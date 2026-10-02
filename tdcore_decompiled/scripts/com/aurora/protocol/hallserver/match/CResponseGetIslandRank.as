package com.aurora.protocol.hallserver.match
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponseGetIslandRank implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_nRankCount:Array;
      
      public var m_arrRankInfo:Array;
      
      public var m_nPersonRankCount:int;
      
      public var m_arrPersonRankInfo:Array;
      
      public function CResponseGetIslandRank()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var stRankInfo:Object = null;
         var j:int = 0;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_nRankCount = new Array();
         this.m_arrRankInfo = new Array();
         this.m_arrPersonRankInfo = new Array();
         for(var i:int = 0; i < 4; i++)
         {
            this.m_nRankCount[i] = a_2664.decode_int32(byte_array);
         }
         var obj:Object = {};
         for(i = 0; i < 4; i++)
         {
            for(j = 0; j < this.m_nRankCount[i]; j++)
            {
               obj = {};
               obj.iConsortiaID = a_2664.decode_int32(byte_array);
               obj.iConsortiaName = a_2664.decode_string(byte_array,32);
               obj.iScore = a_2664.decode_int32(byte_array);
               obj.nRank = a_2664.decode_int32(byte_array);
               obj.iCheckIn = 0;
               obj.id = i;
               if(obj.nRank > 0)
               {
                  this.m_arrRankInfo.push(obj);
               }
            }
         }
         this.m_nPersonRankCount = a_2664.decode_int32(byte_array);
         for(i = 0; i < this.m_nPersonRankCount; i++)
         {
            obj = {};
            obj.m_iRoleUin = a_2664.decode_int32(byte_array);
            obj.m_iUserName = a_2664.decode_string(byte_array,32);
            obj.m_iMapID = a_2664.decode_int32(byte_array);
            obj.m_iConsortiaID = a_2664.decode_int32(byte_array);
            obj.m_nRank = a_2664.decode_int32(byte_array);
            obj.m_iMatchPoint = a_2664.decode_int32(byte_array);
            obj.m_iWin = a_2664.decode_int32(byte_array);
            obj.m_iLoss = a_2664.decode_int32(byte_array);
            obj.m_iFlee = a_2664.decode_int32(byte_array);
            this.m_arrPersonRankInfo.push(obj);
            for each(stRankInfo in this.m_arrRankInfo)
            {
               if(stRankInfo.iConsortiaID == obj.m_iConsortiaID && this.GetMapID(stRankInfo.id) == obj.m_iMapID)
               {
                  ++stRankInfo.iCheckIn;
               }
            }
         }
         return true;
      }
      
      private function GetMapID(id:int) : int
      {
         var iMapID:int = -1;
         switch(id)
         {
            case 0:
               iMapID = 1009;
               break;
            case 1:
               iMapID = 241;
               break;
            case 2:
               iMapID = 753;
               break;
            case 3:
               iMapID = 497;
         }
         return iMapID;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

