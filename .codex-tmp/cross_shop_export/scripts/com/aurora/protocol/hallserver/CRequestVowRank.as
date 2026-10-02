package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CRequestVowRank implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUIN:int;
      
      public var m_iMoneyConsume:int;
      
      public var m_iCount:int;
      
      public var m_arrVowRank:Array;
      
      public function CRequestVowRank()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var rankObj:Object = null;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_iUIN = a_2664.decode_int32(byte_array);
         this.m_iMoneyConsume = a_2664.decode_int32(byte_array);
         this.m_iCount = a_2664.decode_int32(byte_array);
         if(this.m_arrVowRank == null)
         {
            this.m_arrVowRank = [];
         }
         this.m_arrVowRank.splice(0);
         for(var i:int = 0; i < this.m_iCount; i++)
         {
            rankObj = {};
            rankObj.m_iUin = a_2664.decode_int32(byte_array);
            rankObj.m_iRank = a_2664.decode_int32(byte_array);
            rankObj.iMoneyConsume = a_2664.decode_int32(byte_array);
            rankObj.szRoleName = a_2664.decode_string(byte_array,32);
            this.m_arrVowRank.push(rankObj);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

