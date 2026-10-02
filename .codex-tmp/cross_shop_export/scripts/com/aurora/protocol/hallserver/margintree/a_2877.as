package com.aurora.protocol.hallserver.margintree
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2877 implements CMessageBody
   {
      
      public var m_iUIN:int;
      
      public var m_iFlag:int;
      
      public var m_czComment:String;
      
      public function a_2877()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iUIN);
         a_2664.encode_int32(byte_array,this.m_iFlag);
         a_2664.encode_string(byte_array,this.m_czComment,302);
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

