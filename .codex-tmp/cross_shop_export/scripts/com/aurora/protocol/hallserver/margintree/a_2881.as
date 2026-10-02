package com.aurora.protocol.hallserver.margintree
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2881 implements CMessageBody
   {
      
      public var m_nResult:int;
      
      public var m_nCount:int;
      
      public var m_aryInfo:Array;
      
      public var m_cSex:int;
      
      public var m_iMax:int;
      
      public var m_szReasonMessage:String;
      
      public function a_2881()
      {
         super();
         this.m_aryInfo = new Array();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var i:int = 0;
         var obj:Object = null;
         var len:int = 0;
         this.m_nResult = a_2664.decode_int16(byte_array);
         if(0 == this.m_nResult)
         {
            this.m_nCount = a_2664.decode_int16(byte_array);
            for(i = 0; i < this.m_nCount; i++)
            {
               obj = new Object();
               len = a_2664.decode_int16(byte_array);
               obj.m_iUIN = a_2664.decode_int32(byte_array);
               obj.m_czName = a_2664.decode_string(byte_array,32);
               obj.m_iFlag = a_2664.decode_int32(byte_array);
               obj.m_iLeastConsume = a_2664.decode_int32(byte_array);
               obj.m_iValidTimeType1 = a_2664.decode_int32(byte_array);
               obj.m_czComment = a_2664.decode_string(byte_array,302);
               obj.m_iValidTimeType2 = a_2664.decode_int32(byte_array);
               obj.m_iTotalConsume1 = a_2664.decode_int32(byte_array);
               obj.m_iTotalConsume2 = a_2664.decode_int32(byte_array);
               obj.m_iMonthConsume = a_2664.decode_int32(byte_array);
               obj.m_iMonthConsumeSrc = a_2664.decode_int32(byte_array);
               this.m_aryInfo[i] = obj;
            }
            this.m_cSex = a_2664.decode_int8(byte_array);
            this.m_iMax = a_2664.decode_int32(byte_array);
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

