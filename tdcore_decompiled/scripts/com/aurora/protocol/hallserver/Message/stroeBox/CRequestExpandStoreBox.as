package com.aurora.protocol.hallserver.Message.stroeBox
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CRequestExpandStoreBox implements CMessageBody
   {
      
      public var m_iUin:int;
      
      public var m_iItemID:int;
      
      public var m_iItemSeq:int;
      
      public var m_iCount:int;
      
      public var m_cOpt:int;
      
      public var m_cRuleID:int;
      
      public var m_cBoxIndex:int;
      
      public var m_cBoxName:String;
      
      public function CRequestExpandStoreBox()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iUin);
         a_2664.encode_int32(byte_array,this.m_iItemID);
         a_2664.encode_int32(byte_array,this.m_iItemSeq);
         a_2664.encode_int16(byte_array,this.m_iCount);
         a_2664.encode_int8(byte_array,this.m_cOpt);
         a_2664.encode_int8(byte_array,this.m_cRuleID);
         a_2664.encode_int8(byte_array,this.m_cBoxIndex);
         a_2664.encode_string(byte_array,this.m_cBoxName,32);
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

