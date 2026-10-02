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
   import com.aurora.ui.maogoutd.resource.shot.boss.skyTrain.SkyTrainFlameShot;
   import flash.utils.Dictionary;
   
   public class SkyTrainBossBodyFirstTransMoveIntruder extends BaseBossMoveIntruder
   {
      
      protected static const STATE_BUFFER:uint = 6;
      
      protected static const STATE_MOVE_TO_LEFT_HIDE:uint = 7;
      
      protected static const STATE_MOVE_TO_RIGHT_HIDE:uint = 8;
      
      protected static const STATE_MOVE_TO_LEFT_SHOW:uint = 9;
      
      protected static const STATE_MOVE_TO_RIGHT_SHOW:uint = 10;
      
      protected static const STATE_UP_EXTENDING_LASER_CANNON:uint = 11;
      
      protected static const STATE_UP_LASER_CHARGE:uint = 12;
      
      protected static const STATE_UP_EMITTING_LASER:uint = 13;
      
      protected static const STATE_UP_LASER_GUNS_RECOVERED:uint = 14;
      
      protected static const STATE_DOWN_EXTENDING_LASER_CANNON:uint = 15;
      
      protected static const STATE_DOWN_LASER_CHARGE:uint = 16;
      
      protected static const STATE_DOWN_EMITTING_LASER:uint = 17;
      
      protected static const STATE_DOWN_LASER_GUNS_RECOVERED:uint = 18;
      
      protected static const STATE_UP_PROTRUDING_GUN_SMOKE:uint = 19;
      
      protected static const STATE_UP_EMITTING_SMOKE:uint = 20;
      
      protected static const STATE_UP_RECOVER_GUN_SMOKE:uint = 21;
      
      protected static const STATE_DOWN_PROTRUDING_GUN_SMOKE:uint = 22;
      
      protected static const STATE_DOWN_EMITTING_SMOKE:uint = 23;
      
      protected static const STATE_DOWN_RECOVER_GUN_SMOKE:uint = 24;
      
      protected static const STATE_BOTH_PROTRUDING_GUN_SMOKE:uint = 25;
      
      protected static const STATE_BOTH_EMITTING_SMOKE:uint = 26;
      
      protected static const STATE_BOTH_RECOVER_GUN_SMOKE:uint = 27;
      
      protected static const STATE_ROTATING_CAR_STAND:uint = 28;
      
      protected static const STATE_ROTATING_CAR_MOVE:uint = 29;
      
      protected static const STATE_ROTATING_CAR_BUFFER:uint = 30;
      
      protected static const STATE_ROTATING_CAR_MOVE_TO_LEFT_HIDE:uint = 31;
      
      protected static const STATE_ROTATING_CAR_MOVE_TO_RIGHT_HIDE:uint = 32;
      
      protected static const STATE_ROTATING_CAR_MOVE_TO_LEFT_SHOW:uint = 33;
      
      protected static const STATE_ROTATING_CAR_MOVE_TO_RIGHT_SHOW:uint = 34;
      
      protected static const STATE_ROTATING_CAR_EXTENDING_BARREL:uint = 35;
      
      protected static const STATE_ROTATING_CAR_VERTICAL_ATTACK:uint = 36;
      
      protected static const STATE_ROTATING_CAR_TILT:uint = 37;
      
      protected static const STATE_ROTATING_CAR_TILT_ATTACK:uint = 38;
      
      protected static const STATE_ROTATING_CAR_BARREL_BACK:uint = 39;
      
      private var m_iPosID:int;
      
      private var m_stHead:SkyTrainBossFirstTransMoveIntruder;
      
      private var m_arrFlameShotDir:Array = [[1,0],[1,-1],[0,-1],[-1,-1],[-1,0],[-1,1],[0,1],[1,1]];
      
      public function SkyTrainBossBodyFirstTransMoveIntruder()
      {
         super();
         m_bIsNeedHighPrecision = true;
         a_1467 = 0.5 * this.height - a_3491.a_1081;
      }
      
      public static function a_3926() : SkyTrainBossBodyFirstTransMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(SkyTrainBossBodyFirstTransMoveIntruder) as SkyTrainBossBodyFirstTransMoveIntruder;
      }
      
      public function RealeaseByHead() : void
      {
         a_3940();
      }
      
      public function set iPosID(iValue:int) : void
      {
         this.m_iPosID = iValue;
         m_iStartShowGridNo = SkyTrainBossFirstTransMoveIntruder.START_SHOW_GRIDNO + this.m_iPosID * 2;
      }
      
      public function set BossHead(stHead:SkyTrainBossFirstTransMoveIntruder) : void
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
         return SkyTrainBossBodyFirstTransMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1460 = false;
         a_1350 = SkyTrainBossFirstTransMoveIntruder.MOVE_SPEED;
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
         m_dictBossStateFrameID[STATE_MOVE_TO_LEFT_HIDE + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_MOVE_TO_RIGHT_HIDE + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_MOVE_TO_LEFT_SHOW + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_MOVE_TO_RIGHT_SHOW + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_UP_EXTENDING_LASER_CANNON + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_UP_LASER_CHARGE + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_UP_EMITTING_LASER + "_" + 0] = 10;
         m_dictBossStateFrameID[STATE_UP_LASER_GUNS_RECOVERED + "_" + 0] = 11;
         m_dictBossStateFrameID[STATE_DOWN_EXTENDING_LASER_CANNON + "_" + 0] = 12;
         m_dictBossStateFrameID[STATE_DOWN_LASER_CHARGE + "_" + 0] = 13;
         m_dictBossStateFrameID[STATE_DOWN_EMITTING_LASER + "_" + 0] = 14;
         m_dictBossStateFrameID[STATE_DOWN_LASER_GUNS_RECOVERED + "_" + 0] = 15;
         m_dictBossStateFrameID[STATE_UP_PROTRUDING_GUN_SMOKE + "_" + 0] = 16;
         m_dictBossStateFrameID[STATE_UP_EMITTING_SMOKE + "_" + 0] = 17;
         m_dictBossStateFrameID[STATE_UP_RECOVER_GUN_SMOKE + "_" + 0] = 18;
         m_dictBossStateFrameID[STATE_DOWN_PROTRUDING_GUN_SMOKE + "_" + 0] = 19;
         m_dictBossStateFrameID[STATE_DOWN_EMITTING_SMOKE + "_" + 0] = 20;
         m_dictBossStateFrameID[STATE_DOWN_RECOVER_GUN_SMOKE + "_" + 0] = 21;
         m_dictBossStateFrameID[STATE_BOTH_PROTRUDING_GUN_SMOKE + "_" + 0] = 22;
         m_dictBossStateFrameID[STATE_BOTH_EMITTING_SMOKE + "_" + 0] = 23;
         m_dictBossStateFrameID[STATE_BOTH_RECOVER_GUN_SMOKE + "_" + 0] = 24;
         m_dictBossStateFrameID[STATE_ROTATING_CAR_STAND + "_" + 0] = 25;
         m_dictBossStateFrameID[STATE_ROTATING_CAR_MOVE + "_" + 0] = 26;
         m_dictBossStateFrameID[STATE_ROTATING_CAR_BUFFER + "_" + 0] = 27;
         m_dictBossStateFrameID[STATE_ROTATING_CAR_MOVE_TO_LEFT_HIDE + "_" + 0] = 28;
         m_dictBossStateFrameID[STATE_ROTATING_CAR_MOVE_TO_RIGHT_HIDE + "_" + 0] = 29;
         m_dictBossStateFrameID[STATE_ROTATING_CAR_MOVE_TO_LEFT_SHOW + "_" + 0] = 30;
         m_dictBossStateFrameID[STATE_ROTATING_CAR_MOVE_TO_RIGHT_SHOW + "_" + 0] = 31;
         m_dictBossStateFrameID[STATE_ROTATING_CAR_EXTENDING_BARREL + "_" + 0] = 32;
         m_dictBossStateFrameID[STATE_ROTATING_CAR_VERTICAL_ATTACK + "_" + 0] = 33;
         m_dictBossStateFrameID[STATE_ROTATING_CAR_TILT + "_" + 0] = 34;
         m_dictBossStateFrameID[STATE_ROTATING_CAR_TILT_ATTACK + "_" + 0] = 35;
         m_dictBossStateFrameID[STATE_ROTATING_CAR_BARREL_BACK + "_" + 0] = 36;
         var iAddFrame:int = 36;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 1] = 1 + iAddFrame;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 1 + iAddFrame;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = 2 + iAddFrame;
         m_dictBossStateFrameID[STATE_BUFFER + "_" + 1] = 3 + iAddFrame;
         m_dictBossStateFrameID[STATE_MOVE_TO_LEFT_HIDE + "_" + 1] = 4 + iAddFrame;
         m_dictBossStateFrameID[STATE_MOVE_TO_RIGHT_HIDE + "_" + 1] = 5 + iAddFrame;
         m_dictBossStateFrameID[STATE_MOVE_TO_LEFT_SHOW + "_" + 1] = 6 + iAddFrame;
         m_dictBossStateFrameID[STATE_MOVE_TO_RIGHT_SHOW + "_" + 1] = 7 + iAddFrame;
         m_dictBossStateFrameID[STATE_UP_EXTENDING_LASER_CANNON + "_" + 1] = 8 + iAddFrame;
         m_dictBossStateFrameID[STATE_UP_LASER_CHARGE + "_" + 1] = 9 + iAddFrame;
         m_dictBossStateFrameID[STATE_UP_EMITTING_LASER + "_" + 1] = 10 + iAddFrame;
         m_dictBossStateFrameID[STATE_UP_LASER_GUNS_RECOVERED + "_" + 1] = 11 + iAddFrame;
         m_dictBossStateFrameID[STATE_DOWN_EXTENDING_LASER_CANNON + "_" + 1] = 12 + iAddFrame;
         m_dictBossStateFrameID[STATE_DOWN_LASER_CHARGE + "_" + 1] = 13 + iAddFrame;
         m_dictBossStateFrameID[STATE_DOWN_EMITTING_LASER + "_" + 1] = 14 + iAddFrame;
         m_dictBossStateFrameID[STATE_DOWN_LASER_GUNS_RECOVERED + "_" + 1] = 15 + iAddFrame;
         m_dictBossStateFrameID[STATE_UP_PROTRUDING_GUN_SMOKE + "_" + 1] = 16 + iAddFrame;
         m_dictBossStateFrameID[STATE_UP_EMITTING_SMOKE + "_" + 1] = 17 + iAddFrame;
         m_dictBossStateFrameID[STATE_UP_RECOVER_GUN_SMOKE + "_" + 1] = 18 + iAddFrame;
         m_dictBossStateFrameID[STATE_DOWN_PROTRUDING_GUN_SMOKE + "_" + 1] = 19 + iAddFrame;
         m_dictBossStateFrameID[STATE_DOWN_EMITTING_SMOKE + "_" + 1] = 20 + iAddFrame;
         m_dictBossStateFrameID[STATE_DOWN_RECOVER_GUN_SMOKE + "_" + 1] = 21 + iAddFrame;
         m_dictBossStateFrameID[STATE_BOTH_PROTRUDING_GUN_SMOKE + "_" + 1] = 22 + iAddFrame;
         m_dictBossStateFrameID[STATE_BOTH_EMITTING_SMOKE + "_" + 1] = 23 + iAddFrame;
         m_dictBossStateFrameID[STATE_BOTH_RECOVER_GUN_SMOKE + "_" + 1] = 24 + iAddFrame;
         m_dictBossStateFrameID[STATE_ROTATING_CAR_STAND + "_" + 1] = 25 + iAddFrame;
         m_dictBossStateFrameID[STATE_ROTATING_CAR_MOVE + "_" + 1] = 26 + iAddFrame;
         m_dictBossStateFrameID[STATE_ROTATING_CAR_BUFFER + "_" + 1] = 27 + iAddFrame;
         m_dictBossStateFrameID[STATE_ROTATING_CAR_MOVE_TO_LEFT_HIDE + "_" + 1] = 28 + iAddFrame;
         m_dictBossStateFrameID[STATE_ROTATING_CAR_MOVE_TO_RIGHT_HIDE + "_" + 1] = 29 + iAddFrame;
         m_dictBossStateFrameID[STATE_ROTATING_CAR_MOVE_TO_LEFT_SHOW + "_" + 1] = 30 + iAddFrame;
         m_dictBossStateFrameID[STATE_ROTATING_CAR_MOVE_TO_RIGHT_SHOW + "_" + 1] = 31 + iAddFrame;
         m_dictBossStateFrameID[STATE_ROTATING_CAR_EXTENDING_BARREL + "_" + 1] = 32 + iAddFrame;
         m_dictBossStateFrameID[STATE_ROTATING_CAR_VERTICAL_ATTACK + "_" + 1] = 33 + iAddFrame;
         m_dictBossStateFrameID[STATE_ROTATING_CAR_TILT + "_" + 1] = 34 + iAddFrame;
         m_dictBossStateFrameID[STATE_ROTATING_CAR_TILT_ATTACK + "_" + 1] = 35 + iAddFrame;
         m_dictBossStateFrameID[STATE_ROTATING_CAR_BARREL_BACK + "_" + 1] = 36 + iAddFrame;
         m_dictBossStateFrameID[STATE_DEAD] = iAddFrame * 2 + 1;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = iAddFrame * 2 + 2;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = iAddFrame * 2 + 2;
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
         m_vSkillFunction.push(this.CacheSkillLaser);
         m_vSkillFunction.push(this.CacheSkillRotatingShells);
         m_vSkillFunction.push(this.CacheSkillSmokeMouse);
      }
      
      private function CacheMoveState(iXGrid:int, iYGrid:int) : void
      {
         m_vStateCache.push([STATE_BUFFER,5]);
         m_vStateCache.push([STATE_MOVE,iXGrid,iYGrid]);
         m_vStateCache.push([STATE_BUFFER,5]);
      }
      
      private function CacheSkillLaser() : void
      {
         var iYGrid:int = 0;
         var iChangeXGrid:int = 1;
         var iMaxXGrid:int = BattleFieldView.a_1011;
         var iMaxYGrid:int = BattleFieldView.a_1012;
         m_vStateCache.push([STATE_APPEAR,m_iStartShowGridNo,iYGrid]);
         var iHalfLen:int = 5;
         var iLaserLen:int = 10;
         if(this.m_iPosID >= iLaserLen)
         {
            m_vStateCache.push([STATE_BUFFER,5]);
            m_vStateCache.push([STATE_MOVE,iChangeXGrid + (this.m_iPosID - 1 - iHalfLen) * 2,iYGrid]);
            m_vStateCache.push([STATE_BUFFER,5]);
            HavingRestForAwhile(39);
            m_vStateCache.push([STATE_BUFFER,5]);
            m_vStateCache.push([STATE_MOVE,iChangeXGrid,iYGrid]);
            m_vStateCache.push([STATE_MOVE_TO_LEFT_HIDE,iChangeXGrid - 2,iYGrid]);
            m_vStateCache.push([STATE_APPEAR,iChangeXGrid - 2,iMaxYGrid - 1,-1]);
            m_vStateCache.push([STATE_MOVE_TO_LEFT_SHOW,iChangeXGrid,iMaxYGrid - 1]);
            m_vStateCache.push([STATE_MOVE,iMaxXGrid + 3 + (SkyTrainBossFirstTransMoveIntruder.SKY_TRAIN_BODY_LEN - this.m_iPosID) * 2,iMaxYGrid - 1]);
            m_vStateCache.push([STATE_BUFFER,5]);
         }
         else if(this.m_iPosID < iHalfLen)
         {
            m_vStateCache.push([STATE_BUFFER,5]);
            m_vStateCache.push([STATE_MOVE,iChangeXGrid,iYGrid]);
            m_vStateCache.push([STATE_MOVE_TO_LEFT_HIDE,iChangeXGrid - 2,iYGrid]);
            m_vStateCache.push([STATE_APPEAR,iChangeXGrid - 2,iMaxYGrid - 1,-1]);
            m_vStateCache.push([STATE_MOVE_TO_LEFT_SHOW,iChangeXGrid,iMaxYGrid - 1]);
            m_vStateCache.push([STATE_MOVE,iMaxXGrid - this.m_iPosID * 2,iMaxYGrid - 1]);
            m_vStateCache.push([STATE_BUFFER,5]);
            m_vStateCache.push([STATE_UP_EXTENDING_LASER_CANNON,9]);
            m_vStateCache.push([STATE_UP_LASER_CHARGE,14]);
            m_vStateCache.push([STATE_UP_EMITTING_LASER,4]);
            m_vStateCache.push([STATE_UP_LASER_GUNS_RECOVERED,9]);
            this.CacheMoveState(iMaxXGrid + 3 + (SkyTrainBossFirstTransMoveIntruder.SKY_TRAIN_BODY_LEN - this.m_iPosID) * 2,iMaxYGrid - 1);
         }
         else if(this.m_iPosID > iHalfLen)
         {
            m_vStateCache.push([STATE_BUFFER,5]);
            m_vStateCache.push([STATE_MOVE,iChangeXGrid + (this.m_iPosID - 1 - iHalfLen) * 2,iYGrid]);
            m_vStateCache.push([STATE_BUFFER,5]);
            m_vStateCache.push([STATE_DOWN_EXTENDING_LASER_CANNON,9]);
            m_vStateCache.push([STATE_DOWN_LASER_CHARGE,14]);
            m_vStateCache.push([STATE_DOWN_EMITTING_LASER,4]);
            m_vStateCache.push([STATE_DOWN_LASER_GUNS_RECOVERED,9]);
            m_vStateCache.push([STATE_BUFFER,5]);
            m_vStateCache.push([STATE_MOVE,iChangeXGrid,iYGrid]);
            m_vStateCache.push([STATE_MOVE_TO_LEFT_HIDE,iChangeXGrid - 2,iYGrid]);
            m_vStateCache.push([STATE_APPEAR,iChangeXGrid - 2,iMaxYGrid - 1,-1]);
            m_vStateCache.push([STATE_MOVE_TO_LEFT_SHOW,iChangeXGrid,iMaxYGrid - 1]);
            m_vStateCache.push([STATE_MOVE,iMaxXGrid + 3 + (SkyTrainBossFirstTransMoveIntruder.SKY_TRAIN_BODY_LEN - this.m_iPosID) * 2,iMaxYGrid - 1]);
            m_vStateCache.push([STATE_BUFFER,5]);
         }
         else
         {
            m_vStateCache.push([STATE_BUFFER,5]);
            m_vStateCache.push([STATE_MOVE,iChangeXGrid,iYGrid]);
            m_vStateCache.push([STATE_MOVE_TO_LEFT_HIDE,iChangeXGrid - 2,iYGrid]);
            m_vStateCache.push([STATE_HIDE,52]);
            m_vStateCache.push([STATE_APPEAR,iChangeXGrid - 2,iMaxYGrid - 1,-1]);
            m_vStateCache.push([STATE_MOVE_TO_LEFT_SHOW,iChangeXGrid,iMaxYGrid - 1]);
            m_vStateCache.push([STATE_MOVE,iMaxXGrid + 3 + (SkyTrainBossFirstTransMoveIntruder.SKY_TRAIN_BODY_LEN - this.m_iPosID) * 2,iMaxYGrid - 1]);
            m_vStateCache.push([STATE_BUFFER,5]);
         }
      }
      
      private function CacheSkillRotatingShells() : void
      {
         var iYGrid:int = 3;
         var iHideXGrid:int = 1;
         var iXGrid:int = int(m_stRandomSeed.nextInt(2));
         var iMaxXGrid:int = BattleFieldView.a_1011;
         var iMaxYGrid:int = BattleFieldView.a_1012;
         m_vStateCache.push([STATE_APPEAR,m_iStartShowGridNo,iYGrid]);
         var iMaxMoveGrid:int = Math.max(iXGrid + SkyTrainBossFirstTransMoveIntruder.ROTATING_CAR_POS_ID * 2 - 2 - iHideXGrid,iMaxXGrid - 2 - SkyTrainBossFirstTransMoveIntruder.ROTATING_CAR_POS_ID * 2 - 2 - iXGrid);
         var iSkillTick:int = 70;
         var iMaxShowLen:int = 3;
         if(this.m_iPosID > iMaxShowLen)
         {
            m_vStateCache.push([STATE_HIDE,iMaxMoveGrid * 4 + 29 + 15 + iSkillTick + 4 * (m_iStartShowGridNo - (iXGrid + this.m_iPosID * 2))]);
            return;
         }
         if(SkyTrainBossFirstTransMoveIntruder.ROTATING_CAR_POS_ID != this.m_iPosID)
         {
            m_vStateCache.push([STATE_BUFFER,5]);
            m_vStateCache.push([STATE_MOVE,iXGrid + this.m_iPosID * 2,iYGrid]);
            m_vStateCache.push([STATE_BUFFER,5]);
         }
         else
         {
            m_vStateCache.push([STATE_ROTATING_CAR_BUFFER,5]);
            m_vStateCache.push([STATE_ROTATING_CAR_MOVE,iXGrid + this.m_iPosID * 2,iYGrid]);
            m_vStateCache.push([STATE_ROTATING_CAR_BUFFER,5]);
         }
         if(SkyTrainBossFirstTransMoveIntruder.ROTATING_CAR_POS_ID > this.m_iPosID)
         {
            m_vStateCache.push([STATE_BUFFER,5]);
            m_vStateCache.push([STATE_MOVE,iHideXGrid,iYGrid]);
            m_vStateCache.push([STATE_MOVE_TO_LEFT_HIDE,iHideXGrid - 2,iYGrid]);
            m_vStateCache.push([STATE_HIDE,iSkillTick + (iMaxMoveGrid - (iXGrid + this.m_iPosID * 2 - iHideXGrid)) * 4]);
            m_vStateCache.push([STATE_HIDE,14]);
         }
         else if(SkyTrainBossFirstTransMoveIntruder.ROTATING_CAR_POS_ID < this.m_iPosID)
         {
            m_vStateCache.push([STATE_BUFFER,5]);
            m_vStateCache.push([STATE_MOVE,iMaxXGrid - 2,iYGrid]);
            m_vStateCache.push([STATE_MOVE_TO_RIGHT_HIDE,iMaxXGrid,iYGrid]);
            m_vStateCache.push([STATE_HIDE,iSkillTick + (iMaxMoveGrid - (iMaxXGrid - 2 - iXGrid - this.m_iPosID * 2)) * 4]);
            m_vStateCache.push([STATE_HIDE,14]);
         }
         else
         {
            m_vStateCache.push([STATE_ROTATING_CAR_STAND,6 + 9 + iMaxMoveGrid * 4]);
            m_vStateCache.push([STATE_ROTATING_CAR_EXTENDING_BARREL,25]);
            m_vStateCache.push([STATE_ROTATING_CAR_VERTICAL_ATTACK,6]);
            m_vStateCache.push([STATE_ROTATING_CAR_TILT,9]);
            m_vStateCache.push([STATE_ROTATING_CAR_TILT_ATTACK,6]);
            m_vStateCache.push([STATE_ROTATING_CAR_BARREL_BACK,20]);
            m_vStateCache.push([STATE_ROTATING_CAR_BUFFER,5]);
            m_vStateCache.push([STATE_ROTATING_CAR_MOVE_TO_LEFT_HIDE,iXGrid + this.m_iPosID * 2 - 2,iYGrid]);
         }
      }
      
      private function IsEvenNumber(iValue:int) : Boolean
      {
         return Boolean(0 == (iValue & 1));
      }
      
      private function CacheSkillSmokeMouse() : void
      {
         var iMaxXGrid:int = BattleFieldView.a_1011;
         var iMaxYGrid:int = BattleFieldView.a_1012;
         var iXLeftGrid:int = 1;
         var iXRightGrid:int = iMaxXGrid - 2;
         var iXStopGrid:int = 3;
         var iYFirstSegGrid:int = 0;
         var iYSecondSegGrid:int = iMaxYGrid - 1;
         var iYThirdSegGrid:int = 3;
         var iFirstHideID:int = 4;
         var iSecondHideID:int = 9;
         var iBelongSeg:int = 0;
         if(this.m_iPosID < iFirstHideID)
         {
            iBelongSeg = 1;
         }
         else if(this.m_iPosID <= iFirstHideID)
         {
            iBelongSeg = 2;
         }
         else if(this.m_iPosID < iSecondHideID)
         {
            iBelongSeg = 3;
         }
         else if(this.m_iPosID <= iSecondHideID)
         {
            iBelongSeg = 4;
         }
         else
         {
            iBelongSeg = 5;
         }
         m_vStateCache.push([STATE_APPEAR,m_iStartShowGridNo,iYFirstSegGrid]);
         switch(iBelongSeg)
         {
            case 1:
               m_vStateCache.push([STATE_BUFFER,5]);
               m_vStateCache.push([STATE_MOVE,iXLeftGrid,iYFirstSegGrid]);
               this.DeliveryCar(1,iXLeftGrid,iYFirstSegGrid,iXLeftGrid,iYSecondSegGrid);
               m_vStateCache.push([STATE_MOVE,iXRightGrid,iYSecondSegGrid]);
               this.DeliveryCar(-1,iXRightGrid,iYSecondSegGrid,iXRightGrid,iYThirdSegGrid);
               m_vStateCache.push([STATE_MOVE,iXStopGrid + (this.m_iPosID - 1) * 2,iYThirdSegGrid]);
               m_vStateCache.push([STATE_BUFFER,5]);
               this.CacheOnlySmokeMouse(iBelongSeg);
               m_vStateCache.push([STATE_BUFFER,5]);
               break;
            case 2:
               m_vStateCache.push([STATE_BUFFER,5]);
               m_vStateCache.push([STATE_MOVE,iXLeftGrid,iYFirstSegGrid]);
               this.DeliveryCar(1,iXLeftGrid,iYFirstSegGrid,iXLeftGrid,iYSecondSegGrid);
               m_vStateCache.push([STATE_MOVE,iXRightGrid,iYSecondSegGrid]);
               m_vStateCache.push([STATE_MOVE_TO_LEFT_HIDE,iXRightGrid + 2,iYSecondSegGrid]);
               this.CacheOnlySmokeMouse(iBelongSeg);
               m_vStateCache.push([STATE_APPEAR,iXRightGrid + 2,iYThirdSegGrid,-1]);
               m_vStateCache.push([STATE_MOVE_TO_LEFT_SHOW,iXRightGrid,iYThirdSegGrid]);
               break;
            case 3:
               m_vStateCache.push([STATE_BUFFER,5]);
               m_vStateCache.push([STATE_MOVE,iXLeftGrid,iYFirstSegGrid]);
               this.DeliveryCar(1,iXLeftGrid,iYFirstSegGrid,iXLeftGrid,iYSecondSegGrid);
               m_vStateCache.push([STATE_MOVE,iXRightGrid - (this.m_iPosID - iFirstHideID - 1) * 2,iYSecondSegGrid]);
               m_vStateCache.push([STATE_BUFFER,5]);
               this.CacheOnlySmokeMouse(iBelongSeg);
               m_vStateCache.push([STATE_BUFFER,5]);
               m_vStateCache.push([STATE_MOVE,iXRightGrid,iYSecondSegGrid]);
               this.DeliveryCar(-1,iXRightGrid,iYSecondSegGrid,iXRightGrid,iYThirdSegGrid);
               break;
            case 4:
               m_vStateCache.push([STATE_BUFFER,5]);
               m_vStateCache.push([STATE_MOVE,iXLeftGrid,iYFirstSegGrid]);
               m_vStateCache.push([STATE_MOVE_TO_LEFT_HIDE,iXLeftGrid - 2,iYFirstSegGrid]);
               this.CacheOnlySmokeMouse(iBelongSeg);
               m_vStateCache.push([STATE_APPEAR,iXLeftGrid - 2,iYSecondSegGrid,-1]);
               m_vStateCache.push([STATE_MOVE_TO_LEFT_SHOW,iXLeftGrid,iYSecondSegGrid]);
               m_vStateCache.push([STATE_MOVE,iXRightGrid,iYSecondSegGrid]);
               this.DeliveryCar(-1,iXRightGrid,iYSecondSegGrid,iXRightGrid,iYThirdSegGrid);
               break;
            case 5:
               m_vStateCache.push([STATE_BUFFER,5]);
               m_vStateCache.push([STATE_MOVE,iXLeftGrid + (this.m_iPosID - iSecondHideID - 1) * 2,iYFirstSegGrid]);
               m_vStateCache.push([STATE_BUFFER,5]);
               this.CacheOnlySmokeMouse(iBelongSeg);
               m_vStateCache.push([STATE_BUFFER,5]);
               m_vStateCache.push([STATE_MOVE,iXLeftGrid,iYFirstSegGrid]);
               this.DeliveryCar(1,iXLeftGrid,iYFirstSegGrid,iXLeftGrid,iYSecondSegGrid);
               m_vStateCache.push([STATE_MOVE,iXRightGrid,iYSecondSegGrid]);
               this.DeliveryCar(-1,iXRightGrid,iYSecondSegGrid,iXRightGrid,iYThirdSegGrid);
         }
         m_vStateCache.push([STATE_MOVE,iXLeftGrid,iYThirdSegGrid]);
         m_vStateCache.push([STATE_MOVE_TO_LEFT_HIDE,iXLeftGrid - 2,iYThirdSegGrid]);
         m_vStateCache.push([STATE_HIDE,(SkyTrainBossFirstTransMoveIntruder.SKY_TRAIN_BODY_LEN - this.m_iPosID) * 2 * 4]);
      }
      
      private function CacheOnlySmokeMouse(iBelong:int) : void
      {
         switch(iBelong)
         {
            case 1:
               m_vStateCache.push([STATE_BOTH_PROTRUDING_GUN_SMOKE,20]);
               m_vStateCache.push([STATE_BOTH_EMITTING_SMOKE,30]);
               m_vStateCache.push([STATE_BOTH_RECOVER_GUN_SMOKE,12]);
               break;
            case 3:
               m_vStateCache.push([STATE_UP_PROTRUDING_GUN_SMOKE,20]);
               m_vStateCache.push([STATE_UP_EMITTING_SMOKE,30]);
               m_vStateCache.push([STATE_UP_RECOVER_GUN_SMOKE,12]);
               break;
            case 5:
               m_vStateCache.push([STATE_DOWN_PROTRUDING_GUN_SMOKE,20]);
               m_vStateCache.push([STATE_DOWN_EMITTING_SMOKE,30]);
               m_vStateCache.push([STATE_DOWN_RECOVER_GUN_SMOKE,12]);
               break;
            case 2:
            case 4:
               m_vStateCache.push([STATE_HIDE,21 + 31 + 13 + 12]);
         }
      }
      
      private function DeliveryCar(iDirection:int, iCurXGrid:int, iCurYGrid:int, iDstXGrid:int, iDstYGrid:int) : void
      {
         m_vStateCache.push([STATE_MOVE_TO_LEFT_HIDE,iCurXGrid - 2 * iDirection,iCurYGrid]);
         m_vStateCache.push([STATE_APPEAR,iDstXGrid - 2 * iDirection,iDstYGrid,-1]);
         m_vStateCache.push([STATE_MOVE_TO_LEFT_SHOW,iDstXGrid,iDstYGrid]);
      }
      
      override protected function IsSkillState() : Boolean
      {
         return STATE_UP_EMITTING_LASER == m_iBossState || STATE_DOWN_EMITTING_LASER == m_iBossState || STATE_UP_EMITTING_SMOKE == m_iBossState || STATE_DOWN_EMITTING_SMOKE == m_iBossState || STATE_BOTH_EMITTING_SMOKE == m_iBossState || STATE_ROTATING_CAR_VERTICAL_ATTACK == m_iBossState || STATE_ROTATING_CAR_TILT_ATTACK == m_iBossState;
      }
      
      override protected function UpdateBossBloodProgress() : void
      {
         trace(toString() + "->UpdateBossBloodProgress->null");
      }
      
      override protected function CheckIsCanLaunchSkill(iCurrentTime:int) : Boolean
      {
         var stStartFieldGrid:a_3491 = null;
         var stLaserEmissionMoveIntruder:LaserEmissionMoveIntruder = null;
         var stBaseShot:a_4348 = null;
         var fPosX:Number = NaN;
         var fPosY:Number = NaN;
         var bIsDown:Boolean = false;
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
            case STATE_UP_EMITTING_LASER:
            case STATE_DOWN_EMITTING_LASER:
               bIsDown = Boolean(STATE_DOWN_EMITTING_LASER == m_iBossState);
               stLaserEmissionMoveIntruder = LaserEmissionMoveIntruder.a_3926();
               stLaserEmissionMoveIntruder.IsCanLaserEmission = bIsDown;
               stLaserEmissionMoveIntruder.a_1797(a_4265(),-1);
               stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo + (bIsDown ? 1 : -1));
               stLaserEmissionMoveIntruder.x = (stStartFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
               stLaserEmissionMoveIntruder.y = stLaserEmissionMoveIntruder.iYPosSkewing + (stStartFieldGrid.m_iYGridNo + 1) * a_3491.a_1081 - stLaserEmissionMoveIntruder.height;
               stStartFieldGrid.m_stCurrentBattbleFieldView.a_3459(stLaserEmissionMoveIntruder,stStartFieldGrid,false);
               stStartFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLaserEmissionMoveIntruder,BattleLayerDefine.EFFECTS_TOP_TYPE);
               break;
            case STATE_UP_EMITTING_SMOKE:
               this.m_stHead.RealeaseSmoke(iCurrentTime);
               stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo - 2);
               this.OutMoveIntruder(stStartFieldGrid);
               break;
            case STATE_DOWN_EMITTING_SMOKE:
               this.m_stHead.RealeaseSmoke(iCurrentTime);
               stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo + 2);
               this.OutMoveIntruder(stStartFieldGrid);
               break;
            case STATE_BOTH_EMITTING_SMOKE:
               this.m_stHead.RealeaseSmoke(iCurrentTime);
               stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo - 2);
               this.OutMoveIntruder(stStartFieldGrid);
               stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo + 2);
               this.OutMoveIntruder(stStartFieldGrid);
               break;
            case STATE_ROTATING_CAR_VERTICAL_ATTACK:
               this.OutFlameShot(0);
               break;
            case STATE_ROTATING_CAR_TILT_ATTACK:
               this.OutFlameShot(1);
               break;
            default:
               trace(">>>>>>SkyTrainBossBodyFirstTransMoveIntruder::CheckIsLaunchSkill:: 不可能事件！！！ m_iBossState = " + m_iBossState);
               return false;
         }
         return true;
      }
      
      private function OutFlameShot(iStartDir:int) : void
      {
         var iCurDir:int = 0;
         var stSkyTrainFlameShot:SkyTrainFlameShot = null;
         var stStartFieldGrid:a_3491 = null;
         var fPosX:Number = NaN;
         var fPosY:Number = NaN;
         for(var i:int = 0; i < 4; i++)
         {
            iCurDir = iStartDir + i * 2;
            stSkyTrainFlameShot = SkyTrainFlameShot.a_4344();
            stSkyTrainFlameShot.Direction = iCurDir;
            stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo + this.m_arrFlameShotDir[iCurDir][0],m_stCurrentFieldGrid.m_iYGridNo + this.m_arrFlameShotDir[iCurDir][1]);
            fPosX = a_3491.a_1080 * (stStartFieldGrid.m_iXGridNo + 0.5);
            fPosY = a_3491.a_1081 * (stStartFieldGrid.m_iYGridNo + 0.5);
            stSkyTrainFlameShot.a_1797(a_4265(),20,100000,fPosX,fPosY,stStartFieldGrid.m_stCurrentBattbleFieldView,stStartFieldGrid);
            stStartFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stSkyTrainFlameShot,BattleLayerDefine.SHOT_TYPE);
         }
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
            case STATE_ROTATING_CAR_MOVE:
            case STATE_ROTATING_CAR_MOVE_TO_LEFT_HIDE:
            case STATE_ROTATING_CAR_MOVE_TO_LEFT_SHOW:
            case STATE_ROTATING_CAR_MOVE_TO_RIGHT_HIDE:
            case STATE_ROTATING_CAR_MOVE_TO_RIGHT_SHOW:
               fPosX = getPosXByXGridNo(m_vStateCache[0][1]);
               fPosY = getPosYByYGridNo(m_vStateCache[0][2]);
               iNextValue = setMoveToPosition(fPosX,fPosY);
               break;
            case STATE_UP_EMITTING_LASER:
            case STATE_DOWN_EMITTING_LASER:
               m_iLaunchNum = 1;
               m_iLaunchDelayTick = 4;
               break;
            case STATE_UP_EMITTING_SMOKE:
            case STATE_DOWN_EMITTING_SMOKE:
            case STATE_BOTH_EMITTING_SMOKE:
               m_iLaunchNum = 1;
               m_iLaunchDelayTick = 18;
               break;
            case STATE_ROTATING_CAR_VERTICAL_ATTACK:
               m_iLaunchNum = 2;
               m_iLaunchDelayTick = 2;
               m_iLaunchIntervalTick = 4;
               break;
            case STATE_ROTATING_CAR_TILT_ATTACK:
               m_iLaunchNum = 2;
               m_iLaunchDelayTick = 2;
               m_iLaunchIntervalTick = 4;
         }
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
         return STATE_MOVE == m_iBossState || STATE_MOVE_TO_LEFT_HIDE == m_iBossState || STATE_MOVE_TO_LEFT_SHOW == m_iBossState || STATE_MOVE_TO_RIGHT_HIDE == m_iBossState || STATE_MOVE_TO_RIGHT_SHOW == m_iBossState || STATE_ROTATING_CAR_MOVE == m_iBossState || STATE_ROTATING_CAR_MOVE_TO_LEFT_HIDE == m_iBossState || STATE_ROTATING_CAR_MOVE_TO_LEFT_SHOW == m_iBossState || STATE_ROTATING_CAR_MOVE_TO_RIGHT_HIDE == m_iBossState || STATE_ROTATING_CAR_MOVE_TO_RIGHT_SHOW == m_iBossState;
      }
   }
}

