package com.aurora.protocol.logicserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CRequestSendChatMsg implements CMessageBody
   {
      
      public var m_iType:int;
      
      public var m_iPlatformID:int;
      
      public var m_iGroupID:int;
      
      public var m_iUin:int;
      
      public var m_iPlayerID:int;
      
      public var m_szSrcName:String;
      
      public var m_iDstPlatformID:int;
      
      public var m_iDstGroupID:int;
      
      public var m_iDstUin:int;
      
      public var m_szMsg:String;
      
      public function CRequestSendChatMsg()
      {
         super();
         this.m_iType = 0;
         this.m_iPlatformID = 0;
         this.m_iGroupID = 0;
         this.m_iUin = 0;
         this.m_iPlayerID = 0;
         this.m_szSrcName = "";
         this.m_iDstPlatformID = 0;
         this.m_iDstGroupID = 0;
         this.m_iDstUin = 0;
         this.m_szMsg = "";
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iType);
         a_2664.encode_int32(byte_array,this.m_iPlatformID);
         a_2664.encode_int32(byte_array,this.m_iGroupID);
         a_2664.encode_int32(byte_array,this.m_iUin);
         a_2664.encode_int32(byte_array,this.m_iPlayerID);
         a_2664.encode_string(byte_array,this.m_szSrcName,32);
         a_2664.encode_int32(byte_array,this.m_iDstPlatformID);
         a_2664.encode_int32(byte_array,this.m_iDstGroupID);
         a_2664.encode_int32(byte_array,this.m_iDstUin);
         a_2664.encode_string(byte_array,this.m_szMsg,256);
         return true;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_iType = a_2664.decode_int32(byte_array);
         this.m_iPlatformID = a_2664.decode_int32(byte_array);
         this.m_iGroupID = a_2664.decode_int32(byte_array);
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_iPlayerID = a_2664.decode_int32(byte_array);
         this.m_szSrcName = a_2664.decode_string(byte_array,32);
         this.m_iDstPlatformID = a_2664.decode_int32(byte_array);
         this.m_iDstGroupID = a_2664.decode_int32(byte_array);
         this.m_iDstUin = a_2664.decode_int32(byte_array);
         this.m_szMsg = a_2664.decode_string(byte_array,256);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

