package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.boss
{
   import a_4718.b_181;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class TheBossAvatarIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 4500;
      
      private static const MAX_INJURED_LIFE:int = 300;
      
      private static const ONE_GRID_SPEED:int = -3;
      
      private var brozeSnakeBoss:TheBrozeSnakeBoss;
      
      public function TheBossAvatarIntruder()
      {
         a_1279 = -48;
         m_iYDisplayCenterPos = -40;
         super();
      }
      
      public static function a_3926() : TheBossAvatarIntruder
      {
         return PoolManager.getInstance().CheckOutOne(TheBossAvatarIntruder) as TheBossAvatarIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return TheBossAvatarIntruderMovie;
      }
      
      override public function a_4212() : Boolean
      {
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
      }
      
      override public function a_4213() : Boolean
      {
         a_1339 = 0;
         if(m_stCurrentFieldGrid)
         {
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         }
         a_3940();
         return true;
      }
      
      protected function DoStateChange() : void
      {
         if(m_stCurrentFieldGrid.m_iXGridNo >= 7)
         {
            this.a_3969(iLifeValue);
         }
      }
      
      override protected function ChangeFieldGrid(stNextFieldGrid:a_3491) : void
      {
         super.ChangeFieldGrid(stNextFieldGrid);
         this.DoStateChange();
      }
      
      public function InitBrozenSnake(stBrozeSnakeBoss:TheBrozeSnakeBoss, hp:Number) : void
      {
         this.brozeSnakeBoss = stBrozeSnakeBoss;
         a_1339 = hp;
         this.SetAnimationOnce2Loop(0,2);
      }
      
      public function SetAnimation(animIdx:int, addIdx:int = 0) : void
      {
         if(a_1339 > 0 && a_1339 < MAX_INJURED_LIFE)
         {
            animIdx += addIdx;
         }
         if(a_1275 != animIdx)
         {
            a_1275 = animIdx;
            gotoAndStop((a_1276[animIdx] as FrameLabel).frame);
            a_3419();
         }
      }
      
      public function SetAnimationOnce2Loop(onceAnimIdx:int, loopAnimIdx:int, addIdx:int = 0) : void
      {
         if(a_1339 > 0 && a_1339 < MAX_INJURED_LIFE)
         {
            onceAnimIdx += addIdx;
            loopAnimIdx += addIdx;
         }
         a_1275 = loopAnimIdx;
         gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         a_3419();
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
         a_1272 = 0;
         BoomIsReduceLife = true;
         a_1377 = 10;
         a_1481 = false;
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         if(m_stCurrentFieldGrid != null && m_stCurrentFieldGrid.m_iHurtRate <= 0)
         {
            return true;
         }
         super.a_4210();
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > MAX_INJURED_LIFE)
         {
            if(a_1475)
            {
               if(a_1275 != 3)
               {
                  a_1275 = 3;
                  gotoAndStop((a_1276[3] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 2)
            {
               a_1275 = 2;
               gotoAndStop((a_1276[2] as FrameLabel).frame);
            }
            a_3419();
         }
         else if(a_1339 > 0)
         {
            if(a_1475)
            {
               if(a_1275 != 6)
               {
                  a_1275 = 6;
                  gotoAndStop((a_1276[6] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 5)
            {
               a_1275 = 5;
               gotoAndStop((a_1276[5] as FrameLabel).frame);
            }
            a_3419();
         }
         else if(a_1339 <= 0 && a_1275 != 7)
         {
            a_1275 = 7;
            gotoAndStop((a_1276[7] as FrameLabel).frame);
            a_3419();
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            this.play();
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         return true;
      }
      
      override protected function IsCanEat(stBaseDefense:a_3962) : Boolean
      {
         return !stBaseDefense.m_isShowFrozen && stBaseDefense.CanBeEat() && !(stBaseDefense is a_3924);
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var numOrigXPos:Number = x;
         super.a_4216(iCurrentTime);
         if(a_1457 == b_181.a_424 && (x > a_3491.a_1080 * 4 && a_1283 || x < a_3491.a_1080 * 5 && !a_1283))
         {
            y += Math.tan(15 * Math.PI / 180) * Math.abs(numOrigXPos - x);
         }
         return true;
      }
      
      override public function play() : void
      {
         super.play();
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return true;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption(false,false);
      }
   }
}

