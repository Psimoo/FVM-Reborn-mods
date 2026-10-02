package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import flash.utils.ByteArray;
   
   public class CReponseGetPetAccount
   {
      
      public var m_nResultID:int;
      
      public var m_iUIN:int;
      
      public var m_iPetSlotCount:int;
      
      public var m_iFreeChallengeCount:int;
      
      public var m_iPurchaseCount:int;
      
      public var m_iChallengeCountAlready:int;
      
      public var m_iCurrentTall:int;
      
      public function CReponseGetPetAccount()
      {
         super();
      }
      
      public function Decode(byteArr:ByteArray) : void
      {
         this.m_nResultID = a_2664.decode_int16(byteArr);
         this.m_iUIN = a_2664.decode_int32(byteArr);
         this.m_iPetSlotCount = a_2664.decode_int32(byteArr);
         this.m_iFreeChallengeCount = a_2664.decode_int32(byteArr);
         this.m_iPurchaseCount = a_2664.decode_int32(byteArr);
         this.m_iChallengeCountAlready = a_2664.decode_int32(byteArr);
         this.m_iCurrentTall = a_2664.decode_int32(byteArr);
      }
   }
}

