package com.aurora.protocol.logicserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2952 implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iRoomID:int;
      
      public var m_iTableID:int;
      
      public var m_bSeatID:int;
      
      public var m_bState:int;
      
      public function a_2952()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_nResultID","int16"]];
         if(this.m_nResultID == 0)
         {
            propertyArray.push(["m_iRoomID","int32"]);
            propertyArray.push(["m_iTableID","int32"]);
            propertyArray.push(["m_bSeatID","int8"]);
            propertyArray.push(["m_bState","int8"]);
         }
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_nResultID = a_2664.decode_int16(byte_array);
         var propertyArray:Array = [];
         if(this.m_nResultID == 0)
         {
            propertyArray.push(["m_iRoomID","int32"]);
            propertyArray.push(["m_iTableID","int32"]);
            propertyArray.push(["m_bSeatID","int8"]);
            propertyArray.push(["m_bState","int8"]);
         }
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

