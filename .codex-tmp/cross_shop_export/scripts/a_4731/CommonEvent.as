package a_4731
{
   import flash.events.Event;
   
   public class CommonEvent extends Event
   {
      
      public var Data:*;
      
      public function CommonEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
      {
         super(type,bubbles,cancelable);
      }
   }
}

