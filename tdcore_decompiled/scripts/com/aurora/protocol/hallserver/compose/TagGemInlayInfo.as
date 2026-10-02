package com.aurora.protocol.hallserver.compose
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class TagGemInlayInfo implements CMessageBody
   {
      
      public var m_iGemID:int;
      
      public var m_iGemSeq:int;
      
      public var m_iAttrLevel:int;
      
      public var m_iPosition:int;
      
      public var m_cAttrType:int;
      
      public function TagGemInlayInfo()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var end_position:int = 0;
         var body_size:int = 0;
         var start_position:int = int(byte_array.position);
         a_2664.encode_int16(byte_array,body_size);
         a_2664.encode_int32(byte_array,this.m_iGemID);
         a_2664.encode_int32(byte_array,this.m_iGemSeq);
         a_2664.encode_int32(byte_array,this.m_iAttrLevel);
         a_2664.encode_int32(byte_array,this.m_iPosition);
         a_2664.encode_int8(byte_array,this.m_cAttrType);
         end_position = int(byte_array.position);
         body_size = end_position - start_position - 2;
         byte_array.position = start_position;
         a_2664.encode_int16(byte_array,body_size);
         byte_array.position = end_position;
         return true;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var body_size:int = a_2664.decode_int16(byte_array);
         this.m_iGemID = a_2664.decode_int32(byte_array);
         this.m_iGemSeq = a_2664.decode_int32(byte_array);
         this.m_iAttrLevel = a_2664.decode_int32(byte_array);
         this.m_iPosition = a_2664.decode_int32(byte_array);
         this.m_cAttrType = a_2664.decode_int8(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

