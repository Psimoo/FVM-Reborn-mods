package com.aurora.ui.maogoutd.resource.avatar
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   
   public class BaseAvatarEffect extends a_3909
   {
      
      private var m_iContinueTick:int;
      
      public function BaseAvatarEffect()
      {
         super();
         mouseEnabled = false;
      }
      
      public function a_1797(bIsReversed:Boolean = false, iContinueTick:int = -2) : Boolean
      {
         a_1283 = bIsReversed;
         this.m_iContinueTick = iContinueTick;
         this.visible = true;
         gotoAndStop(1);
         return true;
      }
      
      public function OnTimeInterval(iCurrentTime:uint) : void
      {
         if(this.m_iContinueTick >= 0)
         {
            --this.m_iContinueTick;
            if(this.m_iContinueTick < 0)
            {
               this.a_3940();
            }
         }
         else if(a_1273 == a_1274)
         {
            if(-1 == this.m_iContinueTick)
            {
               this.a_3940();
            }
            else
            {
               gotoAndStop(1);
            }
         }
         nextFrame();
      }
      
      public function a_3940() : Boolean
      {
         gotoAndStop(1);
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
   }
}

