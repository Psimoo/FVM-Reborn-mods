package a_4771
{
   public class a_2648
   {
      
      private static var serverManager:a_2648;
      
      protected static var mapTcpConnectionRoutine:Array = new Array();
      
      public function a_2648()
      {
         super();
      }
      
      public static function getInstance() : a_2648
      {
         if(null == serverManager)
         {
            serverManager = new a_2648();
         }
         return serverManager;
      }
      
      public static function reBuild() : a_2648
      {
         return new a_2648();
      }
      
      public function addServer(tcpConn:a_2650) : Boolean
      {
         if(null == tcpConn || !(tcpConn is a_2650))
         {
            trace("addServer to ServerManager failed, tcpconn is null or not TcpConnection object");
            return false;
         }
         if(tcpConn.serverType < 0 || tcpConn.serverId <= 0)
         {
            trace("connection serverType or serverId  less than 0");
            return false;
         }
         if(null != mapTcpConnectionRoutine[tcpConn.serverType] && mapTcpConnectionRoutine[tcpConn.serverType][tcpConn.serverId] is a_2650)
         {
            trace("mapTcpConnectionRoutine[" + tcpConn.serverType + "][" + tcpConn.serverId + "] is a tcpconnection already");
            return false;
         }
         if(mapTcpConnectionRoutine[tcpConn.serverType] is Array)
         {
            mapTcpConnectionRoutine[tcpConn.serverType][tcpConn.serverId] = tcpConn;
         }
         else
         {
            mapTcpConnectionRoutine[tcpConn.serverType] = new Array();
            mapTcpConnectionRoutine[tcpConn.serverType][tcpConn.serverId] = tcpConn;
         }
         trace("add server connection:" + mapTcpConnectionRoutine[tcpConn.serverType][tcpConn.serverId]);
         return true;
      }
      
      public function removeServer(tcpConn:a_2650) : Boolean
      {
         if(null == tcpConn || !(tcpConn is a_2650))
         {
            trace("remove Server failed, tcpconn is null or not TcpConnection object");
            return false;
         }
         if(tcpConn.serverType < 0 || tcpConn.serverId <= 0)
         {
            trace("connection serverType or serverType  less than 1");
            return false;
         }
         if(null != mapTcpConnectionRoutine[tcpConn.serverType] && null != mapTcpConnectionRoutine[tcpConn.serverType][tcpConn.serverId])
         {
            mapTcpConnectionRoutine[tcpConn.serverType][tcpConn.serverId] = null;
         }
         return true;
      }
      
      public function getTcpConnection(serverType:int, server_id:int) : a_2650
      {
         if(serverType < 0 || server_id <= 0 || null == mapTcpConnectionRoutine[serverType] || !(mapTcpConnectionRoutine[serverType][server_id] is a_2650))
         {
            return null;
         }
         return mapTcpConnectionRoutine[serverType][server_id];
      }
      
      public function getTcpConnectionsByServerType(serverType:int) : Array
      {
         return mapTcpConnectionRoutine[serverType];
      }
   }
}

