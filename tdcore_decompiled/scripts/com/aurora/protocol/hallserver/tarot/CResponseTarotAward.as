package com.aurora.protocol.hallserver.tarot
{
   import com.aurora.protocol.a_2664;
   import flash.utils.ByteArray;
   
   public class CResponseTarotAward
   {
      
      public var m_iUin:int;
      
      public var m_nResultID:int;
      
      public function CResponseTarotAward()
      {
         super();
      }
      
      public function decode(byteArr:ByteArray) : Boolean
      {
         this.m_iUin = a_2664.decode_int32(byteArr);
         this.m_nResultID = a_2664.decode_int16(byteArr);
         return true;
      }
   }
}

