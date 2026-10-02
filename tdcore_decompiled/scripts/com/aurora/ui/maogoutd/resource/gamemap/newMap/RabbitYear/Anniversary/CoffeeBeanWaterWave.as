package com.aurora.ui.maogoutd.resource.gamemap.newMap.RabbitYear.Anniversary
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.display.FrameLabel;
   
   public class CoffeeBeanWaterWave extends a_3909
   {
      
      public function CoffeeBeanWaterWave()
      {
         super();
      }
      
      public static function a_3926() : CoffeeBeanWaterWave
      {
         return PoolManager.getInstance().CheckOutOne(CoffeeBeanWaterWave) as CoffeeBeanWaterWave;
      }
      
      override protected function getBindMovie() : Class
      {
         return CoffeeBeanWaterWaveMovie;
      }
      
      public function a_1797(isReseaved:Boolean) : Boolean
      {
         a_1283 = isReseaved;
         gotoAndStop(1);
         this.visible = true;
         return true;
      }
      
      public function set m_iFrameIndex(value:int) : void
      {
         a_1275 = value;
      }
      
      override public function nextFrame() : void
      {
         super.nextFrame();
         if(a_1278 != null || a_1273 == a_1274)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
      }
      
      public function a_3940() : Boolean
      {
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
   }
}

