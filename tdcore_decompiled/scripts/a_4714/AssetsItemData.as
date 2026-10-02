package a_4714
{
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   
   public class AssetsItemData
   {
      
      private var _id:String;
      
      private var _type:int;
      
      internal var version:String;
      
      internal var localSave:int;
      
      internal var localPath:String;
      
      internal var url:String;
      
      internal var _data:*;
      
      internal var itemRef:AssetItem;
      
      internal var _holder:Boolean;
      
      internal var _encoding:String;
      
      internal var _context:LoaderContext;
      
      internal var _decode:Boolean;
      
      internal var _retryTime:int = 0;
      
      public function AssetsItemData(url:String, type:int, id:String = "", version:String = "", localPath:String = null, holder:Boolean = true, encoding:String = "utf-8", context:LoaderContext = null, decode:Boolean = true, retryTime:int = 0)
      {
         super();
         if(url == "")
         {
            throw new Error("url不能为空！");
         }
         this.url = url + "?" + AssetsUrlVersionCache.m_strTotalVersion;
         if(!AssetType.typeCheck(type))
         {
            throw new Error("提供的文件类型:" + type + "不是可接受的文件！");
         }
         this._type = type;
         this._id = id;
         if(this._id == "")
         {
            this._id = url;
         }
         this.version = version;
         if(this.version == "")
         {
            this.localSave = 1;
         }
         else
         {
            this.localSave = 0;
         }
         this.localPath = localPath;
         this._holder = holder;
         this._encoding = encoding;
         this._context = context;
         this._decode = decode;
         this._retryTime = retryTime;
      }
      
      public function destory() : void
      {
         var i:int = 0;
         var len:int = 0;
         var dict:Dictionary = null;
         var k:String = null;
         if(this.itemRef != null)
         {
            this.itemRef.destory();
            this.itemRef = null;
         }
         this.url = "";
         this._id = "";
         this.version = "";
         this.localPath = "";
         this._encoding = "";
         this._context = null;
         this._type = 0;
         if(this._data != undefined)
         {
            if(this._data is ByteArray)
            {
               this.byteArrayDestory(this._data as ByteArray);
            }
            else if(this._data is Array)
            {
               i = 0;
               len = int(this._data.length);
               while(i < len)
               {
                  if(this._data[i] is Dictionary)
                  {
                     dict = this._data[i] as Dictionary;
                     for(k in dict)
                     {
                        if(dict[k] is ByteArray)
                        {
                           this.byteArrayDestory(dict[k] as ByteArray);
                        }
                        else if(dict[k] is MovieClip)
                        {
                           this.movieClipDestory(dict[k] as MovieClip);
                        }
                        else if(dict[k] is Bitmap)
                        {
                           this.bitmapDestory(dict[k] as Bitmap);
                        }
                     }
                  }
                  i++;
               }
            }
            else if(this._data is MovieClip)
            {
               this.movieClipDestory(this._data as MovieClip);
            }
            else if(this._data is Bitmap)
            {
               this.bitmapDestory(this._data as Bitmap);
            }
            this._data = null;
         }
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get data() : *
      {
         return this._data;
      }
      
      public function set data(d:*) : void
      {
         this._data = d;
      }
      
      public function get holder() : Boolean
      {
         return this._holder;
      }
      
      public function set encoding(v:String) : void
      {
         this._encoding = v;
      }
      
      public function set context(v:LoaderContext) : void
      {
         this._context = v;
      }
      
      public function get decode() : Boolean
      {
         return this._decode;
      }
      
      public function get retryTime() : int
      {
         return this._retryTime;
      }
      
      public function set retryTime(t:int) : void
      {
         this._retryTime = t;
      }
      
      private function byteArrayDestory(ba:ByteArray) : void
      {
         ba.clear();
         ba = null;
      }
      
      private function movieClipDestory(mc:MovieClip) : void
      {
         mc.stop();
         mc = null;
      }
      
      private function bitmapDestory(bm:Bitmap) : void
      {
         if(bm.bitmapData != null)
         {
            bm.bitmapData.dispose();
         }
         bm = null;
      }
   }
}

