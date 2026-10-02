package com.aurora.protocol.hallserver.recipes
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class SCResponseRecipesActive implements CMessageBody
   {
      
      public var m_nResult:int;
      
      public var m_iUIN:int;
      
      public var m_iCookeryID:int;
      
      public var m_iStatus:int;
      
      public var m_strMessage:String;
      
      public function SCResponseRecipesActive()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_nResult = a_2664.decode_int16(byte_array);
         if(this.m_nResult != 0)
         {
            this.m_strMessage = a_2664.decode_string(byte_array,1024);
            return false;
         }
         this.m_iUIN = a_2664.decode_int32(byte_array);
         this.m_iCookeryID = a_2664.decode_int32(byte_array);
         this.m_iStatus = a_2664.decode_int32(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

