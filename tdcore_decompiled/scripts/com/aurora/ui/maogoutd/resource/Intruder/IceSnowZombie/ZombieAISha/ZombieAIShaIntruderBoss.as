package com.aurora.ui.maogoutd.resource.Intruder.IceSnowZombie.ZombieAISha
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.IceSnowZombie.ZombieFrostGiants.ZombieIceEarthHole;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.utils.Dictionary;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   
   public class ZombieAIShaIntruderBoss extends BaseBossMoveIntruder
   {
      
      private static const MOVE_SPEED:Number = -10;
      
      private static const STATE_SNOWSTORM:uint = 6;
      
      private static const STATE_ICEARROW:uint = 7;
      
      private static const STATE_ICETORNADO:uint = 8;
      
      private static const STATE_CHG_TOWARD:uint = 9;
      
      private var m_bCanBeAttack:Boolean;
      
      private var m_OutArray:Array = new Array([1,3],[3,3],[5,3],[7,3]);
      
      private var m_isJumping:Boolean = false;
      
      private var m_numYSpeed:int = 0;
      
      private var a_1581:int = 0;
      
      private var m_numXSpeed:int = 0;
      
      private var m_arrTargetFieldGrid:Vector.<a_3491> = new Vector.<a_3491>();
      
      private var intervalId:uint;
      
      private var counter:uint = 0;
      
      private var stopCount:uint = 4;
      
      private var randomField:Array = new Array();
      
      private var m_isAddHole:Boolean;
      
      public function ZombieAIShaIntruderBoss()
      {
         super();
         IsNeedShadow = false;
         m_fOrginSpeed = MOVE_SPEED;
         a_1279 = -0.5 * this.width - 28;
         a_1467 = -45;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(ZombieAIShaIntruderBoss) as ZombieAIShaIntruderBoss;
      }
      
      override protected function getBindMovie() : Class
      {
         return ZombieAIShaIntruderBossMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         var b:Boolean = false;
         b = super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         m_bSkillIsOrder = true;
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
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = 12;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_ICETORNADO + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_ICEARROW + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_SNOWSTORM + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 11;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = 12;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 1] = 5 + 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 5 + 1;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = 5 + 2;
         m_dictBossStateFrameID[STATE_ICETORNADO + "_" + 1] = 5 + 3;
         m_dictBossStateFrameID[STATE_ICEARROW + "_" + 1] = 5 + 4;
         m_dictBossStateFrameID[STATE_SNOWSTORM + "_" + 1] = 5 + 5;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = 11;
      }
      
      override protected function InitSkillCache() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_APPEAR,4,3,0]);
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.snowStormSkill);
         m_vSkillFunction.push(this.iceArrowSkill);
         m_vSkillFunction.push(this.iceTornadoSkill);
      }
      
      private function snowStormSkill() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_MOVE,4,3]);
         m_vStateCache.push([STATE_SNOWSTORM,28]);
         m_vStateCache.push([STATE_WAITING,40]);
      }
      
      private function iceArrowSkill() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_MOVE,9,m_stRandomSeed.nextInt(7)]);
         m_vStateCache.push([STATE_ICEARROW,21]);
         m_vStateCache.push([STATE_WAITING,40]);
         m_vStateCache.push([STATE_MOVE,9,m_stRandomSeed.nextInt(7)]);
         m_vStateCache.push([STATE_ICEARROW,21]);
         m_vStateCache.push([STATE_WAITING,40]);
      }
      
      private function iceTornadoSkill() : void
      {
         var m_iXGridNo:int = int(this.m_OutArray[m_stRandomSeed.nextInt(this.m_OutArray.length)][0]);
         var m_iYGridNo:int = int(this.m_OutArray[m_stRandomSeed.nextInt(this.m_OutArray.length)][1]);
         m_vStateCache.push([STATE_MOVE,m_iXGridNo,m_iYGridNo]);
         m_vStateCache.push([STATE_ICETORNADO,22]);
         m_vStateCache.push([STATE_WAITING,40]);
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
            case STATE_APPEAR:
               this.SetIsCannotSee(false);
               iNextValue = 21;
               this.setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2],m_vStateCache[0][3]);
               break;
            case STATE_MOVE:
               this.SetIsCannotSee(true);
               fPosX = getPosXByXGridNo(m_vStateCache[0][1]);
               fPosY = getPosYByYGridNo(m_vStateCache[0][2]);
               iNextValue = setMoveToPosition(fPosX,fPosY);
               break;
            case STATE_SNOWSTORM:
            case STATE_ICEARROW:
            case STATE_WAITING:
            case STATE_ICETORNADO:
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
         var bIsCanChangeToFieldGrid:Boolean = ChangeToFieldGrid(stNextFieldGrid);
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
         var stLastWaitShot:a_4348 = null;
         var i:int = 0;
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         switch(m_iBossState)
         {
            case STATE_ICETORNADO:
               trace("m_iCurrentFrame::::" + a_1273);
               if(a_1273 == 35 || a_1273 == 135)
               {
                  this.addIceTornadoShot();
               }
               break;
            case STATE_ICEARROW:
               if(a_1273 == 61 || a_1273 == 160)
               {
                  if(m_stCurrentFieldGrid != null)
                  {
                     this.counter = 0;
                     this.intervalId = setInterval(this.addIceArrowShot,300);
                  }
               }
               break;
            case STATE_SNOWSTORM:
               if(a_1273 == 95 || a_1273 == 194)
               {
                  this.randomFieldGrid();
                  for(i = 0; i < this.randomField.length; i++)
                  {
                     stStartFieldGrid = this.randomField[i];
                     stBaseMoveIntruder = ZombieSnowStormMoveIntruder.a_3926();
                     stBaseMoveIntruder.a_1797((globalMoveFighterID << 16) + stStartFieldGrid.m_iYGridNo,-1);
                     stBaseMoveIntruder.m_stMoveIntruderTypeID = 134217728;
                     stBaseMoveIntruder.x = stStartFieldGrid.m_iXGridNo * a_3491.a_1080;
                     stStartFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stStartFieldGrid,false);
                  }
               }
         }
         return true;
      }
      
      private function addIceTornadoShot() : void
      {
         var stStartFieldGrid:a_3491 = null;
         var stLastWaitShot:a_4348 = null;
         var m_iXGridNo:int = getXGridNoByPosX();
         var m_iYGridNo:int = getYGridNoByPosY();
         var move_speed:int = a_3491.a_1080 / (3 * 20);
         var move_direction:int = int(m_stRandomSeed.nextInt(3));
         stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,0);
         if(stStartFieldGrid)
         {
            stLastWaitShot = ZombieIceTornadoShot.a_4344();
            stLastWaitShot.a_1797(a_4265(),move_speed,1000000,stStartFieldGrid.m_iXGridNo * a_3491.a_1080 + 0,stStartFieldGrid.m_iYGridNo * a_3491.a_1081 - 145,stStartFieldGrid.m_stCurrentBattbleFieldView,stStartFieldGrid);
            stLastWaitShot.iShotSequenceNum = move_direction;
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE);
         }
         stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,6);
         if(stStartFieldGrid)
         {
            stLastWaitShot = ZombieIceTornadoShot.a_4344();
            stLastWaitShot.a_1797(a_4265(),move_speed,1000000,stStartFieldGrid.m_iXGridNo * a_3491.a_1080 + 0,stStartFieldGrid.m_iYGridNo * a_3491.a_1081 - 117,stStartFieldGrid.m_stCurrentBattbleFieldView,stStartFieldGrid);
            stLastWaitShot.iShotSequenceNum = move_direction + 3;
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE);
         }
      }
      
      private function addIceArrowShot() : void
      {
         var stStartFieldGrid:a_3491 = null;
         var stLastWaitShot:a_4348 = null;
         ++this.counter;
         if(this.counter == this.stopCount)
         {
            trace("Clearing Interval");
            clearInterval(this.intervalId);
         }
         var m_iXGridNo:int = Math.min(getXGridNoByPosX(),BattleFieldView.a_1011 - 1);
         var m_iYGridNo:int = getYGridNoByPosY();
         var yStart:int = Math.max(m_iYGridNo - 2,0);
         var yEnd:int = Math.min(m_iYGridNo + 2,BattleFieldView.a_1012 - 1);
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,yIndex);
            if(stStartFieldGrid)
            {
               stLastWaitShot = ZombieIceArrowShot.a_4344();
               stLastWaitShot.a_1797(a_4265(),MOVE_SPEED,1000000,stStartFieldGrid.m_iXGridNo * a_3491.a_1080 + 0,stStartFieldGrid.m_iYGridNo * a_3491.a_1081 + 30,stStartFieldGrid.m_stCurrentBattbleFieldView,stStartFieldGrid);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE);
            }
         }
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
         for(var i:int = 0; i < 5; i++)
         {
            do
            {
               m_iXGridNo = int(m_stRandomSeed.nextInt(8));
               m_iYGridNo = int(m_stRandomSeed.nextInt(7));
               stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
            }
            while(this.randomField.indexOf(stTargetFieldGrid) != -1 || stTargetFieldGrid.m_stAttackFighter is a_3924);
            this.randomField[i] = stTargetFieldGrid;
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
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924) && !stFieldGrid.m_stAttackFighter.m_isShowFrozen)
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
         return Boolean(m_iBossState == STATE_SNOWSTORM || m_iBossState == STATE_ICEARROW || m_iBossState == STATE_ICETORNADO);
      }
      
      override protected function IsMoving() : Boolean
      {
         return m_iBossState == STATE_MOVE;
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
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(this.IsCanReduceLife() && iRduceLifeValue != 0)
         {
            super.a_3969(iRduceLifeValue);
            UpdateBossBloodProgress();
         }
         return true;
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
      
      override protected function InitState() : void
      {
         setLifeValue();
         this.SetIsCannotSee(true);
         stop();
         m_vSkillID.length = 0;
         a_1465 = 3;
         m_iRestTick = 0;
         m_iBossState = STATE_NONE;
         SetRandomSeed();
         this.InitSkillCache();
         InitShadow();
      }
      
      override protected function MoveMySelf() : void
      {
         if(m_bIsNeedHighPrecision)
         {
            this.x = Math.round(10000 * this.x + 10000 * m_fMoveSpeedX) * 0.0001;
            this.y = Math.round(10000 * this.y + 10000 * m_fMoveSpeedY) * 0.0001;
         }
         else
         {
            this.x += m_fMoveSpeedX;
            this.y += m_fMoveSpeedY;
         }
         var iXGridNo:int = getXGridNoByPosX();
         var iYGridNo:int = getYGridNoByPosY();
         var stNextFieldGrid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
         var bIsCanChangeToFieldGrid:Boolean = ChangeToFieldGrid(stNextFieldGrid);
      }
   }
}

