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
   import com.aurora.ui.maogoutd.resource.shot.boss.skyTrain.SkyTrainMissileShot;
   import flash.utils.Dictionary;
   
   public class SkyTrainBossBodyMoveIntruder extends BaseBossMoveIntruder
   {
      
      protected static const STATE_ATTACK_MISSILE:uint = 6;
      
      protected static const STATE_ATTACK_LEFT_MOUSE:uint = 8;
      
      protected static const STATE_ATTACK_RIGHT_MOUSE:uint = 10;
      
      protected static const STATE_ATTACK_MIDDLE_MOUSE:uint = 9;
      
      protected static const STATE_BUFFER:uint = 11;
      
      protected static const STATE_OUT_BARREL:uint = 12;
      
      protected static const STATE_MISSILE_WARNING:uint = 13;
      
      protected static const STATE_BACK_BARREL:uint = 14;
      
      protected static const STATE_OUT_LEFT_STAIRS:uint = 15;
      
      protected static const STATE_BACK_LEFT_STAIRS:uint = 16;
      
      protected static const STATE_OUT_RIGHT_STAIRS:uint = 17;
      
      protected static const STATE_BACK_RIGHT_STAIRS:uint = 18;
      
      protected static const STATE_OUT_MIDDLE_STAIRS:uint = 19;
      
      protected static const STATE_BACK_MIDDLE_STAIRS:uint = 20;
      
      private var m_iPosID:int;
      
      private var m_stHead:SkyTrainBossMoveIntruder;
      
      public function SkyTrainBossBodyMoveIntruder()
      {
         super();
         m_bIsNeedHighPrecision = true;
         a_1467 = 0.5 * this.height - a_3491.a_1081;
         m_fOrginSpeed = SkyTrainBossMoveIntruder.MOVE_SPEED;
      }
      
      public static function a_3926() : SkyTrainBossBodyMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(SkyTrainBossBodyMoveIntruder) as SkyTrainBossBodyMoveIntruder;
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
         m_iStartShowGridNo = BattleFieldView.a_1012 + this.m_iPosID * 2;
      }
      
      public function set BossHead(stHead:SkyTrainBossMoveIntruder) : void
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
         return SkyTrainBossBodyMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         return true;
      }
      
      override public function get height() : Number
      {
         return 134;
      }
      
      private function CacheMoveState(iXGrid:int, iYGrid:int) : void
      {
         m_vStateCache.push([STATE_BUFFER,5]);
         m_vStateCache.push([STATE_MOVE,iXGrid,iYGrid]);
         m_vStateCache.push([STATE_BUFFER,5]);
      }
      
      override protected function UpdateBossBloodProgress() : void
      {
         trace(toString() + "->UpdateBossBloodProgress->null");
      }
      
      private function CacheSkillMissileOdd() : void
      {
         this.CacheSkillMissile(0);
      }
      
      private function CacheSkillMissileEven() : void
      {
         this.CacheSkillMissile(1);
      }
      
      private function CacheSkillMissile(iPos:int) : void
      {
         var iXGrid:int = BattleFieldView.a_1011 - 1;
         m_vStateCache.push([STATE_APPEAR,iXGrid,m_iStartShowGridNo]);
         this.CacheMoveState(iXGrid,-iPos + this.m_iPosID * 2 - 1);
         HavingRestForAwhile(this.m_iPosID * 4);
         m_vStateCache.push([STATE_OUT_BARREL,10]);
         m_vStateCache.push([STATE_MISSILE_WARNING,5]);
         m_vStateCache.push([STATE_ATTACK_MISSILE,4]);
         HavingRestForAwhile((1 + SkyTrainBossMoveIntruder.SKY_TRAIN_BODY_LEN - this.m_iPosID) * 4);
         this.CacheMoveState(iXGrid,-3 - 2 * (SkyTrainBossMoveIntruder.SKY_TRAIN_BODY_LEN - this.m_iPosID));
      }
      
      private function CacheSkillMiddleOutMouse() : void
      {
         var iMaxYGrid:int = BattleFieldView.a_1012;
         var iXGrid:int = 4;
         m_vStateCache.push([STATE_APPEAR,iXGrid,-1 - 2 * this.m_iPosID,-1]);
         this.CacheMoveState(iXGrid,iMaxYGrid + 1 - this.m_iPosID * 2);
         m_vStateCache.push([STATE_OUT_MIDDLE_STAIRS,12]);
         m_vStateCache.push([STATE_ATTACK_MIDDLE_MOUSE,SkyTrainBossMoveIntruder.OUT_MOUSE_TICK]);
         m_vStateCache.push([STATE_BACK_MIDDLE_STAIRS,13]);
         this.CacheMoveState(iXGrid,iMaxYGrid + 2 + (SkyTrainBossMoveIntruder.SKY_TRAIN_BODY_LEN - this.m_iPosID) * 2);
      }
      
      private function CacheSkillLeftOutMouse() : void
      {
         var iXGrid:int = 6;
         var iMaxYGrid:int = BattleFieldView.a_1012;
         m_vStateCache.push([STATE_APPEAR,iXGrid,m_iStartShowGridNo]);
         var iHalfLen:int = SkyTrainBossMoveIntruder.SKY_TRAIN_BODY_LEN >> 1;
         if(this.m_iPosID <= iHalfLen)
         {
            m_vStateCache.push([STATE_BUFFER,5]);
            m_vStateCache.push([STATE_MOVE,iXGrid,-4]);
            m_vStateCache.push([STATE_APPEAR,1,-3,-1]);
            m_vStateCache.push([STATE_MOVE,1,iMaxYGrid - this.m_iPosID * 2 + 1]);
            m_vStateCache.push([STATE_BUFFER,5]);
            m_vStateCache.push([STATE_OUT_RIGHT_STAIRS,11]);
            m_vStateCache.push([STATE_ATTACK_RIGHT_MOUSE,SkyTrainBossMoveIntruder.OUT_MOUSE_TICK]);
            m_vStateCache.push([STATE_BACK_RIGHT_STAIRS,12]);
            this.CacheMoveState(1,iMaxYGrid + 2 + (SkyTrainBossMoveIntruder.SKY_TRAIN_BODY_LEN - this.m_iPosID) * 2);
         }
         else
         {
            m_vStateCache.push([STATE_BUFFER,5]);
            m_vStateCache.push([STATE_MOVE,iXGrid,-4 + 2 * (this.m_iPosID - iHalfLen) - 1]);
            m_vStateCache.push([STATE_BUFFER,5]);
            m_vStateCache.push([STATE_OUT_LEFT_STAIRS,11]);
            m_vStateCache.push([STATE_ATTACK_LEFT_MOUSE,SkyTrainBossMoveIntruder.OUT_MOUSE_TICK]);
            m_vStateCache.push([STATE_BACK_LEFT_STAIRS,12]);
            m_vStateCache.push([STATE_BUFFER,5]);
            m_vStateCache.push([STATE_MOVE,iXGrid,-4]);
            m_vStateCache.push([STATE_APPEAR,1,-3,-1]);
            m_vStateCache.push([STATE_MOVE,1,iMaxYGrid + 2 + (SkyTrainBossMoveIntruder.SKY_TRAIN_BODY_LEN - this.m_iPosID) * 2]);
            m_vStateCache.push([STATE_BUFFER,5]);
         }
      }
      
      override protected function InitSkillCache() : void
      {
         iVerticalDirect = 1;
         m_stRandomSeed.setSeed(this.m_stHead.globalMoveFighterID - this.m_stHead.m_stCurrentFieldGrid.m_iYGridNo,this.m_stHead.globalMoveFighterID + this.m_stHead.m_stCurrentFieldGrid.m_iYGridNo);
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_APPEAR,BattleFieldView.a_1011 - 1,m_iStartShowGridNo]);
         HavingRestForAwhile(10);
      }
      
      override protected function InitBossStateFrameID() : void
      {
         m_dictBossStateFrameID = new Dictionary();
         m_dictBossStateFrameID[STATE_DEAD] = 33;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_ATTACK_MISSILE + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_ATTACK_LEFT_MOUSE + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_ATTACK_RIGHT_MOUSE + "_" + 0] = 12;
         m_dictBossStateFrameID[STATE_ATTACK_MIDDLE_MOUSE + "_" + 0] = 15;
         m_dictBossStateFrameID[STATE_BUFFER + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_OUT_BARREL + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_MISSILE_WARNING + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_BACK_BARREL + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_OUT_LEFT_STAIRS + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_BACK_LEFT_STAIRS + "_" + 0] = 10;
         m_dictBossStateFrameID[STATE_OUT_RIGHT_STAIRS + "_" + 0] = 11;
         m_dictBossStateFrameID[STATE_BACK_RIGHT_STAIRS + "_" + 0] = 13;
         m_dictBossStateFrameID[STATE_OUT_MIDDLE_STAIRS + "_" + 0] = 14;
         m_dictBossStateFrameID[STATE_BACK_MIDDLE_STAIRS + "_" + 0] = 16;
         var iAddFrame:int = 16;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 1] = 1 + iAddFrame;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = 1 + iAddFrame;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 1 + iAddFrame;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = 2 + iAddFrame;
         m_dictBossStateFrameID[STATE_ATTACK_MISSILE + "_" + 1] = 6 + iAddFrame;
         m_dictBossStateFrameID[STATE_ATTACK_LEFT_MOUSE + "_" + 1] = 9 + iAddFrame;
         m_dictBossStateFrameID[STATE_ATTACK_RIGHT_MOUSE + "_" + 1] = 12 + iAddFrame;
         m_dictBossStateFrameID[STATE_ATTACK_MIDDLE_MOUSE + "_" + 1] = 15 + iAddFrame;
         m_dictBossStateFrameID[STATE_BUFFER + "_" + 1] = 3 + iAddFrame;
         m_dictBossStateFrameID[STATE_OUT_BARREL + "_" + 1] = 4 + iAddFrame;
         m_dictBossStateFrameID[STATE_MISSILE_WARNING + "_" + 1] = 5 + iAddFrame;
         m_dictBossStateFrameID[STATE_BACK_BARREL + "_" + 1] = 7 + iAddFrame;
         m_dictBossStateFrameID[STATE_OUT_LEFT_STAIRS + "_" + 1] = 8 + iAddFrame;
         m_dictBossStateFrameID[STATE_BACK_LEFT_STAIRS + "_" + 1] = 10 + iAddFrame;
         m_dictBossStateFrameID[STATE_OUT_RIGHT_STAIRS + "_" + 1] = 11 + iAddFrame;
         m_dictBossStateFrameID[STATE_BACK_RIGHT_STAIRS + "_" + 1] = 13 + iAddFrame;
         m_dictBossStateFrameID[STATE_OUT_MIDDLE_STAIRS + "_" + 1] = 14 + iAddFrame;
         m_dictBossStateFrameID[STATE_BACK_MIDDLE_STAIRS + "_" + 1] = 16 + iAddFrame;
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.CacheSkillMissileOdd);
         m_vSkillFunction.push(this.CacheSkillMissileEven);
         m_vSkillFunction.push(this.CacheSkillMiddleOutMouse);
         m_vSkillFunction.push(this.CacheSkillLeftOutMouse);
      }
      
      override protected function IsSkillState() : Boolean
      {
         return STATE_ATTACK_MISSILE == m_iBossState || STATE_ATTACK_LEFT_MOUSE == m_iBossState || STATE_ATTACK_MIDDLE_MOUSE == m_iBossState || STATE_ATTACK_RIGHT_MOUSE == m_iBossState;
      }
      
      override protected function CheckIsCanLaunchSkill(iCurrentTime:int) : Boolean
      {
         var stStartFieldGrid:a_3491 = null;
         var stBaseShot:a_4348 = null;
         var fPosX:Number = NaN;
         var fPosY:Number = NaN;
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
            case STATE_ATTACK_MISSILE:
               stBaseShot = SkyTrainMissileShot.a_4344();
               if(!stBaseShot)
               {
                  return false;
               }
               stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 1,m_stCurrentFieldGrid.m_iYGridNo);
               fPosX = a_3491.a_1080 * stStartFieldGrid.m_iXGridNo + 15;
               fPosY = a_3491.a_1081 * stStartFieldGrid.m_iYGridNo + 0.5 * (a_3491.a_1081 - stBaseShot.height);
               stBaseShot.a_1797(a_4265(),15,100000,fPosX,fPosY,stStartFieldGrid.m_stCurrentBattbleFieldView,stStartFieldGrid);
               stStartFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stBaseShot,BattleLayerDefine.SHOT_TYPE);
               break;
            case STATE_ATTACK_LEFT_MOUSE:
               stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 1,m_stCurrentFieldGrid.m_iYGridNo);
               this.OutMoveIntruder(stStartFieldGrid);
               break;
            case STATE_ATTACK_RIGHT_MOUSE:
               stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo + 1,m_stCurrentFieldGrid.m_iYGridNo);
               this.OutMoveIntruder(stStartFieldGrid);
               break;
            case STATE_ATTACK_MIDDLE_MOUSE:
               stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo + 1,m_stCurrentFieldGrid.m_iYGridNo);
               this.OutMoveIntruder(stStartFieldGrid);
               stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 1,m_stCurrentFieldGrid.m_iYGridNo);
               this.OutMoveIntruder(stStartFieldGrid,1);
               break;
            default:
               trace(">>>>>>SkyTrainBossBodyMoveIntruder::CheckIsLaunchSkill:: 不可能事件！！！ m_iBossState = " + m_iBossState);
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
         if(iIntruderMoveDirection < 0)
         {
            stBaseMoveIntruder = a_4255.getInstance().a_4256(iFindMoveIntruderTypeID);
         }
         else if(8388867 == iFindMoveIntruderTypeID)
         {
            stBaseMoveIntruder = ReverseSwimmingHelmetMouseMoveIntruder.a_3926();
         }
         else
         {
            stBaseMoveIntruder = ReverseHelmetMechanicalMouseMoveIntruder.a_3926();
         }
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
            if(IsMoving())
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
      
      override protected function getPosXByXGridNo(iXGridNo:int) : Number
      {
         var fPosX:Number = a_3491.a_1080 * iXGridNo;
         return fPosX + a_3491.a_1080 * 0.5;
      }
      
      override protected function getXGridNoByPosX(fPosX:Number = -0.1234) : int
      {
         if(-0.1234 == fPosX)
         {
            fPosX = this.x;
         }
         fPosX += 10000 * a_3491.a_1080;
         var iXGridNo:int = fPosX / a_3491.a_1080;
         return iXGridNo - 10000;
      }
      
      override protected function getPosYByYGridNo(iYGridNo:int) : Number
      {
         var fPosY:Number = a_3491.a_1081 * iYGridNo + (a_3491.a_1081 - this.height) + iYPosSkewing;
         return fPosY + a_3491.a_1081 * 0.5;
      }
      
      override protected function getYGridNoByPosY(fPosY:Number = -0.1234) : int
      {
         if(-0.1234 == fPosY)
         {
            fPosY = this.y;
         }
         fPosY += 10000 * a_3491.a_1081;
         var iYGridNo:int = int(fPosY - iYPosSkewing - (a_3491.a_1081 - this.height)) / a_3491.a_1081;
         return iYGridNo - 10000;
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
               SetIsCannotSee(true);
               break;
            case STATE_APPEAR:
               if(m_vStateCache[0].length >= 4)
               {
                  iVerticalDirect = -iVerticalDirect;
               }
               setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2]);
               iNextValue = 0;
               break;
            case STATE_MOVE:
               fPosX = this.getPosXByXGridNo(m_vStateCache[0][1]);
               fPosY = this.getPosYByYGridNo(m_vStateCache[0][2]);
               iNextValue = setMoveToPosition(fPosX,fPosY);
               break;
            case STATE_ATTACK_LEFT_MOUSE:
            case STATE_ATTACK_RIGHT_MOUSE:
            case STATE_ATTACK_MIDDLE_MOUSE:
               m_iLaunchNum = 1;
               m_iLaunchDelayTick = 1;
               break;
            case STATE_ATTACK_MISSILE:
               m_iLaunchNum = 1;
               m_iLaunchDelayTick = 3;
         }
         m_vStateCache.shift();
         if(0 == iNextValue)
         {
            return this.SwitchState(iCurrentTime);
         }
         ChangeState(iNextState,iNextValue,iCurrentTime);
         if(STATE_HIDE == m_iBossState || STATE_MOVE == m_iBossState || STATE_APPEAR == m_iBossState || STATE_BUFFER == m_iBossState)
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
   }
}

