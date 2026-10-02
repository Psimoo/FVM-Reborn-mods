package com.aurora.protocol.hallserver.handbook
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CRequestHandbookLightOrReceiveInfo implements CMessageBody
   {
      
      public var m_iUin:int;
      
      public var m_cOpt:int;
      
      public var m_cType:int;
      
      public var m_nAwardType:int;
      
      public var m_cAwardLevel:int;
      
      public var m_cCardCount:int;
      
      public var m_aryCardInfo:Array;
      
      public function CRequestHandbookLightOrReceiveInfo()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var activeCard:HandbookActiveCard = null;
         a_2664.encode_int32(byte_array,this.m_iUin);
         a_2664.encode_int8(byte_array,this.m_cOpt);
         a_2664.encode_int8(byte_array,this.m_cType);
         a_2664.encode_int16(byte_array,this.m_nAwardType);
         a_2664.encode_int8(byte_array,this.m_cAwardLevel);
         a_2664.encode_int8(byte_array,this.m_cCardCount);
         if(this.m_aryCardInfo != null && this.m_aryCardInfo.length > 0)
         {
            activeCard = this.m_aryCardInfo[0];
            activeCard.encode(byte_array,0);
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

