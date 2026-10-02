package com.aurora.ui.maogoutd.resource.defender.HorseYear.battleflag.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.events.Event;
   
   public class BattleFlagSecondBottomEffect extends a_4108
   {
      
      private var m_iStartTime:int;
      
      public var stOriginalFieldGrid:a_3491;
      
      public function BattleFlagSecondBottomEffect()
      {
         super();
         a_1279 = -60;
         m_iYDisplayCenterPos = -215;
      }
      
      public static function a_3926() : BattleFlagSecondBottomEffect
      {
         return PoolManager.getInstance().CheckOutOne(BattleFlagSecondBottomEffect) as BattleFlagSecondBottomEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return BattleFlagSecondBottomEffectMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         this.m_iStartTime = 0;
         play();
         return true;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == a_1274 || a_1278 != null)
         {
            gotoAndStop(1);
         }
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         scaleX = scaleY = 0;
         return true;
      }
   }
}

