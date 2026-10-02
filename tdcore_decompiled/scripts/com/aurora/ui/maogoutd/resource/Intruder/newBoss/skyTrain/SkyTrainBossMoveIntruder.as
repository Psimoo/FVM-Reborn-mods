package com.aurora.ui.maogoutd.resource.Intruder.newBoss.skyTrain
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import flash.utils.Dictionary;
   
   public class SkyTrainBossMoveIntruder extends BaseBossMoveIntruder
   {
      
      internal static const SKY_TRAIN_BODY_LEN:uint = 10;
      
      internal static const OUT_MOUSE_TICK:uint = 10;
      
      internal static const SKILL_NUM:int = 4;
      
      internal static const MOVE_SPEED:Number = a_3491.a_1081 / 4;
      
      protected static const STATE_BUFFER:uint = 11;
      
      private var m_vBody:Vector.<SkyTrainBossBodyMoveIntruder>;
      
      public function SkyTrainBossMoveIntruder()
      {
         super();
         m_bIsNeedHighPrecision = true;
         a_1467 = -0.5 * a_3491.a_1081 - 0.5 * a_3491.a_1081;
         m_fOrginSpeed = MOVE_SPEED;
         m_iStartShowGridNo = BattleFieldView.a_1012 + 1;
         this.m_vBody = new Vector.<SkyTrainBossBodyMoveIntruder>(SKY_TRAIN_BODY_LEN,false);
         for(var i:int = 0; i < SKY_TRAIN_BODY_LEN; i++)
         {
            this.m_vBody[i] = SkyTrainBossBodyMoveIntruder.a_3926();
            this.m_vBody[i].iPosID = i + 1;
            this.m_vBody[i].BossHead = this;
         }
      }
      
      public static function a_3926() : BaseBossMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(SkyTrainBossMoveIntruder) as SkyTrainBossMoveIntruder;
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
         return SkyTrainBossMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         return true;
      }
      
      private function CacheMoveState(iXGrid:int, iYGrid:int) : void
      {
         m_vStateCache.push([STATE_BUFFER,5]);
         m_vStateCache.push([STATE_MOVE,iXGrid,iYGrid]);
         m_vStateCache.push([STATE_BUFFER,5]);
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
         this.CacheMoveState(iXGrid,-iPos);
         HavingRestForAwhile(1 * 4);
         HavingRestForAwhile(10);
         HavingRestForAwhile(5);
         HavingRestForAwhile(4);
         HavingRestForAwhile((1 + SkyTrainBossMoveIntruder.SKY_TRAIN_BODY_LEN - 1) * 4);
         this.CacheMoveState(iXGrid,-3 - (2 * SKY_TRAIN_BODY_LEN - 1));
      }
      
      private function CacheSkillMiddleOutMouse() : void
      {
         var iMaxYGrid:int = BattleFieldView.a_1012;
         var iXGrid:int = 4;
         m_vStateCache.push([STATE_APPEAR,iXGrid,-2,-1]);
         this.CacheMoveState(iXGrid,iMaxYGrid);
         HavingRestForAwhile(12);
         HavingRestForAwhile(SkyTrainBossMoveIntruder.OUT_MOUSE_TICK);
         HavingRestForAwhile(13);
         this.CacheMoveState(iXGrid,iMaxYGrid + 1 + SkyTrainBossMoveIntruder.SKY_TRAIN_BODY_LEN * 2);
      }
      
      private function CacheSkillLeftOutMouse() : void
      {
         var iXGrid:int = 6;
         var iMaxYGrid:int = BattleFieldView.a_1012;
         m_vStateCache.push([STATE_APPEAR,iXGrid,m_iStartShowGridNo]);
         m_vStateCache.push([STATE_BUFFER,5]);
         m_vStateCache.push([STATE_MOVE,iXGrid,-4]);
         m_vStateCache.push([STATE_APPEAR,1,-3,-1]);
         m_vStateCache.push([STATE_MOVE,1,iMaxYGrid - 1 + 1]);
         m_vStateCache.push([STATE_BUFFER,5]);
         m_vStateCache.push([STATE_WAITING,11]);
         m_vStateCache.push([STATE_WAITING,SkyTrainBossMoveIntruder.OUT_MOUSE_TICK]);
         m_vStateCache.push([STATE_WAITING,12]);
         this.CacheMoveState(1,iMaxYGrid + 1 + (SkyTrainBossMoveIntruder.SKY_TRAIN_BODY_LEN - 0) * 2);
      }
      
      override protected function InitSkillCache() : void
      {
         var fPosX:Number = NaN;
         var fPosY:Number = NaN;
         var i:int = 0;
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_APPEAR,BattleFieldView.a_1011 - 1,m_iStartShowGridNo]);
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
            this.m_vBody[i].x = fPosY;
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this.m_vBody[i],BattleLayerDefine.INTRUDER_SKY_BOSS_TYPE,m_stCurrentFieldGrid);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(this.m_vBody[i],m_stCurrentFieldGrid,false);
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
      
      override protected function InitBossStateFrameID() : void
      {
         m_dictBossStateFrameID = new Dictionary();
         m_dictBossStateFrameID[STATE_DEAD] = 7;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_BUFFER + "_" + 0] = 5;
         var iAddFrame:int = 1;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 1] = 1 + iAddFrame;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = 1 + iAddFrame;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 1 + iAddFrame;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = 3 + iAddFrame;
         m_dictBossStateFrameID[STATE_BUFFER + "_" + 1] = 5 + iAddFrame;
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
         return false;
      }
      
      override protected function CheckIsCanLaunchSkill(iCurrentTime:int) : Boolean
      {
         return false;
      }
      
      override public function get height() : Number
      {
         return 84;
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
               fPosX = getPosXByXGridNo(m_vStateCache[0][1]);
               fPosY = getPosYByYGridNo(m_vStateCache[0][2]);
               iNextValue = setMoveToPosition(fPosX,fPosY);
         }
         m_vStateCache.shift();
         if(0 == iNextValue)
         {
            return this.SwitchState(iCurrentTime);
         }
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
   }
}

