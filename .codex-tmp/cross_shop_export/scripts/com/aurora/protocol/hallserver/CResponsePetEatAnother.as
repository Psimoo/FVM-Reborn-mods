package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import flash.utils.ByteArray;
   
   public class CResponsePetEatAnother
   {
      
      public var m_nResultID:int;
      
      public var m_iUIN:int;
      
      public var m_iItemID:int;
      
      public var m_iItemSeq:int;
      
      public var m_iPetExp:int;
      
      public var m_iDelItemID:int;
      
      public var m_iDelItemSeq:int;
      
      public function CResponsePetEatAnother()
      {
         super();
      }
      
      public function Decode(stBody:ByteArray) : void
      {
         this.m_nResultID = a_2664.decode_int16(stBody);
         this.m_iUIN = a_2664.decode_int32(stBody);
         this.m_iItemID = a_2664.decode_int32(stBody);
         this.m_iItemSeq = a_2664.decode_int32(stBody);
         this.m_iPetExp = a_2664.decode_int32(stBody);
         this.m_iDelItemID = a_2664.decode_int32(stBody);
         this.m_iDelItemSeq = a_2664.decode_int32(stBody);
      }
   }
}

