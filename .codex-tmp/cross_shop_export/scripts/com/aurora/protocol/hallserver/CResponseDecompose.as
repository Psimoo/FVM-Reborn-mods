package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import flash.utils.ByteArray;
   
   public class CResponseDecompose
   {
      
      public var m_iUin:int;
      
      public var m_iCardID:int;
      
      public var m_iResult:int;
      
      public function CResponseDecompose()
      {
         super();
      }
      
      public function decode(byteArr:ByteArray) : Boolean
      {
         this.m_iUin = a_2664.decode_int32(byteArr);
         this.m_iCardID = a_2664.decode_int32(byteArr);
         this.m_iResult = a_2664.decode_int32(byteArr);
         return true;
      }
   }
}

