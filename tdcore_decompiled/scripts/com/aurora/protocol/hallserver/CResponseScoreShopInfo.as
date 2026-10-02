package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import flash.utils.ByteArray;
   
   public class CResponseScoreShopInfo
   {
      
      public var m_iUin:int;
      
      public var m_iResTime:int;
      
      public var m_iScoreNum:int;
      
      public var m_iMysteryGroup:int;
      
      public var m_iBlackGroup:int;
      
      public function CResponseScoreShopInfo()
      {
         super();
      }
      
      public function decode(byteArr:ByteArray) : Boolean
      {
         this.m_iUin = a_2664.decode_int32(byteArr);
         this.m_iScoreNum = a_2664.decode_int32(byteArr);
         this.m_iMysteryGroup = a_2664.decode_int16(byteArr);
         this.m_iBlackGroup = a_2664.decode_int16(byteArr);
         this.m_iResTime = a_2664.decode_int32(byteArr);
         return true;
      }
   }
}

