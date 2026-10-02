package a_4731
{
   import flash.events.Event;
   
   public class a_1791 extends Event
   {
      
      public static const INVITE:String = "invite";
      
      public static const ACCEPT:String = "accept";
      
      public static const REJECT:String = "reject";
      
      public var value:*;
      
      public function a_1791(type:String, value:* = -1, bubbles:Boolean = false, cancelable:Boolean = false)
      {
         super(type,bubbles,cancelable);
         this.value = value;
      }
      
      override public function toString() : String
      {
         return super.toString() + " value=" + this.value;
      }
   }
}

