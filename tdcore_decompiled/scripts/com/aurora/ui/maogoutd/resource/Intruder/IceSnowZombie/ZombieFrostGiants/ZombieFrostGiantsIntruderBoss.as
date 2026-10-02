package com.aurora.ui.maogoutd.resource.Intruder.IceSnowZombie.ZombieFrostGiants
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import flash.utils.Dictionary;
   
   public class ZombieFrostGiantsIntruderBoss extends BaseBossMoveIntruder
   {
      
      private static const MOVE_SPEED:Number = 15;
      
      private static const STATE_JUMP:uint = 6;
      
      private static const STATE_SUPER_VOICE:uint = 7;
      
      private static const STATE_EARTH_TREMBLE:uint = 8;
      
      private static const STATE_ICE_THORN:uint = 9;
      
      private static const STATE_START_JUMP:uint = 10;
      
      private var m_bFirst:Boolean;
      
      private var m_bCanBeAttack:Boolean;
      
      private var m_arrHasSweetTombstone:Array;
      
      private var m_arrHasCandyShell:Array;
      
      private var m_OutArray:Array = new Array([1,1],[1,3],[1,5],[4,1],[4,3],[4,5]);
      
      private var m_isJumping:Boolean = false;
      
      private var m_numYSpeed:int = 0;
      
      private var a_1581:int = 0;
      
      private var m_numXSpeed:int = 0;
      
      private var m_arrTargetFieldGrid:Vector.<a_3491> = new Vector.<a_3491>();
      
      private var randomField:Array = new Array();
      
      private var m_iYGridArray:Array = new Array();
      
      private var m_isAddHole:Boolean;
      
      public function ZombieFrostGiantsIntruderBoss()
      {
         super();
         IsNeedShadow = false;
         m_fOrginSpeed = MOVE_SPEED;
         a_1279 = -0.5 * this.width - 45;
         a_1467 = -65;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(ZombieFrostGiantsIntruderBoss) as ZombieFrostGiantsIntruderBoss;
      }
      
      override protected function getBindMovie() : Class
      {
         return ZombieFrostGiantsIntruderBossMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         var b:Boolean = false;
         b = super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         m_bSkillIsOrder = true;
         this.m_bFirst = true;
         this.m_bCanBeAttack = true;
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
         m_dictBossStateFrameID[STATE_JUMP + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_START_JUMP + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_SUPER_VOICE + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_EARTH_TREMBLE + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_ICE_THORN + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 13;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 6 + 1;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = 6 + 1;
         m_dictBossStateFrameID[STATE_JUMP + "_" + 1] = 6 + 2;
         m_dictBossStateFrameID[STATE_START_JUMP + "_" + 1] = 6 + 3;
         m_dictBossStateFrameID[STATE_SUPER_VOICE + "_" + 1] = 6 + 4;
         m_dictBossStateFrameID[STATE_EARTH_TREMBLE + "_" + 1] = 6 + 5;
         m_dictBossStateFrameID[STATE_ICE_THORN + "_" + 1] = 6 + 6;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = 13;
      }
      
      override protected function InitSkillCache() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_APPEAR,9,5,0]);
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.iceThornSkill);
         m_vSkillFunction.push(this.earthShakeSkill);
         m_vSkillFunction.push(this.supersOnicSkill);
      }
      
      private function iceThornSkill() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_ICE_THORN,20]);
         m_vStateCache.push([STATE_WAITING,3 * 20]);
      }
      
      private function supersOnicSkill() : void
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_JUMP,2]);
         do
         {
            m_iXGridNo = int(this.m_OutArray[m_stRandomSeed.nextInt(this.m_OutArray.length)][0]);
            m_iYGridNo = int(this.m_OutArray[m_stRandomSeed.nextInt(this.m_OutArray.length)][1]);
            stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
         }
         while(stTargetFieldGrid.m_stAttackFighter is a_3924);
         m_vStateCache.push([STATE_START_JUMP,9,m_iXGridNo,m_iYGridNo]);
         m_vStateCache.push([STATE_SUPER_VOICE,17]);
         m_vStateCache.push([STATE_WAITING,3 * 20]);
         m_vStateCache.push([STATE_JUMP,2]);
         m_vStateCache.push([STATE_START_JUMP,9,9,3]);
      }
      
      private function earthShakeSkill() : void
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_JUMP,2]);
         do
         {
            m_iXGridNo = 6;
            m_iYGridNo = int(m_stRandomSeed.nextInt(7));
            stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
         }
         while(stTargetFieldGrid.m_stAttackFighter is a_3924);
         m_vStateCache.push([STATE_START_JUMP,9,m_iXGridNo,m_iYGridNo]);
         m_vStateCache.push([STATE_EARTH_TREMBLE,17]);
         m_vStateCache.push([STATE_WAITING,3 * 20]);
         m_vStateCache.push([STATE_JUMP,2]);
         do
         {
            m_iXGridNo = 6;
            m_iYGridNo = int(m_stRandomSeed.nextInt(7));
            stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
         }
         while(stTargetFieldGrid.m_stAttackFighter is a_3924);
         m_vStateCache.push([STATE_START_JUMP,9,m_iXGridNo,m_iYGridNo]);
         m_vStateCache.push([STATE_EARTH_TREMBLE,17]);
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
               iNextValue = 0;
               this.setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2],m_vStateCache[0][3]);
               break;
            case STATE_START_JUMP:
               this.SetIsCannotSee(true);
               this.a_1581 = m_vStateCache[0][1];
               this.a_4349(m_vStateCache[0][2],m_vStateCache[0][3]);
               this.m_isJumping = true;
               break;
            case STATE_JUMP:
               this.SetIsCannotSee(false);
               break;
            case STATE_EARTH_TREMBLE:
               this.SetIsCannotSee(false);
               break;
            case STATE_ICE_THORN:
               this.SetIsCannotSee(false);
               break;
            case STATE_SUPER_VOICE:
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
         this.SetIsCannotSee(true);
         this.visible = true;
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
         var i:int = 0;
         var xStart:int = 0;
         var xEnd:int = 0;
         var yStart:int = 0;
         var yEnd:int = 0;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         switch(m_iBossState)
         {
            case STATE_ICE_THORN:
               if(a_1273 == 75 || a_1273 == 155)
               {
                  this.randomFieldGrid();
                  for(i = 0; i < this.randomField.length; i++)
                  {
                     stStartFieldGrid = this.randomField[i];
                     stBaseMoveIntruder = ZombieIceThornMouseMoveIntruder.a_3926();
                     stBaseMoveIntruder.a_1797((globalMoveFighterID << 16) + stStartFieldGrid.m_iYGridNo,-1);
                     stBaseMoveIntruder.m_stMoveIntruderTypeID = 134217728;
                     stBaseMoveIntruder.x = stStartFieldGrid.m_iXGridNo * a_3491.a_1080;
                     stStartFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stStartFieldGrid,false);
                  }
               }
               break;
            case STATE_EARTH_TREMBLE:
               if(a_1273 == 49 || a_1273 == 129)
               {
                  stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(5,m_stCurrentFieldGrid.m_iYGridNo - 1);
                  if(stStartFieldGrid)
                  {
                     stBaseMoveIntruder = ZombieEarthEffectMoveIntruder.a_3926();
                     stBaseMoveIntruder.a_1797((globalMoveFighterID << 16) + stStartFieldGrid.m_iYGridNo,-1);
                     stBaseMoveIntruder.m_stMoveIntruderTypeID = 134217728;
                     stBaseMoveIntruder.x = stStartFieldGrid.m_iXGridNo * a_3491.a_1080;
                     stStartFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stStartFieldGrid,false);
                  }
                  stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(5,m_stCurrentFieldGrid.m_iYGridNo + 1);
                  if(stStartFieldGrid)
                  {
                     stBaseMoveIntruder = ZombieEarthEffectMoveIntruder.a_3926();
                     stBaseMoveIntruder.a_1797((globalMoveFighterID << 16) + stStartFieldGrid.m_iYGridNo,-1);
                     stBaseMoveIntruder.m_stMoveIntruderTypeID = 134217728;
                     stBaseMoveIntruder.x = stStartFieldGrid.m_iXGridNo * a_3491.a_1080;
                     stStartFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stStartFieldGrid,false);
                  }
               }
               break;
            case STATE_START_JUMP:
               if(a_1273 == 23 || a_1273 == 103)
               {
                  this.a_3502(m_stCurrentFieldGrid);
                  stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 1,m_stCurrentFieldGrid.m_iYGridNo);
                  if(stStartFieldGrid)
                  {
                     this.a_3502(m_stCurrentFieldGrid);
                  }
               }
               break;
            case STATE_SUPER_VOICE:
               if(a_1273 == 34 || a_1273 == 114)
               {
                  xStart = 0;
                  xEnd = BattleFieldView.a_1011 - 1;
                  yStart = 0;
                  yEnd = BattleFieldView.a_1012 - 1;
                  for(yIndex = yStart; yIndex <= yEnd; yIndex++)
                  {
                     for(xIndex = xStart; xIndex <= xEnd; xIndex++)
                     {
                        stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
                        this.ClearFrozenFieldGridDefense(stTargetFieldGrid);
                     }
                  }
               }
         }
         return true;
      }
      
      private function randomFieldGrid() : void
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         while(this.randomField.length > 0)
         {
            this.randomField.pop();
         }
         while(this.m_iYGridArray.length > 0)
         {
            this.m_iYGridArray.pop();
         }
         for(var i:int = 0; i < 7; i++)
         {
            do
            {
               m_iXGridNo = m_stRandomSeed.nextInt(4) + 1;
               do
               {
                  m_iYGridNo = int(m_stRandomSeed.nextInt(7));
               }
               while(this.m_iYGridArray.indexOf(m_iYGridNo) != -1);
               trace("1");
               stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
            }
            while(this.randomField.indexOf(stTargetFieldGrid) != -1 || stTargetFieldGrid.m_stAttackFighter is a_3924 || stTargetFieldGrid.m_stBaseLander != null);
            this.m_iYGridArray.push(m_iYGridNo);
            this.randomField.push(stTargetFieldGrid);
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
         return Boolean(m_iBossState == STATE_JUMP || m_iBossState == STATE_SUPER_VOICE || m_iBossState == STATE_ICE_THORN || m_iBossState == STATE_EARTH_TREMBLE);
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
         var stIceEarthHole:ZombieIceEarthHole = null;
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
         stIceEarthHole = ZombieIceEarthHole.a_3926();
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

