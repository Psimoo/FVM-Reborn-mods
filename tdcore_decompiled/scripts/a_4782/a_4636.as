package a_4782
{
   import flash.events.Event;
   
   public class a_4636 extends Event
   {
      
      public static const DRAG_START:String = "dragStart";
      
      public static const DRAG_STOP:String = "dragStop";
      
      public static const DRAGING:String = "draging";
      
      public static const ADDED_TO_STAGE:String = "addedToStage";
      
      public static const REMOVED_FROM_STAGE:String = "removedFromStage";
      
      public var value:*;
      
      public function a_4636(type:String, value:* = -1)
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

