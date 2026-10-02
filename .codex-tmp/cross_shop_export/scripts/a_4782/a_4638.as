package a_4782
{
   import flash.events.Event;
   
   public class a_4638 extends Event
   {
      
      public static const UPDATE_ROWS:String = "updateRows";
      
      public static const DATA_UPDATE:String = "dataUpdate";
      
      public static const a_1717:String = "scrollChange";
      
      public var value:*;
      
      public function a_4638(type:String, value:* = -1)
      {
         super(type);
         this.value = value;
      }
      
      override public function toString() : String
      {
         return super.toString() + " value=" + this.value;
      }
   }
}

