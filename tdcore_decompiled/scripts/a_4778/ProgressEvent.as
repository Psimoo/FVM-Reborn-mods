package a_4778
{
   import flash.events.Event;
   
   public class ProgressEvent extends Event
   {
      
      public static const PROGRESS:String = "assetLoader_progress";
      
      public var _percentDone:Number;
      
      public function ProgressEvent(type:String, percentDone:Number = 0)
      {
         super(type);
         this._percentDone = percentDone;
      }
      
      override public function clone() : Event
      {
         return new ProgressEvent(type,this._percentDone);
      }
      
      override public function toString() : String
      {
         return formatToString("ProgressEvent","type","percentDone");
      }
      
      public function get percentDone() : Number
      {
         return this._percentDone;
      }
      
      public function set percentDone(val:Number) : void
      {
         this._percentDone = val;
      }
   }
}

