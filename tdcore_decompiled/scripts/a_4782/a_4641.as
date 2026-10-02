package a_4782
{
   import flash.events.Event;
   
   public class a_4641 extends Event
   {
      
      public static const a_1124:String = "load_complete";
      
      public static const LOAD_PROGRESS:String = "load_progress";
      
      public static const LOAD_ERROR:String = "load_error";
      
      public static const HTTP_ERROR:String = "http_error";
      
      public static const LOAD_START:String = "load_start";
      
      public var value:*;
      
      public function a_4641(type:String, value:* = -1)
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

