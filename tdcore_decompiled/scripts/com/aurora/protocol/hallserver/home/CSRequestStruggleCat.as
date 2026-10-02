package com.aurora.protocol.hallserver.home
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CSRequestStruggleCat implements CMessageBody
   {
      
      public var m_iSrcUin:int;
      
      public var m_szSrcRoleName:String;
      
      public var m_iDstUin:int;
      
      public var m_szDstRoleName:String;
      
      public function CSRequestStruggleCat()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iSrcUin);
         a_2664.encode_string(byte_array,this.m_szSrcRoleName,32);
         a_2664.encode_int32(byte_array,this.m_iDstUin);
         a_2664.encode_string(byte_array,this.m_szDstRoleName,32);
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

