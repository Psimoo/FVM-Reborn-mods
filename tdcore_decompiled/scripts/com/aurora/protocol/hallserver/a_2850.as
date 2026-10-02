package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2850 implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iID:int;
      
      public var m_iSeq:int;
      
      public var m_nType:int;
      
      public var m_iValue:int;
      
      public var m_szReasonMessage:String;
      
      public function a_2850()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_iID = a_2664.decode_int32(byte_array);
         this.m_iSeq = a_2664.decode_int32(byte_array);
         if(this.m_nResultID == 0)
         {
            this.m_nType = a_2664.decode_int16(byte_array);
            this.m_iValue = a_2664.decode_int32(byte_array);
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

