package com.aurora.protocol.logicserver.crossserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponseCrossGameResultGet implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_nGameResultCount:int;
      
      public var m_vGameResult:Vector.<GameResult>;
      
      public function CResponseCrossGameResultGet()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var gameInfo:GameResult = null;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_nGameResultCount = a_2664.decode_int16(byte_array);
         this.m_vGameResult = new Vector.<GameResult>();
         for(var i:int = 0; i < this.m_nGameResultCount; i++)
         {
            gameInfo = new GameResult();
            gameInfo.decode(byte_array,0);
            this.m_vGameResult.push(gameInfo);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

