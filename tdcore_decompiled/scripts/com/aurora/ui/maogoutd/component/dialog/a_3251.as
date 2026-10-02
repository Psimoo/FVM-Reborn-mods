package com.aurora.ui.maogoutd.component.dialog
{
   import flash.events.Event;
   
   public class a_3251 extends Event
   {
      
      public static const CLOSE:String = "close";
      
      public static const SURE:String = "sure";
      
      public static const CANCEL:String = "cancel";
      
      public var value:*;
      
      public function a_3251(type:String, value:* = -1)
      {
         super(type);
         this.value = value;
      }
      
      override public function toString() : String
      {
         return super.toString() + " value=" + this.value;
      }
   }
}

