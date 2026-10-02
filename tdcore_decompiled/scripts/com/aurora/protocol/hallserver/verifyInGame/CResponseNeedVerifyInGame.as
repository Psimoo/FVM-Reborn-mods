package com.aurora.protocol.hallserver.verifyInGame
{
   import a_4723.a_1767;
   import com.aurora.protocol.a_2664;
   import flash.utils.ByteArray;
   
   public class CResponseNeedVerifyInGame
   {
      
      public var m_iTime:int;
      
      public var m_iUin:int;
      
      public var m_iType:int;
      
      public var m_iNum:int;
      
      public var m_iTimeStamp:Number;
      
      public function CResponseNeedVerifyInGame()
      {
         super();
      }
      
      public function decode(byteArr:ByteArray) : Boolean
      {
         this.m_iTime = a_2664.decode_int16(byteArr);
         this.m_iUin = a_2664.decode_int32(byteArr);
         this.m_iType = a_2664.decode_int16(byteArr);
         this.m_iNum = a_2664.decode_int16(byteArr);
         this.m_iTimeStamp = a_1767.getInstance().TimeSeconds + this.m_iTime;
         return true;
      }
   }
}

