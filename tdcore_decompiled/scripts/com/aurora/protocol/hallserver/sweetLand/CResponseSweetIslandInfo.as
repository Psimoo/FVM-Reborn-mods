package com.aurora.protocol.hallserver.sweetLand
{
   import com.aurora.protocol.a_2664;
   import flash.utils.ByteArray;
   
   public class CResponseSweetIslandInfo
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_iOpenNumber:int;
      
      public var m_iOpenEndTime:int;
      
      public var m_iNowTime:int;
      
      public function CResponseSweetIslandInfo()
      {
         super();
      }
      
      public function decode(byteArr:ByteArray) : Boolean
      {
         this.m_nResultID = a_2664.decode_int16(byteArr);
         this.m_iUin = a_2664.decode_int32(byteArr);
         this.m_iOpenNumber = a_2664.decode_int32(byteArr);
         this.m_iOpenEndTime = a_2664.decode_int32(byteArr);
         this.m_iNowTime = a_2664.decode_int32(byteArr);
         return true;
      }
   }
}

