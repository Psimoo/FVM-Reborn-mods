package com.aurora.ui.maogoutd.resource.Intruder.WonderLand.boss.CrazyHat
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
   import flash.display.FrameLabel;
   import flash.utils.Dictionary;
   
   public class CrazyHatIntruderBoss extends BaseBossMoveIntruder
   {
      
      private static const MOVE_SPEED:Number = 60 / (0.3 * 20);
      
      private static const STATE_BORN:uint = 6;
      
      private static const STATE_SKILL_ONE:uint = 7;
      
      private static const STATE_SKILL_TWO:uint = 8;
      
      private static const STATE_SKILL_THREE:uint = 9;
      
      private static const STATE_CHG_CAN_BE_ATTACK:uint = 10;
      
      private static const STATE_CHG_TOWARD:uint = 11;
      
      private static const STATE_SPECIALWAITING:uint = 12;
      
      private static const STATE_FLASH_IN:uint = 13;
      
      private static const STATE_FLASH_OUT:uint = 14;
      
      protected var a_1312:int = 4;
      
      protected var a_1311:int = 1000;
      
      private var m_BornArray:Array = new Array([3,2],[5,2],[3,4],[5,4]);
      
      private var m_OutArray:Array = new Array();
      
      private var m_isJumping:Boolean = false;
      
      private var m_numYSpeed:int = 0;
      
      private var a_1581:int = 0;
      
      private var m_numXSpeed:int = 0;
      
      private var m_TotalLifeValue:int;
      
      private var m_arrTargetFieldGrid:Vector.<a_3491> = new Vector.<a_3491>();
      
      private var randomField:Array = new Array();
      
      private var randomY:Array = new Array();
      
      private var m_isAddHole:Boolean;
      
      private var m_arrMouse:Array = new Array();
      
      public function CrazyHatIntruderBoss()
      {
         super();
         IsNeedShadow = false;
         m_fOrginSpeed = MOVE_SPEED;
         a_1279 = -60;
         a_1467 = -47;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(CrazyHatIntruderBoss) as CrazyHatIntruderBoss;
      }
      
      override protected function getBindMovie() : Class
      {
         return CrazyHatIntruderBossMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         var b:Boolean = false;
         b = super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         m_bSkillIsOrder = false;
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
         m_dictBossStateFrameID[STATE_BORN + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_CHG_CAN_BE_ATTACK + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_SPECIALWAITING + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_SKILL_ONE + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_SKILL_TWO + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_SKILL_THREE + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_FLASH_OUT + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_FLASH_IN + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 18;
         m_dictBossStateFrameID[STATE_BORN + "_" + 1] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 8 + 2;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = 8 + 2;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 1] = 8 + 2;
         m_dictBossStateFrameID[STATE_CHG_CAN_BE_ATTACK + "_" + 1] = 8 + 2;
         m_dictBossStateFrameID[STATE_SPECIALWAITING + "_" + 1] = 8 + 3;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = 8 + 4;
         m_dictBossStateFrameID[STATE_SKILL_ONE + "_" + 1] = 8 + 5;
         m_dictBossStateFrameID[STATE_SKILL_TWO + "_" + 1] = 8 + 6;
         m_dictBossStateFrameID[STATE_SKILL_THREE + "_" + 1] = 8 + 7;
         m_dictBossStateFrameID[STATE_FLASH_OUT + "_" + 1] = 8 + 8;
         m_dictBossStateFrameID[STATE_FLASH_IN + "_" + 1] = 8 + 9;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = 18;
      }
      
      override protected function InitSkillCache() : void
      {
         m_vStateCache.length = 0;
         var m_iXGridNo:int = int(this.m_BornArray[m_stRandomSeed.nextInt(this.m_BornArray.length)][0]);
         var m_iYGridNo:int = int(this.m_BornArray[m_stRandomSeed.nextInt(this.m_BornArray.length)][1]);
         m_vStateCache.push([STATE_BORN,m_iXGridNo,m_iYGridNo,0]);
         m_vStateCache.push([STATE_WAITING,2 * 10]);
         m_vStateCache.push([STATE_FLASH_OUT,4]);
      }
      
      override protected function InitSkillFunction() : void
      {
         while(m_vSkillFunction.length > 0)
         {
            m_vSkillFunction.pop();
         }
         m_vSkillFunction.push(this.SkillOne);
         m_vSkillFunction.push(this.SkillTwo);
         if(iLifeValue / this.m_TotalLifeValue * 100 <= 40)
         {
            m_vSkillFunction.push(this.SkillThree);
         }
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(STATE_DEAD == m_iBossState || STATE_NONE == m_iBossState)
         {
            return false;
         }
         var strKey:String = getBossFrameStateKey();
         var iNextFrameID:int = int(m_dictBossStateFrameID[strKey]);
         if(null == m_dictBossStateFrameID[strKey] || 0 >= iNextFrameID)
         {
            throw Error("BaseBossMoveIntruder::ResetMovieStatus->Error strKey = " + strKey);
         }
         this.GotoAndStopFrame(iNextFrameID - 1,false);
         return true;
      }
      
      override protected function GotoAndStopFrame(iFrame:uint, bIsNeed:Boolean = true) : void
      {
         var xx:int = m_iRestTick;
         if(!bIsNeed && a_1275 == iFrame)
         {
            return;
         }
         if(m_iBossState != STATE_WAITING)
         {
            if(a_1275 == iFrame + 8 || a_1275 == iFrame - 8)
            {
               return;
            }
         }
         a_1275 = iFrame;
         m_iFrameLabelStartIndex = (a_1276[iFrame] as FrameLabel).frame;
         gotoAndStop(m_iFrameLabelStartIndex);
         a_3419();
      }
      
      private function SkillOne() : void
      {
         var m_iYGridNo:int = 0;
         m_vStateCache.length = 0;
         while(this.m_OutArray.length > 0)
         {
            this.m_OutArray.pop();
         }
         for(var i:int = 0; i < 3; i++)
         {
            do
            {
               m_iYGridNo = int(m_stRandomSeed.nextInt(7));
            }
            while(this.m_OutArray.indexOf(m_iYGridNo) != -1);
            this.m_OutArray.push(m_iYGridNo);
            m_vStateCache.push([STATE_APPEAR,8,m_iYGridNo,0]);
            m_vStateCache.push([STATE_FLASH_IN,5]);
            m_vStateCache.push([STATE_SKILL_ONE,44]);
            if(i != 2)
            {
               m_vStateCache.push([STATE_FLASH_OUT,4]);
            }
         }
         m_vStateCache.push([STATE_WAITING,2 * 10]);
         m_vStateCache.push([STATE_FLASH_OUT,4]);
      }
      
      private function SkillTwo() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_APPEAR,8,3,0]);
         m_vStateCache.push([STATE_FLASH_IN,5]);
         m_vStateCache.push([STATE_SKILL_TWO,40]);
         m_vStateCache.push([STATE_WAITING,2 * 10]);
         m_vStateCache.push([STATE_FLASH_OUT,4]);
      }
      
      private function SkillThree() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_APPEAR,4,3,0]);
         m_vStateCache.push([STATE_FLASH_IN,5]);
         m_vStateCache.push([STATE_SKILL_THREE,60]);
         m_vStateCache.push([STATE_WAITING,2 * 10]);
         m_vStateCache.push([STATE_FLASH_OUT,4]);
      }
      
      override protected function SwitchState(iCurrentTime:int) : Boolean
      {
         var fPosX:Number = NaN;
         var fPosY:Number = NaN;
         if(0 == m_vStateCache.length)
         {
            this.CacheNextSkill();
         }
         var iNextState:uint = uint(m_vStateCache[0][0]);
         var iNextValue:int = int(m_vStateCache[0][1]);
         this.UpdateSpeedByState(iNextState);
         switch(iNextState)
         {
            case STATE_BORN:
               iNextValue = 63;
               this.setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2],m_vStateCache[0][3]);
               this.SetIsCannotSee(true);
               this.visible = true;
               break;
            case STATE_MOVE:
               fPosX = getPosXByXGridNo(m_vStateCache[0][1]) + m_vStateCache[0][3];
               fPosY = getPosYByYGridNo(m_vStateCache[0][2]);
               iNextValue = setMoveToPosition(fPosX,fPosY);
               this.SetIsCannotSee(false);
               break;
            case STATE_APPEAR:
               iNextValue = 0;
               this.setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2],m_vStateCache[0][3]);
               this.SetIsCannotSee(false);
               break;
            case STATE_CHG_TOWARD:
               a_1283 = !a_1283;
               this.SetIsCannotSee(false);
               break;
            case STATE_FLASH_IN:
               this.visible = true;
               this.SetIsCannotSee(false);
               break;
            case STATE_FLASH_OUT:
               this.SetIsCannotSee(false);
               break;
            default:
               this.SetIsCannotSee(false);
         }
         m_vStateCache.shift();
         ChangeState(iNextState,iNextValue,iCurrentTime);
         return true;
      }
      
      override protected function SetRandomSeed() : void
      {
         m_stRandomSeed.setSeed(globalMoveFighterID - m_stCurrentFieldGrid.m_iYGridNo,globalMoveFighterID + m_stCurrentFieldGrid.m_iYGridNo);
      }
      
      override protected function setAppearToGrid(iXGridNo:int, iYGridNo:int, iXOffset:int = 0, iYOffset:int = 0) : void
      {
         var stNextFieldGrid:a_3491 = null;
         stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
         this.x = getPosXByXGridNo(iXGridNo) + iXOffset;
         this.y = getPosYByYGridNo(iYGridNo) + iYOffset;
         ChangeToFieldGrid(stNextFieldGrid);
         this.visible = false;
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
         if(!a_1460)
         {
            InitState();
            a_1460 = true;
            this.m_TotalLifeValue = iLifeValue;
         }
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
         }
         switch(m_iBossState)
         {
            case STATE_BORN:
               if(a_1273 == 14)
               {
                  this.a_3502(m_stCurrentFieldGrid);
                  if(m_stCurrentFieldGrid != null)
                  {
                     stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo + 1,m_stCurrentFieldGrid.m_iYGridNo);
                     this.a_3502(stTargetFieldGrid);
                  }
               }
               break;
            case STATE_FLASH_IN:
               if(a_1273 == 260 || a_1273 == 459)
               {
                  this.a_3502(m_stCurrentFieldGrid);
               }
               break;
            case STATE_SKILL_ONE:
               if(a_1273 == 139 || a_1273 == 338)
               {
                  this.ActionSkillOne();
               }
               break;
            case STATE_SKILL_TWO:
               if(a_1273 == 152 || a_1273 == 351)
               {
                  while(this.m_arrMouse.length > 0)
                  {
                     stBaseMoveIntruder = this.m_arrMouse.pop();
                     stBaseMoveIntruder.a_4212();
                  }
               }
               else if(a_1273 == 189 || a_1273 == 388)
               {
                  this.ActionSkillTwo();
               }
               break;
            case STATE_SKILL_THREE:
               if(a_1273 == 202 || a_1273 == 401)
               {
                  if(m_stCurrentFieldGrid != null)
                  {
                     stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo + 1,m_stCurrentFieldGrid.m_iYGridNo);
                     this.a_3502(stTargetFieldGrid);
                  }
               }
               else if(a_1273 == 229 || a_1273 == 428)
               {
                  this.ActionSkillThree();
               }
         }
         return true;
      }
      
      private function randomFieldGrid() : void
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         var tries:int = 0;
         var bIsContinueFind:Boolean = false;
         while(this.randomField.length > 0)
         {
            this.randomField.pop();
         }
         while(this.randomY.length > 0)
         {
            this.randomY.pop();
         }
         var maxTries:int = 100;
         for(var i:int = 0; i < 4; i++)
         {
            tries = 0;
            bIsContinueFind = true;
            for(tries = 0; tries < maxTries; tries++)
            {
               m_iXGridNo = m_stRandomSeed.nextInt(2) + 6;
               m_iYGridNo = int(m_stRandomSeed.nextInt(7));
               stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
               if(this.randomField.indexOf(stTargetFieldGrid) == -1 && !(stTargetFieldGrid.m_stAttackFighter is a_3924) && this.randomY.indexOf(m_iYGridNo) == -1 && stTargetFieldGrid.m_iFieldGridType == 0)
               {
                  this.randomField.push(stTargetFieldGrid);
                  this.randomY.push(m_iYGridNo);
                  bIsContinueFind = false;
                  break;
               }
            }
            if(bIsContinueFind)
            {
               for(tries = 0; tries < maxTries; tries++)
               {
                  m_iXGridNo = m_stRandomSeed.nextInt(2) + 6;
                  m_iYGridNo = int(m_stRandomSeed.nextInt(7));
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
                  if(this.randomField.indexOf(stTargetFieldGrid) == -1 && !(stTargetFieldGrid.m_stAttackFighter is a_3924) && this.randomY.indexOf(m_iYGridNo) == -1)
                  {
                     this.randomField.push(stTargetFieldGrid);
                     this.randomY.push(m_iYGridNo);
                     break;
                  }
               }
            }
         }
      }
      
      protected function ClearFrozenFieldGridDefense(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         this.m_isAddHole = stFieldGrid.m_isShowFrozen;
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
         if(this.m_isAddHole)
         {
            this.addEarthHole(stFieldGrid);
         }
         return true;
      }
      
      override protected function IsSkillState() : Boolean
      {
         return Boolean(m_iBossState == STATE_SKILL_ONE || m_iBossState == STATE_SKILL_TWO || m_iBossState == STATE_SKILL_THREE || m_iBossState == STATE_SKILL_THREE);
      }
      
      override protected function IsMoving() : Boolean
      {
         return m_iBossState == STATE_MOVE;
      }
      
      override protected function LifeIsZeroHandle(iDeadState:int) : void
      {
         ClearState();
         var iIsNudity:int = IsInjured ? 1 : 0;
         this.GotoAndStopFrame(m_dictBossStateFrameID[STATE_DEAD + "_" + iIsNudity] - 1);
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
            this.InitSkillFunction();
            m_iSkillNum.Value = m_vSkillFunction.length;
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
      
      private function ActionSkillOne() : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var stLastWaitShot:a_4348 = null;
         var iPosX:int = 0;
         var iPosY:int = 0;
         for(var i:int = 0; i < 2; i++)
         {
            stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo);
            if(stTargetFieldGrid != null)
            {
               stLastWaitShot = TeaCupShot.a_4344();
               iPosX = stTargetFieldGrid.m_iXGridNo * a_3491.a_1080 - 49 - i * 60;
               iPosY = stTargetFieldGrid.m_iYGridNo * a_3491.a_1081 + 3;
               stLastWaitShot.a_1797(0,this.a_1312,this.a_1311,iPosX,iPosY,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,stTargetFieldGrid,false,1,0);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,stTargetFieldGrid);
            }
         }
      }
      
      private function ActionSkillTwo() : void
      {
         var stBaseMoveIntruder:a_4206 = null;
         var stStartFieldGrid:a_3491 = null;
         this.randomFieldGrid();
         for(var i:int = 0; i < this.randomField.length; i++)
         {
            stStartFieldGrid = this.randomField[i];
            stBaseMoveIntruder = MagicHatMoveIntruder.a_3926();
            if(Boolean(stBaseMoveIntruder) && Boolean(stStartFieldGrid))
            {
               stBaseMoveIntruder.a_1797((globalMoveFighterID << 16) + stStartFieldGrid.m_iYGridNo,-1);
               stBaseMoveIntruder.m_stMoveIntruderTypeID = 134217728;
               stBaseMoveIntruder.x = stStartFieldGrid.m_iXGridNo * a_3491.a_1080;
               stBaseMoveIntruder.y = stStartFieldGrid.m_iYGridNo * a_3491.a_1081;
               stStartFieldGrid.m_stMouseObstacle = stBaseMoveIntruder;
               stStartFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stStartFieldGrid,false);
               this.m_arrMouse.push(stBaseMoveIntruder);
            }
         }
      }
      
      private function ActionSkillThree() : void
      {
         this.a_3969(-this.m_TotalLifeValue * 0.4);
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

