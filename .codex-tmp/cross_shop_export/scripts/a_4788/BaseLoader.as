package a_4788
{
   import a_4781.Tool;
   import a_4782.a_4641;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLStream;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   
   public class BaseLoader extends EventDispatcher implements IBaseLoader
   {
      
      private var _tempData:Object;
      
      private var _requestTimeout:int = 86400000;
      
      private var _dataType:String;
      
      private var isLoading:Boolean = false;
      
      private var myTimeout:uint;
      
      private var httpErrorState:int;
      
      private var currentLoader:EventDispatcher;
      
      private var loader:Loader;
      
      private var urlLoader:URLLoader;
      
      private var urlStream:URLStream;
      
      public function BaseLoader()
      {
         super(null);
      }
      
      public function load(request:URLRequest = null, type:String = null, context:LoaderContext = null) : void
      {
         this.showDebugMsg("load>>url=" + request.url + ",type=" + type);
         if(this.isLoading)
         {
            this.close();
         }
         if(type == null)
         {
            type = ConstLoader.TYPE_URLSTREAM;
         }
         this._dataType = type;
         this.switchLoader(type);
         try
         {
            this.isLoading = true;
            this.addListeners(this.currentLoader);
            this.myTimeout = setTimeout(this.close,this._requestTimeout);
            switch(type)
            {
               case ConstLoader.TYPE_LOADER:
                  this.loader.load(request,context);
                  break;
               case ConstLoader.TYPE_URLSTREAM:
                  this.urlStream.load(request);
                  break;
               default:
                  this.urlLoader.dataFormat = this._dataType;
                  this.urlLoader.load(request);
            }
         }
         catch(error:Error)
         {
            isLoading = false;
            showDebugMsg("load Error>>" + error);
            dispatchEvent(new a_4641(a_4641.LOAD_ERROR,{"desc":"Unable to load requested document." + error}));
         }
      }
      
      public function close() : void
      {
         if(this.isLoading)
         {
            this.isLoading = false;
            clearTimeout(this.myTimeout);
            this.removeListeners(this.currentLoader);
            try
            {
               if(this.currentLoader is LoaderInfo)
               {
                  LoaderInfo(this.currentLoader).loader.close();
                  this.currentLoader = null;
               }
               else if(this.currentLoader is URLLoader)
               {
                  URLLoader(this.currentLoader).close();
               }
               else
               {
                  URLStream(this.currentLoader).close();
               }
            }
            catch(e:Error)
            {
               showDebugMsg("调用close方法失败>>" + e);
            }
         }
      }
      
      public function set requestTimeout(value:int) : void
      {
         this._requestTimeout = value;
      }
      
      public function get requestTimeout() : int
      {
         return this._requestTimeout;
      }
      
      public function set tempData(value:Object) : void
      {
         this._tempData = value;
      }
      
      public function get tempData() : Object
      {
         return this._tempData;
      }
      
      public function get dataType() : String
      {
         return this._dataType;
      }
      
      private function switchLoader(type:String) : void
      {
         switch(type)
         {
            case ConstLoader.TYPE_LOADER:
               this.loader = new Loader();
               this.currentLoader = this.loader.contentLoaderInfo;
               break;
            case ConstLoader.TYPE_URLSTREAM:
               if(this.urlStream == null)
               {
                  this.urlStream = new URLStream();
               }
               this.currentLoader = this.urlStream;
               break;
            default:
               if(this.urlLoader == null)
               {
                  this.urlLoader = new URLLoader();
               }
               this.currentLoader = this.urlLoader;
         }
      }
      
      private function addListeners(dispatcher:EventDispatcher) : void
      {
         if(!dispatcher.hasEventListener(Event.COMPLETE))
         {
            dispatcher.addEventListener(Event.COMPLETE,this.completeHandler);
         }
         if(!dispatcher.hasEventListener(HTTPStatusEvent.HTTP_STATUS))
         {
            dispatcher.addEventListener(HTTPStatusEvent.HTTP_STATUS,this.httpStatusHandler);
         }
         if(!dispatcher.hasEventListener(IOErrorEvent.IO_ERROR))
         {
            dispatcher.addEventListener(IOErrorEvent.IO_ERROR,this.ioErrorHandler);
         }
         if(!dispatcher.hasEventListener(Event.OPEN))
         {
            dispatcher.addEventListener(Event.OPEN,this.openHandler);
         }
         if(!dispatcher.hasEventListener(ProgressEvent.PROGRESS))
         {
            dispatcher.addEventListener(ProgressEvent.PROGRESS,this.progressHandler);
         }
         if(!dispatcher.hasEventListener(SecurityErrorEvent.SECURITY_ERROR))
         {
            dispatcher.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.securityErrorHandler);
         }
      }
      
      private function removeListeners(dispatcher:EventDispatcher) : void
      {
         if(dispatcher.hasEventListener(Event.COMPLETE))
         {
            dispatcher.removeEventListener(Event.COMPLETE,this.completeHandler);
         }
         if(dispatcher.hasEventListener(HTTPStatusEvent.HTTP_STATUS))
         {
            dispatcher.removeEventListener(HTTPStatusEvent.HTTP_STATUS,this.httpStatusHandler);
         }
         if(dispatcher.hasEventListener(IOErrorEvent.IO_ERROR))
         {
            dispatcher.removeEventListener(IOErrorEvent.IO_ERROR,this.ioErrorHandler);
         }
         if(dispatcher.hasEventListener(Event.OPEN))
         {
            dispatcher.removeEventListener(Event.OPEN,this.openHandler);
         }
         if(dispatcher.hasEventListener(ProgressEvent.PROGRESS))
         {
            dispatcher.removeEventListener(ProgressEvent.PROGRESS,this.progressHandler);
         }
         if(dispatcher.hasEventListener(SecurityErrorEvent.SECURITY_ERROR))
         {
            dispatcher.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.securityErrorHandler);
         }
      }
      
      private function completeHandler(a_4730:Event) : void
      {
         var value:* = undefined;
         this.showDebugMsg("completeHandler");
         if(this.currentLoader is URLStream)
         {
            value = new ByteArray();
            URLStream(this.currentLoader).readBytes(value);
         }
         else if(this.currentLoader is LoaderInfo)
         {
            value = LoaderInfo(this.currentLoader).loader;
         }
         else
         {
            value = URLLoader(this.currentLoader).data;
            if(!(value is String))
            {
               value = Tool.a_4653(value);
            }
         }
         this.close();
         dispatchEvent(new a_4641(a_4641.a_1124,value));
      }
      
      private function openHandler(a_4730:Event) : void
      {
         this.showDebugMsg("openHandler");
         clearTimeout(this.myTimeout);
      }
      
      private function progressHandler(a_4730:ProgressEvent) : void
      {
         dispatchEvent(new a_4641(a_4641.LOAD_PROGRESS,{
            "bytesLoaded":a_4730.bytesLoaded,
            "bytesTotal":a_4730.bytesTotal,
            "target":this.currentLoader
         }));
      }
      
      private function securityErrorHandler(a_4730:SecurityErrorEvent) : void
      {
         this.showDebugMsg("securityErrorHandler");
         this.close();
         dispatchEvent(new a_4641(a_4641.LOAD_ERROR,{
            "desc":"SecurityError",
            "code":-1
         }));
      }
      
      private function httpStatusHandler(a_4730:HTTPStatusEvent) : void
      {
         if(a_4730.status * 1 >= 400)
         {
            this.showDebugMsg("httpError");
            clearTimeout(this.myTimeout);
            this.httpErrorState = a_4730.status;
            dispatchEvent(new a_4641(a_4641.HTTP_ERROR,a_4730.status));
         }
         else
         {
            this.showDebugMsg("httpStatusHandler>status=" + a_4730.status);
         }
      }
      
      private function ioErrorHandler(a_4730:IOErrorEvent) : void
      {
         this.showDebugMsg("ioErrorHandler");
         this.close();
         dispatchEvent(new a_4641(a_4641.LOAD_ERROR,{
            "desc":"IOError",
            "code":this.httpErrorState
         }));
      }
      
      private function showDebugMsg(msg:String) : void
      {
      }
   }
}

