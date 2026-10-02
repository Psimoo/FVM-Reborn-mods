package com.aurora.protocol.hallserver.changename
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2747 implements CMessageBody
   {
      
      public var m_iUin:int;
      
      public var m_iRoleUin:int;
      
      public var m_szOldRoleName:String;
      
      public var m_szNewRoleName:String;
      
      public function a_2747()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iUin);
         a_2664.encode_int32(byte_array,this.m_iRoleUin);
         a_2664.encode_string(byte_array,this.m_szOldRoleName,32);
         a_2664.encode_string(byte_array,this.m_szNewRoleName,32);
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

