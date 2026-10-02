package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import flash.utils.ByteArray;
   
   public class CRequestChangePetStatus
   {
      
      public var m_iUIN:int;
      
      public var m_iItemID:int;
      
      public var m_iItemSeq:int;
      
      public var m_iPetCurrentStatus:int;
      
      public function CRequestChangePetStatus()
      {
         super();
      }
      
      public function Encode(byteArr:ByteArray) : void
      {
         a_2664.encode_int32(byteArr,this.m_iUIN);
         a_2664.encode_int32(byteArr,this.m_iItemID);
         a_2664.encode_int32(byteArr,this.m_iItemSeq);
         a_2664.encode_int32(byteArr,this.m_iPetCurrentStatus);
      }
   }
}

