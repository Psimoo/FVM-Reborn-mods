package com.aurora.protocol.hallserver.worldBoss
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponseReceiveDivideAward implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_cAwardCount:int;
      
      public var m_aryAwardInfo:Array;
      
      public var m_cConsAwardCount:int;
      
      public var m_aryConsAwardInfo:Array;
      
      public function CResponseReceiveDivideAward()
      {
         super();
         this.m_aryAwardInfo = [];
         this.m_aryConsAwardInfo = [];
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return true;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var i:int = 0;
         var dividePlayerAward:CWBDividePlayerAward = null;
         var divideAward:CWBDivideAward = null;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         if(this.m_nResultID == 0)
         {
            this.m_iUin = a_2664.decode_int32(byte_array);
            this.m_cAwardCount = a_2664.decode_int8(byte_array);
            for(i = 0; i < this.m_cAwardCount; i++)
            {
               dividePlayerAward = new CWBDividePlayerAward();
               dividePlayerAward.decode(byte_array,0);
               this.m_aryAwardInfo.push(dividePlayerAward);
            }
            this.m_cConsAwardCount = a_2664.decode_int8(byte_array);
            for(i = 0; i < this.m_cConsAwardCount; i++)
            {
               divideAward = new CWBDivideAward();
               divideAward.decode(byte_array,0);
               this.m_aryConsAwardInfo.push(divideAward);
            }
         }
         return false;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

