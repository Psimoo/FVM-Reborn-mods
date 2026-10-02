package com.aurora.protocol.logicserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2911 implements CMessageBody
   {
      
      public var m_iUin:int;
      
      public var m_szPlayerName:String;
      
      public var m_nFlag:int;
      
      public var m_iIdentity:int;
      
      public var m_iPlayerID:int;
      
      public var m_iTableID:int;
      
      public var m_bySeat:int;
      
      public var m_byStatus:int;
      
      public var m_iExperiencePoint:int;
      
      public var m_iAchievement:int;
      
      public var m_iPoint:Number;
      
      public var m_iWinRound:int;
      
      public var m_iLoseRound:int;
      
      public var m_iDrawRound:int;
      
      public var m_iConsortiaID:int;
      
      public var m_aryServiceTime:int;
      
      public var m_iVipScore:int;
      
      public function a_2911()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_szPlayerName = a_2664.decode_string(byte_array,32);
         this.m_nFlag = a_2664.decode_int16(byte_array);
         this.m_iIdentity = a_2664.decode_int32(byte_array);
         this.m_iPlayerID = a_2664.decode_int32(byte_array);
         this.m_iTableID = a_2664.decode_int32(byte_array);
         this.m_bySeat = a_2664.decode_int8(byte_array);
         this.m_byStatus = a_2664.decode_int8(byte_array);
         this.m_iExperiencePoint = a_2664.decode_int32(byte_array);
         this.m_iAchievement = a_2664.decode_int32(byte_array);
         this.m_iPoint = a_2664.decode_uint64(byte_array);
         this.m_iWinRound = a_2664.decode_int32(byte_array);
         this.m_iLoseRound = a_2664.decode_int32(byte_array);
         this.m_iDrawRound = a_2664.decode_int32(byte_array);
         this.m_iConsortiaID = a_2664.decode_int32(byte_array);
         this.m_aryServiceTime = a_2664.decode_int32(byte_array);
         this.m_iVipScore = a_2664.decode_int32(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

