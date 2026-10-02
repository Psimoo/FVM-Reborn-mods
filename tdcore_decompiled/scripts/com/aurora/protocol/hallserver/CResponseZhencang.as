package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import flash.utils.ByteArray;
   
   public class CResponseZhencang
   {
      
      public var m_iUin:int;
      
      public var m_iResult:int;
      
      public function CResponseZhencang()
      {
         super();
      }
      
      public function decode(byteArr:ByteArray) : Boolean
      {
         this.m_iUin = a_2664.decode_int32(byteArr);
         this.m_iResult = a_2664.decode_int16(byteArr);
         return true;
      }
   }
}

