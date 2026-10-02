package com.aurora.protocol.friend
{
   import a_4720.a_1755;
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CStateData implements CMessageBody
   {
      
      public var m_cClass:int;
      
      public var hallState:int;
      
      public var logicState:LogicServerState;
      
      public function CStateData()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_cClass","int8"]];
         if(this.m_cClass == a_1755.a_522)
         {
            propertyArray.push(["hallState","int32"]);
         }
         else if(this.m_cClass == a_1755.a_523)
         {
            propertyArray.push(["logicState","object","com.aurora.protocol.friend.LogicServerState","nosize"]);
         }
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var size:int = a_2664.decode_int16(byte_array);
         this.m_cClass = a_2664.decode_int8(byte_array);
         var propertyArray:Array = [];
         if(this.m_cClass == a_1755.a_522)
         {
            this.hallState = a_2664.decode_int32(byte_array);
         }
         else if(this.m_cClass == a_1755.a_523)
         {
            this.logicState = new LogicServerState();
            this.logicState.decode(byte_array,decode_length);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

