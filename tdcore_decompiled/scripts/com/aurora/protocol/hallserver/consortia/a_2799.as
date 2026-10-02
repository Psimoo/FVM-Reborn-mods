package com.aurora.protocol.hallserver.consortia
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2799 implements CMessageBody
   {
      
      public var m_nResult:int;
      
      public var m_iStart:int;
      
      public var m_iEnd:int;
      
      public var m_iMaxConsortiaID:int;
      
      public var m_iValidConsortiaCount:int;
      
      public var m_nCount:int;
      
      public var m_aryIDS:Array;
      
      public var m_szReasonMessage:String;
      
      public function a_2799()
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
         this.m_nResult = a_2664.decode_int16(byte_array);
         this.m_iStart = a_2664.decode_int32(byte_array);
         this.m_iEnd = a_2664.decode_int32(byte_array);
         if(this.m_nResult == 0)
         {
            this.m_iMaxConsortiaID = a_2664.decode_int32(byte_array);
            this.m_iValidConsortiaCount = a_2664.decode_int32(byte_array);
            this.m_nCount = a_2664.decode_int16(byte_array);
            this.m_aryIDS = new Array(this.m_nCount);
            for(i = 0; i < this.m_nCount; i++)
            {
               this.m_aryIDS[i] = a_2664.decode_int32(byte_array);
            }
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

