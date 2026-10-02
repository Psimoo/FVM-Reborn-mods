package com.aurora.event.mail
{
   import flash.events.Event;
   
   public class MailEvent extends Event
   {
      
      public var data:*;
      
      public function MailEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
      {
         super(type,bubbles,cancelable);
      }
   }
}

