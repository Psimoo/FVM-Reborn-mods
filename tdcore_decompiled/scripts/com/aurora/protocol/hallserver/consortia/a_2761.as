package com.aurora.protocol.hallserver.consortia
{
   import a_4716.EnmConsortia;
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2761 implements CMessageBody
   {
      
      public var m_nEvent:int;
      
      public var m_iValue:int;
      
      public var m_stEstablismentLevel:Object;
      
      public var m_stConsortiaLevel:Object;
      
      public var m_stEstablismentSetting:Object;
      
      public var m_stContribute:Object;
      
      public var m_stSomebodyJoin:Object;
      
      public var m_stRequestJoin:Object;
      
      public var m_stInviteJoin:Object;
      
      public var m_stEnounceChange:Object;
      
      public var m_stNotifyChange:Object;
      
      public var m_stCommonData:Object;
      
      public var m_stTitleData:Object;
      
      public var m_stPlayerData:Object;
      
      public var m_stBeKicked:Object;
      
      public function a_2761()
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
         var body_size:int = a_2664.decode_int16(byte_array);
         this.m_nEvent = a_2664.decode_int16(byte_array);
         switch(this.m_nEvent)
         {
            case EnmConsortia.enm_upgrade_establishment:
               this.m_stEstablismentLevel = {};
               this.m_stEstablismentLevel.m_iSrcUIN = a_2664.decode_int32(byte_array);
               this.m_stEstablismentLevel.m_iEstablisment = a_2664.decode_int32(byte_array);
               this.m_stEstablismentLevel.m_nLevel = a_2664.decode_int16(byte_array);
               break;
            case EnmConsortia.enm_refresh_establishment:
               this.m_stEstablismentSetting = {};
               this.m_stEstablismentSetting.m_iSrcUIN = a_2664.decode_int32(byte_array);
               this.m_stEstablismentSetting.m_iEstablisment = a_2664.decode_int32(byte_array);
               this.m_stEstablismentSetting.m_nSettingCount = a_2664.decode_int16(byte_array);
               this.m_stEstablismentSetting.m_arySettings = new Array();
               for(i = 0; i < this.m_stEstablismentSetting.m_nSettingCount; i++)
               {
                  this.m_stEstablismentSetting.m_arySettings.push(a_2664.decode_int32(byte_array));
               }
               break;
            case EnmConsortia.enm_endow:
               this.m_stContribute = {};
               this.m_stContribute.m_iSrcUIN = a_2664.decode_int32(byte_array);
               this.m_stContribute.m_iMoney = a_2664.decode_int32(byte_array);
               this.m_stContribute.m_iPoint = a_2664.decode_int32(byte_array);
               this.m_stContribute.m_iCoin = a_2664.decode_int32(byte_array);
               break;
            case EnmConsortia.enm_divide:
               this.m_stCommonData = {};
               this.m_stCommonData.m_iSrcUIN = a_2664.decode_int32(byte_array);
               this.m_stCommonData.m_szRoleName = a_2664.decode_string(byte_array,32);
               break;
            case EnmConsortia.enm_somebody_join:
               this.m_stSomebodyJoin = {};
               this.m_stSomebodyJoin.m_iSrcUIN = a_2664.decode_int32(byte_array);
               this.m_stSomebodyJoin.m_szRoleName = a_2664.decode_string(byte_array,32);
               break;
            case EnmConsortia.enm_request_join:
               this.m_stRequestJoin = {};
               this.m_stRequestJoin.m_iSrcUIN = a_2664.decode_int32(byte_array);
               this.m_stRequestJoin.m_szRoleName = a_2664.decode_string(byte_array,32);
               this.m_stRequestJoin.m_szComment = a_2664.decode_string(byte_array,1024);
               break;
            case EnmConsortia.enm_invite_join:
               this.m_stInviteJoin = {};
               this.m_stInviteJoin.m_iSrcUIN = a_2664.decode_int32(byte_array);
               this.m_stInviteJoin.m_szRoleName = a_2664.decode_string(byte_array,32);
               break;
            case EnmConsortia.enm_enounce_change:
               this.m_stEnounceChange = {};
               this.m_stEnounceChange.m_iSrcUIN = a_2664.decode_int32(byte_array);
               this.m_stEnounceChange.m_czContent = a_2664.decode_string(byte_array,1024);
               break;
            case EnmConsortia.enm_notify_change:
               this.m_stNotifyChange = {};
               this.m_stNotifyChange.m_iSrcUIN = a_2664.decode_int32(byte_array);
               this.m_stNotifyChange.m_czContent = a_2664.decode_string(byte_array,1024);
               break;
            case EnmConsortia.enm_commondata_change:
               this.m_stCommonData = {};
               this.m_stCommonData.m_iSrcUIN = a_2664.decode_int32(byte_array);
               this.m_stCommonData.m_iPoint = a_2664.decode_int32(byte_array);
               this.m_stCommonData.m_iCoin = a_2664.decode_int32(byte_array);
               break;
            case EnmConsortia.enm_set_title:
               this.m_stTitleData = {};
               this.m_stTitleData.m_iSrcUIN = a_2664.decode_int32(byte_array);
               this.m_stTitleData.m_cTitle = a_2664.decode_int8(byte_array);
               break;
            case EnmConsortia.enm_player_data:
               this.m_stPlayerData = {};
               this.m_stPlayerData.m_iSrcUIN = a_2664.decode_int32(byte_array);
               this.m_stPlayerData.m_iPoint = a_2664.decode_int32(byte_array);
               this.m_stPlayerData.m_iScore = a_2664.decode_int32(byte_array);
               break;
            case EnmConsortia.enm_kick_member:
               this.m_stBeKicked = {};
               this.m_stBeKicked.m_iSrcUIN = a_2664.decode_int32(byte_array);
               this.m_stBeKicked.m_iDstUIN = a_2664.decode_int32(byte_array);
               break;
            case EnmConsortia.enm_upgrade:
               this.m_stConsortiaLevel = {};
               this.m_stConsortiaLevel.m_iSrcUIN = a_2664.decode_int32(byte_array);
               this.m_stConsortiaLevel.m_nLevel = a_2664.decode_int16(byte_array);
               break;
            default:
               this.m_iValue = a_2664.decode_int32(byte_array);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

