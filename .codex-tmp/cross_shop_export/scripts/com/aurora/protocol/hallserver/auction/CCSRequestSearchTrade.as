package com.aurora.protocol.hallserver.auction
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CCSRequestSearchTrade implements CMessageBody
   {
      
      public var m_iUin:int;
      
      public var m_iType:int;
      
      public var m_iStartIndex:int;
      
      public var m_iEndIndex:int;
      
      public var m_szItemName:String;
      
      public function CCSRequestSearchTrade()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iUin);
         a_2664.encode_int32(byte_array,this.m_iType);
         a_2664.encode_int32(byte_array,this.m_iStartIndex);
         a_2664.encode_int32(byte_array,this.m_iEndIndex);
         a_2664.encode_string(byte_array,this.m_szItemName,32);
         return false;
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

