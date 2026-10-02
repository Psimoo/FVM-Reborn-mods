package com.aurora.ui.maogoutd.resource.shot.ThornRoseShield
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class RosesHeartAddHurtEffect extends a_4108
   {
      
      private var iTimeNum:int;
      
      public function RosesHeartAddHurtEffect()
      {
         super();
         a_1279 = -16;
         m_iYDisplayCenterPos = -10;
      }
      
      public static function a_3926() : RosesHeartAddHurtEffect
      {
         return PoolManager.getInstance().CheckOutOne(RosesHeartAddHurtEffect,RosesHeartAddHurtEffectMovie) as RosesHeartAddHurtEffect;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         this.iTimeNum = -1;
         play();
         return true;
      }
      
      override public function a_3940() : Boolean
      {
         stop();
         super.a_3940();
         return true;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         ++this.iTimeNum;
         nextFrame();
         if(a_1273 == a_1274 || a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
      }
   }
}

