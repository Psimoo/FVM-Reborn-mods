package com.aurora.protocol.logicserver.diy
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponseDiyPublishMap implements CMessageBody
   {
      
      public var m_nResultID:int = 0;
      
      public var m_iPlatformID:int = 0;
      
      public var m_iGroupID:int = 0;
      
      public var m_iUin:int = 0;
      
      public var m_iDraftMapID:int = 0;
      
      public var m_iPublishMapID:int = 0;
      
      public function CResponseDiyPublishMap()
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
         this.m_iDraftMapID = a_2664.decode_int32(byte_array);
         this.m_iPublishMapID = a_2664.decode_int32(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

