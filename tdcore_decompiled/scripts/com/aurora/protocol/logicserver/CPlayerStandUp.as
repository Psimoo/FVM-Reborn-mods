package com.aurora.protocol.logicserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CPlayerStandUp implements CMessageBody
   {
      
      public var m_iPlayerID:int;
      
      public var m_iTableID:int;
      
      public var m_bySeatID:int;
      
      public var m_byMMCount:int;
      
      public var m_bySeatCount:int;
      
      public var m_byValidCount:int;
      
      public function CPlayerStandUp()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iPlayerID","int32"],["m_iTableID","int32"],["m_bySeatID","int8"],["m_byMMCount","int8"],["m_bySeatCount","int8"],["m_byValidCount","int8"]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_iPlayerID = a_2664.decode_int32(byte_array);
         this.m_iTableID = a_2664.decode_int32(byte_array);
         this.m_bySeatID = a_2664.decode_int8(byte_array);
         this.m_byMMCount = a_2664.decode_int8(byte_array);
         this.m_bySeatCount = a_2664.decode_int8(byte_array);
         this.m_byValidCount = a_2664.decode_int8(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

