package com.aurora.ui.maogoutd.weddingRoom
{
   import a_4752.MarriageConfig;
   import a_4752.a_2027;
   import a_4754.a_2161;
   import a_4781.HtmlUtils;
   import com.aurora.game.maogoutd.common.marriage.WeddingWelfareItem;
   import com.aurora.ui.maogoutd.component.a_3306;
   import com.aurora.ui.maogoutd.component.tip.a_3297;
   import com.aurora.ui.maogoutd.role.a_4463;
   
   public class DefineWeddingRoomInfo
   {
      
      internal static var m_stWeddingRoomInfo:Object;
      
      internal static const BARRAGE_RESTRICT:String = "^[\\\\><\"]";
      
      internal static const BARRAGE_FIRST:int = 1;
      
      internal static const BARRAGE_NORMAL:int = 2;
      
      internal static const WELFARE_MAX_NUM:int = 4;
      
      internal static const WELFARE_RED:int = 1;
      
      internal static const WELFARE_CANDY:int = 2;
      
      internal static const WELFARE_HOST_FEEDBACK:int = 0;
      
      internal static const WELFARE_HOST_CLICK_AWARD:int = 1;
      
      internal static const WELFARE_OTHERS_CLICK_AWARD:int = 2;
      
      internal static const FIREWORK_SMALL:int = 1;
      
      internal static const FIREWORK_BIG:int = 2;
      
      internal static const GAG_NOT:int = 0;
      
      internal static const GAG_SURE:int = 1;
      
      internal static var IS_SHOW_PLAYER_NAME:Boolean = true;
      
      internal static var IS_SHOW_BARRAGE:Boolean = true;
      
      internal static var IS_CHANGE_SEAT:Boolean = false;
      
      internal static const UPDATE_MANAGER:int = 1;
      
      internal static const UPDATE_BENCH:int = 2;
      
      internal static const UPDATE_COOL_TIME:int = 3;
      
      internal static const UPDATE_FIREWORK:int = 4;
      
      internal static const UPDATE_FEEDBACK_SPREE:int = 5;
      
      internal static const UPDATE_WAIT_CEREMONY_MC:int = 6;
      
      internal static const UPDATE_WELFARE_RECORD_BTN:int = 7;
      
      internal static const PLAYER_ID_START:int = 1;
      
      internal static const BENCH_PLAYER_NUM:int = 4;
      
      internal static const BENCH_LIST_NUM:int = 2;
      
      internal static const PLAYER_HEAD_NUM:int = 4;
      
      internal static const DIR_LEFT:int = 0;
      
      internal static const DIR_RIGHT:int = 1;
      
      internal static const ROOM_CEREMONY_DOING:int = 0;
      
      internal static const ROOM_CEREMONY_BEFORE:int = 1;
      
      internal static const ROOM_CEREMONY_AFTER:int = 2;
      
      public function DefineWeddingRoomInfo()
      {
         super();
      }
      
      internal static function IsCeremoning() : Boolean
      {
         return Boolean(DefineWeddingRoomInfo.ROOM_CEREMONY_DOING == GetValueByProperty("m_iIsWeddingCeremony"));
      }
      
      public static function IsMySelf(iUin:int) : Boolean
      {
         return m_stWeddingRoomInfo.m_iUin == iUin;
      }
      
      internal static function IsCreater() : Boolean
      {
         return m_stWeddingRoomInfo.m_iUin == RoomInfo().m_iCreatorUin;
      }
      
      internal static function IsManager() : Boolean
      {
         return IsCreater() || m_stWeddingRoomInfo.m_iUin == RoomInfo().m_iPartnerUin;
      }
      
      public static function SetWeddingRoomInfo(stData:Object) : void
      {
         m_stWeddingRoomInfo = stData;
      }
      
      internal static function GetPlayerInfoBySeatID(iSeatID:int) : Object
      {
         return m_stWeddingRoomInfo.m_dictPalyersSeat[iSeatID];
      }
      
      internal static function GetManagerInfoBySex(iSex:int) : Object
      {
         return m_stWeddingRoomInfo.m_dictManager[iSex];
      }
      
      internal static function GetValueByProperty(strProperty:String) : *
      {
         if(m_stWeddingRoomInfo.hasOwnProperty(strProperty))
         {
            return m_stWeddingRoomInfo[strProperty];
         }
         throw Error("m_stWeddingRoomInfo isn\'t Property:" + strProperty);
      }
      
      internal static function SetValueByProperty(strProperty:String, value:*) : void
      {
         if(m_stWeddingRoomInfo.hasOwnProperty(strProperty))
         {
            m_stWeddingRoomInfo[strProperty] = value;
            return;
         }
         throw Error("m_stWeddingRoomInfo isn\'t Property:" + strProperty + "  value = " + value);
      }
      
      internal static function AddCurTimeStamp() : void
      {
         ++m_stWeddingRoomInfo["m_iCurServerTimeStamp"];
      }
      
      internal static function RoomInfo() : Object
      {
         if(null == m_stWeddingRoomInfo.m_stWeddingInfoItem.m_strPassword)
         {
            m_stWeddingRoomInfo.m_stWeddingInfoItem.m_strPassword = "";
         }
         return m_stWeddingRoomInfo.m_stWeddingInfoItem;
      }
      
      public static function GetPlayerInfoHandle(iUin:int) : Object
      {
         return m_stWeddingRoomInfo.GetPlayerInfoByUin(iUin);
      }
      
      public static function UpdatePlayerSeatHandle(iUin:int, strProperty:String, iValue:*) : void
      {
         m_stWeddingRoomInfo.UpdatePlayerInfo(iUin,strProperty,iValue);
      }
      
      public static function RemovePlayerInfoHandle(iUin:int) : Boolean
      {
         var iSeatID:int = int(m_stWeddingRoomInfo.RemovePlayerInfo(iUin));
         return Boolean(iSeatID < PLAYER_ID_START);
      }
      
      public static function AddPlayerInfoHandle(stData:Object) : Boolean
      {
         m_stWeddingRoomInfo.AddPlayerInfo(stData);
         return Boolean(stData.m_iSeat < PLAYER_ID_START);
      }
      
      public static function RequestWeddingRoomOperation(iOperateType:int, arrValue:Array = null, strInfo:String = "", iUin:int = -1) : void
      {
         if(-1 == iUin)
         {
            iUin = (a_2161.e.GetCurrentRole() as a_4463).m_iRoleUin;
         }
         a_2161.e.notify("OnRequestWeddingRoomOperate",iUin,iOperateType,arrValue,strInfo);
      }
      
      public static function GetWelfareName(iType:int, iLevel:int) : String
      {
         var strWelfareName:String = null;
         var stItem:WeddingWelfareItem = MarriageConfig.GetInstance().m_stWeddingRoomXML.m_stWeddingWelfareXML.GetItemByLevel(iLevel);
         if(DefineWeddingRoomInfo.WELFARE_RED == iType)
         {
            strWelfareName = stItem.m_strRedName;
         }
         else
         {
            strWelfareName = stItem.m_strCandyName;
         }
         return strWelfareName;
      }
      
      public static function GetAwardName(iItemID:int, iFontSize:int = 12) : String
      {
         var stTipDesc:a_3306 = a_2027.getInstance().m_dictDesc[iItemID];
         var uColor:uint = a_3297.getInstance().checkObjLevel(stTipDesc.CardID);
         return HtmlUtils.GetHtmlText(stTipDesc.Name,"#" + uColor.toString(16),iFontSize,true);
      }
   }
}

