package a_4714
{
   import a_4781.Tool;
   import a_4782.a_4641;
   import a_4788.BaseLoader;
   import a_4788.ConstLoader;
   import a_4788.IBaseLoader;
   import a_4788.LocalData;
   import cn.riahome.file.zip.ZipFile;
   import flash.display.Bitmap;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   import flash.utils.setTimeout;
   
   public class AssetItem extends EventDispatcher
   {
      
      private static var count:int = 0;
      
      private var timeout:int;
      
      private var waitingTime:int = 10000;
      
      private var _assetData:AssetsItemData;
      
      private var _loading:Boolean = false;
      
      private var tdld:LocalData;
      
      private var fld:IBaseLoader;
      
      private var bdt:ByteDataTransform;
      
      private var tempTime:Number;
      
      public function AssetItem(data:AssetsItemData)
      {
         super();
         this._assetData = data;
         ++count;
      }
      
      public function get assetData() : AssetsItemData
      {
         return this._assetData;
      }
      
      public function get data() : Object
      {
         var bm:Bitmap = null;
         if(this._assetData.data is Bitmap)
         {
            bm = this._assetData.data as Bitmap;
            if(bm.bitmapData != null && bm.bitmapData.width * bm.bitmapData.height > 0)
            {
               return this._assetData.data;
            }
            return null;
         }
         return this._assetData.data;
      }
      
      public function getAsset() : void
      {
         var bm:Bitmap = null;
         if(this._loading)
         {
            return;
         }
         if(this.data != null)
         {
            if(!(this.data is Bitmap))
            {
               dispatchEvent(new a_4641(a_4641.a_1124,{
                  "code":this._assetData.id,
                  "data":this.data,
                  "type":this._assetData.type
               }));
               return;
            }
            bm = this.data as Bitmap;
            if(bm.bitmapData != null && bm.bitmapData.width * bm.bitmapData.height > 0)
            {
               dispatchEvent(new a_4641(a_4641.a_1124,{
                  "code":this._assetData.id,
                  "data":this.data,
                  "type":this._assetData.type
               }));
               return;
            }
         }
         this.getData();
      }
      
      public function destory() : void
      {
         if(this._loading)
         {
            if(this.fld != null)
            {
               if(!this.fld.hasEventListener(a_4641.a_1124))
               {
                  this.fld.removeEventListener(a_4641.a_1124,this.lcHandle);
                  this.fld.removeEventListener(a_4641.LOAD_PROGRESS,this.lpHandle);
                  this.fld.removeEventListener(a_4641.LOAD_ERROR,this.leHandle);
               }
               this.fld.close();
               this.fld = null;
            }
         }
         if(this.tdld != null)
         {
            this.tdld = null;
         }
      }
      
      private function getData() : void
      {
         var o:Object = null;
         this._loading = true;
         if(this._assetData.localSave == 0)
         {
            if(this.tdld == null)
            {
               this.tdld = new LocalData();
            }
            o = this.tdld.read(this._assetData.id,this._assetData.localPath);
            if(o != null)
            {
               if(o.version == this._assetData.version)
               {
                  this.dataOnComplete(Tool.a_4653(o.data) as ByteArray);
                  return;
               }
            }
         }
         this.loadData(this._assetData.url);
      }
      
      private function getLoadType(type:int) : String
      {
         var strType:String = ConstLoader.TYPE_URLSTREAM;
         if(this._assetData._decode)
         {
            switch(type)
            {
               case AssetType.SWF:
               case AssetType.JPG:
               case AssetType.PNG:
                  strType = ConstLoader.TYPE_LOADER;
                  break;
               default:
                  trace("默认2进制加载！" + this._assetData.url);
            }
         }
         return strType;
      }
      
      private function saveData(d:ByteArray) : void
      {
         var ba:ByteArray = new ByteArray();
         d.readBytes(ba);
         var o:Object = {};
         o.data = ba;
         o.version = this._assetData.version;
         o.type = this._assetData.type;
         this.tdld.writeAndSave(o,this._assetData.id,this._assetData.localPath);
      }
      
      private function loadData(path:String) : void
      {
         if(this.fld == null)
         {
            this.fld = new BaseLoader();
         }
         if(!this.fld.hasEventListener(a_4641.a_1124))
         {
            this.fld.addEventListener(a_4641.a_1124,this.lcHandle);
            this.fld.addEventListener(a_4641.LOAD_PROGRESS,this.lpHandle);
            this.fld.addEventListener(a_4641.LOAD_ERROR,this.leHandle);
         }
         var type:String = this.getLoadType(this._assetData.type);
         this.tempTime = getTimer();
         this.fld.load(new URLRequest(path),type,this._assetData._context);
      }
      
      private function lcHandle(a_4730:a_4641) : void
      {
         this.fld.removeEventListener(a_4641.a_1124,this.lcHandle);
         this.fld.removeEventListener(a_4641.LOAD_ERROR,this.leHandle);
         this.fld.removeEventListener(a_4641.LOAD_PROGRESS,this.lpHandle);
         if(this._assetData.localSave == 0)
         {
            if(a_4730.value is ByteArray)
            {
               this.saveData(a_4730.value as ByteArray);
            }
         }
         trace("[" + this._assetData.id + "]加载成功>>","用时：" + (getTimer() - this.tempTime));
         this.tempTime = getTimer();
         this.dataOnComplete(a_4730.value);
      }
      
      private function leHandle(a_4730:a_4641) : void
      {
         var url:String = null;
         trace("[" + this._assetData.id + "]加载失败>>","用时：" + (getTimer() - this.tempTime));
         --this._assetData.retryTime;
         if(this._assetData.retryTime < 0)
         {
            this.fld.removeEventListener(a_4641.a_1124,this.lcHandle);
            this.fld.removeEventListener(a_4641.LOAD_ERROR,this.leHandle);
            this.fld.removeEventListener(a_4641.LOAD_PROGRESS,this.lpHandle);
            this._loading = false;
            dispatchEvent(new a_4641(a_4641.LOAD_ERROR,{"code":this._assetData.id}));
         }
         else
         {
            url = this._assetData.url;
            if(url.indexOf("LoadFilesList") == -1)
            {
               if(url.indexOf("?") == -1)
               {
                  url += "?retry=" + Math.random();
               }
               else
               {
                  url += "&retry=" + Math.random();
               }
               setTimeout(this.loadData,500,url);
            }
            else
            {
               setTimeout(this.loadData,500,url);
            }
         }
      }
      
      private function lpHandle(a_4730:a_4641) : void
      {
         dispatchEvent(new a_4641(a_4641.LOAD_PROGRESS,{
            "code":this._assetData.id,
            "data":a_4730.value
         }));
      }
      
      private function dataOnComplete(d:*) : void
      {
         var dict:Dictionary = null;
         var name:String = null;
         var zipFile:ZipFile = null;
         var entries:Array = null;
         var transformData:Dictionary = null;
         var i:int = 0;
         var len:int = 0;
         if(this._assetData.type == AssetType.ZIP)
         {
            dict = new Dictionary(true);
            zipFile = new ZipFile(d);
            entries = zipFile.entries;
            transformData = new Dictionary(true);
            i = 0;
            len = int(entries.length);
            while(i < len)
            {
               if(entries[i] != null)
               {
                  if(!entries[i].isDirectory())
                  {
                     name = entries[i].getName();
                     dict[name] = zipFile.getEntryData(entries[i]);
                     transformData[name] = {};
                     transformData[name].name = name;
                     transformData[name].data = dict[name];
                  }
               }
               i++;
            }
            if(!this._assetData._decode)
            {
               this._assetData._data = dict;
               this._loading = false;
               transformData = null;
               trace("[" + this._assetData.id + "]转化成功>>","用时：" + (getTimer() - this.tempTime));
               dispatchEvent(new a_4641(a_4641.a_1124,{
                  "code":this._assetData.id,
                  "data":this.data,
                  "type":this._assetData.type
               }));
               return;
            }
            if(this.bdt == null)
            {
               this.bdt = new ByteDataTransform();
            }
            if(!this.bdt.hasEventListener(Event.COMPLETE))
            {
               this.bdt.addEventListener(Event.COMPLETE,this.transformOnComplete);
            }
            this.bdt.transform(transformData,this._assetData._encoding,this._assetData._context);
            return;
         }
         if(this._assetData.type == AssetType.TXT)
         {
            if(this.bdt == null)
            {
               this.bdt = new ByteDataTransform();
            }
            this.bdt.decipherHandle(d,this._assetData._encoding);
            d.position = 0;
            this._assetData._data = d.readMultiByte(d.bytesAvailable,this._assetData._encoding);
            d.clear();
            d = null;
            this._loading = false;
            trace("[" + this._assetData.id + "]转化成功>>","用时：" + (getTimer() - this.tempTime));
            dispatchEvent(new a_4641(a_4641.a_1124,{
               "code":this._assetData.id,
               "data":this.data,
               "type":this._assetData.type
            }));
            return;
         }
         if(d is Loader)
         {
            d = Loader(d).content;
         }
         this._assetData._data = d;
         this._loading = false;
         trace("[" + this._assetData.id + "]转化成功>>","用时：" + (getTimer() - this.tempTime));
         dispatchEvent(new a_4641(a_4641.a_1124,{
            "code":this._assetData.id,
            "data":this.data,
            "type":this._assetData.type
         }));
      }
      
      private function transformOnComplete(a_4730:Event) : void
      {
         var k:String = null;
         var url:String = null;
         this.bdt.removeEventListener(Event.COMPLETE,this.transformOnComplete);
         var tempData:Dictionary = this.bdt.resultData;
         if(this._assetData.type == AssetType.ZIP)
         {
            this._assetData._data = new Dictionary(true);
            for(k in tempData)
            {
               this._assetData._data[k] = tempData[k].data;
               delete tempData[k];
            }
         }
         else
         {
            if(tempData[this._assetData.id].data == null && this._assetData.type == AssetType.SWF)
            {
               url = this._assetData.url;
               if(url.indexOf("autoTry=") == -1)
               {
                  if(url.indexOf("?") > -1)
                  {
                     this._assetData.url = this._assetData.url + "&autoTry=" + Math.random();
                  }
                  else
                  {
                     this._assetData.url = this._assetData.url + "?autoTry=" + Math.random();
                  }
                  this.loadData(this._assetData.url);
                  return;
               }
            }
            this._assetData._data = tempData[this._assetData.id].data;
            delete tempData[this._assetData.id];
         }
         this._loading = false;
         trace("[" + this._assetData.id + "]转化成功>>","用时：" + (getTimer() - this.tempTime));
         dispatchEvent(new a_4641(a_4641.a_1124,{
            "code":this._assetData.id,
            "data":this.data,
            "type":this._assetData.type
         }));
      }
   }
}

