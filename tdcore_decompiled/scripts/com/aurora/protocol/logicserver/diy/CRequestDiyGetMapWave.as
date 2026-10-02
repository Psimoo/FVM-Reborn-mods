package com.aurora.protocol.logicserver.diy
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CRequestDiyGetMapWave implements CMessageBody
   {
      
      public var m_iPlatformID:int;
      
      public var m_iGroupID:int;
      
      public var m_iUin:int;
      
      public var m_iMapID:int;
      
      public var m_iWaveID:int;
      
      public var m_iUsage:int;
      
      public function CRequestDiyGetMapWave()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iPlatformID);
         a_2664.encode_int32(byte_array,this.m_iGroupID);
         a_2664.encode_int32(byte_array,this.m_iUin);
         a_2664.encode_int32(byte_array,this.m_iMapID);
         a_2664.encode_int32(byte_array,this.m_iWaveID);
         a_2664.encode_int32(byte_array,this.m_iUsage);
         return true;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

