package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CGuideDataMessage implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUIN:int;
      
      public var m_nExtDataSize:int;
      
      public var m_szExtDataByteArray:ByteArray;
      
      public var m_szExtData:String;
      
      public function CGuideDataMessage()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iUIN);
         a_2664.encode_int16(byte_array,this.m_nExtDataSize);
         a_2664.encode_memory(byte_array,this.m_szExtDataByteArray,this.m_nExtDataSize);
         return true;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_iUIN = a_2664.decode_int32(byte_array);
         this.m_nExtDataSize = a_2664.decode_int16(byte_array);
         if(this.m_nExtDataSize > 0)
         {
            if(this.m_szExtDataByteArray == null)
            {
               this.m_szExtDataByteArray = new ByteArray();
            }
            a_2664.decode_memory(byte_array,this.m_szExtDataByteArray,this.m_nExtDataSize);
            this.m_szExtDataByteArray.position = 0;
            this.m_szExtData = this.m_szExtDataByteArray.readUTFBytes(this.m_nExtDataSize);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

