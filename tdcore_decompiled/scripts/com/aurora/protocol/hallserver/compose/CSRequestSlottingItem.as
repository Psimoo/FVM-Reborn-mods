package com.aurora.protocol.hallserver.compose
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CSRequestSlottingItem implements CMessageBody
   {
      
      public var m_iSrcUin:int;
      
      public var m_iItemID:int;
      
      public var m_iItemSeq:int;
      
      public var m_nDelCount:int;
      
      public var m_astDelInfo:Array;
      
      public var m_nSlotCount:int;
      
      public function CSRequestSlottingItem()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var delInfo:DelItemInfo = null;
         var obj:Object = null;
         a_2664.encode_int32(byte_array,this.m_iSrcUin);
         a_2664.encode_int32(byte_array,this.m_iItemID);
         a_2664.encode_int32(byte_array,this.m_iItemSeq);
         a_2664.encode_int16(byte_array,this.m_nDelCount);
         for(var i:int = 0; i < this.m_nDelCount; i++)
         {
            delInfo = new DelItemInfo();
            obj = this.m_astDelInfo[i];
            delInfo.m_iDelID = obj.m_iDelID;
            delInfo.m_iDelSeq = obj.m_iDelSeq;
            delInfo.m_nDelCount = obj.m_nDelCount;
            delInfo.encode(byte_array,0);
         }
         a_2664.encode_int16(byte_array,this.m_nSlotCount);
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

