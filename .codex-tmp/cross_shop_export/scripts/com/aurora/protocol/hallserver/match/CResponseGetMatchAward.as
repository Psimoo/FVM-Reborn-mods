package com.aurora.protocol.hallserver.match
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponseGetMatchAward implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_iFlag:int;
      
      public var m_iType:int;
      
      public var m_iRank:int;
      
      public var m_iMatchPoint:int;
      
      public var m_iLevel:int;
      
      public function CResponseGetMatchAward()
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
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_iFlag = a_2664.decode_int32(byte_array);
         this.m_iType = a_2664.decode_int32(byte_array);
         this.m_iRank = a_2664.decode_int32(byte_array);
         this.m_iMatchPoint = a_2664.decode_int32(byte_array);
         this.m_iLevel = a_2664.decode_int32(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

