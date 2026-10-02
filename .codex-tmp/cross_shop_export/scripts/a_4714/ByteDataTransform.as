package a_4714
{
   import a_4781.a_4713;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   
   public class ByteDataTransform extends EventDispatcher
   {
      
      private const TRANSFORM_TIMEOUT:int = 5000;
      
      private const ENCRYPT_FLAG:String = "TDXML";
      
      private var _resultData:Dictionary;
      
      private var temp:Dictionary;
      
      private var nums:int;
      
      private var context:LoaderContext;
      
      private var timeouts:Dictionary;
      
      public function ByteDataTransform(target:IEventDispatcher = null)
      {
         super(target);
      }
      
      public function transform(data:Dictionary, encoding:String = "utf-8", context:LoaderContext = null) : void
      {
         var k1:String = null;
         var obj:Object = null;
         var k:String = null;
         this.temp = new Dictionary();
         this._resultData = data;
         this.nums = 0;
         this.context = context;
         this.clearTimeouts();
         for(k1 in this._resultData)
         {
            obj = this._resultData[k1];
            if(this.isXMLObject(obj.name))
            {
               obj.data = this.toXMLObject(obj.data,encoding);
            }
            else if(this.isDisplayObject(obj.name))
            {
               ++this.nums;
               this.temp[k1] = obj.data;
            }
         }
         if(this.nums > 0)
         {
            for(k in this.temp)
            {
               if(this.temp[k] is ByteArray)
               {
                  this.toDisplayObject(this.temp[k],k);
               }
            }
         }
         else
         {
            this.transformComplete();
         }
      }
      
      public function get resultData() : Dictionary
      {
         return this._resultData;
      }
      
      private function resetDictionary(dict:Dictionary) : void
      {
         var k:* = undefined;
         if(dict == null)
         {
            return;
         }
         for(k in dict)
         {
            delete dict[k];
         }
      }
      
      private function clearTimeouts() : void
      {
         var k:String = null;
         if(this.timeouts == null)
         {
            this.timeouts = new Dictionary(true);
            return;
         }
         for(k in this.timeouts)
         {
            clearTimeout(this.timeouts[k]);
            delete this.timeouts[k];
         }
      }
      
      private function isDisplayObject(fileName:String) : Boolean
      {
         var b:Boolean = false;
         var checkTarget:Array = [".swf",".jpg",".png"];
         fileName = fileName.toLocaleLowerCase();
         for(var i:int = 0; i < 3; i++)
         {
            b = fileName.indexOf(checkTarget[i]) > 0;
            if(b)
            {
               return b;
            }
         }
         return b;
      }
      
      private function isXMLObject(fileName:String) : Boolean
      {
         fileName = fileName.toLocaleLowerCase();
         return fileName.indexOf(".xml") > 0;
      }
      
      private function toXMLObject(data:ByteArray, encoding:String) : XML
      {
         this.decipherHandle(data,encoding);
         var strXML:String = data.readMultiByte(data.bytesAvailable,encoding);
         data.clear();
         data = null;
         return new XML(a_4713.xmlStringFormat(strXML));
      }
      
      private function toDisplayObject(data:ByteArray, name:String) : void
      {
         var loader:Loader = new Loader();
         loader.name = name;
         loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.loaderOnComplete);
         loader.loadBytes(data,this.context);
         this.timeouts[name] = setTimeout(this.loaderOnComplete,this.TRANSFORM_TIMEOUT,loader);
         data.clear();
         data = null;
      }
      
      private function loaderOnComplete(target:*) : void
      {
         var loader:Loader = null;
         if(target is Loader)
         {
            loader = target as Loader;
         }
         else
         {
            loader = (target as Event).target.loader;
         }
         loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.loaderOnComplete);
         var name:String = loader.name;
         var obj:Object = this._resultData[name];
         obj.data = loader.content;
         clearTimeout(this.timeouts[name]);
         if(obj.data == null)
         {
            trace(name + ">>转化失败，请检查文件是否有问题!>>target=" + target);
         }
         delete this.temp[name];
         delete this.timeouts[name];
         --this.nums;
         if(this.nums == 0)
         {
            this.transformComplete();
         }
      }
      
      private function transformComplete() : void
      {
         this.temp = null;
         dispatchEvent(new Event(Event.COMPLETE));
         this.resetDictionary(this._resultData);
      }
      
      public function decipherHandle(data:ByteArray, encoding:String = "utf-8") : void
      {
         data.position = 0;
         var flag:String = data.readMultiByte(5,encoding);
         if(flag != this.ENCRYPT_FLAG)
         {
            return;
         }
         var ba:ByteArray = new ByteArray();
         data.readBytes(ba);
         data.clear();
         ba.position = 0;
         ba.readBytes(data);
         ba.clear();
         data.uncompress();
         data.position = 0;
      }
   }
}

