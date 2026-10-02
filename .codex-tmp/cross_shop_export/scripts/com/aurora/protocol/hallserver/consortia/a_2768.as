package com.aurora.protocol.hallserver.consortia
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2768 implements CMessageBody
   {
      
      public var m_nAdjust:int;
      
      public var m_nCount:int;
      
      public var m_aryConsortia:Array;
      
      public var m_szConsortiaName:String;
      
      public function a_2768()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_uint16(byte_array,this.m_nAdjust);
         a_2664.encode_uint16(byte_array,this.m_nCount);
         for(var i:int = 0; i < this.m_nCount; i++)
         {
            a_2664.encode_int32(byte_array,this.m_aryConsortia[i]);
         }
         a_2664.encode_string(byte_array,this.m_szConsortiaName,128);
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

