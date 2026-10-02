package a_4752
{
   public class a_2020
   {
      
      private static var instance:a_2020;
      
      public var m_arrMatchGameList:Array;
      
      private var day:Array;
      
      public function a_2020()
      {
         super();
      }
      
      public static function getInstance() : a_2020
      {
         if(instance == null)
         {
            instance = new a_2020();
         }
         return instance;
      }
      
      public function getDayString(date:Date) : String
      {
         return this.day[date.day];
      }
      
      public function a_2021(matchListXML:XML) : Boolean
      {
         var roomXml:XML = null;
         var szStartTime:String = null;
         var roomItem:Object = null;
         var arrHour:Array = null;
         var iDay:int = 0;
         if(null == this.day)
         {
            this.day = GameStringManager.getInstance().getString(131328).split(",");
         }
         this.m_arrMatchGameList = [];
         if(matchListXML != null)
         {
            for each(roomXml in matchListXML.Room)
            {
               szStartTime = String(roomXml.@StartTime);
               roomItem = new Object();
               roomItem.iType = Number(roomXml.@Type);
               roomItem.szBetweenTime = String(roomXml.@BetweenTime);
               roomItem.szText = String(roomXml.@Text);
               roomItem.iServerID = Number(roomXml.@ServerID);
               roomItem.iRoomID = Number(roomXml.@RoomID);
               roomItem.isOpen = Number(roomXml.@IsOpen);
               roomItem.iPlayerCount = Number(roomXml.@PlayerCount);
               roomItem.iMaxPlayerCount = Number(roomXml.@MaxPlayerCount);
               roomItem.iGameMapID = Number(roomXml.@GameMapID);
               roomItem.iGameMode = Number(roomXml.@GameMode);
               roomItem.iCoin = Number(roomXml.@coin);
               roomItem.szCardLimit = String(roomXml.@CardLimit);
               roomItem.szExtraAward = String(roomXml.@ExtraAward);
               roomItem.szGameAward = String(roomXml.@GameAward);
               roomItem.szGameDesc = String(roomXml.@GameDesc);
               roomItem.szGameMapName = String(roomXml.@GameMapName);
               arrHour = roomItem.szBetweenTime.split("-");
               roomItem.startHour = arrHour[0];
               roomItem.endHour = arrHour[1];
               iDay = int(roomXml.@StartTime);
               roomItem.iStartTime = iDay;
               iDay = 7 == iDay ? 0 : iDay;
               roomItem.szDay = this.day[iDay];
               if(arrHour.length != 2)
               {
                  throw Error("竞技比赛配置文件有错误,时间:" + roomItem.szStartTime + ",比赛:" + roomItem.szText);
               }
               this.m_arrMatchGameList.push(roomItem);
            }
         }
         return true;
      }
      
      public function getMatchItemByType(iMatchType:int) : Object
      {
         var item:Object = null;
         var roomItem:Object = null;
         if(this.m_arrMatchGameList != null)
         {
            for each(item in this.m_arrMatchGameList)
            {
               if(item.iType == iMatchType && item.isOpen == 1)
               {
                  roomItem = item;
                  break;
               }
            }
         }
         return roomItem;
      }
      
      public function getMatchItemByID(iServerID:int, iRoomID:int) : Object
      {
         var item:Object = null;
         var roomItem:Object = null;
         if(this.m_arrMatchGameList != null)
         {
            for each(item in this.m_arrMatchGameList)
            {
               if(item.iServerID == iServerID && item.iRoomID == iRoomID)
               {
                  roomItem = item;
                  break;
               }
            }
         }
         return roomItem;
      }
   }
}

