package com.aurora.ui.maogoutd.resource.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.display.FrameLabel;
   import flash.utils.Timer;
   
   public class FansEffect extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      private var m_iStartTime:int;
      
      public function FansEffect()
      {
         super();
      }
      
      public static function a_3926() : FansEffect
      {
         return PoolManager.getInstance().CheckOutOne(FansEffect) as FansEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return FansEffectMovie;
      }
      
      public function a_1797(isReseaved:Boolean) : Boolean
      {
         a_1283 = isReseaved;
         this.visible = true;
         gotoAndStop(1);
         this.play();
         this.m_iStartTime = 0;
         return true;
      }
      
      public function a_3940() : Boolean
      {
         gotoAndStop(1);
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      public function play() : void
      {
      }
      
      public function stop() : void
      {
      }
      
      public function a_4003(iTimeNum:int) : void
      {
         if(iTimeNum % 160 == 152)
         {
            gotoAndStop((a_1276[1] as FrameLabel).frame);
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

