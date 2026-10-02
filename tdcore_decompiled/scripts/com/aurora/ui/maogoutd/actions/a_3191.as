package com.aurora.ui.maogoutd.actions
{
   import a_4752.GameStringManager;
   import a_4752.a_2036;
   import a_4752.a_2047;
   import a_4781.a_4652;
   import com.adobe.serialization.json.JSON;
   import com.adobe.serialization.json.JSONParseError;
   import com.aurora.ui.maogoutd.component.dialog.Dialog;
   import com.aurora.ui.maogoutd.component.dialog.IDialog;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.utils.Dictionary;
   
   public class a_3191 extends EventDispatcher
   {
      
      private static var _instance:a_3191;
      
      private var waitArr:Array;
      
      private var dict:Dictionary;
      
      private var baseUrl:String = "";
      
      private var urls:Array;
      
      private var reqID:Number = 0;
      
      private var dialog:IDialog;
      
      public function a_3191(se:SingletonEnforcer)
      {
         super();
         this.waitArr = new Array();
         this.dict = new Dictionary(true);
         this.dialog = Dialog.getInstance();
      }
      
      public static function getInstance() : a_3191
      {
         if(_instance == null)
         {
            _instance = new a_3191(new SingletonEnforcer());
         }
         return _instance;
      }
      
      public function getURLs(xml:XML) : void
      {
         var node:XML = null;
         var item:XML = null;
         var obj:Object = null;
         if(this.urls == null)
         {
            this.urls = new Array();
         }
         this.urls.length = 0;
         for each(node in xml..node)
         {
            for each(item in node.item)
            {
               obj = {};
               obj.baseUrl = String(node.@baseUrl);
               obj.subUrl = String(item.@subUrl);
               this.urls[int(item.@index)] = obj;
            }
         }
      }
      
      public function pushRequest(instance:*, params:Object, method:Function) : void
      {
         this.waitArr.push({
            "ins":instance,
            "pa":params,
            "me":method,
            "requestID":++this.reqID
         });
      }
      
      public function sendRequest(instance:*, params:Object, method:Function, isShowTip:Boolean = false, tipMsg:String = "") : void
      {
         if(isShowTip)
         {
            this.showTip(instance,tipMsg);
         }
         this.waitArr.unshift({
            "ins":instance,
            "pa":params,
            "me":method,
            "requestID":++this.reqID
         });
         this.sendNext();
      }
      
      public function sendAllRequests() : void
      {
         if(this.waitArr.length > 0)
         {
            this.sendNext();
         }
      }
      
      private function sendNext() : void
      {
         var key:String = null;
         var urlRequest:URLRequest = null;
         var loader:URLLoader = null;
         var requestObj:Object = this.waitArr.shift();
         requestObj.pa.original_uin = a_2036.getInstance().m_iUin;
         requestObj.pa.signature = a_2036.getInstance().a_783;
         if(a_2047.getConfigData(this.urls[requestObj.pa.URLType].baseUrl) != null)
         {
            this.baseUrl = a_2047.getConfigData(this.urls[requestObj.pa.URLType].baseUrl).url;
         }
         var vars:URLVariables = new URLVariables();
         for(key in requestObj.pa)
         {
            if(key != "URLType")
            {
               vars[key] = requestObj.pa[key];
            }
         }
         urlRequest = new URLRequest();
         urlRequest.method = URLRequestMethod.POST;
         urlRequest.url = this.baseUrl + this.urls[requestObj.pa.URLType].subUrl;
         urlRequest.data = vars;
         loader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.TEXT;
         loader.addEventListener(Event.COMPLETE,this.onComplete);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.onIOError);
         loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onSecurityError);
         loader.load(urlRequest);
         this.dict[loader] = {
            "instance":requestObj.ins,
            "params":requestObj.pa,
            "method":requestObj.me
         };
      }
      
      private function onComplete(e:Event) : void
      {
         var xml:XML = null;
         var obj:Object = null;
         var loader:URLLoader = e.target as URLLoader;
         loader.removeEventListener(Event.COMPLETE,this.onComplete);
         loader.removeEventListener(IOErrorEvent.IO_ERROR,this.onIOError);
         loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onSecurityError);
         if(this.dict[loader] != null)
         {
            if(a_4652.getInstance().startsWith(e.target.data,"<?xml version=\"1.0\" encoding=\"utf-8\"?>"))
            {
               xml = new XML(e.target.data);
               (this.dict[loader].method as Function).apply(this.dict[loader],[{
                  "params":this.dict[loader].params,
                  "data":xml
               }]);
            }
            else if(a_4652.getInstance().startsWith(e.target.data,"{"))
            {
               try
               {
                  obj = com.adobe.serialization.json.JSON.decode(e.target.data) as Object;
               }
               catch(e:JSONParseError)
               {
                  obj = {};
                  obj.result_id = -1;
                  obj.msg = GameStringManager.getInstance().getString(131880);
               }
               (this.dict[loader].method as Function).apply(this.dict[loader],[{
                  "params":this.dict[loader].params,
                  "data":obj
               }]);
            }
            else
            {
               (this.dict[loader].method as Function).apply(this.dict[loader],[{
                  "params":this.dict[loader].params,
                  "data":e.target.data
               }]);
            }
         }
         delete this.dict[loader];
         if(this.waitArr.length > 0)
         {
            this.sendNext();
         }
      }
      
      private function onIOError(e:IOErrorEvent) : void
      {
         trace(e.target.data);
         var loader:URLLoader = e.target as URLLoader;
         (this.dict[loader].method as Function).apply(this.dict[loader],[{
            "params":this.dict[loader].params,
            "data":{
               "result_id":-1,
               "msg":"ioError"
            }
         }]);
         loader.removeEventListener(Event.COMPLETE,this.onComplete);
         loader.removeEventListener(IOErrorEvent.IO_ERROR,this.onIOError);
         loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onSecurityError);
         delete this.dict[loader];
         if(this.waitArr.length > 0)
         {
            this.sendNext();
         }
      }
      
      private function onSecurityError(e:SecurityErrorEvent) : void
      {
         trace(e.target.data);
         var loader:URLLoader = e.target as URLLoader;
         (this.dict[loader].method as Function).apply(this.dict[loader],[{
            "params":this.dict[loader].params,
            "data":{
               "result_id":-1,
               "msg":"SecurityError"
            }
         }]);
         loader.removeEventListener(Event.COMPLETE,this.onComplete);
         loader.removeEventListener(IOErrorEvent.IO_ERROR,this.onIOError);
         loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onSecurityError);
         delete this.dict[loader];
         if(this.waitArr.length > 0)
         {
            this.sendNext();
         }
      }
      
      private function showTip(p:DisplayObject, msg:String) : void
      {
         if(msg == "")
         {
            msg = GameStringManager.getInstance().getString(24632);
         }
         this.dialog.content = msg;
         this.dialog.showTip(p.parent,GameStringManager.getInstance().getString(24577),true,false,false,false);
      }
   }
}

class SingletonEnforcer
{
   
   public function SingletonEnforcer()
   {
      super();
   }
}
