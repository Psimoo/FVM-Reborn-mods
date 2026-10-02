package a_4731
{
   import flash.events.Event;
   
   public class TaskShortcutEvent extends Event
   {
      
      public static const NAME:String = "TaskShortcutEvent";
      
      public var m_eventData:Object = new Object();
      
      public function TaskShortcutEvent()
      {
         super(NAME,false,false);
      }
   }
}

