package com.aurora.ui.maogoutd.resource.Intruder.DragonYear.StoneMouseGolem
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class BlooDBarEffect extends a_4108
   {
      
      private var m_iStartTime:int;
      
      public function BlooDBarEffect()
      {
         super();
         a_1279 = 0;
         m_iYDisplayCenterPos = -24;
         scaleX = scaleY = 0.9;
      }
      
      public static function a_3926() : BlooDBarEffect
      {
         return PoolManager.getInstance().CheckOutOne(BlooDBarEffect) as BlooDBarEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return BlooDBarEffectMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         this.m_iStartTime = 0;
         return true;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1278 != null || a_1273 == a_1274)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
      }
      
      public function FrameIndex(frame:int) : void
      {
         if(a_1275 != frame)
         {
            a_1275 = frame;
            gotoAndStop((a_1276[frame] as FrameLabel).frame);
         }
      }
   }
}

