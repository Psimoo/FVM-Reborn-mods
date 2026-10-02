package com.aurora.protocol.hallserver.consortia
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2775 implements CMessageBody
   {
      
      public var m_iConsortiaID:int;
      
      public var m_iProposerUIN:int;
      
      public var m_iRefuse:int;
      
      public function a_2775()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iConsortiaID);
         a_2664.encode_int32(byte_array,this.m_iProposerUIN);
         a_2664.encode_int16(byte_array,this.m_iRefuse);
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

