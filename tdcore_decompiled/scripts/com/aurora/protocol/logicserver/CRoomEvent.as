package com.aurora.protocol.logicserver
{
   import a_4716.EnmRoomEventID;
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import com.aurora.protocol.game.CPlayerDetail;
   import flash.utils.ByteArray;
   
   public class CRoomEvent implements CMessageBody
   {
      
      public var m_iSequence:int;
      
      public var m_byEventID:int;
      
      public var m_nEventLen:int;
      
      public var m_stEventObject:Object;
      
      public var m_iPlayerID:int;
      
      public function CRoomEvent()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var playerDetail:CPlayerDetail = null;
         var setTableInfo:CSetTableInfo = null;
         var playerStandUp:CPlayerStandUp = null;
         var playerSitStatus:CPlayerSitStatus = null;
         var playerSitDown:CPlayerSitDown = null;
         var playerBeCkicked:CPlayerBeKicked = null;
         var tableStatus:CTableStatus = null;
         var playerID:CPlayerID = null;
         var setSeatInfo:CSetSeatInfo = null;
         this.m_iSequence = a_2664.decode_int32(byte_array);
         this.m_byEventID = a_2664.decode_int8(byte_array);
         this.m_nEventLen = a_2664.decode_int16(byte_array);
         switch(this.m_byEventID)
         {
            case EnmRoomEventID.room_event_enter:
            case EnmRoomEventID.room_event_attributechanged:
            case EnmRoomEventID.room_event_comeback:
               playerDetail = new CPlayerDetail();
               playerDetail.decode(byte_array,0);
               this.m_stEventObject = playerDetail;
               break;
            case EnmRoomEventID.room_event_settableinfo:
               setTableInfo = new CSetTableInfo();
               setTableInfo.decode(byte_array,0);
               this.m_stEventObject = setTableInfo;
               break;
            case EnmRoomEventID.room_event_standup:
               playerStandUp = new CPlayerStandUp();
               playerStandUp.decode(byte_array,0);
               this.m_stEventObject = playerStandUp;
               break;
            case EnmRoomEventID.room_event_observe:
            case EnmRoomEventID.room_event_cancelobserving:
            case EnmRoomEventID.room_event_ready:
            case EnmRoomEventID.room_event_becanceled:
               playerSitStatus = new CPlayerSitStatus();
               playerSitStatus.decode(byte_array,0);
               this.m_stEventObject = playerSitStatus;
               break;
            case EnmRoomEventID.room_event_sitdown:
               playerSitDown = new CPlayerSitDown();
               playerSitDown.decode(byte_array,0);
               this.m_stEventObject = playerSitDown;
               break;
            case EnmRoomEventID.room_event_bekicked:
               playerBeCkicked = new CPlayerBeKicked();
               playerBeCkicked.decode(byte_array,0);
               this.m_stEventObject = playerBeCkicked;
               break;
            case EnmRoomEventID.room_event_lock:
            case EnmRoomEventID.room_event_unlock:
            case EnmRoomEventID.room_event_gamestart:
            case EnmRoomEventID.room_event_gameend:
               tableStatus = new CTableStatus();
               tableStatus.decode(byte_array,0);
               this.m_stEventObject = tableStatus;
               break;
            case EnmRoomEventID.room_event_exit:
            case EnmRoomEventID.room_event_offline:
               playerID = new CPlayerID();
               playerID.decode(byte_array,0);
               this.m_stEventObject = playerID;
               break;
            case EnmRoomEventID.room_event_setseatstate:
               setSeatInfo = new CSetSeatInfo();
               setSeatInfo.decode(byte_array,0);
               this.m_stEventObject = setSeatInfo;
               break;
            default:
               byte_array.readUTFBytes(this.m_nEventLen);
               return true;
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

