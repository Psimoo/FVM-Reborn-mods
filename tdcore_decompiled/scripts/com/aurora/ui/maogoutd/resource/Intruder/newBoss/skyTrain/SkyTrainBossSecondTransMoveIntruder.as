package com.aurora.ui.maogoutd.resource.Intruder.newBoss.skyTrain
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.effect.BaseAccelerationEffect;
   import com.aurora.ui.maogoutd.resource.effect.ButterRunwayAcceEffect;
   import flash.utils.Dictionary;
   
   public class SkyTrainBossSecondTransMoveIntruder extends BaseBossMoveIntruder
   {
      
      internal static const START_SHOW_GRIDNO:uint = 11;
      
      internal static const OUT_MOUSE_TICK:uint = 5;
      
      internal static const SKY_TRAIN_BODY_LEN:uint = 9;
      
      internal static const SKILL_NUM:int = 4;
      
      internal static const BUTTER_RUNWAY_TICK:int = 20 * 50;
      
      internal static const MOVE_SPEED:Number = a_3491.a_1080 / 4;
      
      protected static const STATE_BUFFER:uint = 6;
      
      protected static const STATE_MOVE_TO_LEFT_HIDE:uint = 7;
      
      protected static const STATE_MOVE_TO_RIGHT_HIDE:uint = 8;
      
      protected static const STATE_MOVE_TO_LEFT_SHOW:uint = 9;
      
      protected static const STATE_MOVE_TO_RIGHT_SHOW:uint = 10;
      
      protected static const STATE_MOVE_COLLIDE:uint = 11;
      
      protected static const STATE_MOVE_BUTTER:uint = 12;
      
      private var m_vBody:Vector.<SkyTrainBossBodySecondTransMoveIntruder>;
      
      private var m_iLastXGridNo:int;
      
      private var m_iLastYGridNo:int;
      
      public function SkyTrainBossSecondTransMoveIntruder()
      {
         super();
         m_bIsNeedHighPrecision = true;
         a_1467 = 0.5 * this.height - a_3491.a_1081;
         m_iStartShowGridNo = START_SHOW_GRIDNO + 1;
         this.m_vBody = new Vector.<SkyTrainBossBodySecondTransMoveIntruder>(SKY_TRAIN_BODY_LEN,false);
         for(var i:int = 0; i < SKY_TRAIN_BODY_LEN; i++)
         {
            this.m_vBody[i] = SkyTrainBossBodySecondTransMoveIntruder.a_3926();
            this.m_vBody[i].iPosID = i + 1;
            this.m_vBody[i].BossHead = this;
         }
         a_1279 = -this.width;
      }
      
      public static function a_3926() : BaseBossMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(SkyTrainBossSecondTransMoveIntruder) as SkyTrainBossSecondTransMoveIntruder;
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
         return SkyTrainBossSecondTransMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         m_bSkillIsOrder = true;
         a_1350 = MOVE_SPEED;
         return true;
      }
      
      override protected function InitSkillCache() : void
      {
         var fPosY:Number = NaN;
         var i:int = 0;
         iHorizontalDirect = 1;
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_APPEAR,m_iStartShowGridNo,0]);
         HavingRestForAwhile(10);
         var fPosX:Number = (m_stCurrentFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
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
         this.m_iLastXGridNo = this.m_iLastYGridNo = -1;
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
         var iYGridLen:int = int(arrYGrid.length);
         for(var iY:int = 0; iY < iYGridLen; iY++)
         {
            iDirection = 0 == (iY & 1) ? 1 : -1;
            iCurYGrid = int(arrYGrid[iY]);
            iNextYGrid = iY < iYGridLen - 1 ? int(arrYGrid[iY + 1]) : -1;
            if(iNextYGrid >= 0)
            {
               iCurXGrid = 1 == iDirection ? iXLeftGrid : iXRightGrid;
               m_vStateCache.push([STATE_MOVE_BUTTER,iCurXGrid,iCurYGrid]);
               this.DeliveryCar(iDirection,iCurXGrid,iCurYGrid,iCurXGrid,iNextYGrid);
            }
            else
            {
               m_vStateCache.push([STATE_MOVE_BUTTER,(iShowLen - 1) * 2 + iMaxXGrid + 4 + 1,iCurYGrid]);
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
         m_vStateCache.push([STATE_BUFFER,5]);
         m_vStateCache.push([STATE_MOVE,iXLeftGrid,iYFirstGrid]);
         this.DeliveryCar(1,iXLeftGrid,iYFirstGrid,iXLeftGrid,iYSecondGrid);
         m_vStateCache.push([STATE_MOVE,iMaxXGrid - 1 * 2 + 1,iYSecondGrid]);
         m_vStateCache.push([STATE_BUFFER,5]);
         m_vStateCache.push([STATE_WAITING,SkyTrainBossSecondTransMoveIntruder.OUT_MOUSE_TICK + 27]);
         this.CacheMoveState(iMaxXGrid + 3 + (SkyTrainBossFirstTransMoveIntruder.SKY_TRAIN_BODY_LEN - 1) * 2 + 1,iYSecondGrid);
      }
      
      private function CacheSkillFrontCollision() : void
      {
         var iCurYGrid:int = 0;
         var iCurXGrid:int = 0;
         var iDirection:int = 0;
         var iNextYGrid:int = 0;
         var iMaxXGrid:int = BattleFieldView.a_1011;
         var iMaxYGrid:int = BattleFieldView.a_1012;
         var iXLeftGrid:int = 1;
         var iXRightGrid:int = iMaxXGrid - 2;
         var arrYGrid:Array = [iMaxYGrid - 1];
         for(var i:int = iMaxYGrid - 2; i >= 0; i -= 2)
         {
            iCurYGrid = i - m_stRandomSeed.nextInt(2);
            if(iCurYGrid < 0)
            {
               iCurYGrid = 0;
            }
            arrYGrid.push(iCurYGrid);
         }
         var iWaitTick:int = 10;
         m_vStateCache.push([STATE_APPEAR,m_iStartShowGridNo,arrYGrid[0]]);
         m_vStateCache.push([STATE_MOVE,iMaxXGrid,arrYGrid[0]]);
         m_vStateCache.push([STATE_BUFFER,5]);
         HavingRestForAwhile(iWaitTick);
         m_vStateCache.push([STATE_BUFFER,5]);
         var iYGridLen:int = int(arrYGrid.length);
         for(var iY:int = 0; iY < iYGridLen; iY++)
         {
            iDirection = 0 == (iY & 1) ? 1 : -1;
            iCurYGrid = int(arrYGrid[iY]);
            iNextYGrid = iY < iYGridLen - 1 ? int(arrYGrid[iY + 1]) : -1;
            if(iNextYGrid >= 0)
            {
               iCurXGrid = 1 == iDirection ? iXLeftGrid : iXRightGrid;
               m_vStateCache.push([STATE_MOVE_COLLIDE,iCurXGrid,iCurYGrid]);
               this.DeliveryCar(iDirection,iCurXGrid,iCurYGrid,iCurXGrid,iNextYGrid);
            }
            else
            {
               m_vStateCache.push([STATE_MOVE_COLLIDE,m_iStartShowGridNo,iCurYGrid]);
            }
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
         m_vStateCache.push([STATE_BUFFER,5]);
         m_vStateCache.push([STATE_MOVE,iXLeftGrid,iYFirstGrid]);
         this.DeliveryCar(1,iXLeftGrid,iYFirstGrid,iXLeftGrid,iYSecondGrid);
         m_vStateCache.push([STATE_MOVE,6,iYSecondGrid]);
         m_vStateCache.push([STATE_MOVE_COLLIDE,m_iStartShowGridNo,iYSecondGrid]);
         m_vStateCache.push([STATE_BUFFER,5]);
         m_vStateCache.push([STATE_APPEAR,m_iStartShowGridNo,iYFirstGrid]);
         m_vStateCache.push([STATE_HIDE,iSkillTick + 3 - 1]);
      }
      
      private function AddButterEffect() : void
      {
         if(null == m_stCurrentFieldGrid)
         {
            return;
         }
         if(this.m_iLastXGridNo == m_stCurrentFieldGrid.m_iInitialXGridNo && this.m_iLastYGridNo == m_stCurrentFieldGrid.m_iInitialYGridNo)
         {
            return;
         }
         this.m_iLastXGridNo = m_stCurrentFieldGrid.m_iInitialXGridNo;
         this.m_iLastYGridNo = m_stCurrentFieldGrid.m_iInitialYGridNo;
         var stAccelerationEffect:BaseAccelerationEffect = ButterRunwayAcceEffect.a_3926();
         stAccelerationEffect.a_1797(m_stCurrentFieldGrid,BUTTER_RUNWAY_TICK);
         m_stCurrentFieldGrid.AddAcceleration(stAccelerationEffect);
      }
      
      private function DeliveryCar(iDirection:int, iCurXGrid:int, iCurYGrid:int, iDstXGrid:int, iDstYGrid:int) : void
      {
         m_vStateCache.push([STATE_MOVE_TO_LEFT_HIDE,iCurXGrid - 2 * iDirection,iCurYGrid]);
         m_vStateCache.push([STATE_APPEAR,iDstXGrid - 2 * iDirection,iDstYGrid,-1]);
         m_vStateCache.push([STATE_MOVE_TO_LEFT_SHOW,iDstXGrid,iDstYGrid]);
      }
      
      override protected function InitBossStateFrameID() : void
      {
         m_dictBossStateFrameID = new Dictionary();
         m_dictBossStateFrameID[STATE_HIDE + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_MOVE_BUTTER + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_BUFFER + "_" + 0] = 5;
         var iAddFrame:int = 1;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 1] = 1 + iAddFrame;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 1 + iAddFrame;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = 3 + iAddFrame;
         m_dictBossStateFrameID[STATE_MOVE_BUTTER + "_" + 1] = 3 + iAddFrame;
         m_dictBossStateFrameID[STATE_BUFFER + "_" + 1] = 5 + iAddFrame;
         m_dictBossStateFrameID[STATE_MOVE_TO_LEFT_HIDE + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_MOVE_TO_RIGHT_HIDE + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_MOVE_TO_LEFT_SHOW + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_MOVE_TO_RIGHT_SHOW + "_" + 0] = 10;
         m_dictBossStateFrameID[STATE_MOVE_TO_LEFT_HIDE + "_" + 1] = 11;
         m_dictBossStateFrameID[STATE_MOVE_TO_RIGHT_HIDE + "_" + 1] = 12;
         m_dictBossStateFrameID[STATE_MOVE_TO_LEFT_SHOW + "_" + 1] = 13;
         m_dictBossStateFrameID[STATE_MOVE_TO_RIGHT_SHOW + "_" + 1] = 14;
         m_dictBossStateFrameID[STATE_MOVE_COLLIDE + "_" + 0] = 15;
         m_dictBossStateFrameID[STATE_MOVE_COLLIDE + "_" + 1] = 15;
         m_dictBossStateFrameID[STATE_DEAD] = 17;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = 18;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = 18;
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
      
      override protected function MoveMySelf() : void
      {
         super.MoveMySelf();
         if(!IsInBattle())
         {
            return;
         }
         if(STATE_MOVE_COLLIDE == m_iBossState)
         {
            ClearFieldGridDefenseCard(m_stCurrentFieldGrid);
         }
         else if(STATE_MOVE_BUTTER == m_iBossState)
         {
            this.AddButterEffect();
         }
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
            case STATE_MOVE_BUTTER:
            case STATE_MOVE_TO_LEFT_HIDE:
            case STATE_MOVE_TO_LEFT_SHOW:
            case STATE_MOVE_TO_RIGHT_HIDE:
            case STATE_MOVE_TO_RIGHT_SHOW:
            case STATE_MOVE_COLLIDE:
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
         return STATE_MOVE_COLLIDE != m_iBossState;
      }
      
      override protected function IsMoving() : Boolean
      {
         return STATE_MOVE == m_iBossState || STATE_MOVE_TO_LEFT_HIDE == m_iBossState || STATE_MOVE_TO_LEFT_SHOW == m_iBossState || STATE_MOVE_TO_RIGHT_HIDE == m_iBossState || STATE_MOVE_TO_RIGHT_SHOW == m_iBossState || STATE_MOVE_COLLIDE == m_iBossState || STATE_MOVE_BUTTER == m_iBossState;
      }
      
      override protected function IsCanReduceLife() : Boolean
      {
         return Boolean(a_1339 > 0);
      }
   }
}

