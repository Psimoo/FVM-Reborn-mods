package a_4714
{
   import flash.events.Event;
   
   public class AssetsManagerEvent extends Event
   {
      
      public static const GET_SUCCESS:String = "getSuccess";
      
      public static const GET_FAIL:String = "getFail";
      
      public static const a_101:String = "getProgress";
      
      public var value:*;
      
      public function AssetsManagerEvent(type:String, value:* = -1)
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

