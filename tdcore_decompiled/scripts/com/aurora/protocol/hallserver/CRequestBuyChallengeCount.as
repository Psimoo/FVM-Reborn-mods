package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import flash.utils.ByteArray;
   
   public class CRequestBuyChallengeCount
   {
      
      public var m_iUin:int;
      
      public var m_iDeltaCoin:int;
      
      public var m_iPurchaseCount:int;
      
      public function CRequestBuyChallengeCount()
      {
         super();
      }
      
      public function Encode(byteArr:ByteArray) : void
      {
         a_2664.encode_int32(byteArr,this.m_iUin);
         a_2664.encode_int32(byteArr,this.m_iDeltaCoin);
         a_2664.encode_int32(byteArr,this.m_iPurchaseCount);
      }
   }
}

