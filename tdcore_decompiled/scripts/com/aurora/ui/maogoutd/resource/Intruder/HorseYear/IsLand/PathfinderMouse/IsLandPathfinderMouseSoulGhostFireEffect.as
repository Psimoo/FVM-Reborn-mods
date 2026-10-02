package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.IsLand.PathfinderMouse
{
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   
   public class IsLandPathfinderMouseSoulGhostFireEffect extends BaseGameEffect
   {
      
      private var _count:int = 15;
      
      public function IsLandPathfinderMouseSoulGhostFireEffect()
      {
         super();
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         var b:Boolean = super.a_1797(isReversed);
         this._count = 15;
         return b;
      }
      
      private function SwitchCount(count:int) : void
      {
         this._count = count;
         if(count > 10)
         {
            SetAnimation(1);
         }
         else if(count > 5)
         {
            SetAnimation(2);
         }
         else
         {
            SetAnimation(3);
         }
      }
      
      public function ReduceCount() : Boolean
      {
         if(this._count > 1)
         {
            this.SwitchCount(this._count - 1);
            return true;
         }
         return false;
      }
   }
}

