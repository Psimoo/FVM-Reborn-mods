package com.aurora.protocol.logicserver.diy
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CRequestDiyDelMap implements CMessageBody
   {
      
      public var m_iPlatformID:int;
      
      public var m_iGroupID:int;
      
      public var m_iUin:int;
      
      public var m_iMapID:int;
      
      public function CRequestDiyDelMap()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iPlatformID);
         a_2664.encode_int32(byte_array,this.m_iGroupID);
         a_2664.encode_int32(byte_array,this.m_iUin);
         a_2664.encode_int32(byte_array,this.m_iMapID);
         return true;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         return false;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

