package com.aurora.protocol.hallserver.auction
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponseGetTradeItemList implements CMessageBody
   {
      
      public var m_iUin:int;
      
      public var m_iGroupID:int;
      
      public var m_iResultID:int;
      
      public var m_iTotalCount:int;
      
      public var m_iItemCount:int;
      
      public var m_vCTradeItem:Vector.<CTradeItem>;
      
      public function CResponseGetTradeItemList()
      {
         super();
         this.m_vCTradeItem = new Vector.<CTradeItem>();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var stCTradeItem:CTradeItem = null;
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_iGroupID = a_2664.decode_int32(byte_array);
         this.m_iResultID = a_2664.decode_int32(byte_array);
         this.m_iTotalCount = a_2664.decode_int32(byte_array);
         this.m_iItemCount = a_2664.decode_int32(byte_array);
         this.m_vCTradeItem.length = 0;
         for(var i:int = 0; i < this.m_iItemCount; i++)
         {
            stCTradeItem = new CTradeItem();
            stCTradeItem.decode(byte_array,0);
            this.m_vCTradeItem.push(stCTradeItem);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

