package com.aurora.protocol.hallserver.compose
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class SCResponseSlottingItem implements CMessageBody
   {
      
      public var m_nResult:int;
      
      public var m_iSrcUin:int;
      
      public var m_iItemID:int;
      
      public var m_iItemSeq:int;
      
      public var m_nDelCount:int;
      
      public var m_astDelInfo:Array;
      
      public var m_nSlotCount:int;
      
      public var m_szReasonMessage:String;
      
      public function SCResponseSlottingItem()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var objDelInfo:DelItemInfo = null;
         this.m_nResult = a_2664.decode_int16(byte_array);
         this.m_iSrcUin = a_2664.decode_int32(byte_array);
         this.m_iItemID = a_2664.decode_int32(byte_array);
         this.m_iItemSeq = a_2664.decode_int32(byte_array);
         this.m_nDelCount = a_2664.decode_int16(byte_array);
         this.m_astDelInfo = [];
         for(var i:int = 0; i < this.m_nDelCount; i++)
         {
            objDelInfo = new DelItemInfo();
            objDelInfo.decode(byte_array,0);
            this.m_astDelInfo.push(objDelInfo);
         }
         this.m_nSlotCount = a_2664.decode_int16(byte_array);
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

