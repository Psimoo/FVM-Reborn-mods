package com.aurora.ui.maogoutd.resource.defender.HorseYear.soulpuppet.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.events.Event;
   
   public class SoulPuppetFirstBoomEffect extends a_4108
   {
      
      private var m_iStartTime:int;
      
      public var stOriginalFieldGrid:a_3491;
      
      public function SoulPuppetFirstBoomEffect()
      {
         super();
         a_1279 = -129;
         m_iYDisplayCenterPos = -118;
      }
      
      public static function a_3926() : SoulPuppetFirstBoomEffect
      {
         return PoolManager.getInstance().CheckOutOne(SoulPuppetFirstBoomEffect) as SoulPuppetFirstBoomEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return SoulPuppetFirstBoomEffectMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         if(this.stOriginalFieldGrid)
         {
            this.stOriginalFieldGrid.m_stCurrentBattbleFieldView.m_arrEffectArray.push(this);
         }
         this.m_iStartTime = 0;
         play();
         return true;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == a_1274 || a_1278 != null)
         {
            this.a_3940();
         }
      }
      
      override public function a_3940() : Boolean
      {
         var stVector:Array = null;
         super.a_3940();
         if(this.stOriginalFieldGrid)
         {
            stVector = this.stOriginalFieldGrid.m_stCurrentBattbleFieldView.m_arrEffectArray;
            if(-1 != stVector.indexOf(this))
            {
               stVector.splice(stVector.indexOf(this),1);
            }
         }
         this.stOriginalFieldGrid = null;
         return true;
      }
   }
}

