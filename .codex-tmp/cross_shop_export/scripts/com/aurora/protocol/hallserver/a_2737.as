package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import com.aurora.protocol.logicserver.CCardExtraAttr;
   import flash.utils.ByteArray;
   
   public class a_2737 implements CMessageBody
   {
      
      public var m_iCardID:int;
      
      public var m_iCardSeq:int;
      
      public var m_nCardCount:int;
      
      public var m_nCardUsedCount:int;
      
      public var m_cTimeFlag:int;
      
      public var m_iExpiredTime:int;
      
      public var m_cIsBind:int;
      
      public var m_cUpdateMode:int;
      
      public var m_iUsedTime:int;
      
      public var m_iDeltaTime:int;
      
      public var m_nCardExtraCount:int;
      
      public var arrCardExtraAttr:Array;
      
      public function a_2737()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var extra:CCardExtraAttr = null;
         var size:int = a_2664.decode_int16(byte_array);
         this.m_iCardID = a_2664.decode_int32(byte_array);
         this.m_iCardSeq = a_2664.decode_int32(byte_array);
         this.m_nCardCount = a_2664.decode_int16(byte_array);
         this.m_nCardUsedCount = a_2664.decode_int16(byte_array);
         this.m_cTimeFlag = a_2664.decode_int8(byte_array);
         this.m_iExpiredTime = a_2664.decode_int32(byte_array);
         this.m_cIsBind = a_2664.decode_int8(byte_array);
         this.m_cUpdateMode = a_2664.decode_int8(byte_array);
         this.m_iUsedTime = a_2664.decode_int32(byte_array);
         this.m_iDeltaTime = a_2664.decode_int32(byte_array);
         this.m_nCardExtraCount = a_2664.decode_int16(byte_array);
         this.arrCardExtraAttr = [];
         for(var index:int = 0; index < this.m_nCardExtraCount; index++)
         {
            extra = new CCardExtraAttr();
            extra.decode(byte_array,decode_length);
            this.arrCardExtraAttr.push(extra);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

