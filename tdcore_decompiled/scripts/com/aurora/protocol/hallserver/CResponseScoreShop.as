package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import flash.utils.ByteArray;
   
   public class CResponseScoreShop
   {
      
      public var m_iUin:int;
      
      public var m_iItemID:int;
      
      public var m_iResult:int;
      
      public var m_iDeltaScore:int;
      
      public function CResponseScoreShop()
      {
         super();
      }
      
      public function decode(byteArr:ByteArray) : Boolean
      {
         this.m_iUin = a_2664.decode_int32(byteArr);
         this.m_iItemID = a_2664.decode_int32(byteArr);
         this.m_iResult = a_2664.decode_int16(byteArr);
         this.m_iDeltaScore = a_2664.decode_int32(byteArr);
         return true;
      }
   }
}

