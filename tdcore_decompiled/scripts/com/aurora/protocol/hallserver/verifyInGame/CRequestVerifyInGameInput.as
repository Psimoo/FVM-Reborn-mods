package com.aurora.protocol.hallserver.verifyInGame
{
   import com.aurora.protocol.a_2664;
   import flash.utils.ByteArray;
   
   public class CRequestVerifyInGameInput
   {
      
      public var m_iUin:int;
      
      public var m_iOpt:int;
      
      public var m_iNum:int;
      
      public function CRequestVerifyInGameInput()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iUin);
         a_2664.encode_int32(byte_array,this.m_iOpt);
         a_2664.encode_int32(byte_array,this.m_iNum);
         return true;
      }
   }
}

