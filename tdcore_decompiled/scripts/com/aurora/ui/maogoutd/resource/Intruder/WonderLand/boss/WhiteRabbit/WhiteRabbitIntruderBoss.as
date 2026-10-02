package com.aurora.ui.maogoutd.resource.Intruder.WonderLand.boss.WhiteRabbit
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.FrostGiants.IceEarthHole;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.utils.Dictionary;
   
   public class WhiteRabbitIntruderBoss extends BaseBossMoveIntruder
   {
      
      private static const MOVE_SPEED:Number = 15;
      
      private static const STATE_BORN:uint = 6;
      
      private static const STATE_SKILL_ONE:uint = 7;
      
      private static const STATE_SKILL_TWO_APPEAR:uint = 8;
      
      private static const STATE_SKILL_TWO_WAITING:uint = 9;
      
      private static const STATE_SKILL_TWO_HIDE:uint = 10;
      
      private static const STATE_SKILL_THREE:uint = 11;
      
      private static const STATE_CHG_CAN_BE_ATTACK:uint = 12;
      
      private static const STATE_CHG_TOWARD:uint = 13;
      
      private static const STATE_FLASH_IN:uint = 14;
      
      private static const STATE_FLASH_OUT:uint = 15;
      
      private var m_isJumping:Boolean = false;
      
      private var m_numYSpeed:int = 0;
      
      private var a_1581:int = 0;
      
      private var m_numXSpeed:int = 0;
      
      private var m_arrTargetFieldGrid:Vector.<a_3491> = new Vector.<a_3491>();
      
      public function WhiteRabbitIntruderBoss()
      {
         super();
         IsNeedShadow = false;
         m_fOrginSpeed = MOVE_SPEED;
         a_1279 = -45 - 17;
         a_1467 = -53;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(WhiteRabbitIntruderBoss) as WhiteRabbitIntruderBoss;
      }
      
      override protected function getBindMovie() : Class
      {
         return WhiteRabbitIntruderBossMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         var b:Boolean = false;
         b = super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         m_bSkillIsOrder = true;
         return b;
      }
      
      override public function get width() : Number
      {
         return 100;
      }
      
      override public function get height() : Number
      {
         return 165;
      }
      
      override protected function InitBossStateFrameID() : void
      {
         m_dictBossStateFrameID = new Dictionary();
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_CHG_CAN_BE_ATTACK + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_SKILL_ONE + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_SKILL_TWO_APPEAR + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_SKILL_TWO_WAITING + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_SKILL_TWO_HIDE + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_SKILL_THREE + "_" + 0] = 11;
         m_dictBossStateFrameID[STATE_BORN + "_" + 0] = 13;
         m_dictBossStateFrameID[STATE_FLASH_IN + "_" + 0] = 15;
         m_dictBossStateFrameID[STATE_FLASH_OUT + "_" + 0] = 16;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 14;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 2;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = 1;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 1] = 2;
         m_dictBossStateFrameID[STATE_CHG_CAN_BE_ATTACK + "_" + 1] = 2;
         m_dictBossStateFrameID[STATE_SKILL_ONE + "_" + 1] = 4;
         m_dictBossStateFrameID[STATE_SKILL_TWO_APPEAR + "_" + 1] = 8;
         m_dictBossStateFrameID[STATE_SKILL_TWO_WAITING + "_" + 1] = 9;
         m_dictBossStateFrameID[STATE_SKILL_TWO_HIDE + "_" + 1] = 10;
         m_dictBossStateFrameID[STATE_SKILL_THREE + "_" + 1] = 12;
         m_dictBossStateFrameID[STATE_BORN + "_" + 1] = 13;
         m_dictBossStateFrameID[STATE_FLASH_IN + "_" + 1] = 17;
         m_dictBossStateFrameID[STATE_FLASH_OUT + "_" + 1] = 18;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = 14;
      }
      
      override protected function InitSkillCache() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_BORN,6,4,0]);
         m_vStateCache.push([STATE_WAITING,3 * 20]);
         m_vStateCache.push([STATE_FLASH_OUT,6]);
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.SkillOne);
         m_vSkillFunction.push(this.SkillOne);
         m_vSkillFunction.push(this.SkillThree);
         m_vSkillFunction.push(this.SkillTwo);
      }
      
      private function SkillOne() : void
      {
         var m_iYGridNo:int = 0;
         m_vStateCache.length = 0;
         var m_iXGridNo:int = 8;
         m_iYGridNo = int(m_stRandomSeed.nextInt(7));
         m_vStateCache.push([STATE_APPEAR,m_iXGridNo,m_iYGridNo,60]);
         if(a_1283)
         {
            m_vStateCache.push([STATE_CHG_TOWARD,0]);
         }
         m_vStateCache.push([STATE_FLASH_IN,4]);
         m_vStateCache.push([STATE_SKILL_ONE,45]);
         m_vStateCache.push([STATE_WAITING,1 * 20]);
         m_vStateCache.push([STATE_FLASH_OUT,6]);
      }
      
      private function SkillTwo() : void
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         m_vStateCache.length = 0;
         do
         {
            m_iXGridNo = int(m_stRandomSeed.nextInt(3));
            m_iYGridNo = m_stRandomSeed.nextInt(3) + 4;
            stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
         }
         while(stTargetFieldGrid == null || stTargetFieldGrid != null && stTargetFieldGrid.m_stAttackFighter is a_3924);
         m_vStateCache.push([STATE_APPEAR,m_iXGridNo,m_iYGridNo,0]);
         m_vStateCache.push([STATE_SKILL_TWO_APPEAR,4]);
         m_vStateCache.push([STATE_SKILL_TWO_WAITING,15 * 20]);
         m_vStateCache.push([STATE_SKILL_TWO_HIDE,3]);
      }
      
      private function SkillThree() : void
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_APPEAR,0,3,-60]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
         m_vStateCache.push([STATE_FLASH_IN,4]);
         m_vStateCache.push([STATE_SKILL_THREE,46]);
         m_vStateCache.push([STATE_WAITING,3 * 20]);
      }
      
      override protected function SwitchState(iCurrentTime:int) : Boolean
      {
         if(0 == m_vStateCache.length)
         {
            this.CacheNextSkill();
         }
         var iNextState:uint = uint(m_vStateCache[0][0]);
         var iNextValue:int = int(m_vStateCache[0][1]);
         this.UpdateSpeedByState(iNextState);
         switch(iNextState)
         {
            case STATE_APPEAR:
               this.SetIsCannotSee(true);
               iNextValue = 0;
               this.setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2],m_vStateCache[0][3]);
               this.visible = false;
               break;
            case STATE_BORN:
               this.SetIsCannotSee(true);
               iNextValue = 44;
               this.setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2],m_vStateCache[0][3]);
               this.visible = true;
               break;
            case STATE_CHG_TOWARD:
               this.SetIsCannotSee(true);
               a_1283 = !a_1283;
               break;
            default:
               this.visible = true;
               this.SetIsCannotSee(false);
         }
         m_vStateCache.shift();
         ChangeState(iNextState,iNextValue,iCurrentTime);
         return true;
      }
      
      override protected function setAppearToGrid(iXGridNo:int, iYGridNo:int, iXOffset:int = 0, iYOffset:int = 0) : void
      {
         var stNextFieldGrid:a_3491 = null;
         stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
         this.x = getPosXByXGridNo(iXGridNo) + iXOffset;
         this.y = getPosYByYGridNo(iYGridNo) + iYOffset;
         ChangeToFieldGrid(stNextFieldGrid);
      }
      
      protected function a_4349(m_iXGridNo:int, m_iYGridNo:int) : Boolean
      {
         var numDistanceX:Number = Math.abs(getPosXByXGridNo(m_iXGridNo) - x);
         var numDistanceY:Number = Math.abs(getPosYByYGridNo(m_iYGridNo) - y);
         this.m_numXSpeed = (getPosXByXGridNo(m_iXGridNo) - x) / this.a_1581;
         this.m_numYSpeed = (getPosYByYGridNo(m_iYGridNo) - y) / this.a_1581;
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var stNextFieldGrid:a_3491 = null;
         var bIsCanChangeToFieldGrid:Boolean = false;
         if(this.a_1581 > 0 && this.m_isJumping)
         {
            --this.a_1581;
            x += this.m_numXSpeed;
            y += this.m_numYSpeed;
            iXGridNo = getXGridNoByPosX();
            iYGridNo = getYGridNoByPosY();
            stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
            bIsCanChangeToFieldGrid = ChangeToFieldGrid(stNextFieldGrid);
         }
         super.a_4216(iCurrentTime);
         return true;
      }
      
      override protected function IsCanReduceLife() : Boolean
      {
         return STATE_MOVE != m_iBossState && a_1339 > 0;
      }
      
      private function UpdateSpeedByState(iNextState:int) : void
      {
         a_1350 = MOVE_SPEED;
      }
      
      override protected function CheckIsCanLaunchSkill(iCurrentTime:int) : Boolean
      {
         var stTargetFieldGrid:a_3491 = null;
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stBaseMoveIntruder:a_4206 = null;
         var stStartFieldGrid:a_3491 = null;
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         if(m_iBossState != STATE_WAITING)
         {
            trace("m_iCurrentFrame::" + a_1273);
         }
         switch(m_iBossState)
         {
            case STATE_BORN:
               if(a_1273 == 275)
               {
                  this.a_3502(m_stCurrentFieldGrid);
               }
               break;
            case STATE_SKILL_ONE:
               if(a_1273 == 45 || a_1273 == 91)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(7,m_stCurrentFieldGrid.m_iYGridNo);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 51 || a_1273 == 97)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(5,m_stCurrentFieldGrid.m_iYGridNo);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 55 || a_1273 == 101)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(3,m_stCurrentFieldGrid.m_iYGridNo);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 56 || a_1273 == 102)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(2,m_stCurrentFieldGrid.m_iYGridNo);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 58 || a_1273 == 104)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(1,m_stCurrentFieldGrid.m_iYGridNo);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 62 || a_1273 == 108)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(0,m_stCurrentFieldGrid.m_iYGridNo);
                  this.a_3502(stTargetFieldGrid);
               }
               break;
            case STATE_SKILL_TWO_APPEAR:
               if(a_1273 == 121 || a_1273 == 143)
               {
                  this.a_3502(m_stCurrentFieldGrid);
               }
               if(a_1273 == 118 || a_1273 == 140)
               {
                  do
                  {
                     m_iXGridNo = int(m_stRandomSeed.nextInt(3));
                     m_iYGridNo = int(m_stRandomSeed.nextInt(3));
                     stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
                  }
                  while(stTargetFieldGrid == null || stTargetFieldGrid != null && stTargetFieldGrid.m_stAttackFighter is a_3924);
                  m_vStateCache.push([STATE_APPEAR,m_iXGridNo,m_iYGridNo,0]);
                  this.addShadowbodyMouse(stTargetFieldGrid);
                  do
                  {
                     m_iXGridNo = m_stRandomSeed.nextInt(3) + 6;
                     m_iYGridNo = int(m_stRandomSeed.nextInt(3));
                     stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
                  }
                  while(stTargetFieldGrid == null || stTargetFieldGrid != null && stTargetFieldGrid.m_stAttackFighter is a_3924);
                  m_vStateCache.push([STATE_APPEAR,m_iXGridNo,m_iYGridNo,0]);
                  this.addShadowbodyMouse(stTargetFieldGrid);
                  do
                  {
                     m_iXGridNo = m_stRandomSeed.nextInt(3) + 6;
                     m_iYGridNo = m_stRandomSeed.nextInt(3) + 4;
                     stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
                  }
                  while(stTargetFieldGrid == null || stTargetFieldGrid != null && stTargetFieldGrid.m_stAttackFighter is a_3924);
                  m_vStateCache.push([STATE_APPEAR,m_iXGridNo,m_iYGridNo,0]);
                  this.addShadowbodyMouse(stTargetFieldGrid);
                  do
                  {
                     m_iXGridNo = m_stRandomSeed.nextInt(3) + 3;
                     m_iYGridNo = m_stRandomSeed.nextInt(3) + 2;
                     stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
                  }
                  while(stTargetFieldGrid == null || stTargetFieldGrid != null && stTargetFieldGrid.m_stAttackFighter is a_3924);
                  m_vStateCache.push([STATE_APPEAR,m_iXGridNo,m_iYGridNo,0]);
                  this.addShadowbodyMouse(stTargetFieldGrid);
               }
               break;
            case STATE_SKILL_THREE:
               if(a_1273 == 196 || a_1273 == 242)
               {
                  this.addTornadoShot();
               }
         }
         return true;
      }
      
      private function addTornadoShot() : void
      {
         var m_iYGridNo:int = 0;
         var m_iXGridNo:int = 0;
         var stStartFieldGrid:a_3491 = null;
         var stLastWaitShot:a_4348 = null;
         var shotMoveSpeed:int = a_3491.a_1080 / (1 * 20);
         for(var i:int = 0; i < BattleFieldView.a_1012; i++)
         {
            stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(0,i);
            if(stStartFieldGrid)
            {
               stLastWaitShot = RabbitShot.a_4344();
               stLastWaitShot.a_1797(a_4265(),shotMoveSpeed,1000000,stStartFieldGrid.m_iXGridNo * a_3491.a_1080 + 0,stStartFieldGrid.m_iYGridNo * a_3491.a_1081 + 30,stStartFieldGrid.m_stCurrentBattbleFieldView,stStartFieldGrid);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE);
            }
         }
      }
      
      protected function ClearFrozenFieldGridDefense(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         if(null != stFieldGrid.m_stProtector && stFieldGrid.m_stProtector.m_isShowFrozen)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(stFieldGrid.m_stProtector.iLifeValue);
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924) && stFieldGrid.m_stAttackFighter.m_isShowFrozen)
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(stFieldGrid.m_stAttackFighter.iLifeValue);
         }
         if(null != stFieldGrid.m_stBoomDefense && stFieldGrid.m_stBoomDefense.m_isShowFrozen)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(stFieldGrid.m_stBoomDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stFlowerDefense && stFieldGrid.m_stFlowerDefense.m_isShowFrozen)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(stFieldGrid.m_stFlowerDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter && stFieldGrid.m_stBaseAuxiliaryFighter.m_isShowFrozen)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
         }
         stFieldGrid.DamageNewSlot(true,1,true,0,1);
         if(null != stFieldGrid.m_stTrayDefense && stFieldGrid.m_stTrayDefense.m_isShowFrozen)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue);
         }
         return true;
      }
      
      override protected function IsSkillState() : Boolean
      {
         return Boolean(m_iBossState == STATE_SKILL_ONE || m_iBossState == STATE_SKILL_TWO_APPEAR || m_iBossState == STATE_SKILL_TWO_WAITING || m_iBossState == STATE_SKILL_TWO_HIDE || m_iBossState == STATE_SKILL_THREE || m_iBossState == STATE_SKILL_THREE);
      }
      
      override protected function IsMoving() : Boolean
      {
         return m_iBossState == STATE_MOVE;
      }
      
      override protected function LifeIsZeroHandle(iDeadState:int) : void
      {
         ClearState();
         var iIsNudity:int = IsInjured ? 1 : 0;
         GotoAndStopFrame(m_dictBossStateFrameID[STATE_DEAD + "_" + iIsNudity] - 1);
         m_iBossState = iDeadState;
         play();
      }
      
      override protected function CacheNextSkill() : void
      {
         var iPos:int = 0;
         var iSkillNum:int = 0;
         var i:int = 0;
         if(0 == m_vSkillID.length)
         {
            iSkillNum = m_iSkillNum.Value;
            for(i = 0; i < iSkillNum; i++)
            {
               m_vSkillID.push(i);
            }
         }
         if(m_bSkillIsOrder)
         {
            iPos = 0;
         }
         else
         {
            iPos = int(m_stRandomSeed.nextInt(m_vSkillID.length));
         }
         var iSkillID:int = m_vSkillID[iPos];
         m_vSkillID.splice(iPos,1);
         m_vSkillFunction[iSkillID]();
      }
      
      override protected function SetIsCannotSee(bIsCannotSee:Boolean, bIsSetVisible:Boolean = true) : void
      {
         if(m_bIsNoChangeCannotSee)
         {
            return;
         }
         SetCannotSeeByFighter(bIsCannotSee);
      }
      
      private function addShadowbodyMouse(stFieldGrid:a_3491) : Boolean
      {
         var stBaseMoveIntruder:a_4206 = null;
         if(stFieldGrid == null)
         {
            return false;
         }
         stBaseMoveIntruder = RabbitShadowbodyMouseMoveIntruder.a_3926();
         if(stBaseMoveIntruder)
         {
            stBaseMoveIntruder.a_1797((globalMoveFighterID << 16) + stFieldGrid.m_iYGridNo,-1);
            stBaseMoveIntruder.m_stMoveIntruderTypeID = 134217728;
            stBaseMoveIntruder.x = stFieldGrid.m_iXGridNo * a_3491.a_1080;
            stFieldGrid.m_stMouseObstacle = stBaseMoveIntruder;
            stFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stFieldGrid,false);
         }
         return true;
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption();
      }
      
      private function addEarthHole(stFieldGrid:a_3491) : void
      {
         var stIceEarthHole:IceEarthHole = null;
         if(stFieldGrid.m_stMouseEarthHole)
         {
            stFieldGrid.m_stMouseEarthHole.a_3940();
            stFieldGrid.m_stMouseEarthHole = null;
         }
         var m_iOldFieldGridType:int = stFieldGrid.m_iFieldGridType;
         if(0 == stFieldGrid.m_iFieldGridType)
         {
            stFieldGrid.m_iFieldGridType = 1;
         }
         stIceEarthHole = IceEarthHole.a_3926();
         stIceEarthHole.m_stCurrentFieldGrid = m_stCurrentFieldGrid;
         stIceEarthHole.a_1797(a_1283);
         stIceEarthHole.m_iOldFieldGridType = m_iOldFieldGridType;
         stIceEarthHole.x = a_3491.a_1080 * stFieldGrid.m_iXGridNo + 0.5 * (a_3491.a_1080 - stIceEarthHole.width);
         stIceEarthHole.y = a_3491.a_1081 * stFieldGrid.m_iYGridNo + (a_3491.a_1081 - stIceEarthHole.height) - 15;
         stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stIceEarthHole,BattleLayerDefine.OBSTACL_TYPE,stFieldGrid);
         if(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
         {
            stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(stIceEarthHole,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
         }
         stIceEarthHole.play();
         stFieldGrid.m_stMouseEarthHole = stIceEarthHole;
         if(a_1283)
         {
            stIceEarthHole.x = BattleFieldView.a_1013 - stIceEarthHole.x;
         }
      }
      
      protected function ClearPigBarrierField(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid.m_stMouseEarthHole)
         {
            stFieldGrid.m_stMouseEarthHole.a_3940();
            stFieldGrid.m_stMouseEarthHole = null;
         }
         if(stFieldGrid.m_stBaseLander != null)
         {
            stFieldGrid.m_stBaseLander.a_3940();
            stFieldGrid.m_stBaseLander = null;
         }
         if(stFieldGrid.m_iFieldGridType == 1)
         {
            stFieldGrid.m_iFieldGridType = 0;
         }
         return true;
      }
   }
}

