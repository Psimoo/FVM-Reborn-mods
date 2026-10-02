package com.aurora.ui.maogoutd.resource.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class AddMouseFireBuff extends a_3909
   {
      
      public function AddMouseFireBuff()
      {
         super();
      }
      
      public static function a_3926() : AddMouseFireBuff
      {
         return PoolManager.getInstance().CheckOutOne(AddMouseFireBuff) as AddMouseFireBuff;
      }
      
      override protected function getBindMovie() : Class
      {
         return AddMouseFireBuffMovie;
      }
      
      public function a_1797(isReseaved:Boolean = false) : Boolean
      {
         a_1283 = isReseaved;
         this.visible = true;
         gotoAndStop(1);
         scaleX = scaleY = 0.65;
         return true;
      }
      
      public function a_3940() : Boolean
      {
         gotoAndStop(1);
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      public function a_4003(a_4730:Event) : void
      {
         nextFrame();
         var xx:Array = a_1276;
         trace("m_iCurrentFrame<<<<<" + a_1273);
         if(a_1273 == a_1274)
         {
            this.a_3940();
         }
         else if(a_1273 == 7 || a_1273 == 22)
         {
            a_1275 = 1;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
      }
      
      public function ClearBuff() : void
      {
         a_1275 = 2;
         gotoAndStop((a_1276[2] as FrameLabel).frame);
      }
   }
}

