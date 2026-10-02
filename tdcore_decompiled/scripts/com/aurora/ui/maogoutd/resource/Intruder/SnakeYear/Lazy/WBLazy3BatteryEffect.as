package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.Lazy
{
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   
   public class WBLazy3BatteryEffect extends BaseGameEffect
   {
      
      private var _value:int = 0;
      
      public function WBLazy3BatteryEffect()
      {
         super();
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         SetAnimation(0);
         this._value = 0;
         return true;
      }
      
      public function AddValue() : void
      {
         ++this._value;
         if(this._value <= 3)
         {
            SetAnimation(this._value);
         }
      }
   }
}

