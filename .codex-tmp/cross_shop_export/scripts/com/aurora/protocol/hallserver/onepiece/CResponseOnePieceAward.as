package com.aurora.protocol.hallserver.onepiece
{
   import com.aurora.protocol.a_2664;
   import flash.utils.ByteArray;
   
   public class CResponseOnePieceAward
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_iType:int;
      
      public var m_iID:int;
      
      public function CResponseOnePieceAward()
      {
         super();
      }
      
      public function decode(byteArr:ByteArray) : Boolean
      {
         this.m_nResultID = a_2664.decode_int16(byteArr);
         this.m_iUin = a_2664.decode_int32(byteArr);
         this.m_iType = a_2664.decode_int32(byteArr);
         this.m_iID = a_2664.decode_int32(byteArr);
         return true;
      }
   }
}

