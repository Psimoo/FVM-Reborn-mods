package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.CrossServerMouse.CactusMouse
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.effect.a_4135;
   import flash.events.Event;
   
   public class CactusMouseEarthHole extends a_4135
   {
      
      private var timeLeave:int = -1;
      
      public function CactusMouseEarthHole()
      {
         super();
      }
      
      public static function a_3926() : CactusMouseEarthHole
      {
         return PoolManager.getInstance().CheckOutOne(CactusMouseEarthHole) as CactusMouseEarthHole;
      }
      
      override protected function getBindMovie() : Class
      {
         return CactusMouseEarthHoleMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         if(m_stCurrentFieldGrid != null)
         {
            this.timeLeave = 25 * 10;
            a_3502(m_stCurrentFieldGrid);
         }
         return true;
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         --this.timeLeave;
         if(this.timeLeave == 0)
         {
            ClearPigBarrierField(m_stCurrentFieldGrid);
            this.a_3940();
            return;
         }
         nextFrame();
         if(a_1273 == a_1274)
         {
            gotoAndStop(1);
         }
      }
   }
}

