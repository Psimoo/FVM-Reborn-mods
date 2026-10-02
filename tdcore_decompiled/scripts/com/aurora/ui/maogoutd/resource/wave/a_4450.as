package com.aurora.ui.maogoutd.resource.wave
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.events.Event;
   
   public class a_4450 extends a_3909
   {
      
      public function a_4450()
      {
         a_1271 = true;
         super();
      }
      
      public static function a_3926(moveClipClass:Class) : a_4450
      {
         var wave:a_4450 = null;
         wave = PoolManager.getInstance().CheckOutOne(a_4450,moveClipClass) as a_4450;
         wave.x = 0;
         wave.y = 0;
         return wave;
      }
      
      public function a_1797() : Boolean
      {
         if(a_3913().totalFrames <= 1)
         {
            return false;
         }
         this.visible = true;
         gotoAndStop(1);
         return true;
      }
      
      public function a_4451() : a_4450
      {
         return null;
      }
      
      public function a_3940() : Boolean
      {
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      public function a_4332() : void
      {
         visible = true;
      }
      
      public function a_4333(a_4730:Event) : void
      {
         if(a_1273 == a_1274)
         {
            gotoAndStop(1);
         }
         nextFrame();
      }
   }
}

