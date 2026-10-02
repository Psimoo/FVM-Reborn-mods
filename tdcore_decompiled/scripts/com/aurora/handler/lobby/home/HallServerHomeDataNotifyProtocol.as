package com.aurora.handler.lobby.home
{
   import a_4716.b_154;
   import a_4754.TDHomeUINotify;
   import a_4759.b_167;
   import com.aurora.protocol.common.a_2670;
   import com.aurora.protocol.hallserver.home.SCNotifyHomeEvent;
   import flash.events.IEventDispatcher;
   import flash.utils.ByteArray;
   
   public class HallServerHomeDataNotifyProtocol extends b_167
   {
      
      private static var _instance:HallServerHomeDataNotifyProtocol = new HallServerHomeDataNotifyProtocol();
      
      public function HallServerHomeDataNotifyProtocol(target:IEventDispatcher = null)
      {
         super(target);
         this.init();
      }
      
      public static function getInstance() : HallServerHomeDataNotifyProtocol
      {
         return _instance;
      }
      
      private function init() : void
      {
         a_2247(b_154.MSG_HALL_NOTIFY_CAT_INFO,this.OnNotifyHomeEvent);
      }
      
      private function OnNotifyHomeEvent(csPackageHeader:a_2670, byteArray:ByteArray) : void
      {
         var length:int = 0;
         var response:SCNotifyHomeEvent = new SCNotifyHomeEvent();
         response.decode(byteArray,length);
         TDHomeUINotify.e.homeNotify(response);
      }
   }
}

