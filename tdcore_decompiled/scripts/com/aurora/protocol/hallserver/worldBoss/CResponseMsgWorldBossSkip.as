package com.aurora.protocol.hallserver.worldBoss
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponseMsgWorldBossSkip implements CMessageBody
   {
      
      public var m_nresult:int;
      
      public var m_nGetScore:int;
      
      public var m_nCount:int;
      
      public var skipAwardAry:Array;
      
      public function CResponseMsgWorldBossSkip()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var skipAward:CWBSkipAward = null;
         this.m_nresult = a_2664.decode_int16(byte_array);
         this.m_nGetScore = a_2664.decode_int16(byte_array);
         this.m_nCount = a_2664.decode_int16(byte_array);
         this.skipAwardAry = [];
         for(var i:int = 0; i < this.m_nCount; i++)
         {
            skipAward = new CWBSkipAward();
            skipAward.decode(byte_array,decode_length);
            this.skipAwardAry[i] = skipAward;
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

