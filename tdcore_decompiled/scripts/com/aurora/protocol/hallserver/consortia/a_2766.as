package com.aurora.protocol.hallserver.consortia
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2766 implements CMessageBody
   {
      
      public var m_szConsortiaName:String;
      
      public var m_szConsortiaDesc:String;
      
      public function a_2766()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_string(byte_array,this.m_szConsortiaName,128);
         a_2664.encode_string(byte_array,this.m_szConsortiaDesc,1024);
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

