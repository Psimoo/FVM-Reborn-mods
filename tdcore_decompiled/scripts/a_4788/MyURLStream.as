package a_4788
{
   import a_4782.a_4641;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLRequest;
   import flash.net.URLStream;
   import flash.net.URLVariables;
   import flash.utils.ByteArray;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   
   public class MyURLStream extends EventDispatcher
   {
      
      private var _instanceIndex:uint = 0;
      
      private var _requestTimeout:uint = 600000;
      
      private var stream:URLStream;
      
      private var timeout:uint;
      
      private var httpErrorState:int;
      
      public function MyURLStream()
      {
         super();
      }
      
      public function close() : void
      {
         if(this.stream != null)
         {
            try
            {
               if(this.stream.connected)
               {
                  this.stream.close();
               }
            }
            catch(e:Error)
            {
               trace("数据加载取消出错：" + e);
            }
            this.removeEvents(this.stream);
         }
         trace("MyURLStream::close");
         dispatchEvent(new a_4641(a_4641.LOAD_ERROR,"requestTimeout"));
      }
      
      public function load(url:String, data:Object = null, method:String = "POST") : void
      {
         var request:URLRequest;
         var variables:URLVariables = null;
         var i:String = null;
         if(this.stream == null)
         {
            this.stream = new URLStream();
         }
         else
         {
            try
            {
               if(this.stream.connected)
               {
                  this.stream.close();
               }
            }
            catch(e:Error)
            {
               trace("数据加载取消出错：" + e);
            }
         }
         if(this.timeout)
         {
            clearTimeout(this.timeout);
         }
         request = new URLRequest(url);
         if(data != null)
         {
            variables = new URLVariables();
            for(i in data)
            {
               variables[i] = data[i];
            }
            request.method = method;
            request.data = variables;
         }
         try
         {
            this.configureListeners(this.stream);
            this.stream.load(request);
            this.timeout = setTimeout(this.close,this._requestTimeout);
         }
         catch(error:Error)
         {
            trace("MyURLStream::load");
            dispatchEvent(new a_4641(a_4641.LOAD_ERROR,"Unable to load requested document." + error));
         }
      }
      
      public function set instanceIndex(id:uint) : void
      {
         this._instanceIndex = id;
      }
      
      public function get instanceIndex() : uint
      {
         return this._instanceIndex;
      }
      
      public function set requestTimeout(t:uint) : void
      {
         this._requestTimeout = t;
      }
      
      private function configureListeners(dispatcher:EventDispatcher) : void
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
      
      private function removeEvents(dispatcher:EventDispatcher) : void
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
         this.removeEvents(this.stream);
         var bytes:ByteArray = new ByteArray();
         this.stream.readBytes(bytes);
         this.stream.close();
         dispatchEvent(new a_4641(a_4641.a_1124,bytes));
         trace("MyURLStream::completeHandler");
      }
      
      private function openHandler(a_4730:Event) : void
      {
         clearTimeout(this.timeout);
      }
      
      private function progressHandler(a_4730:ProgressEvent) : void
      {
         dispatchEvent(new a_4641(a_4641.LOAD_PROGRESS,{
            "bytesLoaded":a_4730.bytesLoaded,
            "bytesTotal":a_4730.bytesTotal
         }));
      }
      
      private function securityErrorHandler(a_4730:SecurityErrorEvent) : void
      {
         trace("MyURLStream::securityErrorHandler");
         clearTimeout(this.timeout);
         this.removeEvents(this.stream);
         this.stream.close();
         dispatchEvent(new a_4641(a_4641.LOAD_ERROR,{
            "desc":"SecurityError",
            "code":-1
         }));
      }
      
      private function httpStatusHandler(a_4730:HTTPStatusEvent) : void
      {
         trace("MyURLStream::httpStatusHandler>status=" + a_4730.status);
         if(a_4730.status * 1 >= 400)
         {
            clearTimeout(this.timeout);
            this.httpErrorState = a_4730.status;
            trace("MyURLStream::httpError");
            dispatchEvent(new a_4641(a_4641.HTTP_ERROR,a_4730.status));
         }
      }
      
      private function ioErrorHandler(a_4730:IOErrorEvent) : void
      {
         trace("MyURLStream::ioErrorHandler");
         clearTimeout(this.timeout);
         this.removeEvents(this.stream);
         this.stream.close();
         dispatchEvent(new a_4641(a_4641.LOAD_ERROR,{
            "desc":"IOError",
            "code":this.httpErrorState
         }));
      }
   }
}

