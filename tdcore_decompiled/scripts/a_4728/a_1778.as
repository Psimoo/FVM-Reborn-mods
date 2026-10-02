package a_4728
{
   import flash.events.Event;
   import flash.utils.ByteArray;
   
   public class a_1778 extends Event
   {
      
      private var _dataObject:Object;
      
      public function a_1778(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
      {
         super(type,bubbles,cancelable);
      }
      
      override public function clone() : Event
      {
         var newDataEvent:a_1778 = new a_1778(this.type,this.bubbles,this.cancelable);
         var objByteArray:ByteArray = new ByteArray();
         objByteArray.writeObject(this._dataObject);
         objByteArray.position = 0;
         newDataEvent._dataObject = objByteArray.readObject();
         objByteArray = null;
         return newDataEvent;
      }
      
      public function set dataObject(tempObject:Object) : void
      {
         var objByteArray:ByteArray = new ByteArray();
         objByteArray.writeObject(tempObject);
         objByteArray.position = 0;
         this._dataObject = objByteArray.readObject();
         objByteArray = null;
      }
      
      public function set dataObjectNew(tempObject:Object) : void
      {
         this._dataObject = tempObject;
      }
      
      public function get dataObject() : Object
      {
         return this._dataObject;
      }
   }
}

