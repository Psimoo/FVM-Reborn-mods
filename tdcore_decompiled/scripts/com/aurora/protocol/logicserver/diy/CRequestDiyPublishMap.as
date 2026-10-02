package com.aurora.protocol.logicserver.diy
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CRequestDiyPublishMap implements CMessageBody
   {
      
      public var m_iPlatformID:int;
      
      public var m_iGroupID:int;
      
      public var m_iUin:int;
      
      public var m_iDraftMapId:int;
      
      public var m_iMaxPublishNum:int;
      
      public var m_szName:String;
      
      public var m_szDesz:String;
      
      public function CRequestDiyPublishMap()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iPlatformID);
         a_2664.encode_int32(byte_array,this.m_iGroupID);
         a_2664.encode_int32(byte_array,this.m_iUin);
         a_2664.encode_int32(byte_array,this.m_iDraftMapId);
         a_2664.encode_int32(byte_array,this.m_iMaxPublishNum);
         a_2664.encode_string(byte_array,this.m_szName,32);
         a_2664.encode_string(byte_array,this.m_szDesz,512);
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

