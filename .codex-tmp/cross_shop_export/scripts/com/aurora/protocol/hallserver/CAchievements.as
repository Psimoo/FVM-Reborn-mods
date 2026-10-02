package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CAchievements implements CMessageBody
   {
      
      public var m_iPartnerUin:int;
      
      public var m_nMapID:int;
      
      public var m_nGameType:int;
      
      public var m_cBestGrade:int;
      
      public var m_iBestScore:int;
      
      public var m_iBestScoreUsedTime:int;
      
      public var m_iBestScoreProduction:int;
      
      public var m_iBestScoreDestroyFromMouse:int;
      
      public var m_iBestScoreDestroyFromOpponent:int;
      
      public var m_iBestScoreDestroyToOpponent:int;
      
      public var m_iBestTime:int;
      
      public var m_cBestTimeGrade:int;
      
      public var m_iBestTimeScore:int;
      
      public var m_iBestTimeProduction:int;
      
      public var m_iBestTimeDestroyFromMouse:int;
      
      public var m_iBestTimeDestroyFromOpponent:int;
      
      public var m_iBestTimeDestroyToOpponent:int;
      
      public function CAchievements()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_iPartnerUin = a_2664.decode_int32(byte_array);
         this.m_nMapID = a_2664.decode_int32(byte_array);
         this.m_nGameType = a_2664.decode_int16(byte_array);
         this.m_cBestGrade = a_2664.decode_int8(byte_array);
         this.m_iBestScore = a_2664.decode_int32(byte_array);
         this.m_iBestScoreUsedTime = a_2664.decode_int32(byte_array);
         this.m_iBestScoreProduction = a_2664.decode_int32(byte_array);
         this.m_iBestScoreDestroyFromMouse = a_2664.decode_int32(byte_array);
         this.m_iBestScoreDestroyFromOpponent = a_2664.decode_int32(byte_array);
         this.m_iBestScoreDestroyToOpponent = a_2664.decode_int32(byte_array);
         this.m_iBestTime = a_2664.decode_int32(byte_array);
         this.m_cBestTimeGrade = a_2664.decode_int8(byte_array);
         this.m_iBestTimeScore = a_2664.decode_int32(byte_array);
         this.m_iBestTimeProduction = a_2664.decode_int32(byte_array);
         this.m_iBestTimeDestroyFromMouse = a_2664.decode_int32(byte_array);
         this.m_iBestTimeDestroyFromOpponent = a_2664.decode_int32(byte_array);
         this.m_iBestTimeDestroyToOpponent = a_2664.decode_int32(byte_array);
         a_2664.decode_int32(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

