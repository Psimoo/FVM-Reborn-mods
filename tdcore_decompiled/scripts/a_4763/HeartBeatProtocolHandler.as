package a_4763
{
   import a_4716.EnmServerEntity;
   import a_4716.b_154;
   import a_4757.a_2220;
   import a_4771.a_2648;
   import a_4771.a_2650;
   import com.aurora.protocol.hallserver.CRequestClientHallHearbeat;
   import com.aurora.protocol.logicserver.CRequestClientLogicHearbeat;
   import flash.utils.ByteArray;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   
   public class HeartBeatProtocolHandler
   {
      
      private static var logicHeartBeatBuffer:ByteArray;
      
      private static var hallServerHeartBeatBuffer:ByteArray;
      
      private static var roleServerHeartBeatBuffer:ByteArray;
      
      private static var intervalId:uint = 0;
      
      public function HeartBeatProtocolHandler()
      {
         super();
      }
      
      public static function a_2441() : void
      {
         a_2442();
         a_2443();
      }
      
      public static function a_2442() : void
      {
         var logicConn:a_2650 = null;
         var encodeLength:int = 0;
         var logicHeartBeatRequest:CRequestClientLogicHearbeat = null;
         if(null == logicHeartBeatBuffer)
         {
            logicHeartBeatBuffer = new ByteArray();
            logicHeartBeatRequest = new CRequestClientLogicHearbeat();
            logicHeartBeatRequest.m_byCount = 1;
            logicHeartBeatRequest.m_aiReverse = [1];
            logicHeartBeatRequest.encode(logicHeartBeatBuffer,encodeLength);
            logicHeartBeatRequest = null;
         }
         var logicConnArray:Array = a_2648.getInstance().getTcpConnectionsByServerType(EnmServerEntity.server_entity_logic);
         var pBaseProtocol:a_2220 = a_2220.getInstance();
         for each(logicConn in logicConnArray)
         {
            if(true == logicConn.connected)
            {
               pBaseProtocol.a_2201(logicConn,b_154.a_132,logicHeartBeatBuffer);
            }
         }
      }
      
      public static function a_2443() : void
      {
         var hallConn:a_2650 = null;
         var encodeLength:int = 0;
         var hallHeartBeatRequest:CRequestClientHallHearbeat = null;
         if(null == hallServerHeartBeatBuffer)
         {
            hallServerHeartBeatBuffer = new ByteArray();
            hallHeartBeatRequest = new CRequestClientHallHearbeat();
            hallHeartBeatRequest.m_byCount = 1;
            hallHeartBeatRequest.m_aiReverse = [1];
            hallHeartBeatRequest.encode(hallServerHeartBeatBuffer,encodeLength);
            hallHeartBeatRequest = null;
         }
         var hallConnArray:Array = a_2648.getInstance().getTcpConnectionsByServerType(EnmServerEntity.server_entity_hall);
         var pBaseProtocol:a_2220 = a_2220.getInstance();
         for each(hallConn in hallConnArray)
         {
            if(true == hallConn.connected)
            {
               pBaseProtocol.a_2201(hallConn,b_154.a_241,hallServerHeartBeatBuffer);
            }
         }
      }
      
      public static function a_2217() : Boolean
      {
         if(intervalId == 0)
         {
            intervalId = setInterval(a_2441,30 * 1000);
            trace("heatbeathandler started, intervalId:" + intervalId);
            return true;
         }
         trace("heatbeathandler has been started failed, intervalId:" + intervalId);
         return false;
      }
      
      public static function a_2218() : Boolean
      {
         if(intervalId > 0)
         {
            clearInterval(intervalId);
            intervalId = 0;
         }
         return true;
      }
   }
}

