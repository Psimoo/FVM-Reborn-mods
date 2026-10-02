package com.aurora.protocol.hallserver.consortia
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2790 implements CMessageBody
   {
      
      public var m_iConsortiaID:int;
      
      public var m_nCmd:int;
      
      public var m_iSrcUIN:int;
      
      public var m_szNick:String;
      
      public var m_nLen:int;
      
      public var m_szContent:ByteArray;
      
      public function a_2790()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_iConsortiaID = a_2664.decode_int32(byte_array);
         this.m_nCmd = a_2664.decode_int16(byte_array);
         this.m_iSrcUIN = a_2664.decode_int32(byte_array);
         this.m_szNick = a_2664.decode_string(byte_array,64);
         this.m_nLen = a_2664.decode_int16(byte_array);
         this.m_szContent = new ByteArray();
         a_2664.decode_memory(byte_array,this.m_szContent,this.m_nLen);
         this.m_szContent.position = 0;
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

