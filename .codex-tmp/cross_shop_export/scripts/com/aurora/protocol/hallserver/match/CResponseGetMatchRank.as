package com.aurora.protocol.hallserver.match
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponseGetMatchRank implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_iType:int;
      
      public var m_nRankCount:int;
      
      public var m_arrRankInfo:Array;
      
      public function CResponseGetMatchRank()
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
         var iUin:int = 0;
         var iUserName:String = null;
         var iUserMatchLevel:int = 0;
         var iMatchPoint:int = 0;
         var nRank:int = 0;
         var iWin:int = 0;
         var iLoss:int = 0;
         var iFlee:int = 0;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_iType = a_2664.decode_int32(byte_array);
         this.m_nRankCount = a_2664.decode_int32(byte_array);
         this.m_arrRankInfo = [];
         for(var i:int = 0; i < this.m_nRankCount; i++)
         {
            obj = {};
            iUin = a_2664.decode_int32(byte_array);
            iUserName = a_2664.decode_string(byte_array,32);
            iUserMatchLevel = a_2664.decode_int32(byte_array);
            iMatchPoint = a_2664.decode_int32(byte_array);
            nRank = a_2664.decode_int32(byte_array);
            iWin = a_2664.decode_int32(byte_array);
            iLoss = a_2664.decode_int32(byte_array);
            iFlee = a_2664.decode_int32(byte_array);
            obj.m_iRoleUin = iUin;
            obj.m_iUserName = iUserName;
            obj.m_iUserMatchLevel = iUserMatchLevel;
            obj.m_iMatchPoint = iMatchPoint;
            obj.m_nRank = nRank;
            obj.m_iWin = iWin;
            obj.m_iLoss = iLoss;
            obj.m_iFlee = iFlee;
            this.m_arrRankInfo.push(obj);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

