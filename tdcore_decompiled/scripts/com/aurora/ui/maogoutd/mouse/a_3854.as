package com.aurora.ui.maogoutd.mouse
{
   import flash.events.Event;
   
   public class a_3854 extends Event
   {
      
      public static const OVER_MOUSE:String = "overMouse";
      
      public static const OUT_MOUSE:String = "outMouse";
      
      public var value:*;
      
      public function a_3854(type:String, value:* = -1)
      {
         super(type,false);
         this.value = value;
      }
      
      override public function toString() : String
      {
         return super.toString() + " value=" + this.value;
      }
   }
}

