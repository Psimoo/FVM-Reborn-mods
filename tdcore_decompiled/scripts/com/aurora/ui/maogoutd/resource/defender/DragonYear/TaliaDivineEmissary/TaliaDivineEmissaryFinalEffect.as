package com.aurora.ui.maogoutd.resource.defender.DragonYear.TaliaDivineEmissary
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class TaliaDivineEmissaryFinalEffect extends a_4108
   {
      
      private var m_iStartTime:int;
      
      public var stOriginalFieldGrid:a_3491;
      
      public function TaliaDivineEmissaryFinalEffect()
      {
         super();
         a_1279 = -150.5;
         m_iYDisplayCenterPos = -214.5;
      }
      
      public static function a_3926() : TaliaDivineEmissaryFinalEffect
      {
         return PoolManager.getInstance().CheckOutOne(TaliaDivineEmissaryFinalEffect) as TaliaDivineEmissaryFinalEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return TaliaDivineEmissaryFinalEffectMovie;
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

