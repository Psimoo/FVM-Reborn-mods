package a_4759
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   
   public class b_168 extends EventDispatcher implements b_170
   {
      
      public function b_168(target:IEventDispatcher = null)
      {
         super(target);
      }
      
      public function a_2225(eventType:String, eventHandler:Function, useCapture:Boolean = true) : void
      {
         addEventListener(eventType,eventHandler,useCapture);
      }
      
      public function a_2226(eventType:String, eventHandler:Function, useCapture:Boolean = true) : void
      {
         removeEventListener(eventType,eventHandler,useCapture);
      }
      
      public function a_2227(eventType:String) : Boolean
      {
         return hasEventListener(eventType);
      }
      
      public function a_2228(a_4730:Event) : Boolean
      {
         return dispatchEvent(a_4730);
      }
   }
}

