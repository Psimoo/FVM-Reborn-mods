package com.aurora.protocol.hallserver.birthdayActivity
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CRequestGetSpecialActAward implements CMessageBody
   {
      
      public var m_iUin:int;
      
      public var m_cOpt:int;
      
      public var m_cCount:int;
      
      public var m_cAwardCount:int;
      
      public var m_cAwardID:Array;
      
      public function CRequestGetSpecialActAward()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iUin);
         a_2664.encode_int8(byte_array,this.m_cOpt);
         a_2664.encode_int8(byte_array,this.m_cCount);
         a_2664.encode_uint32(byte_array,this.m_cAwardCount);
         for(var i:int = 0; i < this.m_cAwardCount; i++)
         {
            a_2664.encode_int16(byte_array,this.m_cAwardID[i]);
         }
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

