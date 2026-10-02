package com.aurora.protocol.hallserver.onepiece
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CRequestOnePiece implements CMessageBody
   {
      
      public var m_iUin:int;
      
      public var m_iDrawType:int;
      
      public var m_iBox:int;
      
      public var m_iFree:int;
      
      public function CRequestOnePiece()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iUin);
         a_2664.encode_int32(byte_array,this.m_iDrawType);
         a_2664.encode_int32(byte_array,this.m_iBox);
         a_2664.encode_int32(byte_array,this.m_iFree);
         return true;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         return false;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

