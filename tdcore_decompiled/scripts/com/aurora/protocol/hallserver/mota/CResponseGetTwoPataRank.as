package com.aurora.protocol.hallserver.mota
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponseGetTwoPataRank implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_stPreWeekRank:Object;
      
      public var m_stThisWeekRank:Object;
      
      public var m_iCnt:int;
      
      public var m_iTotal:int;
      
      public var m_iFrom:int;
      
      public var m_astRank:Array;
      
      public function CResponseGetTwoPataRank()
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
         this.m_stPreWeekRank = {};
         this.m_stThisWeekRank = {};
         this.m_stPreWeekRank.m_iRank = a_2664.decode_int32(byte_array);
         this.m_stPreWeekRank.m_iUin = a_2664.decode_int32(byte_array);
         this.m_stPreWeekRank.m_szName = a_2664.decode_string(byte_array,32);
         this.m_stPreWeekRank.m_iLevel = a_2664.decode_int32(byte_array);
         this.m_stPreWeekRank.m_iScore = a_2664.decode_int32(byte_array);
         this.m_stPreWeekRank.m_iWeiWang = a_2664.decode_int32(byte_array);
         this.m_stPreWeekRank.m_iFlag = a_2664.decode_int32(byte_array);
         this.m_stThisWeekRank.m_iRank = a_2664.decode_int32(byte_array);
         this.m_stThisWeekRank.m_iUin = a_2664.decode_int32(byte_array);
         this.m_stThisWeekRank.m_szName = a_2664.decode_string(byte_array,32);
         this.m_stThisWeekRank.m_iLevel = a_2664.decode_int32(byte_array);
         this.m_stThisWeekRank.m_iScore = a_2664.decode_int32(byte_array);
         this.m_stThisWeekRank.m_iWeiWang = a_2664.decode_int32(byte_array);
         this.m_stThisWeekRank.m_iFlag = a_2664.decode_int32(byte_array);
         this.m_iCnt = a_2664.decode_int32(byte_array);
         this.m_astRank = [];
         for(var i:int = 0; i < this.m_iCnt; i++)
         {
            obj = {};
            obj.m_iRank = a_2664.decode_int32(byte_array);
            obj.m_iUin = a_2664.decode_int32(byte_array);
            obj.m_szName = a_2664.decode_string(byte_array,32);
            obj.m_iLevel = a_2664.decode_int32(byte_array);
            obj.m_iScore = a_2664.decode_int32(byte_array);
            obj.m_iWeiWang = a_2664.decode_int32(byte_array);
            obj.m_iFlag = a_2664.decode_int32(byte_array);
            this.m_astRank.push(obj);
         }
         this.m_iTotal = a_2664.decode_int32(byte_array);
         this.m_iFrom = a_2664.decode_int32(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

