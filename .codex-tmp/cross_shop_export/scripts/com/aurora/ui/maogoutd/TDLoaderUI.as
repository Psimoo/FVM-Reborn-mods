package com.aurora.ui.maogoutd
{
   import a_4714.AssetType;
   import a_4714.AssetsItemData;
   import a_4714.AssetsLoader;
   import a_4716.a_1733;
   import a_4716.b_154;
   import a_4729.EventType;
   import a_4752.a_2027;
   import a_4752.a_2037;
   import a_4754.a_1825;
   import a_4754.a_2161;
   import a_4757.a_2200;
   import a_4759.ITDCore;
   import a_4763.a_2439;
   import a_4781.a_4713;
   import a_4781.b_212;
   import a_4782.a_4641;
   import com.aurora.ui.maogoutd.ClientLog.MessageTipHandler;
   import com.aurora.ui.maogoutd.ClientLog.SendCountInfoHandle;
   import com.aurora.ui.maogoutd.doctor.GameDoctor;
   import com.aurora.ui.maogoutd.version.VersionMD5;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.MouseEvent;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.net.navigateToURL;
   import flash.net.sendToURL;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.ui.ContextMenu;
   import flash.utils.Dictionary;
   
   public class TDLoaderUI extends Sprite
   {
      
      public static var m_strTotalVersion:String = "&TotalVersion=1.0";
      
      private var a_893:XML;
      
      private var a_895:Array = [];
      
      public var loadingNumMc:MovieClip;
      
      public var loadmc:MovieClip;
      
      public var loadmask:MovieClip;
      
      public var zimc:MovieClip;
      
      public var catMc:MovieClip;
      
      public var loadbg:MovieClip;
      
      public var dialog_mc:MovieClip;
      
      private var myLoader:AssetsLoader;
      
      private var baseURL:String = "";
      
      private var bg_url:String = "images/loadingbg.jpg";
      
      private var m_iGroupID:int = 1;
      
      private var m_stage:DisplayObjectContainer;
      
      public var doctorBtn:SimpleButton;
      
      public function TDLoaderUI()
      {
         super();
         this.addEventListener(Event.ADDED_TO_STAGE,this.a_4587);
         this.loadBG();
      }
      
      private function a_4587(e:Event) : void
      {
         var stTest:b_154 = null;
         var paramet:String = null;
         trace("22222");
         this.m_stage = stage;
         if(!stage.loaderInfo.parameters.hasOwnProperty("gateway_ip"))
         {
            for each(paramet in root.loaderInfo.parameters)
            {
               stage.loaderInfo.parameters[paramet] = root.loaderInfo.parameters[paramet];
            }
         }
         var contextMenuObj:ContextMenu = new ContextMenu();
         contextMenuObj.hideBuiltInItems();
         this.contextMenu = contextMenuObj;
         this.removeChild(this.dialog_mc);
         this.removeChild(this.loadbg);
         this.removeChild(this.loadmc);
         this.removeChild(this.catMc);
         this.removeChild(this.loadingNumMc);
         this.removeChild(this.loadmask);
         this.removeChild(this.zimc);
         this.doctorBtn.addEventListener(MouseEvent.CLICK,this.onDoctorClick);
         this.AddEnmClass();
         EventType.a_659;
         a_2037.getInstance();
         var iType:int = a_1733.enm_luliaohuayuanA;
         a_2161.e;
         a_1825.e;
         MessageTipHandler.Get();
         a_2027.getInstance();
         m_strTotalVersion = Boolean(null != stage.loaderInfo.parameters.TotalVersion) ? stage.loaderInfo.parameters.TotalVersion : m_strTotalVersion;
         var paramters:Object = stage.loaderInfo.parameters;
         SendCountInfoHandle.Get().m_bIsFristPlay = paramters["first_time"] == "1" ? true : false;
         SendCountInfoHandle.Get().UserID = paramters["sig_user"];
         SendCountInfoHandle.Get().SiteType = paramters["sitetype"];
         SendCountInfoHandle.Get().GroupID = paramters["group_id"];
         SendCountInfoHandle.Get().SendLog(2001);
      }
      
      private function AddEnmClass() : void
      {
      }
      
      private function onDoctorClick(e:MouseEvent) : void
      {
         var randomNum:Number = Math.random() * 999999;
         navigateToURL(new URLRequest("TDDoctor.html?" + String(randomNum)),"_blank");
      }
      
      private function a_4548(e:Event) : void
      {
      }
      
      private function loadBG() : void
      {
         var loader:Loader = new Loader();
         loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.completeHandler);
         loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.ioErrorHandler);
         var base_url:String = stage.loaderInfo.parameters.base_url;
         base_url = base_url == null ? "" : base_url;
         loader.load(new URLRequest(base_url + this.bg_url + "?v=" + stage.loaderInfo.parameters.v));
      }
      
      private function completeHandler(a_4730:Event) : void
      {
         a_4730.target.removeEventListener(Event.COMPLETE,this.completeHandler);
         a_4730.target.removeEventListener(IOErrorEvent.IO_ERROR,this.ioErrorHandler);
         this.addChild(a_4730.target.loader);
         this.initialize();
      }
      
      private function ioErrorHandler(a_4730:IOErrorEvent) : void
      {
         a_4730.target.removeEventListener(Event.COMPLETE,this.completeHandler);
         a_4730.target.removeEventListener(IOErrorEvent.IO_ERROR,this.ioErrorHandler);
         this.initialize();
      }
      
      private function onPost() : void
      {
         var params:URLVariables = null;
         var request:URLRequest = null;
         if(stage != null && Boolean(stage.loaderInfo.parameters))
         {
            this.a_895["sitetype"] = stage.loaderInfo.parameters.sitetype;
            if(stage.loaderInfo.parameters.sitetype == "shengda")
            {
               params = new URLVariables();
               params.uid = root.loaderInfo.parameters.sig_user;
               params.percent = 1;
               request = new URLRequest("http://misc.meishiapp.sdo.com/?a=user");
               request.method = URLRequestMethod.POST;
               request.data = params;
               sendToURL(request);
            }
         }
      }
      
      private function initialize() : void
      {
         if(root.loaderInfo.parameters.group_id != null)
         {
            this.m_iGroupID = root.loaderInfo.parameters.group_id;
         }
         this.baseURL = root.loaderInfo.parameters.base_url;
         this.a_895["iGroupID"] = this.m_iGroupID;
         if(this.baseURL == null)
         {
            this.baseURL = "";
         }
         this.a_895["szBaseUrl"] = this.baseURL;
         stage.frameRate = 12;
         this.addChild(this.loadbg);
         this.addChild(this.zimc);
         this.addChild(this.loadingNumMc);
         this.addChild(this.loadmc);
         this.addChild(this.loadmask);
         this.loadmc.mask = this.loadmask;
         this.addChild(this.catMc);
         this.doctorBtn.x = 20;
         this.doctorBtn.y = 540;
         stage.addChild(this.doctorBtn);
         var nowdate:Date = new Date();
         var url:String = "LoadFilesList.xml?version=" + Math.round(nowdate.getTime() / 1000).toString();
         var dict:Dictionary = new Dictionary();
         dict["LoadFilesList"] = new AssetsItemData(url,AssetType.TXT,"LoadFilesList");
         dict["LoadFilesList"].retryTime = 5;
         this.myLoader = new AssetsLoader();
         this.myLoader.load(dict,{"onComplete":this.complete});
      }
      
      private function complete(p_dict:Dictionary) : void
      {
         var dict:Dictionary = null;
         var MapFilePackage:XML = null;
         var a_1203:Dictionary = null;
         var versionXml:XML = null;
         var versionUrl:String = null;
         var url:String = null;
         this.a_893 = new XML(a_4713.xmlStringFormat(p_dict["LoadFilesList"].data as String));
         this.onPost();
         if(this.a_893 != null)
         {
            dict = new Dictionary(true);
            this.parseConfigFile(this.a_893.ConfigFile[0],dict);
            MapFilePackage = this.a_893.Map.Item.(@name == "MapPackage")[0];
            if(MapFilePackage != null)
            {
               url = this.a_893.Map.@baseurl + MapFilePackage.@url + "?v=" + MapFilePackage.@version;
               dict["MapFilePackage"] = new AssetsItemData(url,AssetType.ZIP,"MapFilePackage");
               dict["MapFilePackage"].retryTime = 5;
            }
            this.parseSWFFile(this.a_893.SWFFile[0],dict);
            if(this.a_893.DefCard != undefined)
            {
               this.a_895["DefCardsPackage"] = a_4713.getNodeAttributes(this.a_893.DefCard.Item.(@name == "DefCardsPackage")[0]);
               this.a_895["DefCardsPackage"].baseurl = this.a_893.DefCard.@baseurl;
            }
            if(this.a_893.PreviewMouse != undefined)
            {
               this.a_895["PreviewMousePackage"] = a_4713.getNodeAttributes(this.a_893.PreviewMouse.Item.(@name == "PreviewMousePackage")[0]);
               this.a_895["PreviewMousePackage"].baseurl = this.a_893.PreviewMouse.@baseurl;
            }
            a_1203 = new Dictionary(true);
            for each(versionXml in this.a_893.Version.Item)
            {
               versionUrl = this.a_893.Version.@baseurl + versionXml.@url + "?v=" + versionXml.@version;
               VersionMD5.Get().a_1203[String(versionXml.@url)] = String(versionXml.@version);
               a_1203[versionXml.@name + ""] = versionUrl;
            }
            for each(versionXml in this.a_893.Version.Item)
            {
               VersionMD5.Get().a_1203[String(versionXml.@url)] = String(versionXml.@version);
            }
            this.a_895["version"] = a_1203;
            this.myLoader.addEventListener(a_4641.a_1124,this.onSingleFileCom);
            this.myLoader.addEventListener(a_4641.LOAD_PROGRESS,this.onSingleFilePro);
            this.myLoader.addEventListener(a_4641.LOAD_ERROR,this.onSingleFileError);
            this.myLoader.load(dict,{
               "onComplete":this.InitializeAll,
               "onProgress":this.onLoadProgress
            });
         }
      }
      
      private function onSingleFileCom(e:a_4641) : void
      {
         var obj:Object = {};
         obj.id = e.value.id;
         GameDoctor.instance.pushInCache({
            "type":"l",
            "isCompleted":true
         },obj.id,"",{"msg":"Complete!"});
      }
      
      private function onSingleFilePro(e:a_4641) : void
      {
         var obj:Object = {};
         obj.id = e.value.id;
         GameDoctor.instance.pushInCache({
            "type":"l",
            "isCompleted":false
         },obj.id,"",e.value.thisLoadedData);
      }
      
      private function onSingleFileError(e:a_4641) : void
      {
         var obj:Object = {};
         obj.id = e.value.id;
         GameDoctor.instance.pushInCache({
            "type":"l",
            "isCompleted":true
         },obj.id,"",{"msg":"Error!"});
      }
      
      private function onLoadProgress(data:Object) : void
      {
         var percentDone:Number = Number(data.totalPercent);
         var loadNum:int = Math.round(percentDone * 100);
         if(loadNum > 100)
         {
            loadNum = 100;
         }
         this.printProgress(loadNum);
      }
      
      private function printProgress(loadNum:int) : void
      {
         var percent:int = loadNum + 1;
         if(percent < 1)
         {
            percent = 1;
         }
         else if(percent > 101)
         {
            percent = 101;
         }
         this.loadingNumMc.gotoAndStop(loadNum + 1);
         this.loadmc.x = this.loadmask.x - this.loadmc.width + int(this.loadmc.width * (loadNum / 100));
         this.catMc.x = this.loadmc.x + this.loadmc.width;
      }
      
      private function InitializeAll(dict:Dictionary) : Boolean
      {
         b_212.a_3014(this.stage);
         this.loaderDataInit(dict);
         this.printProgress(100);
         this.myLoader = null;
         this.cacheAsBitmap = false;
         var pTDCore:ITDCore = this.a_895["TDCore"] as ITDCore;
         if(null == pTDCore)
         {
            trace("pTDCore is null, InitializeAll faild.");
            GameDoctor.instance.pushInCache({"type":"ce"},"error#001, InitializeAll faild.","pTDCore is null, InitializeAll faild.",{"cpShow":true});
            return false;
         }
         var strGatewayIP:String = stage.loaderInfo.parameters.gateway_ip ? stage.loaderInfo.parameters.gateway_ip : "";
         var iGatewayPort:int = stage.loaderInfo.parameters.gateway_port ? int(stage.loaderInfo.parameters.gateway_port) : 443;
         if(!pTDCore.parseConfigFiles(this.a_895,strGatewayIP,iGatewayPort))
         {
            trace("parseConfigFiles failed, InitializeAll faild.");
            return false;
         }
         a_2439.getInstance().m_szCurrentTime = stage.loaderInfo.parameters.current_time.toString();
         a_2439.getInstance().m_szExtSign = stage.loaderInfo.parameters.ext_sign.toString();
         var pLobbyUI:ITDLobbyUI = this.a_895["TDLobbyCoreUI"] as ITDLobbyUI;
         if(null == pLobbyUI)
         {
            trace("pLobbyUI is null, InitializeAll faild.");
            GameDoctor.instance.pushInCache({"type":"ce"},"error#002, InitializeAll faild.","pLobbyUI is null, InitializeAll faild.",{"cpShow":true});
            return false;
         }
         this.a_895["TDLoaderUI"] = this;
         var m_isYellowGem:int = 0;
         m_isYellowGem = int(root.loaderInfo.parameters.is_vip);
         this.a_895["m_isYellowGem"] = m_isYellowGem == 0 ? false : true;
         var m_isYearYellowGem:int = 0;
         m_isYearYellowGem = int(root.loaderInfo.parameters.is_year_vip);
         this.a_895["m_isYearYellowGem"] = m_isYearYellowGem == 0 ? false : true;
         this.a_895["m_iYellowGemLevel"] = root.loaderInfo.parameters.vip_level;
         this.a_895["pfkey"] = root.loaderInfo.parameters.pfkey;
         this.a_895["pf"] = root.loaderInfo.parameters.pf;
         this.a_895["m_iFm"] = root.loaderInfo.parameters.fm;
         this.a_895["m_iFcm"] = root.loaderInfo.parameters.fcm;
         this.a_895["m_prove_gift"] = root.loaderInfo.parameters.prove_gift;
         this.a_895["m_iDemo"] = root.loaderInfo.parameters.is_normal_login;
         this.a_895["m_iLoginDuration"] = root.loaderInfo.parameters.duration;
         this.a_895["m_iMicroClient"] = root.loaderInfo.parameters.client;
         this.a_895["m_MicroGift"] = root.loaderInfo.parameters.client_gift;
         if(null == this.a_895["m_iLoginDuration"])
         {
            this.a_895["m_iLoginDuration"] = 0;
         }
         if(null == this.a_895["m_iYellowGemLevel"])
         {
            this.a_895["m_iYellowGemLevel"] = 0;
         }
         if(null == this.a_895["m_iFm"])
         {
            this.a_895["m_iFm"] = 0;
         }
         this.a_895["m_szFigureurl"] = root.loaderInfo.parameters.figureurl;
         this.a_895["m_szNickname"] = root.loaderInfo.parameters.nickname;
         this.a_895["m_szTxZone"] = root.loaderInfo.parameters.tx_zone;
         this.a_895["m_iClientIP"] = root.loaderInfo.parameters.abc;
         a_2200.getInstance().parameters = root.loaderInfo.parameters;
         if(!pLobbyUI.a_2120(pTDCore.a_2229(),this.a_895))
         {
            trace("pLobbyUI.SetLobbyLogic failed, InitializeAll faild.");
            GameDoctor.instance.pushInCache({"type":"ce"},"error#003, InitializeAll faild.","pLobbyUI.SetLobbyLogic failed, InitializeAll faild.",{"cpShow":true});
            return false;
         }
         if(!pLobbyUI.a_3742(this.a_895["TDGameCoreUI"]))
         {
            trace("pTDCore.SetTDGameUIByteArray failed, InitializeAll faild.");
            GameDoctor.instance.pushInCache({"type":"ce"},"error#004, InitializeAll faild.","pTDCore.SetTDGameUIByteArray failed, InitializeAll faild.",{"cpShow":true});
            return false;
         }
         if(!pTDCore.a_2230(pLobbyUI))
         {
            trace("pTDCore.SetLobbyView failed, InitializeAll faild.");
            GameDoctor.instance.pushInCache({"type":"ce"},"error#005, InitializeAll faild.","pTDCore.SetLobbyView failed, InitializeAll faild.",{"cpShow":true});
            return false;
         }
         if(!pTDCore.a_2234(root.loaderInfo.parameters))
         {
            trace("pTDCore.StartRun failed, InitializeAll faild.");
            GameDoctor.instance.pushInCache({"type":"ce"},"error#006, InitializeAll faild.","pTDCore.StartRun failed, InitializeAll faild.",{"cpShow":true});
            return false;
         }
         stage.addChild(this.a_895["TDLobbyCoreUI"] as DisplayObject);
         SendCountInfoHandle.Get().SendLog(2002);
         trace("InitializeAll()");
         return true;
      }
      
      private function parseConfigFile(dataNode:XML, dict:Dictionary) : void
      {
         var url:String = null;
         var item:XML = null;
         var version:String = null;
         var assetType:int = 0;
         var itemName:String = "";
         var szBaseUrl:String = this.a_895["szBaseUrl"] + dataNode.@baseurl;
         for each(item in dataNode.Item)
         {
            itemName = item.@name + "";
            version = item.@version;
            assetType = AssetType.TXT;
            if("zh_CN.xml" == itemName)
            {
               url = dataNode.@baseurl + item.@url + "?v=" + version;
            }
            else if("Authenticate.xml" == itemName)
            {
               url = szBaseUrl + item.@url + "?v=" + version;
            }
            else if(itemName == "ConfigFilePackage")
            {
               url = szBaseUrl + item.@url + "?v=" + version;
               assetType = AssetType.ZIP;
            }
            else if("LogicServer" == itemName || "HallServer" == itemName || "tagger" == itemName || "open_mode" == itemName)
            {
               url = szBaseUrl + this.m_iGroupID + "/" + item.@url;
               url += "?v=" + version;
            }
            else
            {
               url = szBaseUrl + item.@url;
               url += "?v=" + version;
            }
            if("task" == itemName)
            {
               assetType = AssetType.ZIP;
               dict[itemName] = new AssetsItemData(url,assetType,itemName,"",null,true,"utf-8",null,false);
            }
            else
            {
               dict[itemName] = new AssetsItemData(url,assetType,itemName);
            }
            dict[itemName].retryTime = 5;
         }
      }
      
      private function parseSWFFile(dataNode:XML, dict:Dictionary) : void
      {
         var url:String = null;
         var temp:* = undefined;
         var isPackage:Boolean = false;
         var itemUI:XML = null;
         isPackage = dataNode.Item.(@name == "SWFFilePackage") != undefined;
         for each(itemUI in dataNode.Item)
         {
            temp = itemUI.@name + "";
            url = dataNode.@baseurl + itemUI.@url + "?v=" + itemUI.@version;
            if("0x0203" == itemUI.@id)
            {
               dict[itemUI.@name + ""] = new AssetsItemData(url,AssetType.SWF,itemUI.@name + "","",null,true,"utf-8",null,false);
               dict[itemUI.@name + ""].retryTime = 5;
            }
            else if("SWFFilePackage" == temp)
            {
               url = dataNode.@baseurl + itemUI.@url + "?v=" + itemUI.@version;
               dict["SWFFilePackage"] = new AssetsItemData(url,AssetType.ZIP,"SWFFilePackage","","",true,"utf-8");
               dict["SWFFilePackage"].retryTime = 5;
            }
            else if(isPackage)
            {
               temp = itemUI.@url + "";
               this.a_895[temp] = a_4713.getNodeAttributes(itemUI);
            }
            else
            {
               dict[temp] = new AssetsItemData(url,AssetType.SWF,temp,"","",true,"utf-8",new LoaderContext(false,ApplicationDomain.currentDomain));
               dict[temp].retryTime = 5;
            }
         }
      }
      
      private function loaderDataInit(dict:Dictionary) : void
      {
         var itemName:String = null;
         for(itemName in dict)
         {
            if("ConfigFilePackage" == itemName || "SWFFilePackage" == itemName || "task" == itemName)
            {
               this.a_4549(dict[itemName].data,itemName);
            }
            else if("MapFilePackage" == itemName)
            {
               this.MapFilePackageInit(dict[itemName].data);
            }
            else if(dict[itemName].data is String)
            {
               try
               {
                  this.a_895[itemName] = new XML(a_4713.xmlStringFormat(dict[itemName].data as String));
               }
               catch(e:Error)
               {
                  throw new Error(itemName + "文件格式错误！");
               }
            }
            else
            {
               this.a_895[itemName] = dict[itemName].data;
            }
         }
      }
      
      private function a_4549(dict:Dictionary, tag:String) : void
      {
         var k:String = null;
         var errorItem:String = "";
         for(k in dict)
         {
            this.a_895[k] = dict[k];
            if(dict[k] == null)
            {
               errorItem += "(" + k + ")";
            }
         }
         if(errorItem != "")
         {
            throw new Error("ZIP File[" + tag + "]" + errorItem + "handle failed!");
         }
      }
      
      private function MapFilePackageInit(dict:Dictionary) : void
      {
         var k:String = null;
         var n:String = null;
         for(k in dict)
         {
            n = "";
            if(k.indexOf("vs/") == 0)
            {
               n = k.substring(k.lastIndexOf("/") + 1,k.lastIndexOf(".")) + "vs";
            }
            else
            {
               n = k.substring(k.lastIndexOf("/") + 1,k.lastIndexOf(".")) + "vc";
            }
            this.a_895[n] = dict[k];
            delete dict[k];
         }
      }
   }
}

