package com.aurora.ui.maogoutd.resource.defender.SnakeYear.elementSnake.effect
{
   public class HurtBuff
   {
      
      public var duration:int;
      
      public var power:Number;
      
      public var hitTime:int;
      
      public function HurtBuff(duration:int, power:Number, hitTime:int = 0)
      {
         super();
         this.duration = duration;
         this.power = power;
         this.hitTime = hitTime;
      }
   }
}

