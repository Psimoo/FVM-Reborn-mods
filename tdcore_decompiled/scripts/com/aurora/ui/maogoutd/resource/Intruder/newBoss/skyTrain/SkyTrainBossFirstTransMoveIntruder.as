package com.aurora.ui.maogoutd.resource.Intruder.newBoss.skyTrain
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.effect.a_4128;
   import flash.utils.Dictionary;
   
   public class SkyTrainBossFirstTransMoveIntruder extends BaseBossMoveIntruder
   {
      
      internal static const ROTATING_CAR_POS_ID:int = 2;
      
      internal static const START_SHOW_GRIDNO:uint = 11;
      
      internal static const SKY_TRAIN_BODY_LEN:uint = 13;
      
      internal static const SKILL_NUM:int = 3;
      
      internal static const MOVE_SPEED:Number = a_3491.a_1080 / 4;
      
      protected static const STATE_BUFFER:uint = 6;
      
      protected static const STATE_MOVE_TO_LEFT_HIDE:uint = 7;
      
      protected static const STATE_MOVE_TO_RIGHT_HIDE:uint = 8;
      
      protected static const STATE_MOVE_TO_LEFT_SHOW:uint = 9;
      
      protected static const STATE_MOVE_TO_RIGHT_SHOW:uint = 10;
      
      private var m_vBody:Vector.<SkyTrainBossBodyFirstTransMoveIntruder>;
      
      private var m_iLastRealeaseSmokeTime:int = -1;
      
      public function SkyTrainBossFirstTransMoveIntruder()
      {
         super();
         m_bIsNeedHighPrecision = true;
         a_1467 = 0.5 * this.height - a_3491.a_1081;
         m_iStartShowGridNo = START_SHOW_GRIDNO + 1;
         this.m_vBody = new Vector.<SkyTrainBossBodyFirstTransMoveIntruder>(SKY_TRAIN_BODY_LEN,false);
         for(var i:int = 0; i < SKY_TRAIN_BODY_LEN; i++)
         {
            this.m_vBody[i] = SkyTrainBossBodyFirstTransMoveIntruder.a_3926();
            this.m_vBody[i].iPosID = i + 1;
            this.m_vBody[i].BossHead = this;
         }
         a_1279 = -this.width;
      }
      
      public static function a_3926() : BaseBossMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(SkyTrainBossFirstTransMoveIntruder) as SkyTrainBossFirstTransMoveIntruder;
      }
      
      override protected function a_3940() : Boolean
      {
         for(var i:int = 0; i < SKY_TRAIN_BODY_LEN; i++)
         {
            this.m_vBody[i].RealeaseByHead();
         }
         super.a_3940();
         return true;
      }
      
      override protected function getBindMovie() : Class
      {
         return SkyTrainBossFirstTransMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = MOVE_SPEED;
         return true;
      }
      
      override protected function InitSkillCache() : void
      {
         var fPosX:Number = NaN;
         var fPosY:Number = NaN;
         var i:int = 0;
         iHorizontalDirect = 1;
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_APPEAR,m_iStartShowGridNo,0]);
         HavingRestForAwhile(10);
         fPosX = (m_stCurrentFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
         fPosY = (m_stCurrentFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081;
         for(i = 0; i < SKY_TRAIN_BODY_LEN; i++)
         {
            this.m_vBody[i].visible = false;
            this.m_vBody[i].BossHead = this;
            this.m_vBody[i].a_1797(a_4265(),-1);
            this.m_vBody[i].m_stMoveIntruderTypeID = 8388608;
            this.m_vBody[i].x = fPosX;
            this.m_vBody[i].y = fPosY;
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this.m_vBody[i],BattleLayerDefine.INTRUDER_SKY_BOSS_TYPE,m_stCurrentFieldGrid);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(this.m_vBody[i],m_stCurrentFieldGrid,false);
         }
      }
      
      private function CacheMoveState(iXGrid:int, iYGrid:int) : void
      {
         m_vStateCache.push([STATE_BUFFER,5]);
         m_vStateCache.push([STATE_MOVE,iXGrid,iYGrid]);
         m_vStateCache.push([STATE_BUFFER,5]);
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.CacheSkillLaser);
         m_vSkillFunction.push(this.CacheSkillRotatingShells);
         m_vSkillFunction.push(this.CacheSkillSmokeMouse);
      }
      
      private function CacheSkillLaser() : void
      {
         var iYGrid:int = 0;
         var iChangeXGrid:int = 1;
         var iMaxXGrid:int = BattleFieldView.a_1011;
         var iMaxYGrid:int = BattleFieldView.a_1012;
         m_vStateCache.push([STATE_APPEAR,m_iStartShowGridNo,iYGrid]);
         m_vStateCache.push([STATE_BUFFER,5]);
         m_vStateCache.push([STATE_MOVE,iChangeXGrid,iYGrid]);
         m_vStateCache.push([STATE_MOVE_TO_LEFT_HIDE,iChangeXGrid - 2,iYGrid]);
         m_vStateCache.push([STATE_APPEAR,iChangeXGrid - 2,iMaxYGrid - 1,-1]);
         m_vStateCache.push([STATE_MOVE_TO_LEFT_SHOW,iChangeXGrid,iMaxYGrid - 1]);
         m_vStateCache.push([STATE_MOVE,iMaxXGrid - 1 * 2 + 1,iMaxYGrid - 1]);
         m_vStateCache.push([STATE_BUFFER,5]);
         HavingRestForAwhile(39);
         this.CacheMoveState(iMaxXGrid + 3 + (SkyTrainBossFirstTransMoveIntruder.SKY_TRAIN_BODY_LEN - 1) * 2 + 1,iMaxYGrid - 1);
      }
      
      private function CacheSkillRotatingShells() : void
      {
         var iYGrid:int = 3;
         var iHideXGrid:int = 1;
         var iXGrid:int = int(m_stRandomSeed.nextInt(2));
         var iMaxXGrid:int = BattleFieldView.a_1011;
         var iMaxYGrid:int = BattleFieldView.a_1012;
         var iSkillTick:int = 70;
         var iMaxMoveGrid:int = Math.max(iXGrid + SkyTrainBossFirstTransMoveIntruder.ROTATING_CAR_POS_ID * 2 - 2 - iHideXGrid,iMaxXGrid - 2 - SkyTrainBossFirstTransMoveIntruder.ROTATING_CAR_POS_ID * 2 - 2 - iXGrid);
         m_vStateCache.push([STATE_APPEAR,m_iStartShowGridNo,iYGrid]);
         m_vStateCache.push([STATE_BUFFER,5]);
         m_vStateCache.push([STATE_MOVE,iXGrid + 1 * 2 - 1,iYGrid]);
         m_vStateCache.push([STATE_BUFFER,5]);
         m_vStateCache.push([STATE_BUFFER,5]);
         m_vStateCache.push([STATE_MOVE,iHideXGrid,iYGrid]);
         m_vStateCache.push([STATE_MOVE_TO_LEFT_HIDE,iHideXGrid - 2,iYGrid]);
         m_vStateCache.push([STATE_HIDE,iSkillTick + (iMaxMoveGrid - (iXGrid + 1 * 2 - 1 - iHideXGrid)) * 4]);
         m_vStateCache.push([STATE_HIDE,14]);
      }
      
      private function CacheSkillSmokeMouse() : void
      {
         var iMaxXGrid:int = BattleFieldView.a_1011;
         var iMaxYGrid:int = BattleFieldView.a_1012;
         var iXLeftGrid:int = 1;
         var iXRightGrid:int = iMaxXGrid - 2;
         var iXStopGrid:int = 3 - 1;
         var iYFirstSegGrid:int = 0;
         var iYSecondSegGrid:int = iMaxYGrid - 1;
         var iYThirdSegGrid:int = 3;
         m_vStateCache.push([STATE_APPEAR,m_iStartShowGridNo,iYFirstSegGrid]);
         m_vStateCache.push([STATE_BUFFER,5]);
         m_vStateCache.push([STATE_MOVE,iXLeftGrid,iYFirstSegGrid]);
         this.DeliveryCar(1,iXLeftGrid,iYFirstSegGrid,iXLeftGrid,iYSecondSegGrid);
         m_vStateCache.push([STATE_MOVE,iXRightGrid,iYSecondSegGrid]);
         this.DeliveryCar(-1,iXRightGrid,iYSecondSegGrid,iXRightGrid,iYThirdSegGrid);
         m_vStateCache.push([STATE_MOVE,iXStopGrid,iYThirdSegGrid]);
         m_vStateCache.push([STATE_BUFFER,5]);
         m_vStateCache.push([STATE_WAITING,21 + 31 + 13 - 1]);
         m_vStateCache.push([STATE_BUFFER,5]);
         m_vStateCache.push([STATE_MOVE,iXLeftGrid,iYThirdSegGrid]);
         m_vStateCache.push([STATE_MOVE_TO_LEFT_HIDE,iXLeftGrid - 2,iYThirdSegGrid]);
         m_vStateCache.push([STATE_HIDE,(1 + (SkyTrainBossFirstTransMoveIntruder.SKY_TRAIN_BODY_LEN - 1) * 2) * 4]);
      }
      
      private function DeliveryCar(iDirection:int, iCurXGrid:int, iCurYGrid:int, iDstXGrid:int, iDstYGrid:int) : void
      {
         m_vStateCache.push([STATE_MOVE_TO_LEFT_HIDE,iCurXGrid - 2 * iDirection,iCurYGrid]);
         m_vStateCache.push([STATE_APPEAR,iDstXGrid - 2 * iDirection,iDstYGrid,-1]);
         m_vStateCache.push([STATE_MOVE_TO_LEFT_SHOW,iDstXGrid,iDstYGrid]);
      }
      
      public function RealeaseSmoke(iCurrentTime:int) : void
      {
         if(iCurrentTime - this.m_iLastRealeaseSmokeTime >= 8)
         {
            this.m_iLastRealeaseSmokeTime = iCurrentTime;
            a_4128.a_1413 = true;
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_stLargeFogEffect.a_1797();
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3462(BattleFieldView.a_1011);
         }
      }
      
      override protected function InitBossStateFrameID() : void
      {
         m_dictBossStateFrameID = new Dictionary();
         m_dictBossStateFrameID[STATE_HIDE + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_BUFFER + "_" + 0] = 5;
         var iAddFrame:int = 1;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 1] = 1 + iAddFrame;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 1 + iAddFrame;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = 3 + iAddFrame;
         m_dictBossStateFrameID[STATE_BUFFER + "_" + 1] = 5 + iAddFrame;
         m_dictBossStateFrameID[STATE_MOVE_TO_LEFT_HIDE + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_MOVE_TO_RIGHT_HIDE + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_MOVE_TO_LEFT_SHOW + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_MOVE_TO_RIGHT_SHOW + "_" + 0] = 10;
         m_dictBossStateFrameID[STATE_MOVE_TO_LEFT_HIDE + "_" + 1] = 11;
         m_dictBossStateFrameID[STATE_MOVE_TO_RIGHT_HIDE + "_" + 1] = 12;
         m_dictBossStateFrameID[STATE_MOVE_TO_LEFT_SHOW + "_" + 1] = 13;
         m_dictBossStateFrameID[STATE_MOVE_TO_RIGHT_SHOW + "_" + 1] = 14;
         m_dictBossStateFrameID[STATE_DEAD] = 15;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = 16;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = 16;
      }
      
      override protected function IsSkillState() : Boolean
      {
         return false;
      }
      
      override protected function CheckIsCanLaunchSkill(iCurrentTime:int) : Boolean
      {
         return false;
      }
      
      override public function get width() : Number
      {
         return 86;
      }
      
      override public function get height() : Number
      {
         return 82;
      }
      
      override protected function SetRandomSeed() : void
      {
         var iGlobalID:int = globalMoveFighterID;
         var iXGridNo:int = m_stCurrentFieldGrid.m_iXGridNo;
         var iYGridNo:int = m_stCurrentFieldGrid.m_iYGridNo;
         m_stRandomSeed.setSeed(iGlobalID - iXGridNo,iGlobalID - iYGridNo);
         for(var i:int = 0; i < SKY_TRAIN_BODY_LEN; i++)
         {
            this.m_vBody[i].SetBodyRandomSeed(iGlobalID,iXGridNo,iYGridNo);
         }
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         if(iCurrentTime & 1)
         {
            return false;
         }
         super.a_4216(iCurrentTime);
         for(var i:int = 0; i < SKY_TRAIN_BODY_LEN; i++)
         {
            this.m_vBody[i].GoAhead2(iCurrentTime);
         }
         return true;
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
         m_bIsNoChangeCannotSee = false;
         switch(iNextState)
         {
            case STATE_HIDE:
               SetIsCannotSee(true,true);
               break;
            case STATE_APPEAR:
               SetIsCannotSee(true,true);
               if(m_vStateCache[0].length >= 4)
               {
                  iHorizontalDirect = -iHorizontalDirect;
               }
               setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2]);
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
         }
         m_vStateCache.shift();
         ChangeState(iNextState,iNextValue,iCurrentTime);
         if(this.IsFlying())
         {
            SetIsCannotSee(true,false);
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
      
      private function IsFlying() : Boolean
      {
         return true;
      }
      
      override protected function IsMoving() : Boolean
      {
         return STATE_MOVE == m_iBossState || STATE_MOVE_TO_LEFT_HIDE == m_iBossState || STATE_MOVE_TO_LEFT_SHOW == m_iBossState || STATE_MOVE_TO_RIGHT_HIDE == m_iBossState || STATE_MOVE_TO_RIGHT_SHOW == m_iBossState;
      }
      
      override protected function IsCanReduceLife() : Boolean
      {
         return Boolean(a_1339 > 0);
      }
   }
}

