package com.aurora.ui.maogoutd.resource.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   
   public class a_4139 extends a_3909
   {
      
      private var a_1425:int;
      
      public function a_4139()
      {
         super();
         a_1279 = -4;
         m_iYDisplayCenterPos = 3;
      }
      
      public static function a_3926() : a_4139
      {
         return PoolManager.getInstance().CheckOutOne(a_4139) as a_4139;
      }
      
      override protected function getBindMovie() : Class
      {
         return OilBottleBoomFlameMovie;
      }
      
      public function a_1797(iStartPlayTimeNum:int) : Boolean
      {
         this.a_1425 = iStartPlayTimeNum;
         a_1272 = 0;
         this.visible = true;
         gotoAndStop(1);
         return true;
      }
      
      public function a_4140(iTimeInterval:int) : void
      {
         if(iTimeInterval < this.a_1425)
         {
            return;
         }
         if(iTimeInterval == this.a_1425)
         {
            gotoAndStop(1);
            this.visible = true;
            return;
         }
         nextFrame();
         if(a_1273 == a_1274)
         {
            this.visible = false;
            gotoAndStop(1);
            if(Boolean(parent) && parent.contains(this))
            {
               parent.removeChild(this);
            }
            return;
         }
      }
      
      public function a_3940() : Boolean
      {
         gotoAndStop(1);
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
   }
}

