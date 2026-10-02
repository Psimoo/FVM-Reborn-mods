package com.adobe.serialization.json
{
   public class JSONToken
   {
      
      private var _value:Object;
      
      private var _type:int;
      
      public function JSONToken(type:int = -1, value:Object = null)
      {
         super();
         _type = type;
         _value = value;
      }
      
      public function get value() : Object
      {
         return _value;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function set type(value:int) : void
      {
         _type = value;
      }
      
      public function set value(v:Object) : void
      {
         _value = v;
      }
   }
}

