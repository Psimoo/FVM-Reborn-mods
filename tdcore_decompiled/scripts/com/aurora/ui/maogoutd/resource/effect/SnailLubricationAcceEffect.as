package com.aurora.ui.maogoutd.resource.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class SnailLubricationAcceEffect extends BaseAccelerationEffect
   {
      
      public function SnailLubricationAcceEffect()
      {
         super();
      }
      
      public static function a_3926() : BaseAccelerationEffect
      {
         return PoolManager.getInstance().CheckOutOne(SnailLubricationAcceEffect) as SnailLubricationAcceEffect;
      }
      
      override protected function IsPlayRate(iCurrentTime:int) : Boolean
      {
         return true;
      }
      
      override public function get width() : Number
      {
         return 72;
      }
      
      override public function get height() : Number
      {
         return 22;
      }
      
      override protected function setPosition(iOffsetX:int = 0, iOffsetY:int = 10) : void
      {
         super.setPosition(22,iOffsetY);
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      override protected function getBindMovie() : Class
      {
         return SnailLubricationAcceEffectMovie;
      }
   }
}

