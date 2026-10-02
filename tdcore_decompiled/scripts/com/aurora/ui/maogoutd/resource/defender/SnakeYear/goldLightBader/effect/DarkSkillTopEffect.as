package com.aurora.ui.maogoutd.resource.defender.SnakeYear.goldLightBader.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class DarkSkillTopEffect extends a_4108
   {
      
      private var m_iStartTime:int;
      
      public var stOriginalFieldGrid:a_3491;
      
      public function DarkSkillTopEffect()
      {
         super();
         a_1279 = -38;
         m_iYDisplayCenterPos = -27;
         scaleX = scaleY = 0.5;
      }
      
      public static function a_3926() : DarkSkillTopEffect
      {
         return PoolManager.getInstance().CheckOutOne(DarkSkillTopEffect) as DarkSkillTopEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return DarkSkillTopEffectMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         a_1275 = 1;
         this.m_iStartTime = 0;
         return true;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(a_1273 == a_1274)
         {
            a_3940();
         }
      }
   }
}

