package com.aurora.protocol.hallserver.consortia
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2796 implements CMessageBody
   {
      
      public var m_nResult:int;
      
      public var m_iConsortiaID:int;
      
      public var m_stConsortiaInfo:ConsortiaInfo;
      
      public var m_szReasonMessage:String;
      
      public function a_2796()
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
         var propertyArray:Array = [];
         if(this.m_nResult == 0)
         {
            this.m_iConsortiaID = a_2664.decode_int32(byte_array);
            this.m_stConsortiaInfo = new ConsortiaInfo();
            this.m_stConsortiaInfo.decode(byte_array,decode_length);
         }
         else
         {
            this.m_szReasonMessage = a_2664.decode_string(byte_array,4096);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

