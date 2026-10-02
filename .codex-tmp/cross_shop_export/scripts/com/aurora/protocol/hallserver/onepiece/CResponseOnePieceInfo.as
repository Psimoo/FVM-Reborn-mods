package com.aurora.protocol.hallserver.onepiece
{
   import com.aurora.protocol.a_2664;
   import flash.utils.ByteArray;
   
   public class CResponseOnePieceInfo
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_iType:int;
      
      public var m_iTotal:int;
      
      public var m_iLastFreeTime:int;
      
      public var m_iFlag:int;
      
      public function CResponseOnePieceInfo()
      {
         super();
      }
      
      public function decode(byteArr:ByteArray) : Boolean
      {
         this.m_nResultID = a_2664.decode_int16(byteArr);
         this.m_iUin = a_2664.decode_int32(byteArr);
         this.m_iType = a_2664.decode_int32(byteArr);
         this.m_iTotal = a_2664.decode_int32(byteArr);
         this.m_iLastFreeTime = a_2664.decode_int32(byteArr);
         this.m_iFlag = a_2664.decode_int32(byteArr);
         return true;
      }
   }
}

