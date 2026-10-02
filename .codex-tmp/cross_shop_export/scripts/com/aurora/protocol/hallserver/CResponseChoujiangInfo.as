package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import flash.utils.ByteArray;
   
   public class CResponseChoujiangInfo
   {
      
      public var result:int;
      
      public var m_iUin:int;
      
      public var pay_f:int;
      
      public var freeTime:int;
      
      public var pay_g:int;
      
      public var pay_d:int;
      
      public var acc_d:int;
      
      public function CResponseChoujiangInfo()
      {
         super();
      }
      
      public function decode(byteArr:ByteArray) : Boolean
      {
         this.m_iUin = a_2664.decode_int32(byteArr);
         this.result = a_2664.decode_int16(byteArr);
         this.pay_f = a_2664.decode_int32(byteArr);
         this.freeTime = a_2664.decode_int32(byteArr);
         this.pay_g = a_2664.decode_int32(byteArr);
         a_2664.decode_int32(byteArr);
         this.pay_d = a_2664.decode_int32(byteArr);
         a_2664.decode_int32(byteArr);
         this.acc_d = a_2664.decode_int32(byteArr);
         if(this.freeTime < 0)
         {
            this.freeTime = 0;
         }
         return true;
      }
   }
}

