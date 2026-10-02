package a_4760
{
   import a_4716.EnmServerEntity;
   import a_4771.a_2648;
   import a_4771.a_2650;
   
   public class a_2256
   {
      
      private static var logicSvrInstance:a_2256;
      
      private var serverInfosArray:Array = [];
      
      private var gameRoomsArray:Array = [];
      
      private var a_792:Array = [];
      
      private var a_793:Array = [];
      
      public function a_2256()
      {
         super();
      }
      
      public static function getInstance() : a_2256
      {
         if(null == logicSvrInstance)
         {
            logicSvrInstance = new a_2256();
         }
         return logicSvrInstance;
      }
      
      public function a_2249(serverListXML:XML, strGatewayIP:String = "", iGatewayPort:int = 443) : Boolean
      {
         var server:XML = null;
         this.serverInfosArray = [];
         for each(server in serverListXML.Server)
         {
            if(strGatewayIP.length > 0)
            {
               this.serverInfosArray[server.@ID] = {
                  "ServerID":server.@ID,
                  "IP":strGatewayIP,
                  "Port":iGatewayPort,
                  "DesIP":server.@DesIP,
                  "DesPort":server.@DesPort
               };
            }
            else
            {
               this.serverInfosArray[server.@ID] = {
                  "ServerID":server.@ID,
                  "IP":server.@IP,
                  "Port":server.@Port,
                  "DesIP":server.@DesIP,
                  "DesPort":server.@DesPort
               };
            }
         }
         if(this.serverInfosArray.length > 0)
         {
            return true;
         }
         return false;
      }
      
      public function a_2257(roomListXML:XML) : Boolean
      {
         var roomNode:XML = null;
         var section:XML = null;
         var iServerID:int = 0;
         var iMatchID:int = 0;
         var room:XML = null;
         this.gameRoomsArray = [];
         this.a_792 = [];
         this.a_793 = [];
         var gameId:int = int(roomListXML..Game[0].@GameID);
         for each(roomNode in roomListXML..Game[0]..Room)
         {
            iServerID = int(roomNode.@ServerID);
            iMatchID = int(roomNode.@MatchID);
            if(null == this.gameRoomsArray[iServerID])
            {
               this.gameRoomsArray[iServerID] = new Array();
            }
            this.gameRoomsArray[iServerID][iMatchID] = {
               "Name":roomNode.@Text,
               "GameID":8196
            };
         }
         if(this.gameRoomsArray.length <= 0)
         {
            return false;
         }
         for each(section in roomListXML..Game[0].Section)
         {
            this.a_792[section.@ID] = new Array();
            this.a_793[section.@ID] = new Array();
            for each(room in section.Room)
            {
               this.a_792[section.@ID][room.@MatchID] = {
                  "Name":room.@Text,
                  "a_4697":room.@a_4697,
                  "ServerID":room.@ServerID,
                  "MatchID":room.@MatchID,
                  "MaxSignUpNum":room.@MaxSignUpNum,
                  "Fee":room.@match_entry_fees,
                  "IsHot":room.@is_hot,
                  "Reward":room.@reward,
                  "FixedTime":room.@fixed_time
               };
               (this.a_793[section.@ID] as Array).push({
                  "Name":room.@Text,
                  "a_4697":room.@a_4697,
                  "ServerID":room.@ServerID,
                  "MatchID":room.@MatchID,
                  "MaxSignUpNum":room.@MaxSignUpNum,
                  "Fee":room.@match_entry_fees,
                  "IsHot":room.@is_hot,
                  "Reward":room.@reward,
                  "FixedTime":room.@fixed_time
               });
            }
         }
         return true;
      }
      
      public function a_2258(server_id:int) : a_2650
      {
         var serverConfig:Object = this.serverInfosArray[server_id];
         var logicConn:a_2650 = a_2648.getInstance().getTcpConnection(EnmServerEntity.server_entity_logic,serverConfig.ServerID);
         if(null == logicConn)
         {
            logicConn = new a_2650(serverConfig.IP,serverConfig.Port,EnmServerEntity.server_entity_logic,server_id,serverConfig.DesIP,serverConfig.DesPort);
            a_2648.getInstance().addServer(logicConn);
         }
         return logicConn;
      }
      
      public function a_2259(serverId:int, roomId:int) : int
      {
         return Boolean(this.gameRoomsArray[serverId] as Array) && Boolean(null != this.gameRoomsArray[serverId][roomId]) && this.gameRoomsArray[serverId][roomId].GameID > 0 ? int(this.gameRoomsArray[serverId][roomId].GameID) : 8196;
      }
      
      public function a_2260(iServerID:int, iMatchID:int) : String
      {
         return Boolean(this.gameRoomsArray[iServerID] as Array) && null != this.gameRoomsArray[iServerID][iMatchID] ? this.gameRoomsArray[iServerID][iMatchID].Name : "";
      }
      
      public function a_2261() : Array
      {
         return this.a_793;
      }
      
      public function a_2262() : Array
      {
         return this.serverInfosArray;
      }
   }
}

