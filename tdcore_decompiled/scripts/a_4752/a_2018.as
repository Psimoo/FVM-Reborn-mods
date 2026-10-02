package a_4752
{
   public class a_2018
   {
      
      private static var instance:a_2018;
      
      private static var m_arrChannelList:Array;
      
      private static var m_bIsCrossServer:Boolean = false;
      
      public var a_791:Array;
      
      public function a_2018()
      {
         super();
      }
      
      public static function getInstance() : a_2018
      {
         if(instance == null)
         {
            instance = new a_2018();
         }
         return instance;
      }
      
      public static function SortRoomID(roomItem1:Object, roomItem2:Object) : int
      {
         if(roomItem1.iRoomID > roomItem2.iRoomID)
         {
            return 1;
         }
         return -1;
      }
      
      public static function IsCrossServerLogicRoom() : Boolean
      {
         return m_bIsCrossServer;
      }
      
      public static function SetCrossServerState(iLogicRoomID:int) : Boolean
      {
         var worldBossChanelList:Array = null;
         var roomItem:Object = null;
         m_bIsCrossServer = false;
         if(null == m_arrChannelList)
         {
            m_arrChannelList = getInstance().a_791[5];
            worldBossChanelList = getInstance().a_791[19];
            m_arrChannelList = m_arrChannelList.concat(worldBossChanelList);
            m_arrChannelList.sort(SortRoomID);
         }
         for(var i:int = 0; i < m_arrChannelList.length; i++)
         {
            roomItem = m_arrChannelList[i];
            if(roomItem.iRoomID == iLogicRoomID)
            {
               m_bIsCrossServer = true;
            }
         }
         return m_bIsCrossServer;
      }
      
      public function compareRoomID(iRoomID:int, iServerID:int) : Boolean
      {
         var arrChannel:Object = null;
         var roomItem:Object = null;
         var isRoomID:Boolean = false;
         if(this.a_791 != null)
         {
            for each(arrChannel in this.a_791)
            {
               for each(roomItem in arrChannel)
               {
                  if(iRoomID == Number(roomItem.iRoomID) && roomItem.isOpen == 1 && iServerID == Number(roomItem.iServerID) && roomItem.iPlayerCount < roomItem.MaxPlayerCount - 20)
                  {
                     isRoomID = true;
                     break;
                  }
               }
            }
         }
         return isRoomID;
      }
      
      public function getRoomItem(iRoomID:int, iServerID:int) : Object
      {
         var arrChannel:Object = null;
         var item:Object = null;
         var roomItem:Object = null;
         if(this.a_791 != null)
         {
            for each(arrChannel in this.a_791)
            {
               for each(item in arrChannel)
               {
                  if(iRoomID == Number(item.iRoomID) && item.isOpen == 1 && iServerID == Number(item.iServerID))
                  {
                     roomItem = item;
                     break;
                  }
               }
            }
         }
         return roomItem;
      }
      
      public function getNewPlayerRoomID(index:int) : Object
      {
         var size:int = 0;
         var arrChannelLists:Array = null;
         var roomItem:Object = null;
         var m_arrRoomID:Array = [];
         if(this.a_791 != null)
         {
            size = int(this.a_791.length);
            index = size > index ? index : 0;
            arrChannelLists = this.a_791[index];
            for each(roomItem in arrChannelLists)
            {
               if(roomItem.isOpen == 1 && roomItem.iPlayerCount < roomItem.MaxPlayerCount * 0.2)
               {
                  m_arrRoomID.push(roomItem);
               }
            }
            if(m_arrRoomID.length == 0)
            {
               for each(roomItem in arrChannelLists)
               {
                  if(roomItem.isOpen == 1 && roomItem.iPlayerCount < roomItem.MaxPlayerCount * 0.3)
                  {
                     m_arrRoomID.push(roomItem);
                  }
               }
            }
            if(m_arrRoomID.length == 0)
            {
               for each(roomItem in arrChannelLists)
               {
                  if(roomItem.isOpen == 1 && roomItem.iPlayerCount < roomItem.MaxPlayerCount * 0.4)
                  {
                     m_arrRoomID.push(roomItem);
                  }
               }
            }
            if(m_arrRoomID.length == 0)
            {
               for each(roomItem in arrChannelLists)
               {
                  if(roomItem.isOpen == 1 && roomItem.iPlayerCount < roomItem.MaxPlayerCount * 0.5)
                  {
                     m_arrRoomID.push(roomItem);
                  }
               }
            }
            if(m_arrRoomID.length == 0)
            {
               for each(roomItem in arrChannelLists)
               {
                  if(roomItem.isOpen == 1 && roomItem.iPlayerCount < roomItem.MaxPlayerCount * 0.7)
                  {
                     m_arrRoomID.push(roomItem);
                  }
               }
            }
            if(m_arrRoomID.length == 0)
            {
               for each(roomItem in arrChannelLists)
               {
                  if(roomItem.isOpen == 1 && roomItem.iPlayerCount < roomItem.MaxPlayerCount * 0.8)
                  {
                     m_arrRoomID.push(roomItem);
                  }
               }
            }
            if(m_arrRoomID.length == 0)
            {
               for each(roomItem in arrChannelLists)
               {
                  if(roomItem.isOpen == 1 && roomItem.iPlayerCount < roomItem.MaxPlayerCount * 0.9)
                  {
                     m_arrRoomID.push(roomItem);
                  }
               }
            }
            if(m_arrRoomID.length == 0)
            {
               for each(roomItem in arrChannelLists)
               {
                  if(roomItem.isOpen == 1 && roomItem.iPlayerCount < roomItem.MaxPlayerCount - 10)
                  {
                     m_arrRoomID.push(roomItem);
                  }
               }
            }
         }
         else
         {
            roomItem = {
               "iRoomID":int(Math.random() * 5),
               "iServerID":1,
               "index":0
            };
         }
         if(m_arrRoomID.length > 0)
         {
            roomItem = m_arrRoomID[0];
         }
         else
         {
            roomItem = {
               "iRoomID":int(Math.random() * 5),
               "iServerID":1,
               "index":0
            };
         }
         return roomItem;
      }
      
      public function updateHotGameList(playerCount:Object, index:int = 0) : void
      {
         var room:Object = null;
         var iCount:int = 0;
         var iRoomID:int = 0;
         var arrChannelLists:Array = null;
         var roomItem:Object = null;
         var iServerID:int = int(playerCount.m_iServerID);
         var arrPlayerCounts:Array = playerCount.m_arrRoomPlayerCount;
         for each(room in arrPlayerCounts)
         {
            iCount = room.m_nMMCount + room.m_nOtherCount;
            iRoomID = int(room.m_iRoomID);
            for each(arrChannelLists in this.a_791)
            {
               for each(roomItem in arrChannelLists)
               {
                  if(roomItem.isOpen == 1 && roomItem.iRoomID == iRoomID && roomItem.iServerID == iServerID)
                  {
                     roomItem.iPlayerCount = iCount;
                  }
               }
            }
         }
      }
      
      public function a_2019(serverListXML:XML) : Boolean
      {
         var section:XML = null;
         var index:int = 0;
         var arrRooms:Array = null;
         var roomXml:XML = null;
         var roomItem:Object = null;
         var ID:String = null;
         this.a_791 = [];
         if(serverListXML != null)
         {
            for each(section in serverListXML..Game[0].Section)
            {
               index = Number("0x" + section.@ID) & 0xFF;
               arrRooms = [];
               this.a_791[index] = arrRooms;
               for each(roomXml in section.Room)
               {
                  roomItem = new Object();
                  ID = roomXml.@ID;
                  roomItem.iServerID = Number(roomXml.@ServerID);
                  roomItem.ID = ID;
                  roomItem.Text = roomXml.@Text.toString();
                  roomItem.iRoomID = Number(roomXml.@RoomID);
                  roomItem.iOrder = Number(roomXml.@RecommendOrder);
                  roomItem.index = index;
                  roomItem.isOpen = Number(roomXml.@IsOpen);
                  roomItem.iPlayerCount = Number(roomXml.@PlayerCount);
                  roomItem.MaxPlayerCount = Number(roomXml.@MaxPlayerCount);
                  roomItem.iGameMode = Number(roomXml.@GameMode);
                  if(roomItem.isOpen == 1)
                  {
                     arrRooms.push(roomItem);
                  }
               }
               arrRooms.sortOn("iOrder",Array.NUMERIC);
            }
         }
         return true;
      }
   }
}

