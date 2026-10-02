package a_4760
{
   import a_4716.EnmServerEntity;
   import a_4771.a_2648;
   import a_4771.a_2650;
   
   public class a_2251
   {
      
      private static var a_789:a_2251;
      
      private var serverInfosArray:Array = [];
      
      private var a_790:a_2650;
      
      public function a_2251()
      {
         super();
      }
      
      public static function getInstance() : a_2251
      {
         if(null == a_789)
         {
            a_789 = new a_2251();
         }
         return a_789;
      }
      
      public function a_2249(serverListXML:XML, strGatewayIP:String = "", iGatewayPort:int = 443) : Boolean
      {
         var server:XML = null;
         for each(server in serverListXML.Server)
         {
            if(strGatewayIP.length > 0)
            {
               this.serverInfosArray.push({
                  "ServerID":server.@ID,
                  "IP":strGatewayIP,
                  "Port":iGatewayPort,
                  "DesIP":server.@DesIP,
                  "DesPort":server.@DesPort
               });
            }
            else
            {
               this.serverInfosArray.push({
                  "ServerID":server.@ID,
                  "IP":server.@IP,
                  "Port":server.@Port,
                  "DesIP":server.@DesIP,
                  "DesPort":server.@DesPort
               });
            }
         }
         if(this.serverInfosArray.length > 0)
         {
            return true;
         }
         return false;
      }
      
      public function a_2252() : Array
      {
         return this.serverInfosArray;
      }
      
      public function a_2253() : a_2650
      {
         var serverConfig:Object = null;
         var hallHost:Object = null;
         if(null == this.a_790)
         {
            serverConfig = this.serverInfosArray[0];
            this.a_790 = new a_2650(serverConfig.IP,serverConfig.Port,EnmServerEntity.server_entity_hall,serverConfig.ServerID,serverConfig.DesIP,serverConfig.DesPort);
            a_2648.getInstance().addServer(this.a_790);
         }
         var hostsNum:int = int(this.serverInfosArray.length);
         var i:int = 0;
         while(i < hostsNum && false == this.a_790.connected)
         {
            hallHost = this.serverInfosArray[Math.round(Math.random() * (hostsNum - 1))];
            this.a_790.reconnect(hallHost.IP,hallHost.Port);
            i++;
         }
         return this.a_790;
      }
   }
}

