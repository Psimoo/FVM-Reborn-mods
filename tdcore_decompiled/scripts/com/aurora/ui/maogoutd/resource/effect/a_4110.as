package com.aurora.ui.maogoutd.resource.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   
   public class a_4110 extends a_3909
   {
      
      public var m_InitializeWidth:Number;
      
      public function a_4110()
      {
         super();
      }
      
      public function a_1797(isReseaved:Boolean = false) : Boolean
      {
         a_1283 = isReseaved;
         this.visible = true;
         gotoAndStop(1);
         a_1275 = 0;
         this.m_InitializeWidth = this.width;
         return true;
      }
      
      public function SetAnimationOnce2Loop(startIndex:int, loopIndex:int) : void
      {
         a_1275 = loopIndex;
         gotoAndStop(2);
      }
      
      public function a_3940() : Boolean
      {
         PoolManager.getInstance().CheckInOne(this);
         gotoAndStop(1);
         return true;
      }
      
      public function a_3957(iTimeInterval:int) : void
      {
         nextFrame();
         if(a_1273 == a_1274 || a_1278 != null)
         {
            if(a_1275 == 0)
            {
               gotoAndStop(1);
            }
            else
            {
               gotoAndStop(2);
            }
         }
      }
   }
}

