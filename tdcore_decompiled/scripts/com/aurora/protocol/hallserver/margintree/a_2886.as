package com.aurora.protocol.hallserver.margintree
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2886 implements CMessageBody
   {
      
      public var m_nResult:int;
      
      public var m_iUIN:int;
      
      public var m_iFlag:int;
      
      public var m_szReasonMessage:String;
      
      public function a_2886()
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
         if(0 == this.m_nResult)
         {
            this.m_iUIN = a_2664.decode_int32(byte_array);
            this.m_iFlag = a_2664.decode_int32(byte_array);
         }
         else
         {
            this.m_szReasonMessage = a_2664.decode_string(byte_array,4096);
            trace(this.m_szReasonMessage);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

