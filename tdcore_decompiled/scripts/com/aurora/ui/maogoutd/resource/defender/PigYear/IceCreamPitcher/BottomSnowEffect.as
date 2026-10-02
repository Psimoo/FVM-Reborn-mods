package com.aurora.ui.maogoutd.resource.defender.PigYear.IceCreamPitcher
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.utils.Timer;
   
   public class BottomSnowEffect extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      private var m_iStartTime:int;
      
      public function BottomSnowEffect()
      {
         super();
      }
      
      public static function a_3926() : BottomSnowEffect
      {
         return PoolManager.getInstance().CheckOutOne(BottomSnowEffect) as BottomSnowEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return BottomSnowEffectMovie;
      }
      
      public function a_1797(isReseaved:Boolean) : Boolean
      {
         a_1283 = isReseaved;
         this.visible = true;
         gotoAndStop(1);
         this.m_iStartTime = 0;
         return true;
      }
      
      public function a_3940() : Boolean
      {
         gotoAndStop(1);
         PoolManager.getInstance().CheckInOne(this);
         this.m_iStartTime = 0;
         return true;
      }
      
      public function a_4003(iTimeNum:int) : void
      {
         if(this.m_iStartTime == 0)
         {
            this.m_iStartTime = iTimeNum;
         }
         if(iTimeNum % 2 == 0)
         {
            nextFrame();
            if(null != a_1278 || a_1273 == a_1274)
            {
               gotoAndStop(1);
            }
         }
      }
   }
}

