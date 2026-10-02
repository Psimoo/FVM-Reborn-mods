package a_4722
{
   public dynamic class a_1771
   {
      
      private var a_541:Array = [];
      
      public function a_1771()
      {
         super();
      }
      
      public function insert(messageId:uint, fnRoutine:Function) : Boolean
      {
         if(messageId in this)
         {
            return false;
         }
         this[messageId] = fnRoutine;
         this.a_541.push(messageId);
         return true;
      }
      
      public function get protocalMessageIDs() : Array
      {
         return this.a_541.slice();
      }
   }
}

