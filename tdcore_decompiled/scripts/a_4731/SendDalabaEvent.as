package a_4731
{
   import flash.events.Event;
   
   public final class SendDalabaEvent extends Event
   {
      
      public static const NAME:String = "SendDalabaEvent";
      
      public var m_nCount:int;
      
      public function SendDalabaEvent(count:int, bubbles:Boolean = false, cancelable:Boolean = false)
      {
         this.m_nCount = count;
         super(NAME,bubbles,cancelable);
      }
   }
}

