package com.aurora.protocol.hallserver.tarot
{
   import com.aurora.protocol.a_2664;
   import flash.utils.ByteArray;
   
   public class CResponseTarotInfo
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_iScore:int;
      
      public var m_iTotalPoint:int;
      
      public var m_iLastScoreUpdateTime:int;
      
      public var m_iAwardFlag:int;
      
      public var m_iLastFreeTime:int;
      
      public function CResponseTarotInfo()
      {
         super();
      }
      
      public function decode(byteArr:ByteArray) : Boolean
      {
         this.m_nResultID = a_2664.decode_int16(byteArr);
         this.m_iUin = a_2664.decode_int32(byteArr);
         this.m_iScore = a_2664.decode_int32(byteArr);
         this.m_iTotalPoint = a_2664.decode_int32(byteArr);
         this.m_iLastScoreUpdateTime = a_2664.decode_int32(byteArr);
         this.m_iAwardFlag = a_2664.decode_int32(byteArr);
         this.m_iLastFreeTime = a_2664.decode_int32(byteArr);
         return true;
      }
   }
}

