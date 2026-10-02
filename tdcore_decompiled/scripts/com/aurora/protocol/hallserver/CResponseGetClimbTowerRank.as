package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponseGetClimbTowerRank implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_iFlag:int;
      
      public var m_nRankCount:int;
      
      public var m_arrRankInfo:Array;
      
      public var m_szReasonMessage:String;
      
      public function CResponseGetClimbTowerRank()
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
         var len:int = 0;
         var iUin:int = 0;
         var iRank:int = 0;
         var nPosition:int = 0;
         var iBestScore:int = 0;
         var szRoleName:String = null;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         if(this.m_nResultID == 0)
         {
            this.m_iUin = a_2664.decode_int32(byte_array);
            this.m_iFlag = a_2664.decode_int32(byte_array);
            this.m_nRankCount = a_2664.decode_int16(byte_array);
            this.m_arrRankInfo = [];
            for(i = 0; i < this.m_nRankCount; i++)
            {
               obj = {};
               len = a_2664.decode_int16(byte_array);
               iUin = a_2664.decode_int32(byte_array);
               iRank = a_2664.decode_int32(byte_array);
               nPosition = a_2664.decode_int32(byte_array);
               iBestScore = a_2664.decode_int32(byte_array);
               szRoleName = a_2664.decode_string(byte_array,32);
               obj.m_iRoleUin = iUin;
               obj.m_iRank = iRank;
               obj.m_iPosition = nPosition;
               obj.m_iBestScore = iBestScore;
               obj.m_szRoleName = szRoleName;
               this.m_arrRankInfo.push(obj);
            }
         }
         else
         {
            this.m_szReasonMessage = a_2664.decode_string(byte_array,2048);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

