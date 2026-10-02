package com.aurora.protocol.logicserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CSetTableInfo implements CMessageBody
   {
      
      public var m_iPlayerID:int;
      
      public var m_iTableID:int;
      
      public var m_szTableName:String;
      
      public var m_iMapID:int;
      
      public var m_byMode:int;
      
      public var m_byLevel:int;
      
      public function CSetTableInfo()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iPlayerID);
         a_2664.encode_int32(byte_array,this.m_iTableID);
         a_2664.encode_string(byte_array,this.m_szTableName,32);
         a_2664.encode_int32(byte_array,this.m_iMapID);
         a_2664.encode_int8(byte_array,this.m_byMode);
         a_2664.encode_int8(byte_array,this.m_byLevel);
         return true;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_iPlayerID = a_2664.decode_int32(byte_array);
         this.m_iTableID = a_2664.decode_int32(byte_array);
         this.m_szTableName = a_2664.decode_string(byte_array,32);
         this.m_iMapID = a_2664.decode_int32(byte_array);
         this.m_byMode = a_2664.decode_int8(byte_array);
         this.m_byLevel = a_2664.decode_int8(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

