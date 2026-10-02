package a_4731
{
   import flash.events.Event;
   
   public final class ComposeSystemEvent extends Event
   {
      
      public static const NAME:String = "ComposeSystemEvent";
      
      public var m_iOperate:uint;
      
      public var m_iCardID:uint;
      
      public var m_iOption:uint;
      
      public function ComposeSystemEvent(cardID:uint, operate:uint, option:uint = 0, bubbles:Boolean = false, cancelable:Boolean = false)
      {
         this.m_iCardID = cardID;
         this.m_iOperate = operate;
         this.m_iOption = option;
         super(NAME,bubbles,cancelable);
      }
   }
}

