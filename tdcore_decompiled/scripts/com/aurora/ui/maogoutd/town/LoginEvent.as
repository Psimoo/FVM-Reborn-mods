package com.aurora.ui.maogoutd.town
{
   import flash.events.Event;
   
   public class LoginEvent extends Event
   {
      
      public static const MS_TODAY_LOGIN:String = "ms_today_login";
      
      public var data:Object;
      
      public function LoginEvent(type:String, data:Object = null, bubbles:Boolean = false, cancelable:Boolean = false)
      {
         var key:String = null;
         super(type,bubbles,cancelable);
         this.data = {};
         for(key in data)
         {
            this.data[key] = data[key];
         }
      }
      
      override public function clone() : Event
      {
         return new LoginEvent(this.type,this.data,this.bubbles,this.cancelable);
      }
   }
}

