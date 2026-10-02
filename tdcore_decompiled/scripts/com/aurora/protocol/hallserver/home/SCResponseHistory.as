package com.aurora.protocol.hallserver.home
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class SCResponseHistory implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_nRecordCount:int;
      
      public var m_astRecord:Array;
      
      public var m_szReasonMessage:String;
      
      public function SCResponseHistory()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var i:int = 0;
         var obj:Object = null;
         var length:int = 0;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         if(0 == this.m_nResultID)
         {
            this.m_iUin = a_2664.decode_int32(byte_array);
            this.m_nRecordCount = a_2664.decode_int16(byte_array);
            this.m_astRecord = [];
            for(i = 0; i < this.m_nRecordCount; i++)
            {
               obj = {};
               length = a_2664.decode_int16(byte_array);
               obj.m_iOppositeUin = a_2664.decode_int32(byte_array);
               obj.m_szOppositeName = a_2664.decode_string(byte_array,32);
               obj.m_cRecordType = a_2664.decode_int8(byte_array);
               obj.m_cRecordStatus = a_2664.decode_int8(byte_array);
               obj.m_iRecordTime = a_2664.decode_int32(byte_array);
               obj.m_iStealItemID = a_2664.decode_int32(byte_array);
               obj.m_iCount = a_2664.decode_int32(byte_array);
               obj.m_iItemAttrValue = a_2664.decode_int32(byte_array);
               this.m_astRecord.push(obj);
            }
            return true;
         }
         this.m_szReasonMessage = a_2664.decode_string(byte_array,4096);
         return false;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

