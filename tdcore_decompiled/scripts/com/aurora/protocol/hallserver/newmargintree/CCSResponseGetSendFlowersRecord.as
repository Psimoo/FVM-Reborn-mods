package com.aurora.protocol.hallserver.newmargintree
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CCSResponseGetSendFlowersRecord implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_iRecordCount:int;
      
      public var m_vSendFlowerRecord:Vector.<SendFlowerRecord>;
      
      public function CCSResponseGetSendFlowersRecord()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var stSendFlowerRecord:SendFlowerRecord = null;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_iRecordCount = a_2664.decode_int16(byte_array);
         if(!this.m_vSendFlowerRecord)
         {
            this.m_vSendFlowerRecord = new Vector.<SendFlowerRecord>();
         }
         this.m_vSendFlowerRecord.length = 0;
         for(var i:int = 0; i < this.m_iRecordCount; i++)
         {
            stSendFlowerRecord = new SendFlowerRecord();
            stSendFlowerRecord.decode(byte_array,0);
            this.m_vSendFlowerRecord.push(stSendFlowerRecord);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

