package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponsePopularityInfo implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_iCurDayExp:int;
      
      public var m_iCurDayMaxExp:int;
      
      public var m_iCurYearExp:int;
      
      public var m_iAwardCount:int;
      
      public var m_stAwardList:Array;
      
      public function CResponsePopularityInfo()
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
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_iCurDayExp = a_2664.decode_int32(byte_array);
         this.m_iCurDayMaxExp = a_2664.decode_int32(byte_array);
         this.m_iCurYearExp = a_2664.decode_int32(byte_array);
         this.m_iAwardCount = a_2664.decode_int32(byte_array);
         this.m_stAwardList = new Array();
         for(var i:int = 0; i < this.m_iAwardCount; i++)
         {
            obj = new Object();
            obj.m_iLevel = a_2664.decode_int32(byte_array);
            obj.m_iFlag = a_2664.decode_int32(byte_array);
            this.m_stAwardList.push(obj);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

