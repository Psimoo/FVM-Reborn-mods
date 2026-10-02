package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2872 implements CMessageBody
   {
      
      public var m_iGameVipExpireTime:int;
      
      public var m_iGameVIPScore:int;
      
      public var m_iGameVIPLevel:int;
      
      public var m_iNextUpdateVIPLevelTime:int;
      
      public var m_szVIPTips:String;
      
      public var m_iGameVIPType:int;
      
      public function a_2872()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_iGameVIPScore = a_2664.decode_int32(byte_array);
         return true;
      }
      
      public function getVipLevel() : Number
      {
         var level:Number = 0;
         if(this.m_iGameVIPScore >= 20000000)
         {
            level = 16;
         }
         else if(this.m_iGameVIPScore >= 14000000)
         {
            level = 15 + (this.m_iGameVIPScore - 14000000) / 6000000;
         }
         else if(this.m_iGameVIPScore >= 9500000)
         {
            level = 14 + (this.m_iGameVIPScore - 9500000) / 4500000;
         }
         else if(this.m_iGameVIPScore >= 6000000)
         {
            level = 13 + (this.m_iGameVIPScore - 6000000) / 3500000;
         }
         else if(this.m_iGameVIPScore >= 3500000)
         {
            level = 12 + (this.m_iGameVIPScore - 3500000) / 2500000;
         }
         else if(this.m_iGameVIPScore >= 2000000)
         {
            level = 11 + (this.m_iGameVIPScore - 2000000) / 1500000;
         }
         else if(this.m_iGameVIPScore >= 1000000)
         {
            level = 10 + (this.m_iGameVIPScore - 1000000) / 1000000;
         }
         else if(this.m_iGameVIPScore >= 500000)
         {
            level = 9 + (this.m_iGameVIPScore - 500000) / 500000;
         }
         else if(this.m_iGameVIPScore >= 200000)
         {
            level = 8 + (this.m_iGameVIPScore - 200000) / 300000;
         }
         else if(this.m_iGameVIPScore >= 100000)
         {
            level = 7 + (this.m_iGameVIPScore - 100000) / 100000;
         }
         else if(this.m_iGameVIPScore >= 50000)
         {
            level = 6 + (this.m_iGameVIPScore - 50000) / 50000;
         }
         else if(this.m_iGameVIPScore >= 20000)
         {
            level = 5 + (this.m_iGameVIPScore - 20000) / 30000;
         }
         else if(this.m_iGameVIPScore >= 10000)
         {
            level = 4 + (this.m_iGameVIPScore - 10000) / 10000;
         }
         else if(this.m_iGameVIPScore >= 5000)
         {
            level = 3 + (this.m_iGameVIPScore - 5000) / 5000;
         }
         else if(this.m_iGameVIPScore >= 2000)
         {
            level = 2 + (this.m_iGameVIPScore - 2000) / 3000;
         }
         else if(this.m_iGameVIPScore >= 500)
         {
            level = 1 + (this.m_iGameVIPScore - 500) / 1500;
         }
         else
         {
            level = this.m_iGameVIPScore / 500;
         }
         return level;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

