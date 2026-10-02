package com.aurora.protocol.logicserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CTableInfo implements CMessageBody
   {
      
      public var m_iTableID:int;
      
      public var m_nTableStatus:int;
      
      public var m_szTableName:String;
      
      public var m_byMMCount:int;
      
      public var m_bySeatCount:int;
      
      public var m_byValidCount:int;
      
      public var m_iGameMapID:int;
      
      public var m_byGameMode:int;
      
      public var m_byLevel:int;
      
      public function CTableInfo()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iTableID","int32"],["m_nTableStatus","int16"],["m_szTableName","string",32],["m_byMMCount","int8"],["m_bySeatCount","int8"],["m_byValidCount","int8"],["m_iGameMapID","int32"],["m_byGameMode","int8"]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_iTableID = a_2664.decode_int32(byte_array);
         this.m_nTableStatus = a_2664.decode_int16(byte_array);
         this.m_szTableName = a_2664.decode_string(byte_array,32);
         this.m_byMMCount = a_2664.decode_int8(byte_array);
         this.m_bySeatCount = a_2664.decode_int8(byte_array);
         this.m_byValidCount = a_2664.decode_int8(byte_array);
         this.m_iGameMapID = a_2664.decode_int32(byte_array);
         this.m_byGameMode = a_2664.decode_int8(byte_array);
         this.m_byLevel = a_2664.decode_int8(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

