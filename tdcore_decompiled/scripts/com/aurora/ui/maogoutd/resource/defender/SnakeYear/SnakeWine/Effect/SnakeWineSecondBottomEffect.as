package com.aurora.ui.maogoutd.resource.defender.SnakeYear.SnakeWine.Effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class SnakeWineSecondBottomEffect extends a_4108
   {
      
      private var m_iStartTime:int;
      
      public var stOriginalFieldGrid:a_3491;
      
      public function SnakeWineSecondBottomEffect()
      {
         super();
         a_1279 = -100;
         m_iYDisplayCenterPos = -97;
      }
      
      public static function a_3926() : SnakeWineSecondBottomEffect
      {
         return PoolManager.getInstance().CheckOutOne(SnakeWineSecondBottomEffect) as SnakeWineSecondBottomEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return SnakeWineSecondBottomEffectMovie;
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
         if(a_1273 == a_1274 || a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
      }
   }
}

