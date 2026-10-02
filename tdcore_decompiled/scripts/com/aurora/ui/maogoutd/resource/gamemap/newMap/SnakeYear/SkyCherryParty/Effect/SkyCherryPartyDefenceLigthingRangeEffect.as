package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.SkyCherryParty.Effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.events.Event;
   
   public class SkyCherryPartyDefenceLigthingRangeEffect extends a_4108
   {
      
      private var m_iStartTime:int;
      
      public var stOriginalFieldGrid:a_3491;
      
      public var stCallBackFunc:Function = null;
      
      public function SkyCherryPartyDefenceLigthingRangeEffect()
      {
         super();
         a_1279 = -108;
         m_iYDisplayCenterPos = -104;
      }
      
      public static function a_3926() : SkyCherryPartyDefenceLigthingRangeEffect
      {
         return PoolManager.getInstance().CheckOutOne(SkyCherryPartyDefenceLigthingRangeEffect) as SkyCherryPartyDefenceLigthingRangeEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return SkyCherryPartyDefenceLigthingRangeEffectMovie;
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
         ++this.m_iStartTime;
         nextFrame();
         if(a_1273 == a_1274 || a_1278 != null)
         {
            this.a_3940();
            if(this.stCallBackFunc != null)
            {
               this.stCallBackFunc();
            }
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

