package com.aurora.ui.maogoutd.resource.defender.SnakeYear.GoldFateGoddesses.Effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class GoldFateGoddessesBaseBottomEffect extends a_4108
   {
      
      private var m_iStartTime:int;
      
      public var stOriginalFieldGrid:a_3491;
      
      public function GoldFateGoddessesBaseBottomEffect()
      {
         super();
         a_1279 = -140;
         m_iYDisplayCenterPos = -133;
      }
      
      public static function a_3926() : GoldFateGoddessesBaseBottomEffect
      {
         return PoolManager.getInstance().CheckOutOne(GoldFateGoddessesBaseBottomEffect) as GoldFateGoddessesBaseBottomEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return GoldFateGoddessesBaseBottomEffectMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         this.m_iStartTime = 0;
         a_1275 = 1;
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

