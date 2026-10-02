package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import flash.utils.ByteArray;
   
   public class CResponseExchangeInfo
   {
      
      public var m_iUin:int;
      
      public var m_iResult:int;
      
      public var m_iLuckBuff:int;
      
      public var m_iFragments:int;
      
      public function CResponseExchangeInfo()
      {
         super();
      }
      
      public function decode(byteArr:ByteArray) : Boolean
      {
         this.m_iUin = a_2664.decode_int32(byteArr);
         this.m_iResult = a_2664.decode_int16(byteArr);
         this.m_iLuckBuff = a_2664.decode_int32(byteArr);
         this.m_iFragments = a_2664.decode_int32(byteArr);
         return true;
      }
   }
}

