package com.aurora.protocol.hallserver.compose
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CRequestEvolution implements CMessageBody
   {
      
      public var m_iUin:int;
      
      public var m_iCardID:int;
      
      public var m_iItemCount:int;
      
      public var m_arrItems:Array;
      
      public function CRequestEvolution()
      {
         super();
         this.m_arrItems = new Array();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iUin);
         a_2664.encode_int32(byte_array,this.m_iCardID);
         a_2664.encode_int32(byte_array,this.m_iItemCount);
         for(var i:int = 0; i < this.m_iItemCount; i++)
         {
            a_2664.encode_int32(byte_array,this.m_arrItems[i].m_iItemID);
            a_2664.encode_int32(byte_array,this.m_arrItems[i].m_iItemSeq);
         }
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

