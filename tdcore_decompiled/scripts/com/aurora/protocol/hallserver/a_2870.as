package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2870 implements CMessageBody
   {
      
      public var m_nResult:int;
      
      public var m_iUin:int;
      
      public var m_cCardSlotType:int;
      
      public var m_cSlotPackPosi:int;
      
      public var m_iItemID:int;
      
      public var m_iItemSeq:int;
      
      public var m_nSlotAdd:int;
      
      public var m_szReasonMessage:String;
      
      public function a_2870()
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
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_cCardSlotType = a_2664.decode_int8(byte_array);
         this.m_cSlotPackPosi = a_2664.decode_int8(byte_array);
         this.m_iItemID = a_2664.decode_int32(byte_array);
         this.m_iItemSeq = a_2664.decode_int32(byte_array);
         this.m_nSlotAdd = a_2664.decode_int16(byte_array);
         if(this.m_nResult != 0)
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

