package com.aurora.protocol.hallserver.newmargintree
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import com.aurora.ui.maogoutd.newmargintree.PlayerCharmInfo;
   import flash.utils.ByteArray;
   
   public class CCSResponseGetCharmRank implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_iType:int;
      
      public var m_iStartIndex:int;
      
      public var m_iTotalCount:int;
      
      public var m_iCount:int;
      
      public var m_vCharmInfoList:Vector.<PlayerCharmInfo>;
      
      public var m_iCharmLastWeek:int;
      
      public var m_iRankLastWeek:int;
      
      public var m_iCharmCoinAward:int;
      
      public var m_iAwardFlag:int;
      
      public function CCSResponseGetCharmRank()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var stPlayerCharmInfo:PlayerCharmInfo = null;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_iType = a_2664.decode_int8(byte_array);
         this.m_iStartIndex = a_2664.decode_int16(byte_array);
         this.m_iTotalCount = a_2664.decode_int16(byte_array);
         this.m_iCount = a_2664.decode_int16(byte_array);
         if(!this.m_vCharmInfoList)
         {
            this.m_vCharmInfoList = new Vector.<PlayerCharmInfo>();
         }
         this.m_vCharmInfoList.length = 0;
         for(var i:int = 0; i < this.m_iCount; i++)
         {
            stPlayerCharmInfo = new PlayerCharmInfo();
            stPlayerCharmInfo.decode(byte_array,0);
            this.m_vCharmInfoList.push(stPlayerCharmInfo);
         }
         this.m_iCharmLastWeek = a_2664.decode_int32(byte_array);
         this.m_iRankLastWeek = a_2664.decode_int32(byte_array);
         this.m_iCharmCoinAward = a_2664.decode_int32(byte_array);
         this.m_iAwardFlag = a_2664.decode_int32(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

