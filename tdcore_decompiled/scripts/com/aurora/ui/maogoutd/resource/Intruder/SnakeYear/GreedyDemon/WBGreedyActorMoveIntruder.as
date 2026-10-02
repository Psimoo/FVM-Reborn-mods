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
   
   public class WBGreedyActorMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 99999;
      
      private static const ONE_GRID_SPEED:Number = 2;
      
      private var inDamage:Boolean = false;
      
      private var inDie:Boolean = false;
      
      private var m_iChangeNoY:int = -1;
      
      public function WBGreedyActorMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : WBGreedyActorMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(WBGreedyActorMoveIntruder) as WBGreedyActorMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBGreedyActorMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         this.SetSpeed(ONE_GRID_SPEED);
         a_1339 = MAX_LIFE;
         a_1279 = -60;
         m_iYDisplayCenterPos = -90;
         a_1272 = 0;
         a_1481 = false;
         a_1464 = true;
         a_1463 = true;
         this.inDamage = false;
         this.inDie = false;
         this.m_iChangeNoY = -1;
         this.SetAnimation(0,3);
         return true;
      }
      
      public function CallDie() : void
      {
         this.inDie = true;
         a_1283 = false;
         this.SetAnimationOnce2Loop(6,7,6,7);
      }
      
      public function Change2Damage(damage:Boolean) : void
      {
         this.inDamage = damage;
      }
      
      public function CallMove() : void
      {
         this.SetSpeed(0);
      }
      
      public function CallWait() : void
      {
         this.SetSpeed(ONE_GRID_SPEED);
      }
      
      public function CallWait2() : void
      {
         this.SetSpeed(1.5);
      }
      
      public function CallReverse(reverse:Boolean) : void
      {
         a_1283 = reverse;
      }
      
      public function CallAppearIn(iNoY:int) : void
      {
         this.SetAnimation(1,4);
         this.m_iChangeNoY = iNoY;
      }
      
      private function SetSpeed(oneGridSpeed:Number) : void
      {
         if(oneGridSpeed <= 0)
         {
            a_1350 = 0;
            return;
         }
         a_1350 = a_3491.a_1080 / (20 * oneGridSpeed);
         if(!a_1283)
         {
            a_1350 *= -1;
         }
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
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 <= 0)
         {
            this.SetAnimation(7);
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var stNextFieldGrid:a_3491 = null;
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         if((a_1273 == 39 || a_1273 == 91) && iCurrentTime % 2 == 1)
         {
            this.SetAnimationOnce2Loop(2,0,5,3);
            y = (this.m_iChangeNoY + 0.5) * a_3491.a_1081;
            stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.GetiNoX(),this.m_iChangeNoY);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_LAND_TYPE,stNextFieldGrid);
            ChangeFieldGrid(stNextFieldGrid);
         }
         if(this.inDie == true)
         {
            if(a_1273 >= 114 && a_1273 <= 117)
            {
               x += 12;
            }
            if(x >= 700)
            {
               if(m_stCurrentFieldGrid)
               {
                  m_stCurrentFieldGrid.a_3457(this);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
               }
               a_3940();
            }
         }
         else
         {
            x += a_1350 * a_1470;
            iXGridNo = this.GetiNoX();
            iYGridNo = int(y / a_3491.a_1081);
            if(m_stCurrentFieldGrid.m_iXGridNo != iXGridNo || m_stCurrentFieldGrid.m_iYGridNo != iYGridNo)
            {
               stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
               ChangeFieldGrid(stNextFieldGrid);
            }
         }
         if(m_LastPositionX != x || m_LastPositionY != y)
         {
            m_LastPositionX = x;
            m_LastPositionY = y;
            UpdateFollowEffect();
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         return true;
      }
      
      override public function ReduceAllLife(iRduceLifeValue:int, bIsIgnoreArmor:Boolean = false, ishowHuijing:Boolean = false) : Boolean
      {
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      override public function a_4210() : Boolean
      {
         return true;
      }
      
      override public function a_4213() : Boolean
      {
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         return true;
      }
      
      public function SetAnimation(animIdx:int, damageAnimIdx:int = 0) : void
      {
         if(this.inDamage)
         {
            animIdx = damageAnimIdx;
         }
         if(a_1275 != animIdx)
         {
            a_1275 = animIdx;
            gotoAndStop((a_1276[animIdx] as FrameLabel).frame);
            a_3419();
         }
      }
      
      public function SetAnimationOnce2Loop(onceAnimIdx:int, loopAnimIdx:int, damageOnceAnimIdx:int, damageLoopAnimIdx:int) : void
      {
         if(this.inDamage)
         {
            a_1275 = damageLoopAnimIdx;
            gotoAndStop((a_1276[damageOnceAnimIdx] as FrameLabel).frame);
         }
         else
         {
            a_1275 = loopAnimIdx;
            gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         }
         a_3419();
      }
   }
}

