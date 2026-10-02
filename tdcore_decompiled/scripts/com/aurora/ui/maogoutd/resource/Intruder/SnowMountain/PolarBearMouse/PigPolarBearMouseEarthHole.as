package com.aurora.ui.maogoutd.resource.Intruder.SnowMountain.PolarBearMouse
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.effect.a_4135;
   import flash.display.FrameLabel;
   import flash.events.Event;
   import flash.utils.setTimeout;
   
   public class PigPolarBearMouseEarthHole extends a_4135
   {
      
      public function PigPolarBearMouseEarthHole()
      {
         super();
      }
      
      public static function a_3926() : PigPolarBearMouseEarthHole
      {
         return PoolManager.getInstance().CheckOutOne(PigPolarBearMouseEarthHole) as PigPolarBearMouseEarthHole;
      }
      
      override protected function getBindMovie() : Class
      {
         return PigPolarBearMouseEarthHoleMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         if(m_stCurrentFieldGrid != null)
         {
            timerout = setTimeout(ClearPigBarrierField,60 * 1000,m_stCurrentFieldGrid);
            a_3502(m_stCurrentFieldGrid);
         }
         return true;
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == (a_1276[0] as FrameLabel).frame)
         {
            a_1275 = 1;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(a_1273 == a_1274)
         {
            a_1275 = 1;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
      }
   }
}

