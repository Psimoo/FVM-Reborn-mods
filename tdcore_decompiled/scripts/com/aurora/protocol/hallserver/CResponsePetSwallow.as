package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import flash.utils.ByteArray;
   
   public class CResponsePetSwallow
   {
      
      public var m_nResultID:int;
      
      public var iUin:int;
      
      public var iItemID:int;
      
      public var iItemSeq:int;
      
      public var m_iPetExp:int;
      
      public function CResponsePetSwallow()
      {
         super();
      }
      
      public function decode(byteArr:ByteArray) : void
      {
         this.m_nResultID = a_2664.decode_int16(byteArr);
         this.iUin = a_2664.decode_int32(byteArr);
         this.iItemID = a_2664.decode_int32(byteArr);
         this.iItemSeq = a_2664.decode_int32(byteArr);
         this.m_iPetExp = a_2664.decode_int32(byteArr);
      }
   }
}

