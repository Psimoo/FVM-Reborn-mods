package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2740 implements CMessageBody
   {
      
      public var m_nCount:int;
      
      public var m_aryMsg:Array;
      
      public function a_2740()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var i:int = 0;
         var m_nMessageSize:int = 0;
         var m_szSystemMessage:ByteArray = null;
         this.m_nCount = a_2664.decode_int16(byte_array);
         if(this.m_nCount > 0)
         {
            this.m_aryMsg = new Array(this.m_nCount);
            for(i = 0; i < this.m_nCount; i++)
            {
               m_nMessageSize = a_2664.decode_int16(byte_array);
               m_szSystemMessage = new ByteArray();
               a_2664.decode_memory(byte_array,m_szSystemMessage,m_nMessageSize);
               this.m_aryMsg[i] = {
                  "m_nMessageSize":m_nMessageSize,
                  "m_szSystemMessage":m_szSystemMessage
               };
            }
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

