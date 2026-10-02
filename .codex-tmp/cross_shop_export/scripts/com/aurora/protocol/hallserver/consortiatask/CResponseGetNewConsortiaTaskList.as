package com.aurora.protocol.hallserver.consortiatask
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponseGetNewConsortiaTaskList implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_iType:int;
      
      public var m_iFlag:int;
      
      public var m_iTaskCount:int;
      
      public var m_stTask:Array;
      
      public function CResponseGetNewConsortiaTaskList()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var obj:Object = null;
         var m_iUniqueID:int = 0;
         var m_iConfigID:int = 0;
         var m_iType:int = 0;
         var m_iCompleteCount:int = 0;
         var m_iAwardID:int = 0;
         var m_iSchedule:int = 0;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_iType = a_2664.decode_int32(byte_array);
         this.m_iFlag = a_2664.decode_int32(byte_array);
         this.m_iTaskCount = a_2664.decode_int32(byte_array);
         this.m_stTask = [];
         for(var i:int = 0; i < this.m_iTaskCount; i++)
         {
            obj = {};
            m_iUniqueID = a_2664.decode_int32(byte_array);
            m_iConfigID = a_2664.decode_int32(byte_array);
            m_iType = a_2664.decode_int32(byte_array);
            m_iCompleteCount = a_2664.decode_int32(byte_array);
            m_iAwardID = a_2664.decode_int32(byte_array);
            m_iSchedule = a_2664.decode_int32(byte_array);
            obj.m_iUniqueID = m_iUniqueID;
            obj.m_iConfigID = m_iConfigID;
            obj.m_iType = m_iType;
            obj.m_iCompleteCount = m_iCompleteCount;
            obj.m_iAwardID = m_iAwardID;
            obj.m_iSchedule = m_iSchedule;
            this.m_stTask.push(obj);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

