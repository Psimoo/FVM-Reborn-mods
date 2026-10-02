package com.aurora.protocol.logicserver
{
   import a_4717.EnmAntiFlag;
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import com.aurora.protocol.game.CPlayerDetail;
   import com.aurora.protocol.game.CPlayerGameConfig;
   import flash.utils.ByteArray;
   
   public class a_2938 implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_byACT:int;
      
      public var m_iRoomID:int;
      
      public var m_iHeadTableID:int;
      
      public var m_iTailTableID:int;
      
      public var m_stPlayerDetail:CPlayerDetail;
      
      public var m_stPlayerGameConfig:CPlayerGameConfig;
      
      public var m_iFlag:int;
      
      public var m_szKeyInfoHashcode:ByteArray;
      
      public var m_szIdentInfoHashcode:ByteArray;
      
      public var m_szReasonMsg:String;
      
      public function a_2938()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return true;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_byACT = a_2664.decode_int8(byte_array);
         this.m_iRoomID = a_2664.decode_int32(byte_array);
         if(this.m_nResultID == 0)
         {
            this.m_iHeadTableID = a_2664.decode_int32(byte_array);
            this.m_iTailTableID = a_2664.decode_int32(byte_array);
            this.m_stPlayerDetail = new CPlayerDetail();
            this.m_stPlayerDetail.decode(byte_array,decode_length);
            this.m_stPlayerGameConfig = new CPlayerGameConfig();
            this.m_stPlayerGameConfig.decode(byte_array,decode_length);
            this.m_iFlag = a_2664.decode_int32(byte_array);
            if(this.m_iFlag & EnmAntiFlag.enm_antibot_room)
            {
               trace("CResponseEnterRoom:m_szKeyInfoHashcode.memory");
            }
         }
         else
         {
            this.m_szReasonMsg = a_2664.decode_string(byte_array,2048);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

