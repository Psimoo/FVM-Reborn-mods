package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.WorldMouse
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class WBClamMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 3050;
      
      private static const MAX_INJURED_LIFE:int = 1500;
      
      private static const ONE_GRID_SPEED:int = 4;
      
      private var m_bUseBoomDamage:Boolean = false;
      
      private var m_iTick:int = 0;
      
      public function WBClamMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(WBClamMouseMoveIntruder) as WBClamMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBClamMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (ONE_GRID_SPEED * 20);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = MAX_LIFE;
         a_1279 = -width * 0.2;
         a_1272 = 0;
         this.SetAnimation2(0);
         BoomIsReduceLife = true;
         this.m_bUseBoomDamage = false;
         this.m_iTick = 0;
         tagCom.AddTag(40002);
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 0)
         {
            if(a_1475)
            {
               if(a_1339 > MAX_INJURED_LIFE)
               {
                  this.SetAnimation2(3);
               }
               else if(a_1275 == 3 && a_1339 > 0)
               {
                  this.SetAnimationOnce2Loop2(4,5);
               }
               else
               {
                  this.SetAnimation2(5);
               }
            }
            else if(a_1339 > MAX_INJURED_LIFE)
            {
               this.SetAnimation2(0);
            }
            else if(a_1275 == 0 && a_1339 > 0)
            {
               this.SetAnimationOnce2Loop2(1,2);
            }
            else
            {
               this.SetAnimation2(2);
            }
         }
         else
         {
            this.SetAnimation2(6);
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(this.m_bUseBoomDamage)
         {
            super.a_3969(iRduceLifeValue);
         }
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         if(BoomIsReduceLife)
         {
            this.m_bUseBoomDamage = true;
            this.a_3969(BOOM_INJURE_LIFE);
            this.m_bUseBoomDamage = false;
         }
         else
         {
            a_1339 = 0;
         }
         ShowBoomDieEffect();
         if(a_1339 <= 0)
         {
            a_3940();
         }
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         return super.a_4209(iRduceLifeValue);
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var stBaseShot:a_4348 = null;
         var numOrigXPos:Number = x;
         super.a_4216(iCurrentTime);
         if(m_stCurrentFieldGrid != null)
         {
            for each(stBaseShot in m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_stBaseShotVector[m_stCurrentFieldGrid.m_iYGridNo].slice())
            {
               if((!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.isParabolaPath || stBaseShot.tagCom.HasTag(30)) && (this.GetRightestPos(stBaseShot) > x - 1 && this.GetRightestPos(stBaseShot) < x + 60))
               {
                  stBaseShot.a_4350();
               }
            }
         }
         ++this.m_iTick;
         if(this.m_iTick >= 65 * 20)
         {
            super.a_3969(iLifeValue);
         }
         return true;
      }
      
      private function GetRightestPos(stBaseShot:a_4348) : int
      {
         return stBaseShot.x + stBaseShot.width;
      }
      
      public function InDamage() : Boolean
      {
         return a_1339 > 0 && a_1339 < MAX_INJURED_LIFE;
      }
      
      public function SetAnimation2(animIdx:int) : void
      {
         if(a_1275 != animIdx)
         {
            a_1275 = animIdx;
            gotoAndStop((a_1276[animIdx] as FrameLabel).frame);
            a_3419();
         }
      }
      
      public function SetAnimationOnce2Loop2(onceAnimIdx:int, loopAnimIdx:int) : void
      {
         a_1275 = loopAnimIdx;
         gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         a_3419();
      }
   }
}

