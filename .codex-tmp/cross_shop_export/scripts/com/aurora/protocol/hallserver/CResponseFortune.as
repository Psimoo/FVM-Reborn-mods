package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import flash.utils.ByteArray;
   
   public class CResponseFortune
   {
      
      public var m_iUin:int;
      
      public var m_iFortune:int;
      
      public var m_iResult:int;
      
      public function CResponseFortune()
      {
         super();
      }
      
      public function decode(byteArr:ByteArray) : Boolean
      {
         this.m_iUin = a_2664.decode_int32(byteArr);
         this.m_iFortune = a_2664.decode_int32(byteArr);
         this.m_iResult = a_2664.decode_int32(byteArr);
         return true;
      }
   }
}

