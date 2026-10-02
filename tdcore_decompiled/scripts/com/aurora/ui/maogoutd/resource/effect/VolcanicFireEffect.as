package com.aurora.ui.maogoutd.resource.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.events.Event;
   
   public class VolcanicFireEffect extends a_3909
   {
      
      private var m_stCurrentFieldGrid:a_3491;
      
      public function VolcanicFireEffect()
      {
         super();
      }
      
      public static function a_3926() : VolcanicFireEffect
      {
         return PoolManager.getInstance().CheckOutOne(VolcanicFireEffect,VolcanicFireEffectMovie) as VolcanicFireEffect;
      }
      
      public function a_1797(isReseaved:Boolean = false) : Boolean
      {
         a_1283 = isReseaved;
         this.visible = true;
         gotoAndStop(1);
         return true;
      }
      
      public function a_3940() : Boolean
      {
         if(this.m_stCurrentFieldGrid != null)
         {
            this.m_stCurrentFieldGrid.m_hasFireEffect = false;
         }
         gotoAndStop(1);
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      public function a_4003(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == a_1274)
         {
            gotoAndStop(1);
         }
      }
      
      public function get stCurrentFieldGrid() : a_3491
      {
         return this.m_stCurrentFieldGrid;
      }
      
      public function set stCurrentFieldGrid(value:a_3491) : void
      {
         this.m_stCurrentFieldGrid = value;
         if(this.m_stCurrentFieldGrid != null)
         {
            this.m_stCurrentFieldGrid.m_hasFireEffect = true;
         }
      }
   }
}

