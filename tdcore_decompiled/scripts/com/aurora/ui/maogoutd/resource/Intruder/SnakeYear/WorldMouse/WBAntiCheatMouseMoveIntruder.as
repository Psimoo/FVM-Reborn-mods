package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.WorldMouse
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class WBAntiCheatMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 90000000;
      
      private static const MAX_INJURED_LIFE:int = 300;
      
      private static const ONE_GRID_SPEED:int = 6;
      
      public function WBAntiCheatMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(WBAntiCheatMouseMoveIntruder) as WBAntiCheatMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBAntiCheatMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = 0;
         a_1339 = MAX_LIFE;
         a_1279 = -width * 0.2;
         a_1272 = 0;
         a_1481 = false;
         a_1464 = true;
         BoomIsReduceLife = true;
         a_1463 = true;
         a_1462 = false;
         this.SetAnimation(1,0);
         visible = false;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         visible = false;
         super.a_3940();
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 0)
         {
            if(a_1475)
            {
               if(a_1275 == 4 && this.InDamage())
               {
                  this.SetAnimationOnce2Loop2(5,6);
               }
               else
               {
                  this.SetAnimation(4,2);
               }
            }
            else if(a_1275 == 1 && this.InDamage())
            {
               this.SetAnimationOnce2Loop2(2,3);
            }
            else
            {
               this.SetAnimation(1,2);
            }
         }
         else
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
         var arrBaseMoveIntruderVector:Array = null;
         if(!a_1460)
         {
            a_1460 = true;
            if(m_stMoveIntruderTypeID == 8389710)
            {
               if(m_stCurrentFieldGrid)
               {
                  m_stCurrentFieldGrid.a_3457(this);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
                  a_1462 = true;
                  arrBaseMoveIntruderVector = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_arrBaseMoveIntruderVector;
                  if(-1 != arrBaseMoveIntruderVector.indexOf(this))
                  {
                     arrBaseMoveIntruderVector.splice(arrBaseMoveIntruderVector.indexOf(this),1);
                  }
               }
            }
         }
         if(m_stMoveIntruderTypeID != 8389710)
         {
            SetCannotSeeByFighter(true);
         }
         a_1350 = 0;
         return true;
      }
      
      public function InDamage() : Boolean
      {
         return a_1339 > 0 && a_1339 < MAX_INJURED_LIFE;
      }
      
      public function SetAnimation(animIdx:int, addIdx:int = 0) : void
      {
         if(this.InDamage())
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
         if(this.InDamage())
         {
            onceAnimIdx += addIdx;
            loopAnimIdx += addIdx;
         }
         a_1275 = loopAnimIdx;
         gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         a_3419();
      }
      
      public function SetAnimationOnce2Loop2(onceAnimIdx:int, loopAnimIdx:int) : void
      {
         a_1275 = loopAnimIdx;
         gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         a_3419();
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
      }
      
      override public function a_4210() : Boolean
      {
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         return true;
      }
   }
}

