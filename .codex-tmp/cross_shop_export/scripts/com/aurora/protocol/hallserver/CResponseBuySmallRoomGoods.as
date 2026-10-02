package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponseBuySmallRoomGoods implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_Item:CSmallRoomItemVO;
      
      public var m_szReasonMessage:String;
      
      public function CResponseBuySmallRoomGoods()
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
         this.m_iUin = a_2664.decode_int32(byte_array);
         if(this.m_nResultID == 0)
         {
            this.m_Item = new CSmallRoomItemVO();
            this.m_Item.decode(byte_array,decode_length);
         }
         else
         {
            this.m_szReasonMessage = a_2664.decode_string(byte_array,2048);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

