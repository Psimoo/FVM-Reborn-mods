package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.SkyCherryParty.Effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class SkyCherryPartyWindEffect extends a_4108
   {
      
      private var m_iShowTime:int;
      
      public var stOriginalFieldGrid:a_3491;
      
      public function SkyCherryPartyWindEffect()
      {
         super();
         a_1279 = -21;
         m_iYDisplayCenterPos = -9;
      }
      
      public static function a_3926() : SkyCherryPartyWindEffect
      {
         return PoolManager.getInstance().CheckOutOne(SkyCherryPartyWindEffect) as SkyCherryPartyWindEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return SkyCherryPartyWindEffectMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         this.m_iShowTime = 0;
         play();
         return true;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == a_1274 || a_1278 != null)
         {
            ++this.m_iShowTime;
            if(this.m_iShowTime == 2)
            {
               this.a_3940();
               return;
            }
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
      }
      
      override public function a_3940() : Boolean
      {
         this.stOriginalFieldGrid = null;
         super.a_3940();
         return true;
      }
   }
}

