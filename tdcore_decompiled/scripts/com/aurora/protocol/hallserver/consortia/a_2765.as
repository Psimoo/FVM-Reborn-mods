package com.aurora.protocol.hallserver.consortia
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2765 implements CMessageBody
   {
      
      public var m_iConsortiaID:int;
      
      public var m_iMoney:int;
      
      public var m_iCoin:int;
      
      public function a_2765()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iConsortiaID);
         a_2664.encode_int32(byte_array,this.m_iMoney);
         a_2664.encode_int32(byte_array,this.m_iCoin);
         return true;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         return false;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

