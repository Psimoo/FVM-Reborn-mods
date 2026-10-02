package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import flash.utils.ByteArray;
   
   public class CRequestPetEatAnother
   {
      
      public var m_iUIN:int;
      
      public var m_iItemID1:int;
      
      public var m_iItemSeq1:int;
      
      public var m_iItemID2:int;
      
      public var m_iItemSeq2:int;
      
      public function CRequestPetEatAnother()
      {
         super();
      }
      
      public function Encode(stBody:ByteArray) : void
      {
         a_2664.encode_int32(stBody,this.m_iUIN);
         a_2664.encode_int32(stBody,this.m_iItemID1);
         a_2664.encode_int32(stBody,this.m_iItemSeq1);
         a_2664.encode_int32(stBody,this.m_iItemID2);
         a_2664.encode_int32(stBody,this.m_iItemSeq2);
      }
   }
}

