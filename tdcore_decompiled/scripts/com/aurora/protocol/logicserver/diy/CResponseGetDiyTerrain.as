package com.aurora.protocol.logicserver.diy
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponseGetDiyTerrain implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iPlatformID:int;
      
      public var m_iGroupID:int;
      
      public var m_iUin:int;
      
      public var m_iMapID:int;
      
      public var m_iUsage:int;
      
      public var m_iDataSize:int;
      
      public var m_szData:ByteArray;
      
      public function CResponseGetDiyTerrain()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_iPlatformID = a_2664.decode_int32(byte_array);
         this.m_iGroupID = a_2664.decode_int32(byte_array);
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_iMapID = a_2664.decode_int32(byte_array);
         this.m_iUsage = a_2664.decode_int32(byte_array);
         this.m_iDataSize = a_2664.decode_int32(byte_array);
         this.m_szData = new ByteArray();
         a_2664.decode_memory(byte_array,this.m_szData,this.m_iDataSize);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

