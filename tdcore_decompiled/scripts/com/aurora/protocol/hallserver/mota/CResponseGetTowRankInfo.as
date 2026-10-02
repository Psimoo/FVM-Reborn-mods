package com.aurora.protocol.hallserver.mota
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponseGetTowRankInfo implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_iPatnerUin:int;
      
      public var m_mod:int;
      
      public var m_cflag:int;
      
      public var m_cPlayerNum:int;
      
      public var m_playerInfo:Array;
      
      public function CResponseGetTowRankInfo()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var playerInfo:CGetTowPlayerInfo = null;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_iPatnerUin = a_2664.decode_int32(byte_array);
         this.m_mod = a_2664.decode_int8(byte_array);
         this.m_cflag = a_2664.decode_int8(byte_array);
         this.m_cPlayerNum = a_2664.decode_int8(byte_array);
         this.m_playerInfo = [];
         for(var i:int = 0; i < this.m_cPlayerNum; i++)
         {
            playerInfo = new CGetTowPlayerInfo();
            playerInfo.decode(byte_array,0);
            this.m_playerInfo.push(playerInfo);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

