package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import flash.utils.ByteArray;
   
   public class CResponseChangePetStatus
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_iItemID:int;
      
      public var m_iItemSeq:int;
      
      public var m_iPetCurrentStatus:int;
      
      public function CResponseChangePetStatus()
      {
         super();
      }
      
      public function Decode(byteArr:ByteArray) : void
      {
         this.m_nResultID = a_2664.decode_int16(byteArr);
         if(this.m_nResultID == 0)
         {
            this.m_iUin = a_2664.decode_int32(byteArr);
            this.m_iItemID = a_2664.decode_int32(byteArr);
            this.m_iItemSeq = a_2664.decode_int32(byteArr);
            this.m_iPetCurrentStatus = a_2664.decode_int32(byteArr);
         }
      }
   }
}

