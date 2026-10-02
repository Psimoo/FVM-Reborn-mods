package com.aurora.protocol.hallserver.birthdayActivity
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponseGetSpecialActivityInfo implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_cCheckInCount:int;
      
      public var m_cHasCheckIn:int;
      
      public var m_iTaskCount:int;
      
      public var m_stTask:Vector.<SimpleTask>;
      
      public var m_nCakeTicket:int;
      
      public var m_cCakeFlag:int;
      
      public var m_iAwardCount:int;
      
      public var m_stAward:Array;
      
      public var m_cMailFlag:int;
      
      public var m_cTaskAwardFlag:int;
      
      public var m_iAccCharge:int;
      
      public function CResponseGetSpecialActivityInfo()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return true;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var i:int = 0;
         var task:SimpleTask = null;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_cCheckInCount = a_2664.decode_int8(byte_array);
         this.m_cHasCheckIn = a_2664.decode_int8(byte_array);
         this.m_iTaskCount = a_2664.decode_uint32(byte_array);
         this.m_stTask = new Vector.<SimpleTask>();
         for(i = 0; i < this.m_iTaskCount; i++)
         {
            task = new SimpleTask();
            task.decode(byte_array,0);
            this.m_stTask.push(task);
         }
         this.m_nCakeTicket = a_2664.decode_int16(byte_array);
         this.m_cCakeFlag = a_2664.decode_int8(byte_array);
         this.m_iAwardCount = a_2664.decode_uint32(byte_array);
         this.m_stAward = new Array();
         for(i = 0; i < this.m_iAwardCount; i++)
         {
            this.m_stAward.push(a_2664.decode_int16(byte_array));
         }
         this.m_cMailFlag = a_2664.decode_int8(byte_array);
         this.m_cTaskAwardFlag = a_2664.decode_int8(byte_array);
         this.m_iAccCharge = a_2664.decode_int32(byte_array);
         return false;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

