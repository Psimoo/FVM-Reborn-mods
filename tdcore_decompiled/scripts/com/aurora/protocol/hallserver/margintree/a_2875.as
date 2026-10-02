package com.aurora.protocol.hallserver.margintree
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2875 implements CMessageBody
   {
      
      public var m_nCount:int;
      
      public var m_aryUin:Array;
      
      public var m_cSex:int;
      
      public function a_2875()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int16(byte_array,this.m_nCount);
         for(var i:uint = 0; i < this.m_nCount; i++)
         {
            a_2664.encode_int32(byte_array,this.m_aryUin[i]);
         }
         a_2664.encode_int8(byte_array,this.m_cSex);
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

