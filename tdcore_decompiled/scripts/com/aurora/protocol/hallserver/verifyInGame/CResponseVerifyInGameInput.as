package com.aurora.protocol.hallserver.verifyInGame
{
   import com.aurora.protocol.a_2664;
   import flash.utils.ByteArray;
   
   public class CResponseVerifyInGameInput
   {
      
      public var m_iUin:int;
      
      public var m_iOpt:int;
      
      public var m_iNum:int;
      
      public function CResponseVerifyInGameInput()
      {
         super();
      }
      
      public function decode(byteArr:ByteArray) : Boolean
      {
         this.m_iUin = a_2664.decode_int32(byteArr);
         this.m_iOpt = a_2664.decode_int32(byteArr);
         this.m_iNum = a_2664.decode_int32(byteArr);
         return true;
      }
   }
}

