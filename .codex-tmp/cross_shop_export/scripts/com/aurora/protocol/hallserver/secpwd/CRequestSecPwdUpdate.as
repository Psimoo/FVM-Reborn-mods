package com.aurora.protocol.hallserver.secpwd
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CRequestSecPwdUpdate implements CMessageBody
   {
      
      public var m_iUin:int;
      
      public var m_stOldSecPwd:String;
      
      public var m_stNewSecPwd:String;
      
      public function CRequestSecPwdUpdate()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iUin);
         a_2664.encode_string(byte_array,this.m_stOldSecPwd,32);
         a_2664.encode_string(byte_array,this.m_stNewSecPwd,32);
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

