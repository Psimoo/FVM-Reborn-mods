package a_4774
{
   import a_4719.EnmLoaderType;
   import a_4725.AurLoadTask;
   import a_4728.a_1778;
   import a_4729.EventType;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.system.SecurityDomain;
   
   public class a_3004 extends EventDispatcher
   {
      
      private static var _aurLoaderInstance:a_3004;
      
      private static var _waitLoadList:Array = [];
      
      private static var _isLoading:Boolean = false;
      
      private static var _totalTaskNum:int = 0;
      
      private static var a_884:Array = [];
      
      private static var a_885:Array = [];
      
      public static var a_886:int = 8;
      
      private var _dataObj:Object;
      
      private var _currentTask:AurLoadTask;
      
      public function a_3004()
      {
         super();
      }
      
      public static function get isLoading() : Boolean
      {
         return _isLoading;
      }
      
      public static function get arrLoadingTaskLoader() : Array
      {
         return a_884;
      }
      
      public static function get arrLoadingTask() : Array
      {
         return a_885;
      }
      
      public static function getInstance() : a_3004
      {
         if(_aurLoaderInstance == null)
         {
            _aurLoaderInstance = new a_3004();
         }
         return _aurLoaderInstance;
      }
      
      public static function addLoadTask(filePath:String, type:int = 2, loader:Loader = null, isCheckPolicyFile:Boolean = false, isAddToCurrentAppDomain:Boolean = false, isAddToCurrentSecurityDomain:Boolean = false) : Boolean
      {
         if(filePath == null)
         {
            trace("addLoadTask failed: filePath is null");
            return false;
         }
         if(type == EnmLoaderType.a_502 && loader == null)
         {
            trace("addLoadTask failed: loader can not be null");
            return false;
         }
         var taskObject:AurLoadTask = new AurLoadTask();
         taskObject.type = type;
         taskObject.url = filePath;
         if(type == EnmLoaderType.a_502)
         {
            taskObject.loader = loader;
            taskObject.isAddToCurrentAppDomain = isAddToCurrentAppDomain;
            taskObject.isAddToCurrentSecurityDomain = isAddToCurrentSecurityDomain;
            taskObject.isCheckPolicyFile = isCheckPolicyFile;
         }
         return addLoadTaskByObject(taskObject);
      }
      
      public static function addLoadTaskByObject(loadTaskObj:AurLoadTask) : Boolean
      {
         if(loadTaskObj == null || loadTaskObj.url == null)
         {
            trace("Error: loadTaskObj or url is null!");
            return false;
         }
         if(loadTaskObj.type == EnmLoaderType.a_502 && loadTaskObj.loader == null)
         {
            trace("addLoadTaskByObject failed: loader can not be null");
            return false;
         }
         if(_isLoading)
         {
            trace("addLoadTaskByObject failed: Loader is loading now.");
            return false;
         }
         _waitLoadList.push(loadTaskObj);
         return true;
      }
      
      public static function addLoadTaskWhenLoadingByObject(loadTaskObj:AurLoadTask) : Boolean
      {
         if(loadTaskObj == null || loadTaskObj.url == null)
         {
            trace("Error: loadTaskObj or url is null!");
            return false;
         }
         if(loadTaskObj.type == EnmLoaderType.a_502 && loadTaskObj.loader == null)
         {
            trace("addLoadTaskByObject failed: loader can not be null");
            return false;
         }
         _waitLoadList.push(loadTaskObj);
         _totalTaskNum += 1;
         return true;
      }
      
      public static function startLoad() : Boolean
      {
         if(_waitLoadList.length == 0 || _isLoading)
         {
            trace("startLoad Failed: _waitLoadList.length[" + _waitLoadList.length + "] is 0 or _isLoading[" + _isLoading + "] is true;");
            return false;
         }
         _isLoading = true;
         _totalTaskNum = _waitLoadList.length;
         var dataEvent:a_1778 = new a_1778(EventType.a_648);
         dataEvent.dataObject = _waitLoadList.length;
         getInstance().dispatchEvent(dataEvent);
         getInstance().addEventListener(Event.COMPLETE,getInstance().load);
         getInstance().load(new Event(EventType.a_648));
         return true;
      }
      
      public function loadFileToLoader(stLoader:Loader, fileUrl:String, isCheckPolicyFile:Boolean = false, isAddToCurrentAppDomain:Boolean = false, isAddToCurrentSecurityDomain:Boolean = false, stUserDefineAppDoman:ApplicationDomain = null, stUserDefineSecurityDomain:SecurityDomain = null) : Boolean
      {
         var stLoadingTask:AurLoadTask = null;
         var loadTask:AurLoadTask = null;
         if(stLoader == null || fileUrl == null)
         {
            trace("loadFileToLoader failed: stLoader or fileUrl is null");
            return false;
         }
         var loadContext:LoaderContext = new LoaderContext(isCheckPolicyFile);
         if(isAddToCurrentAppDomain)
         {
            loadContext.applicationDomain = ApplicationDomain.currentDomain;
         }
         else if(null != stUserDefineAppDoman)
         {
            loadContext.applicationDomain = stUserDefineAppDoman;
         }
         else
         {
            loadContext.applicationDomain = new ApplicationDomain(ApplicationDomain.currentDomain);
         }
         if(isAddToCurrentSecurityDomain)
         {
            loadContext.securityDomain = SecurityDomain.currentDomain;
         }
         else if(null != stUserDefineSecurityDomain)
         {
            loadContext.securityDomain = stUserDefineSecurityDomain;
         }
         stLoader.load(new URLRequest(fileUrl),loadContext);
         stLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.a_3005);
         stLoader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,this.a_3009);
         stLoader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.a_3008);
         this._dataObj = stLoader;
         var isExistInTaskArray:Boolean = false;
         for each(stLoadingTask in a_885)
         {
            if(stLoadingTask.loader == stLoader)
            {
               isExistInTaskArray = true;
               break;
            }
         }
         if(!isExistInTaskArray)
         {
            loadTask = new AurLoadTask();
            loadTask.name = fileUrl;
            loadTask.url = fileUrl;
            loadTask.type = EnmLoaderType.a_502;
            loadTask.loader = stLoader;
            loadTask.isAddToCurrentAppDomain = isAddToCurrentAppDomain;
            loadTask.stUserDefineAppDoman = stUserDefineAppDoman;
            a_885.push(loadTask);
         }
         return true;
      }
      
      public function loadXMLFILE(fileUrl:String, stUrlLoader:URLLoader = null) : Boolean
      {
         var stLoadingTask:AurLoadTask = null;
         var loadTask:AurLoadTask = null;
         if(fileUrl == null)
         {
            trace("loadXMLFILE failed: fileUrl is null");
            return false;
         }
         var urlRequst:URLRequest = new URLRequest(fileUrl);
         if(null == stUrlLoader)
         {
            stUrlLoader = new URLLoader();
         }
         stUrlLoader.dataFormat = URLLoaderDataFormat.TEXT;
         stUrlLoader.addEventListener(Event.COMPLETE,this.a_3006);
         stUrlLoader.addEventListener(ProgressEvent.PROGRESS,this.a_3009);
         stUrlLoader.addEventListener(IOErrorEvent.IO_ERROR,this.a_3008);
         stUrlLoader.load(urlRequst);
         this._dataObj = stUrlLoader;
         var isExistInTaskArray:Boolean = false;
         for each(stLoadingTask in a_885)
         {
            if(stLoadingTask.stUrlLoader == stUrlLoader)
            {
               isExistInTaskArray = true;
               break;
            }
         }
         if(!isExistInTaskArray)
         {
            loadTask = new AurLoadTask();
            loadTask.name = fileUrl;
            loadTask.url = fileUrl;
            loadTask.type = EnmLoaderType.a_500;
            loadTask.stUrlLoader = stUrlLoader;
            a_885.push(loadTask);
         }
         return true;
      }
      
      public function loadBinaryFile(fileUrl:String, stUrlLoader:URLLoader = null) : Boolean
      {
         var stLoadingTask:AurLoadTask = null;
         var loadTask:AurLoadTask = null;
         if(fileUrl == null)
         {
            trace("loadBinaryFile failed: fileUrl is null");
            return false;
         }
         if(null == stUrlLoader)
         {
            stUrlLoader = new URLLoader();
         }
         stUrlLoader.dataFormat = URLLoaderDataFormat.BINARY;
         stUrlLoader.addEventListener(Event.COMPLETE,this.a_3007);
         stUrlLoader.addEventListener(ProgressEvent.PROGRESS,this.a_3009);
         stUrlLoader.addEventListener(IOErrorEvent.IO_ERROR,this.a_3008);
         stUrlLoader.load(new URLRequest(fileUrl));
         this._dataObj = stUrlLoader;
         var isExistInTaskArray:Boolean = false;
         for each(stLoadingTask in a_885)
         {
            if(stLoadingTask.stUrlLoader == stUrlLoader)
            {
               isExistInTaskArray = true;
               break;
            }
         }
         if(!isExistInTaskArray)
         {
            loadTask = new AurLoadTask();
            loadTask.name = fileUrl;
            loadTask.url = fileUrl;
            loadTask.type = EnmLoaderType.a_501;
            loadTask.stUrlLoader = stUrlLoader;
            a_885.push(loadTask);
         }
         return true;
      }
      
      private function a_3005(a_4730:Event) : void
      {
         var dataEvent:a_1778 = null;
         var stLoadingTask:AurLoadTask = null;
         for each(stLoadingTask in a_885)
         {
            if(stLoadingTask.loader == a_4730.currentTarget.loader)
            {
               this._currentTask = stLoadingTask;
               a_885.splice(a_885.indexOf(stLoadingTask),1);
               break;
            }
         }
         if(a_884.length > 0)
         {
            if(-1 != a_884.indexOf(a_4730.currentTarget.loader))
            {
               a_884.splice(a_884.indexOf(a_4730.currentTarget.loader),1);
            }
            dataEvent = new a_1778(EventType.a_652);
            dataEvent.dataObject = this._currentTask.name;
            dispatchEvent(dataEvent);
            dispatchEvent(new Event(Event.COMPLETE));
         }
         else if(this._currentTask is AurLoadTask)
         {
            dataEvent = new a_1778(EventType.a_652);
            dataEvent.dataObject = this._currentTask.name;
            dispatchEvent(dataEvent);
            dispatchEvent(new Event(Event.COMPLETE));
         }
         else
         {
            dataEvent = new a_1778(Event.COMPLETE);
            dataEvent.dataObject = this._dataObj is Loader ? (this._dataObj as Loader).name : null;
            dispatchEvent(dataEvent);
         }
      }
      
      private function a_3006(a_4730:Event) : void
      {
         var dataEvent:a_1778 = null;
         var stLoadingTask:AurLoadTask = null;
         for each(stLoadingTask in a_885)
         {
            if(stLoadingTask.stUrlLoader == a_4730.currentTarget)
            {
               this._currentTask = stLoadingTask;
               a_885.splice(a_885.indexOf(stLoadingTask),1);
               break;
            }
         }
         if(a_884.length > 0)
         {
            if(-1 != a_884.indexOf(a_4730.currentTarget))
            {
               a_884.splice(a_884.indexOf(a_4730.currentTarget),1);
            }
            dataEvent = new a_1778(EventType.a_651);
            dataEvent.dataObject = {
               "name":null,
               "data":null
            };
            dataEvent.dataObject.name = this._currentTask.name;
            dataEvent.dataObject.data = new XML((a_4730.currentTarget as URLLoader).data);
            dispatchEvent(dataEvent);
            dispatchEvent(new Event(Event.COMPLETE));
         }
         else if(this._currentTask is AurLoadTask)
         {
            dataEvent = new a_1778(EventType.a_651);
            dataEvent.dataObject = {
               "name":null,
               "data":null
            };
            dataEvent.dataObject.name = this._currentTask.name;
            dataEvent.dataObject.data = new XML((this._dataObj as URLLoader).data);
            dispatchEvent(dataEvent);
            dispatchEvent(new Event(Event.COMPLETE));
         }
         else
         {
            dataEvent = new a_1778(Event.COMPLETE);
            dataEvent.dataObject = new XML((this._dataObj as URLLoader).data);
            dispatchEvent(dataEvent);
         }
      }
      
      private function a_3007(a_4730:Event) : void
      {
         var dataEvent:a_1778 = null;
         var stLoadingTask:AurLoadTask = null;
         for each(stLoadingTask in a_885)
         {
            if(stLoadingTask.stUrlLoader == a_4730.currentTarget)
            {
               this._currentTask = stLoadingTask;
               a_885.splice(a_885.indexOf(stLoadingTask),1);
               break;
            }
         }
         if(a_884.length > 0)
         {
            if(-1 != a_884.indexOf(a_4730.currentTarget))
            {
               a_884.splice(a_884.indexOf(a_4730.currentTarget),1);
            }
            dataEvent = new a_1778(EventType.a_653);
            dataEvent.dataObject = {
               "name":null,
               "data":null
            };
            dataEvent.dataObject.name = this._currentTask.name;
            dataEvent.dataObject.data = a_4730.currentTarget is URLLoader ? (a_4730.currentTarget as URLLoader).data : null;
            dispatchEvent(dataEvent);
            dispatchEvent(new Event(Event.COMPLETE));
         }
         else if(this._currentTask is AurLoadTask)
         {
            dataEvent = new a_1778(EventType.a_653);
            dataEvent.dataObject = {
               "name":null,
               "data":null
            };
            dataEvent.dataObject.name = this._currentTask.name;
            dataEvent.dataObject.data = this._dataObj is URLLoader ? (this._dataObj as URLLoader).data : null;
            dispatchEvent(dataEvent);
            dispatchEvent(new Event(Event.COMPLETE));
         }
         else
         {
            dataEvent = new a_1778(Event.COMPLETE);
            dataEvent.dataObject = this._dataObj is URLLoader ? (this._dataObj as URLLoader).data : null;
            dispatchEvent(dataEvent);
         }
      }
      
      private function a_3008(a_4730:IOErrorEvent) : void
      {
         var stCurrentLoader:Loader = null;
         var stCurrentUrlLoader:URLLoader = null;
         var stLoadingTask:AurLoadTask = null;
         if(a_4730.currentTarget is LoaderInfo)
         {
            stCurrentLoader = (a_4730.currentTarget as LoaderInfo).loader;
         }
         else if(a_4730.currentTarget is URLLoader)
         {
            stCurrentUrlLoader = a_4730.currentTarget as URLLoader;
         }
         for each(stLoadingTask in a_885)
         {
            if(Boolean(stCurrentUrlLoader) && stLoadingTask.stUrlLoader == stCurrentUrlLoader)
            {
               if(stLoadingTask.iTryLoadTimes > 2)
               {
                  a_885.splice(a_885.indexOf(stLoadingTask),1);
                  throw a_4730;
               }
               stCurrentUrlLoader.close();
               stCurrentUrlLoader.load(new URLRequest(stLoadingTask.url));
               ++stLoadingTask.iTryLoadTimes;
            }
            else if(Boolean(stCurrentLoader) && stLoadingTask.loader == stCurrentLoader)
            {
               if(stLoadingTask.iTryLoadTimes > 2)
               {
                  a_885.splice(a_885.indexOf(stLoadingTask),1);
                  throw a_4730;
               }
               try
               {
                  stCurrentLoader.close();
               }
               catch(error:Error)
               {
               }
               stCurrentLoader.load(new URLRequest(stLoadingTask.url));
               ++stLoadingTask.iTryLoadTimes;
            }
         }
      }
      
      private function a_3009(a_4730:ProgressEvent) : void
      {
         var dataEvent:a_1778 = null;
         var iNoStartedLoadCount:int = 0;
         var iByteLoaded:uint = 0;
         var iByteTotal:uint = 0;
         var stLoader:Object = null;
         var stLoadingTask:AurLoadTask = null;
         if(a_884.length > 0)
         {
            dataEvent = new a_1778(EventType.a_650);
            for each(stLoader in a_884)
            {
               if(stLoader is Loader)
               {
                  iByteLoaded += stLoader.contentLoaderInfo.bytesLoaded;
                  iByteTotal += stLoader.contentLoaderInfo.bytesTotal;
                  if(0 == stLoader.contentLoaderInfo.bytesTotal)
                  {
                     iNoStartedLoadCount += 1;
                  }
               }
               else if(stLoader is URLLoader)
               {
                  iByteLoaded += stLoader.bytesLoaded;
                  iByteTotal += stLoader.bytesTotal;
                  if(0 == stLoader.bytesTotal)
                  {
                     iNoStartedLoadCount += 1;
                  }
               }
            }
            for each(stLoadingTask in a_885)
            {
               if(a_4730.currentTarget is URLLoader && stLoadingTask.stUrlLoader == a_4730.currentTarget || a_4730.currentTarget is LoaderInfo && stLoadingTask.loader == a_4730.currentTarget.loader)
               {
                  this._currentTask = stLoadingTask;
                  break;
               }
            }
            dataEvent.dataObject = {
               "totalNum":_totalTaskNum,
               "leftNum":_waitLoadList.length + iNoStartedLoadCount,
               "name":this._currentTask.name,
               "url":this._currentTask.url,
               "bytesLoaded":iByteLoaded,
               "bytesTotal":iByteTotal
            };
            dispatchEvent(dataEvent);
         }
         else if(this._currentTask is AurLoadTask)
         {
            dataEvent = new a_1778(EventType.a_650);
            dataEvent.dataObject = {
               "totalNum":_totalTaskNum,
               "leftNum":_waitLoadList.length,
               "name":this._currentTask.name,
               "url":this._currentTask.url,
               "bytesLoaded":a_4730.bytesLoaded,
               "bytesTotal":a_4730.bytesTotal
            };
            dispatchEvent(dataEvent);
         }
         else
         {
            dispatchEvent(a_4730);
         }
      }
      
      private function load(a_4730:Event) : void
      {
         while(_waitLoadList.length > 0 && a_884.length < a_886)
         {
            this._currentTask = _waitLoadList.shift() as AurLoadTask;
            switch(this._currentTask.type)
            {
               case EnmLoaderType.a_501:
                  if(null == this._currentTask.stUrlLoader)
                  {
                     this._currentTask.stUrlLoader = new URLLoader();
                  }
                  a_885.push(this._currentTask);
                  a_884.push(this._currentTask.stUrlLoader);
                  this.loadBinaryFile(this._currentTask.url,this._currentTask.stUrlLoader);
                  break;
               case EnmLoaderType.a_500:
                  if(null == this._currentTask.stUrlLoader)
                  {
                     this._currentTask.stUrlLoader = new URLLoader();
                  }
                  a_885.push(this._currentTask);
                  a_884.push(this._currentTask.stUrlLoader);
                  this.loadXMLFILE(this._currentTask.url,this._currentTask.stUrlLoader);
                  break;
               case EnmLoaderType.a_502:
                  a_885.push(this._currentTask);
                  a_884.push(this._currentTask.loader);
                  this.loadFileToLoader(this._currentTask.loader,this._currentTask.url,this._currentTask.isCheckPolicyFile,this._currentTask.isAddToCurrentAppDomain,this._currentTask.isAddToCurrentSecurityDomain,this._currentTask.stUserDefineAppDoman,this._currentTask.stUserDefineSecurityDomain);
                  break;
               default:
                  trace("Error LoadType: " + this._currentTask.type);
            }
         }
         if(_waitLoadList.length == 0 && a_884.length == 0)
         {
            _isLoading = false;
            _totalTaskNum = 0;
            this._currentTask = null;
            this.removeEventListener(Event.COMPLETE,this.load);
            this.removeEventListener(IOErrorEvent.IO_ERROR,this.load);
            this.dispatchEvent(new Event(EventType.a_649));
         }
      }
   }
}

