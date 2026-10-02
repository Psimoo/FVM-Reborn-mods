package com.aurora.protocol.hallserver.worldBoss
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CWBDistributeInfo implements CMessageBody
   {
      
      public var m_iDstUin:int;
      
      public var m_cAwardCount:int;
      
      public var m_aryAwardInfo:Array;
      
      public function CWBDistributeInfo()
      {
         super();
         this.m_aryAwardInfo = [];
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var cwbAward:CWBDivideAward = null;
         a_2664.encode_int32(byte_array,this.m_iDstUin);
         a_2664.encode_int8(byte_array,this.m_cAwardCount);
         for(var i:int = 0; i < this.m_aryAwardInfo.length; i++)
         {
            cwbAward = this.m_aryAwardInfo[i];
            cwbAward.encode(byte_array,0);
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

