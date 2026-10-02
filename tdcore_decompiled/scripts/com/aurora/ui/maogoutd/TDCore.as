package com.aurora.ui.maogoutd
{
   import a_4716.EnmAppTypeID;
   import a_4716.EnmUserType;
   import a_4752.GameStringManager;
   import a_4758.a_2208;
   import a_4759.ITDCore;
   import a_4760.a_2248;
   import a_4760.a_2251;
   import a_4760.a_2256;
   import a_4763.HeartBeatProtocolHandler;
   import a_4763.a_2439;
   import a_4767.a_2545;
   import a_4767.b_176;
   import a_4788.a_4648;
   import com.aurora.protocol.a_2664;
   import com.aurora.ui.maogoutd.base.TDErrorCatch;
   import com.aurora.ui.maogoutd.base.TDFactoryImport;
   import com.aurora.ui.maogoutd.base.TDGuideFactoryImport;
   import com.aurora.ui.maogoutd.doctor.GameDoctor;
   import com.aurora.ui.maogoutd.weddingRoom.TDweddingAnimationUI;
   import flash.display.Sprite;
   import flash.events.UncaughtErrorEvent;
   import flash.utils.ByteArray;
   
   [SWF(width="550", height="400", backgroundColor="#ffffff", frameRate="30")]
   public class TDCore extends Sprite implements ITDCore
   {
      
      private var a_829:ITDLobbyUI;
      
      public function TDCore()
      {
         new TDweddingAnimationUI();
         TDGuideFactoryImport.ImportAll();
         TDFactoryImport.ImportAll();
         super();
      }
      
      private function onUncaughtError(e:UncaughtErrorEvent) : void
      {
         root.loaderInfo.uncaughtErrorEvents.removeEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR,this.onUncaughtError);
         this.loaderInfo.uncaughtErrorEvents.removeEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR,this.onUncaughtError);
         TDErrorCatch.onUncaughtError(e);
      }
      
      public function parseConfigFiles(arrConfigFiles:Array, strGatewayIP:String = "", iGatewayPort:int = 443) : Boolean
      {
         a_4648.identity = "TDCore";
         a_4648.OmitTrace = true;
         a_2439.getInstance();
         if(!a_2248.getInstance().a_2249(arrConfigFiles["Authenticate.xml"]))
         {
            trace("AuthenServerConfig ParseServerListConfigXML failed");
            GameDoctor.instance.pushInCache({"type":"ce"},GameStringManager.getInstance().getString(132608),"AuthenServerConfig ParseServerListConfigXML failed!",{"cpShow":true});
            return false;
         }
         if(!a_2251.getInstance().a_2249(arrConfigFiles["HallServer"],strGatewayIP,iGatewayPort))
         {
            trace("HallServerConfig ParseServerListConfigXML failed");
            GameDoctor.instance.pushInCache({"type":"ce"},GameStringManager.getInstance().getString(132609),"HallServerConfig ParseServerListConfigXML failed!",{"cpShow":true});
            return false;
         }
         if(!a_2256.getInstance().a_2249(arrConfigFiles["LogicServer"],strGatewayIP,iGatewayPort))
         {
            trace("LogicServerConfig ParseServerListConfigXML failed");
            GameDoctor.instance.pushInCache({"type":"ce"},GameStringManager.getInstance().getString(132610),"LogicServerConfig ParseServerListConfigXML failed!",{"cpShow":true});
            return false;
         }
         return true;
      }
      
      public function a_2229() : b_176
      {
         return a_2545.getInstance();
      }
      
      public function GetLobbyUI() : ITDLobbyUI
      {
         if(this.a_829 == null)
         {
            this.a_829 = new TDLobbyCoreUI();
         }
         return this.a_829;
      }
      
      public function a_2230(lobbyView:ITDLobbyUI) : Boolean
      {
         if(!lobbyView is ITDLobbyUI)
         {
            trace("lobbyView is not ITDLobbyUI failed");
            GameDoctor.instance.pushInCache({"type":"ce"},GameStringManager.getInstance().getString(132611),"lobbyView is not ITDLobbyUI failed!",{"cpShow":true});
            return false;
         }
         this.a_829 = lobbyView;
         return a_2545.getInstance().a_2230(lobbyView);
      }
      
      public function a_2234(parameters:Object) : Boolean
      {
         var szMemoryBuffer:ByteArray = null;
         if("joyyou" == parameters.sitetype)
         {
            root.loaderInfo.uncaughtErrorEvents.addEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR,this.onUncaughtError);
            this.loaderInfo.uncaughtErrorEvents.addEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR,this.onUncaughtError);
         }
         if("renren" == parameters.sitetype)
         {
            szMemoryBuffer = new ByteArray();
            a_2664.encode_string(szMemoryBuffer,parameters.sig_session_key,100);
            a_2545.getInstance().a_2480(parameters.sig_user,parameters.sig_user,EnmUserType.enm_usertype_xiaonei,EnmAppTypeID.enm_apptype_game_xiaonei,szMemoryBuffer);
         }
         else if("123u" == parameters.sitetype)
         {
            szMemoryBuffer = new ByteArray();
            a_2664.encode_int16(szMemoryBuffer,parameters.sig_session_key_len);
            a_2664.encode_string(szMemoryBuffer,parameters.sig_session_key,500);
            a_2545.getInstance().a_2480(parameters.sig_user,parameters.sig_user,EnmUserType.enm_usertype_123u_web,EnmAppTypeID.enm_apptype_game_normal,szMemoryBuffer);
         }
         else if("shengda" == parameters.sitetype)
         {
            szMemoryBuffer = new ByteArray();
            a_2664.encode_string(szMemoryBuffer,parameters.sig_session_key,200);
            a_2545.getInstance().a_2480(parameters.sig_user,parameters.sig_user,EnmUserType.enm_usertype_shengda,EnmAppTypeID.enm_apptype_game_shengda,szMemoryBuffer);
         }
         else if("4399" == parameters.sitetype)
         {
            szMemoryBuffer = new ByteArray();
            a_2664.encode_string(szMemoryBuffer,parameters.sig_session_key,200);
            a_2545.getInstance().a_2480(parameters.sig_user,parameters.sig_user,EnmUserType.enm_usertype_4399,EnmAppTypeID.enm_apptype_game_4399,szMemoryBuffer);
         }
         else if("2144" == parameters.sitetype)
         {
            szMemoryBuffer = new ByteArray();
            a_2664.encode_string(szMemoryBuffer,parameters.sig_session_key,200);
            a_2545.getInstance().a_2480(parameters.sig_user,parameters.sig_user,EnmUserType.enm_usertype_2144,EnmAppTypeID.enm_apptype_game_2144,szMemoryBuffer);
         }
         else if("weibo" == parameters.sitetype)
         {
            szMemoryBuffer = new ByteArray();
            a_2664.encode_string(szMemoryBuffer,parameters.sig_session_key,200);
            a_2545.getInstance().a_2480(parameters.sig_user,parameters.sig_user,EnmUserType.enm_usertype_weibo,EnmAppTypeID.enm_apptype_game_weibo,szMemoryBuffer);
         }
         else if("qq" == parameters.sitetype || "3366" == parameters.sitetype || "qqweibo" == parameters.sitetype)
         {
            szMemoryBuffer = new ByteArray();
            a_2664.encode_string(szMemoryBuffer,parameters.sig_session_key,200);
            a_2545.getInstance().a_2480(parameters.sig_user,parameters.sig_user,EnmUserType.enm_usertype_qq,EnmAppTypeID.enm_apptype_game_qq,szMemoryBuffer);
         }
         else if("duowan" == parameters.sitetype)
         {
            szMemoryBuffer = new ByteArray();
            a_2664.encode_string(szMemoryBuffer,parameters.sig_session_key,200);
            a_2545.getInstance().a_2480(parameters.sig_user,parameters.sig_user,EnmUserType.enm_usertype_duowan,EnmAppTypeID.enm_apptype_game_duowan,szMemoryBuffer);
         }
         else if("qqgame" == parameters.sitetype || "pps" == parameters.sitetype || "thunder" == parameters.sitetype || "joyyou" == parameters.sitetype || "7k7k" == parameters.sitetype || "360" == parameters.sitetype || "taiwan" == parameters.sitetype || "xinma" == parameters.sitetype || "aipai" == parameters.sitetype)
         {
            szMemoryBuffer = new ByteArray();
            a_2664.encode_string(szMemoryBuffer,parameters.sig_session_key,200);
            a_2545.getInstance().a_2480(parameters.sig_user,parameters.sig_user,EnmUserType.enm_usertype_7k7k,EnmAppTypeID.enm_apptype_game_7k7k,szMemoryBuffer);
         }
         else
         {
            a_2545.getInstance().a_2524().a_3744(GameStringManager.getInstance().getString(132612),GameStringManager.getInstance().getString(24578),true,false);
         }
         a_4648.a_4649("key=" + parameters.sig_session_key + ",mykey=" + parameters.myopenkey);
         HeartBeatProtocolHandler.a_2217();
         a_2208.a_2217();
         return true;
      }
   }
}

