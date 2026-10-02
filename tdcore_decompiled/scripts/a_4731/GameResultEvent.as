package a_4731
{
   import flash.events.Event;
   
   public final class GameResultEvent extends Event
   {
      
      public static const NAME:String = "GameResultEvent";
      
      public var m_objResult:Object;
      
      public function GameResultEvent(result:Object, bubbles:Boolean = false, cancelable:Boolean = false)
      {
         this.m_objResult = result;
         super(NAME,bubbles,cancelable);
      }
   }
}

