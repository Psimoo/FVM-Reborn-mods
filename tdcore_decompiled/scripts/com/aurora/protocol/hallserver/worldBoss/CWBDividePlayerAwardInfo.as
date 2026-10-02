package com.aurora.protocol.hallserver.worldBoss
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CWBDividePlayerAwardInfo implements CMessageBody
   {
      
      public var m_cRank:int;
      
      public var m_cSex:int;
      
      public var m_sName:String;
      
      public var m_iUin:int;
      
      public var m_cAwardCount:int;
      
      public var m_aryAwardInfo:Array;
      
      public function CWBDividePlayerAwardInfo()
      {
         super();
         this.m_aryAwardInfo = [];
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var playerAward:CWBDividePlayerAward = null;
         this.m_cRank = a_2664.decode_int8(byte_array);
         this.m_cSex = a_2664.decode_int8(byte_array);
         this.m_sName = a_2664.decode_string(byte_array,32);
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_cAwardCount = a_2664.decode_int8(byte_array);
         for(var i:int = 0; i < this.m_cAwardCount; i++)
         {
            playerAward = new CWBDividePlayerAward();
            playerAward.decode(byte_array,0);
            this.m_aryAwardInfo.push(playerAward);
         }
         return false;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

