package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.GreedyDemon
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class WBGreedyBalloon2MoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 100000;
      
      private static const MAX_INJURED_LIFE:int = 30000;
      
      private static const ONE_GRID_SPEED:Number = 1.2;
      
      public var iRandomX:int;
      
      public var iRandomY:int;
      
      public var m_stBoss:WBGreedyKing2BossMoveIntruder;
      
      private var m_bHasBorn:Boolean = false;
      
      private var m_bDoMove:Boolean = false;
      
      private var _delayClearGrid:a_3491;
      
      protected var m_fMoveSpeedX:Number = 0;
      
      protected var m_fMoveSpeedY:Number = 0;
      
      private var remainMoveTick:int = 0;
      
      public function WBGreedyBalloon2MoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : WBGreedyBalloon2MoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(WBGreedyBalloon2MoveIntruder) as WBGreedyBalloon2MoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBGreedyBalloonMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (20 * ONE_GRID_SPEED);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = MAX_LIFE;
         a_1464 = true;
         a_1463 = true;
         a_1279 = -50;
         m_iYDisplayCenterPos = -82;
         a_1272 = 0;
         this.SetAnimationOnce2Loop(0,2,0,2);
         this.remainMoveTick = 0;
         a_1465 = 3;
         BoomIsReduceLife = true;
         tagCom.AddTag(40003);
         return true;
      }
      
      public function InitRandomPos(boss:WBGreedyKing2BossMoveIntruder, iNoX:int, iNoY:int, doMove:Boolean) : void
      {
         this.iRandomX = iNoX;
         this.iRandomY = iNoY;
         this.m_stBoss = boss;
         this.m_bHasBorn = false;
         this.m_bDoMove = doMove;
      }
      
      override protected function GetiNoX() : int
      {
         var iXGridNo:int = 0;
         iXGridNo = int((x + 15) / a_3491.a_1080);
         if(iXGridNo < 0)
         {
            iXGridNo = 0;
         }
         if(iXGridNo >= BattleFieldView.a_1011)
         {
            iXGridNo = BattleFieldView.a_1011 - 1;
         }
         return iXGridNo;
      }
      
      override protected function a_3940() : Boolean
      {
         this.m_stBoss.RemoveBalloon2Effect(this);
         super.a_3940();
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(iLifeValue > 0)
         {
            if(this.m_bHasBorn)
            {
               if(this.remainMoveTick > 0)
               {
                  this.SetAnimation(2,6);
               }
               else
               {
                  this.SetAnimation(1,5);
               }
            }
         }
         else
         {
            this.SetAnimation(9,9);
            this._delayClearGrid = m_stCurrentFieldGrid;
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
         }
         return true;
      }
      
      override public function a_4140(iCurrentTime:int) : void
      {
         if(a_1273 == 85)
         {
            this.a_3502(this._delayClearGrid);
         }
         super.a_4140(iCurrentTime);
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption();
      }
      
      protected function setMoveToPosition(iNoX:int, iNoY:int) : int
      {
         var fDistanceX:Number = this.getPosXByXGridNo(iNoX) - this.x;
         var fDistanceY:Number = this.getPosXByXGridNo(iNoY) - this.y;
         var fDistance:Number = Math.sqrt(fDistanceX * fDistanceX + fDistanceY * fDistanceY);
         var iMoveTick:int = fDistance / (60 / (20 * ONE_GRID_SPEED));
         if(iMoveTick > 0)
         {
            this.m_fMoveSpeedY = fDistanceY / iMoveTick;
            this.m_fMoveSpeedX = fDistanceX / iMoveTick;
         }
         else
         {
            this.m_fMoveSpeedY = 0;
            this.m_fMoveSpeedX = 0;
         }
         return iMoveTick;
      }
      
      protected function getPosXByXGridNo(iXGridNo:int) : Number
      {
         return a_3491.a_1080 * (iXGridNo + 0.5);
      }
      
      protected function getPosYByYGridNo(iYGridNo:int) : Number
      {
         return a_3491.a_1081 * (iYGridNo + 0.5);
      }
      
      public function CallChangePos() : void
      {
         this.SetAnimation(3,7);
      }
      
      public function SetPosition(iNoX:int, iNoY:int) : void
      {
         x = this.getPosXByXGridNo(iNoX);
         y = this.getPosYByYGridNo(iNoY);
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var stNextFieldGrid:a_3491 = null;
         x += this.m_fMoveSpeedX;
         if(this.m_fMoveSpeedX <= 0)
         {
            a_1283 = false;
         }
         else
         {
            a_1283 = true;
         }
         y += this.m_fMoveSpeedY;
         var iXGridNo:int = this.GetiNoX();
         var iYGridNo:int = int(y / a_3491.a_1081);
         if(m_stCurrentFieldGrid.m_iXGridNo != iXGridNo || m_stCurrentFieldGrid.m_iYGridNo != iYGridNo)
         {
            stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
            ChangeFieldGrid(stNextFieldGrid);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_LAND_TYPE,stNextFieldGrid);
         }
         if(m_LastPositionX != x || m_LastPositionY != y)
         {
            m_LastPositionX = x;
            m_LastPositionY = y;
            UpdateFollowEffect();
         }
         if(iCurrentTime % 2 == 1)
         {
            if(a_1273 == 7)
            {
               this.SetAnimation(2,6);
               if(this.m_bDoMove)
               {
                  this.remainMoveTick = this.setMoveToPosition(this.iRandomX,this.iRandomY);
               }
               else
               {
                  this.remainMoveTick = 0;
               }
               this.m_bHasBorn = true;
            }
         }
         if(this.remainMoveTick > 0)
         {
            --this.remainMoveTick;
            if(this.remainMoveTick == 0)
            {
               this.m_fMoveSpeedX = 0;
               this.m_fMoveSpeedY = 0;
               this.SetAnimation(1,5);
               this.SetPosition(this.iRandomX,this.iRandomY);
            }
         }
         return true;
      }
      
      public function InDamage() : Boolean
      {
         return a_1339 > 0 && a_1339 < MAX_INJURED_LIFE;
      }
      
      public function SetAnimation(animIdx:int, animIdx2:int) : void
      {
         if(this.InDamage())
         {
            animIdx = animIdx2;
         }
         if(a_1275 != animIdx)
         {
            a_1275 = animIdx;
            gotoAndStop((a_1276[animIdx] as FrameLabel).frame);
            a_3419();
         }
      }
      
      public function SetAnimationOnce2Loop(onceAnimIdx:int, loopAnimIdx:int, onceAnimIdx2:int, loopAnimIdx2:int) : void
      {
         if(this.InDamage())
         {
            onceAnimIdx = onceAnimIdx2;
            loopAnimIdx = loopAnimIdx2;
         }
         a_1275 = loopAnimIdx;
         gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         a_3419();
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      override public function a_4213() : Boolean
      {
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         return true;
      }
   }
}

