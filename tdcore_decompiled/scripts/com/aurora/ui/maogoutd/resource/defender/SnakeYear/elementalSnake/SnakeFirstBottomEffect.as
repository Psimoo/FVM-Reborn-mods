package com.aurora.ui.maogoutd.resource.defender.SnakeYear.elementalSnake
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class SnakeFirstBottomEffect extends a_4108
   {
      
      private var m_iStartTime:int;
      
      public var stOriginalFieldGrid:a_3491;
      
      public function SnakeFirstBottomEffect()
      {
         super();
         a_1279 = -88;
         m_iYDisplayCenterPos = -83;
      }
      
      public static function a_3926() : SnakeFirstBottomEffect
      {
         return PoolManager.getInstance().CheckOutOne(SnakeFirstBottomEffect) as SnakeFirstBottomEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return SnakeFirstBottomEffectMovie;
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

