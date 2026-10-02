package com.aurora.ui.maogoutd.resource.Intruder.newBoss.skyTrain
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4255;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.utils.Dictionary;
   
   public class SkyTrainBossBodySecondTransMoveIntruder extends BaseBossMoveIntruder
   {
      
      protected static const STATE_BUFFER:uint = 6;
      
      protected static const STATE_UP_OUT_STAIRS:uint = 7;
      
      protected static const STATE_UP_OUT_MOUSE:uint = 8;
      
      protected static const STATE_UP_BACK_STAIRS:uint = 9;
      
      protected static const STATE_DOWN_OUT_STAIRS:uint = 10;
      
      protected static const STATE_DOWN_OUT_MOUSE:uint = 11;
      
      protected static const STATE_DOWN_BACK_STAIRS:uint = 12;
      
      protected static const STATE_BOTH_OUT_STAIRS:uint = 13;
      
      protected static const STATE_BOTH_OUT_MOUSE:uint = 14;
      
      protected static const STATE_BOTH_BACK_STAIRS:uint = 15;
      
      protected static const STATE_MOVE_TO_LEFT_HIDE:uint = 16;
      
      protected static const STATE_MOVE_TO_RIGHT_HIDE:uint = 17;
      
      protected static const STATE_MOVE_TO_LEFT_SHOW:uint = 18;
      
      protected static const STATE_MOVE_TO_RIGHT_SHOW:uint = 19;
      
      protected static const STATE_SKILL_CAR_BLEW:uint = 20;
      
      private static var m_arrCarBlewWaitGrid:Array = [0,2,7,9];
      
      private var m_iPosID:int;
      
      private var m_stHead:SkyTrainBossSecondTransMoveIntruder;
      
      public function SkyTrainBossBodySecondTransMoveIntruder()
      {
         super();
         m_bIsNeedHighPrecision = true;
         a_1467 = 0.5 * this.height - a_3491.a_1081;
      }
      
      public static function a_3926() : SkyTrainBossBodySecondTransMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(SkyTrainBossBodySecondTransMoveIntruder) as SkyTrainBossBodySecondTransMoveIntruder;
      }
      
      public function RealeaseByHead() : void
      {
         a_3940();
      }
      
      public function get iPosID() : int
      {
         return this.m_iPosID;
      }
      
      public function set iPosID(iValue:int) : void
      {
         this.m_iPosID = iValue;
         m_iStartShowGridNo = SkyTrainBossSecondTransMoveIntruder.START_SHOW_GRIDNO + this.m_iPosID * 2;
      }
      
      public function set BossHead(stHead:SkyTrainBossSecondTransMoveIntruder) : void
      {
         this.m_stHead = stHead;
      }
      
      override public function get numHardRate() : Number
      {
         return this.m_stHead.numHardRate;
      }
      
      override protected function get a_1339() : int
      {
         return null == this.m_stHead ? 0 : this.m_stHead.iLifeValue;
      }
      
      override public function get iArmorLifeValue() : int
      {
         return this.m_stHead.iArmorLifeValue;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         return this.m_stHead.a_3969(iRduceLifeValue);
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         return this.m_stHead.a_4209(iRduceLifeValue);
      }
      
      override protected function getBindMovie() : Class
      {
         return SkyTrainBossBodySecondTransMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         m_bSkillIsOrder = true;
         a_1460 = false;
         a_1350 = SkyTrainBossSecondTransMoveIntruder.MOVE_SPEED;
         return true;
      }
      
      override public function get width() : Number
      {
         return 124;
      }
      
      override public function get height() : Number
      {
         return 98;
      }
      
      override protected function InitBossStateFrameID() : void
      {
         m_dictBossStateFrameID = new Dictionary();
         m_dictBossStateFrameID[STATE_HIDE + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_BUFFER + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_UP_OUT_STAIRS + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_UP_OUT_MOUSE + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_UP_BACK_STAIRS + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_DOWN_OUT_STAIRS + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_DOWN_OUT_MOUSE + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_DOWN_BACK_STAIRS + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_BOTH_OUT_STAIRS + "_" + 0] = 10;
         m_dictBossStateFrameID[STATE_BOTH_OUT_MOUSE + "_" + 0] = 11;
         m_dictBossStateFrameID[STATE_BOTH_BACK_STAIRS + "_" + 0] = 12;
         m_dictBossStateFrameID[STATE_MOVE_TO_LEFT_HIDE + "_" + 0] = 13;
         m_dictBossStateFrameID[STATE_MOVE_TO_RIGHT_HIDE + "_" + 0] = 14;
         m_dictBossStateFrameID[STATE_MOVE_TO_LEFT_SHOW + "_" + 0] = 15;
         m_dictBossStateFrameID[STATE_MOVE_TO_RIGHT_SHOW + "_" + 0] = 16;
         var iAddFrame:int = 16;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 1] = 1 + iAddFrame;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 1 + iAddFrame;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = 2 + iAddFrame;
         m_dictBossStateFrameID[STATE_BUFFER + "_" + 1] = 3 + iAddFrame;
         m_dictBossStateFrameID[STATE_UP_OUT_STAIRS + "_" + 1] = 4 + iAddFrame;
         m_dictBossStateFrameID[STATE_UP_OUT_MOUSE + "_" + 1] = 5 + iAddFrame;
         m_dictBossStateFrameID[STATE_UP_BACK_STAIRS + "_" + 1] = 6 + iAddFrame;
         m_dictBossStateFrameID[STATE_DOWN_OUT_STAIRS + "_" + 1] = 7 + iAddFrame;
         m_dictBossStateFrameID[STATE_DOWN_OUT_MOUSE + "_" + 1] = 8 + iAddFrame;
         m_dictBossStateFrameID[STATE_DOWN_BACK_STAIRS + "_" + 1] = 9 + iAddFrame;
         m_dictBossStateFrameID[STATE_BOTH_OUT_STAIRS + "_" + 1] = 10 + iAddFrame;
         m_dictBossStateFrameID[STATE_BOTH_OUT_MOUSE + "_" + 1] = 11 + iAddFrame;
         m_dictBossStateFrameID[STATE_BOTH_BACK_STAIRS + "_" + 1] = 12 + iAddFrame;
         m_dictBossStateFrameID[STATE_MOVE_TO_LEFT_HIDE + "_" + 1] = 13 + iAddFrame;
         m_dictBossStateFrameID[STATE_MOVE_TO_RIGHT_HIDE + "_" + 1] = 14 + iAddFrame;
         m_dictBossStateFrameID[STATE_MOVE_TO_LEFT_SHOW + "_" + 1] = 15 + iAddFrame;
         m_dictBossStateFrameID[STATE_MOVE_TO_RIGHT_SHOW + "_" + 1] = 16 + iAddFrame;
         m_dictBossStateFrameID[STATE_DEAD] = iAddFrame * 2 + 1;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = iAddFrame * 2 + 2;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = iAddFrame * 2 + 2;
         m_dictBossStateFrameID[STATE_SKILL_CAR_BLEW + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_SKILL_CAR_BLEW + "_" + 1] = 1 + iAddFrame;
      }
      
      override protected function InitSkillCache() : void
      {
         iHorizontalDirect = 1;
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_APPEAR,m_iStartShowGridNo,0]);
         this.SetRandomSeed();
         HavingRestForAwhile(10);
      }
      
      override protected function SetRandomSeed() : void
      {
      }
      
      internal function SetBodyRandomSeed(iGlobalID:int, iXGridNo:int, iYGridNo:int) : void
      {
         m_stRandomSeed.setSeed(iGlobalID - iXGridNo,iGlobalID - iYGridNo);
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.CacheSkillFrontCollision);
         m_vSkillFunction.push(this.CacheSkillButterRunway);
         m_vSkillFunction.push(this.CacheSkillSummonMouse);
         m_vSkillFunction.push(this.CacheSkillCarBlew);
      }
      
      private function CacheSkillButterRunway() : void
      {
         var iCurYGrid:int = 0;
         var iCurXGrid:int = 0;
         var iDirection:int = 0;
         var iNextYGrid:int = 0;
         var iMaxXGrid:int = BattleFieldView.a_1011;
         var iMaxYGrid:int = BattleFieldView.a_1012;
         var iXLeftGrid:int = 1;
         var iXRightGrid:int = iMaxXGrid - 2;
         var arrYGrid:Array = [];
         for(var i:int = 0; i < iMaxYGrid; i += 2)
         {
            iCurYGrid = i;
            arrYGrid.push(iCurYGrid);
         }
         m_vStateCache.push([STATE_APPEAR,m_iStartShowGridNo,arrYGrid[0]]);
         var iShowLen:int = 4;
         if(this.m_iPosID > iShowLen)
         {
            m_vStateCache.push([STATE_HIDE,16 + 4 * (3 * iMaxXGrid + 2 * iShowLen + 2 * SkyTrainBossSecondTransMoveIntruder.SKY_TRAIN_BODY_LEN)]);
            return;
         }
         var iYGridLen:int = int(arrYGrid.length);
         for(var iY:int = 0; iY < iYGridLen; iY++)
         {
            iDirection = 0 == (iY & 1) ? 1 : -1;
            iCurYGrid = int(arrYGrid[iY]);
            iNextYGrid = iY < iYGridLen - 1 ? int(arrYGrid[iY + 1]) : -1;
            if(iNextYGrid >= 0)
            {
               iCurXGrid = 1 == iDirection ? iXLeftGrid : iXRightGrid;
               m_vStateCache.push([STATE_MOVE,iCurXGrid,iCurYGrid]);
               this.DeliveryCar(iDirection,iCurXGrid,iCurYGrid,iCurXGrid,iNextYGrid);
            }
            else
            {
               m_vStateCache.push([STATE_MOVE,(iShowLen - this.m_iPosID) * 2 + iMaxXGrid + 4,iCurYGrid]);
            }
         }
      }
      
      private function CacheSkillSummonMouse() : void
      {
         var iMaxXGrid:int = BattleFieldView.a_1011;
         var iMaxYGrid:int = BattleFieldView.a_1012;
         var iYFirstGrid:int = 1;
         var iYSecondGrid:int = iMaxYGrid - 2;
         var iXLeftGrid:int = 1;
         m_vStateCache.push([STATE_APPEAR,m_iStartShowGridNo,iYFirstGrid]);
         var iHalfLen:int = 5;
         if(this.m_iPosID < iHalfLen)
         {
            m_vStateCache.push([STATE_BUFFER,5]);
            m_vStateCache.push([STATE_MOVE,iXLeftGrid,iYFirstGrid]);
            this.DeliveryCar(1,iXLeftGrid,iYFirstGrid,iXLeftGrid,iYSecondGrid);
            m_vStateCache.push([STATE_MOVE,iMaxXGrid - this.m_iPosID * 2,iYSecondGrid]);
            m_vStateCache.push([STATE_BUFFER,5]);
            this.CacheBothOutMouse();
            this.CacheMoveState(iMaxXGrid + 3 + (SkyTrainBossFirstTransMoveIntruder.SKY_TRAIN_BODY_LEN - this.m_iPosID) * 2,iYSecondGrid);
         }
         else if(this.m_iPosID > iHalfLen)
         {
            m_vStateCache.push([STATE_BUFFER,5]);
            m_vStateCache.push([STATE_MOVE,iXLeftGrid + (this.m_iPosID - 1 - iHalfLen) * 2,iYFirstGrid]);
            m_vStateCache.push([STATE_BUFFER,5]);
            this.CacheBothOutMouse();
            m_vStateCache.push([STATE_BUFFER,5]);
            m_vStateCache.push([STATE_MOVE,iXLeftGrid,iYFirstGrid]);
            this.DeliveryCar(1,iXLeftGrid,iYFirstGrid,iXLeftGrid,iYSecondGrid);
            m_vStateCache.push([STATE_MOVE,iMaxXGrid + 3 + (SkyTrainBossFirstTransMoveIntruder.SKY_TRAIN_BODY_LEN - this.m_iPosID) * 2,iYSecondGrid]);
            m_vStateCache.push([STATE_BUFFER,5]);
         }
         else
         {
            m_vStateCache.push([STATE_BUFFER,5]);
            m_vStateCache.push([STATE_MOVE,iXLeftGrid,iYFirstGrid]);
            m_vStateCache.push([STATE_MOVE_TO_LEFT_HIDE,iXLeftGrid - 2,iYFirstGrid]);
            this.CacheBothOutMouse(true);
            m_vStateCache.push([STATE_APPEAR,iXLeftGrid - 2,iYSecondGrid,-1]);
            m_vStateCache.push([STATE_MOVE_TO_LEFT_SHOW,iXLeftGrid,iYSecondGrid]);
            m_vStateCache.push([STATE_MOVE,iMaxXGrid + 3 + (SkyTrainBossFirstTransMoveIntruder.SKY_TRAIN_BODY_LEN - this.m_iPosID) * 2,iYSecondGrid]);
            m_vStateCache.push([STATE_BUFFER,5]);
         }
      }
      
      private function CacheBothOutMouse(bIsRest:Boolean = false) : void
      {
         if(bIsRest)
         {
            m_vStateCache.push([STATE_HIDE,SkyTrainBossSecondTransMoveIntruder.OUT_MOUSE_TICK + 27 + 12 + 1]);
         }
         else
         {
            m_vStateCache.push([STATE_BOTH_OUT_STAIRS,12]);
            m_vStateCache.push([STATE_BOTH_OUT_MOUSE,SkyTrainBossSecondTransMoveIntruder.OUT_MOUSE_TICK]);
            m_vStateCache.push([STATE_BOTH_BACK_STAIRS,13]);
         }
      }
      
      private function CacheSkillFrontCollision() : void
      {
         var iWaitTick:int = 0;
         var iDelayTick:int = 0;
         var iMaxXGrid:int = BattleFieldView.a_1011;
         var iMaxYGrid:int = BattleFieldView.a_1012;
         for(var i:int = iMaxYGrid - 2; i >= 0; i -= 2)
         {
            m_stRandomSeed.nextInt(2);
         }
         m_vStateCache.push([STATE_APPEAR,m_iStartShowGridNo,iMaxYGrid - 1]);
         if(1 == this.m_iPosID)
         {
            iWaitTick = 10;
            iDelayTick = 6;
            m_vStateCache.push([STATE_MOVE,iMaxXGrid + 1,iMaxYGrid - 1]);
            m_vStateCache.push([STATE_BUFFER,5]);
            HavingRestForAwhile(iWaitTick + iDelayTick);
            m_vStateCache.push([STATE_MOVE,iMaxXGrid + 3,iMaxYGrid - 1]);
            m_vStateCache.push([STATE_HIDE,5 - iDelayTick + 4 * (2 * iMaxXGrid + 10 - 2 + 2 * SkyTrainBossSecondTransMoveIntruder.SKY_TRAIN_BODY_LEN)]);
         }
         else
         {
            m_vStateCache.push([STATE_HIDE,iWaitTick + 14 + 10 + 12 + 4 * (2 * iMaxXGrid + 10 + 2 * SkyTrainBossSecondTransMoveIntruder.SKY_TRAIN_BODY_LEN)]);
         }
      }
      
      private function CacheSkillCarBlew() : void
      {
         var iMaxXGrid:int = BattleFieldView.a_1011;
         var iMaxYGrid:int = BattleFieldView.a_1012;
         var iYFirstGrid:int = 1;
         var iYSecondGrid:int = iMaxYGrid - 2;
         var iXLeftGrid:int = 1;
         m_vStateCache.push([STATE_APPEAR,m_iStartShowGridNo,iYFirstGrid]);
         var iSkillTick:int = 80;
         var iMoveLen:int = 4;
         if(this.m_iPosID > iMoveLen)
         {
            m_vStateCache.push([STATE_HIDE,iSkillTick + 13 + 4 * (2 * SkyTrainBossSecondTransMoveIntruder.START_SHOW_GRIDNO + 6)]);
            return;
         }
         m_vStateCache.push([STATE_BUFFER,5]);
         switch(this.m_iPosID)
         {
            case 1:
               m_vStateCache.push([STATE_MOVE,iXLeftGrid,iYFirstGrid]);
               this.DeliveryCar(1,iXLeftGrid,iYFirstGrid,iXLeftGrid,iYSecondGrid);
               m_vStateCache.push([STATE_MOVE,iMaxXGrid - 3,iYSecondGrid]);
               break;
            case 2:
               m_vStateCache.push([STATE_MOVE,iXLeftGrid,iYFirstGrid]);
               this.DeliveryCar(1,iXLeftGrid,iYFirstGrid,iXLeftGrid,iYSecondGrid);
               m_vStateCache.push([STATE_MOVE,2,iYSecondGrid]);
               break;
            case 3:
               m_vStateCache.push([STATE_MOVE,2,iYFirstGrid]);
               break;
            case 4:
               m_vStateCache.push([STATE_MOVE,iMaxXGrid - 3,iYFirstGrid]);
         }
         m_vStateCache.push([STATE_BUFFER,5]);
         m_vStateCache.push([STATE_SKILL_CAR_BLEW,2]);
         m_vStateCache.push([STATE_APPEAR,m_iStartShowGridNo,iYFirstGrid]);
         m_vStateCache.push([STATE_HIDE,iSkillTick + this.GetSkillCarBlewWaiting()]);
      }
      
      private function GetSkillCarBlewWaiting() : int
      {
         return int((SkyTrainBossSecondTransMoveIntruder.START_SHOW_GRIDNO + m_arrCarBlewWaitGrid[this.m_iPosID - 1] - 6) * 4);
      }
      
      private function CacheMoveState(iXGrid:int, iYGrid:int) : void
      {
         m_vStateCache.push([STATE_BUFFER,5]);
         m_vStateCache.push([STATE_MOVE,iXGrid,iYGrid]);
         m_vStateCache.push([STATE_BUFFER,5]);
      }
      
      private function DeliveryCar(iDirection:int, iCurXGrid:int, iCurYGrid:int, iDstXGrid:int, iDstYGrid:int) : void
      {
         m_vStateCache.push([STATE_MOVE_TO_LEFT_HIDE,iCurXGrid - 2 * iDirection,iCurYGrid]);
         m_vStateCache.push([STATE_APPEAR,iDstXGrid - 2 * iDirection,iDstYGrid,-1]);
         m_vStateCache.push([STATE_MOVE_TO_LEFT_SHOW,iDstXGrid,iDstYGrid]);
      }
      
      override protected function IsSkillState() : Boolean
      {
         return STATE_SKILL_CAR_BLEW == m_iBossState || STATE_BOTH_OUT_MOUSE == m_iBossState || STATE_UP_OUT_MOUSE == m_iBossState || STATE_DOWN_OUT_MOUSE == m_iBossState;
      }
      
      override protected function UpdateBossBloodProgress() : void
      {
         trace(toString() + "->UpdateBossBloodProgress->null");
      }
      
      override protected function CheckIsCanLaunchSkill(iCurrentTime:int) : Boolean
      {
         var stStartFieldGrid:a_3491 = null;
         var stBaseShot:a_4348 = null;
         var fPosX:Number = NaN;
         var fPosY:Number = NaN;
         var stSkyTrainCarBlewMoveIntruder:SkyTrainCarBlewMoveIntruder = null;
         if(!IsCanLaunchShot(iCurrentTime))
         {
            return false;
         }
         if(null == m_stCurrentFieldGrid)
         {
            return false;
         }
         switch(m_iBossState)
         {
            case STATE_SKILL_CAR_BLEW:
               stSkyTrainCarBlewMoveIntruder = SkyTrainCarBlewMoveIntruder.a_3926();
               stSkyTrainCarBlewMoveIntruder.a_1797(a_4265(),-1);
               stStartFieldGrid = m_stCurrentFieldGrid;
               stSkyTrainCarBlewMoveIntruder.x = this.x;
               stSkyTrainCarBlewMoveIntruder.y = this.y;
               stStartFieldGrid.m_stCurrentBattbleFieldView.a_3459(stSkyTrainCarBlewMoveIntruder,stStartFieldGrid,false);
               stStartFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stSkyTrainCarBlewMoveIntruder,BattleLayerDefine.INTRUDER_SKY_BOSS_TYPE,stStartFieldGrid);
               break;
            case STATE_UP_OUT_MOUSE:
               stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo - 1);
               this.OutMoveIntruder(stStartFieldGrid);
               break;
            case STATE_DOWN_OUT_MOUSE:
               stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo + 1);
               this.OutMoveIntruder(stStartFieldGrid);
               break;
            case STATE_BOTH_OUT_MOUSE:
               stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo - 1);
               this.OutMoveIntruder(stStartFieldGrid);
               stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo + 1);
               this.OutMoveIntruder(stStartFieldGrid);
               break;
            default:
               trace(">>>>>>SkyTrainBossBodySecondTransMoveIntruder::CheckIsLaunchSkill:: 不可能事件！！！ m_iBossState = " + m_iBossState);
               return false;
         }
         return true;
      }
      
      private function OutMoveIntruder(stStartFieldGrid:a_3491, iIntruderMoveDirection:int = -1) : Boolean
      {
         var iFindMoveIntruderTypeID:int = 0;
         var stBaseMoveIntruder:a_4206 = null;
         if(null == stStartFieldGrid)
         {
            return false;
         }
         if(m_stCurrentFieldGrid.m_isNeedTray && (null == stStartFieldGrid || stStartFieldGrid.m_isNeedTray))
         {
            iFindMoveIntruderTypeID = 8388867;
         }
         else
         {
            iFindMoveIntruderTypeID = 8388755;
         }
         iIntruderMoveDirection *= iVerticalDirect;
         stBaseMoveIntruder = a_4255.getInstance().a_4256(iFindMoveIntruderTypeID);
         stBaseMoveIntruder.a_1797(a_4265(),iIntruderMoveDirection);
         stBaseMoveIntruder.m_stMoveIntruderTypeID = iFindMoveIntruderTypeID;
         return AddOutMoveIntruder(stBaseMoveIntruder,stStartFieldGrid,iIntruderMoveDirection,0.5);
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         return false;
      }
      
      public function GoAhead2(iCurrentTime:int) : Boolean
      {
         if(null == m_stCurrentFieldGrid)
         {
            return false;
         }
         if(!IsCalTick(iCurrentTime))
         {
            return false;
         }
         m_iLastCalTime = iCurrentTime;
         ++m_iLaunchRunTick;
         if(!a_1460)
         {
            InitState();
            a_1460 = true;
         }
         if(m_iBossState != STATE_DEAD && this.a_1339 <= 0)
         {
            LifeIsZeroHandle(STATE_DEAD);
            return false;
         }
         if(m_iBossState == STATE_DEAD)
         {
            nextFrame();
            return false;
         }
         if(m_iRestTick > 0)
         {
            nextFrame();
            if(this.IsMoving())
            {
               MoveMySelf();
            }
            this.CheckIsCanLaunchSkill(iCurrentTime);
            if(a_1278 != null)
            {
               GotoAndStopFrame(a_1275);
            }
            --m_iRestTick;
            return false;
         }
         return this.SwitchState(iCurrentTime);
      }
      
      override protected function setAppearToGrid(iXGridNo:int, iYGridNo:int, iXOffset:int = 0, iYOffset:int = 0) : void
      {
         super.setAppearToGrid(iXGridNo,iYGridNo,iXOffset,iYOffset);
         this.visible = false;
      }
      
      override protected function SwitchState(iCurrentTime:int) : Boolean
      {
         var fPosX:Number = NaN;
         var fPosY:Number = NaN;
         if(0 == m_vStateCache.length)
         {
            CacheNextSkill();
         }
         var iNextState:uint = uint(m_vStateCache[0][0]);
         var iNextValue:int = int(m_vStateCache[0][1]);
         this.visible = true;
         m_bIsNoChangeCannotSee = false;
         switch(iNextState)
         {
            case STATE_HIDE:
               SetIsCannotSee(true,true);
               m_bIsNoChangeCannotSee = true;
               break;
            case STATE_APPEAR:
               if(m_vStateCache[0].length >= 4)
               {
                  iHorizontalDirect = -iHorizontalDirect;
               }
               this.setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2]);
               iNextValue = 0;
               break;
            case STATE_MOVE:
            case STATE_MOVE_TO_LEFT_HIDE:
            case STATE_MOVE_TO_LEFT_SHOW:
            case STATE_MOVE_TO_RIGHT_HIDE:
            case STATE_MOVE_TO_RIGHT_SHOW:
               fPosX = getPosXByXGridNo(m_vStateCache[0][1]);
               fPosY = getPosYByYGridNo(m_vStateCache[0][2]);
               iNextValue = setMoveToPosition(fPosX,fPosY);
               break;
            case STATE_UP_OUT_MOUSE:
            case STATE_DOWN_OUT_MOUSE:
            case STATE_BOTH_OUT_MOUSE:
               m_iLaunchNum = 1;
               m_iLaunchDelayTick = 3;
               break;
            case STATE_SKILL_CAR_BLEW:
               m_iLaunchNum = 1;
               m_iLaunchDelayTick = 1;
         }
         trace("++++++++++ID = " + this.m_iPosID + " ChangeState:iState = " + iNextState + "  m_iRestTick = " + iNextValue + "  iCurrentTime = " + iCurrentTime);
         m_vStateCache.shift();
         ChangeState(iNextState,iNextValue,iCurrentTime);
         if(STATE_HIDE == m_iBossState || STATE_APPEAR == m_iBossState || STATE_BUFFER == m_iBossState || this.IsMoving())
         {
            SetIsCannotSee(true,Boolean(STATE_APPEAR == m_iBossState));
            m_bIsNoChangeCannotSee = true;
            a_1465 = 3;
         }
         else
         {
            SetIsCannotSee(false,false);
            a_1465 = 0;
         }
         return true;
      }
      
      override protected function IsMoving() : Boolean
      {
         return STATE_MOVE == m_iBossState || STATE_MOVE_TO_LEFT_HIDE == m_iBossState || STATE_MOVE_TO_LEFT_SHOW == m_iBossState || STATE_MOVE_TO_RIGHT_HIDE == m_iBossState || STATE_MOVE_TO_RIGHT_SHOW == m_iBossState;
      }
   }
}

