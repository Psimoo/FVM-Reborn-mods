package com.aurora.ui.maogoutd.resource.defender.DragonYear.NaughtyDragon
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.events.Event;
   
   public class NaughtyDragonMoveBuff extends a_4108
   {
      
      private var m_iStartTime:int;
      
      public function NaughtyDragonMoveBuff()
      {
         super();
         a_1279 = 0;
         m_iYDisplayCenterPos = -158.5;
         scaleX = 0.8;
         scaleY = 0.95;
      }
      
      public static function a_3926() : NaughtyDragonMoveBuff
      {
         return PoolManager.getInstance().CheckOutOne(NaughtyDragonMoveBuff) as NaughtyDragonMoveBuff;
      }
      
      override protected function getBindMovie() : Class
      {
         return NaughtyDragonMoveBuffMovie;
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
         if(a_1273 == a_1274)
         {
            gotoAndStop(1);
         }
      }
   }
}

