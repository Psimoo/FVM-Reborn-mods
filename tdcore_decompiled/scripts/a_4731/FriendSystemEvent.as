package a_4731
{
   import flash.events.Event;
   
   public final class FriendSystemEvent extends Event
   {
      
      public static const NAME:String = "FriendSystemEvent";
      
      public var m_iOperate:int;
      
      public var m_iAddition:int;
      
      public var m_pExtraObject:Object;
      
      public function FriendSystemEvent(operate:int, iAddition:int = 0, bubbles:Boolean = false, cancelable:Boolean = false)
      {
         this.m_iOperate = operate;
         this.m_iAddition = iAddition;
         super(NAME,bubbles,cancelable);
      }
   }
}

