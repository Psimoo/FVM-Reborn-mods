package com.aurora.protocol.game.maogoutd
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2694 implements CMessageBody
   {
      
      public var m_byLoseTeamID:int;
      
      public var m_byGameMode:int;
      
      public var m_iMapID:int;
      
      public var m_iRoundTime:int;
      
      public var m_byRoundStep:int;
      
      public var m_iBossID:int;
      
      public var m_iCommonService:int;
      
      public var m_nPlayerCount:int;
      
      public var m_arrPlayerGameResults:Array;
      
      public var m_iRemainEnergy:int;
      
      private var a_854:CGameResult;
      
      public function a_2694()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_byLoseTeamID","int8"],["m_byGameMode","int8"],["m_iMapID","int32"],["m_iRoundTime","int32"],["m_byRoundStep","int8"],["m_iBossID","int32"],["m_iCommonService","int32"],["m_nPlayerCount","int16"],["m_arrPlayerGameResults",["object","com.aurora.protocol.game.maogoutd.CGameResult","nosize"]]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_byLoseTeamID","int8"],["m_byGameMode","int8"],["m_iMapID","int32"],["m_iRoundTime","int32"],["m_byRoundStep","int8"],["m_iBossID","int32"],["m_iCommonService","int32"],["m_nPlayerCount","int16"],["m_arrPlayerGameResults",["object","com.aurora.protocol.game.maogoutd.CGameResult","nosize"]]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

