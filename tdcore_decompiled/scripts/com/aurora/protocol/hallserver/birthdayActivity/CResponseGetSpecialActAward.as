package com.aurora.protocol.hallserver.birthdayActivity
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponseGetSpecialActAward implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_cOpt:int;
      
      public var m_cCount:int;
      
      public var m_cAwardCount:int;
      
      public var m_cAwardID:Array;
      
      public var m_cNowTicket:int;
      
      public function CResponseGetSpecialActAward()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return true;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_cOpt = a_2664.decode_int8(byte_array);
         this.m_cCount = a_2664.decode_int8(byte_array);
         this.m_cAwardCount = a_2664.decode_uint32(byte_array);
         this.m_cAwardID = new Array();
         for(var i:int = 0; i < this.m_cAwardCount; i++)
         {
            this.m_cAwardID.push(a_2664.decode_int16(byte_array));
         }
         this.m_cNowTicket = a_2664.decode_int8(byte_array);
         return false;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

