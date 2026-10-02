package a_4714
{
   import a_4782.a_4641;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.utils.Dictionary;
   
   public class AssetsLoader extends EventDispatcher
   {
      
      private var assetsData:Dictionary;
      
      private var assetsLoaded:Dictionary;
      
      private var assetsLoading:Dictionary;
      
      private var am:AssetsManager;
      
      private var isLoading:Boolean = false;
      
      private var mode:int;
      
      private var _isPause:Boolean;
      
      private var vars:Object;
      
      private var averagePercent:Number;
      
      private var currentPercent:Number;
      
      public function AssetsLoader(target:IEventDispatcher = null)
      {
         super(target);
      }
      
      public function load(dict:Dictionary, vars:Object = null, mode:int = 0) : void
      {
         var id0:String = null;
         var i:* = 0;
         var len:int = 0;
         var id2:String = null;
         var id:String = null;
         var tempIDS:Array = null;
         this.assetsData = dict;
         for(id0 in this.assetsData)
         {
            if(id0 != this.assetsData[id0].id)
            {
               this.assetsData[this.assetsData[id0].id] = this.assetsData[id0];
               delete this.assetsData[id0];
            }
         }
         this.assetsLoaded = new Dictionary(true);
         this.assetsLoading = new Dictionary();
         this.vars = vars;
         this.mode = AssetsLoadMode.getMode(mode);
         if(this.vars == null)
         {
            this.vars = {};
         }
         if(this.vars.ids == undefined || !(this.vars.ids is Array))
         {
            this.vars.ids = new Array();
         }
         var num:int = 0;
         for(id in this.assetsData)
         {
            num++;
            if(this.vars.ids.indexOf(id) == -1)
            {
               this.vars.ids.push(id);
            }
         }
         if(num != this.vars.ids.length)
         {
            for(i = 0; i < this.vars.ids.length; i++)
            {
               if(this.assetsData[this.vars.ids[i]] == undefined)
               {
                  this.vars.ids.splice(i,1);
                  i--;
               }
            }
         }
         this._isPause = false;
         if(this.am == null)
         {
            this.am = AssetsManager.getInstance();
         }
         if(!this.isLoading)
         {
            this.am.addEventListener(AssetsManagerEvent.GET_SUCCESS,this.onGetSuccess);
            this.am.addEventListener(AssetsManagerEvent.GET_FAIL,this.onGetFall);
            this.am.addEventListener(AssetsManagerEvent.a_101,this.onGetProgress);
         }
         this.isLoading = true;
         this.averagePercent = 100 / this.vars.ids.length;
         this.currentPercent = 0;
         if(mode == AssetsLoadMode.CONCURRENT)
         {
            tempIDS = this.vars.ids.concat();
            len = int(tempIDS.length);
            for(i = 0; i < len; i++)
            {
               id2 = tempIDS[i];
               AssetsManager.addAssetsToList(this.assetsData[id2]);
               this.assetsLoaded[id2] = false;
               AssetsManager.getAsset(id2);
            }
         }
         else
         {
            id2 = this.vars.ids[0];
            AssetsManager.addAssetsToList(this.assetsData[id2]);
            this.assetsLoaded[id2] = false;
            AssetsManager.getAsset(id2);
         }
      }
      
      public function append(assetsItemData:Array) : void
      {
         var i:int = 0;
         var len:int = 0;
         var dict:Dictionary = null;
         var itemData:AssetsItemData = null;
         var remainPercent:Number = NaN;
         if(!this.isLoading)
         {
            dict = new Dictionary(true);
            i = 0;
            len = int(assetsItemData.length);
            while(i < len)
            {
               dict[assetsItemData[i].id] = assetsItemData[i];
               i++;
            }
            this.load(dict,this.vars,this.mode);
            return;
         }
         i = 0;
         len = int(assetsItemData.length);
         while(i < len)
         {
            itemData = assetsItemData[i];
            if(this.assetsData[itemData.id] == undefined)
            {
               this.assetsData[itemData.id] = itemData;
               this.vars.ids.push(itemData.id);
               remainPercent = 100 - this.currentPercent;
               this.averagePercent = remainPercent / this.vars.ids.length;
            }
            i++;
         }
      }
      
      public function pause() : void
      {
         if(this.mode == AssetsLoadMode.CONCURRENT)
         {
            return;
         }
         this._isPause = true;
      }
      
      public function resume() : void
      {
         var id2:String = null;
         if(!this._isPause)
         {
            return;
         }
         this._isPause = false;
         if(this.vars.ids.length <= 0)
         {
            this.checkComplete();
            return;
         }
         id2 = this.vars.ids[0];
         AssetsManager.addAssetsToList(this.assetsData[id2]);
         this.assetsLoaded[id2] = false;
         AssetsManager.getAsset(id2);
      }
      
      public function get isComplete() : Boolean
      {
         return !this.isLoading;
      }
      
      public function get isPause() : Boolean
      {
         return this._isPause;
      }
      
      public function destory(ids:Array) : void
      {
         if(ids.length == 0)
         {
            return;
         }
         var i:int = 0;
         var len:int = int(ids.length);
         while(i < len)
         {
            AssetsManager.removeAssetsFromList(ids[i]);
            i++;
         }
      }
      
      private function onGetSuccess(a_4730:AssetsManagerEvent) : void
      {
         if(!this.haveID(a_4730.value.code))
         {
            return;
         }
         var id:int = int(this.vars.ids.indexOf(a_4730.value.code));
         if(id > -1)
         {
            this.vars.ids.splice(id,1);
         }
         this.assetsLoaded[a_4730.value.code] = a_4730.value;
         this.assetsLoading[a_4730.value.code] = this.averagePercent;
         dispatchEvent(new a_4641(a_4641.a_1124,this.assetsData[a_4730.value.code]));
         delete this.assetsData[a_4730.value.code];
         this.checkComplete();
      }
      
      private function onGetFall(a_4730:AssetsManagerEvent) : void
      {
         if(!this.haveID(a_4730.value.code))
         {
            return;
         }
         trace("onGetFall>>" + a_4730.value.code);
         this.assetsLoaded[a_4730.value.code] = null;
         this.assetsLoading[a_4730.value.code] = 0;
         var id:int = int(this.vars.ids.indexOf(a_4730.value.code));
         if(id > -1)
         {
            this.vars.ids.splice(id,1);
         }
         dispatchEvent(new a_4641(a_4641.LOAD_ERROR,this.assetsData[a_4730.value.code]));
         delete this.assetsData[a_4730.value.code];
         this.checkComplete();
      }
      
      private function onGetProgress(a_4730:AssetsManagerEvent) : void
      {
         var k:String = null;
         var parms:Array = null;
         if(!this.haveID(a_4730.value.code))
         {
            return;
         }
         var loadedData:Object = a_4730.value.data;
         if(loadedData.bytesTotal > 0)
         {
            this.assetsLoading[a_4730.value.code] = this.averagePercent * loadedData.bytesLoaded / loadedData.bytesTotal;
         }
         this.currentPercent = 0;
         for(k in this.assetsLoading)
         {
            this.currentPercent += this.assetsLoading[k];
         }
         if(this.currentPercent > 100)
         {
            this.currentPercent = 100;
         }
         var data:Object = {
            "id":a_4730.value.code,
            "totalPercent":this.currentPercent / 100,
            "thisLoadedData":loadedData
         };
         dispatchEvent(new a_4641(a_4641.LOAD_PROGRESS,data));
         if(this.vars != null)
         {
            if(this.vars.onProgress != undefined && this.vars.onProgress is Function)
            {
               parms = [data];
               if(this.vars.onProgressParms != null)
               {
                  parms = parms.concat(this.vars.onProgressParms);
               }
               this.vars.onProgress.apply(null,parms);
            }
         }
      }
      
      private function checkComplete() : void
      {
         var k:String = null;
         var id2:String = null;
         var parms:Array = null;
         if(!this.isLoading)
         {
            return;
         }
         if(this.mode == AssetsLoadMode.CONCURRENT)
         {
            if(this.vars.ids.length > 0)
            {
               return;
            }
         }
         else
         {
            if(this._isPause)
            {
               return;
            }
            if(this.vars.ids.length > 0)
            {
               id2 = this.vars.ids[0];
               AssetsManager.addAssetsToList(this.assetsData[id2]);
               this.assetsLoaded[id2] = false;
               AssetsManager.getAsset(id2);
               return;
            }
         }
         this.am.removeEventListener(AssetsManagerEvent.GET_SUCCESS,this.onGetSuccess);
         this.am.removeEventListener(AssetsManagerEvent.GET_FAIL,this.onGetFall);
         this.am.removeEventListener(AssetsManagerEvent.a_101,this.onGetProgress);
         this.currentPercent = 0;
         this.averagePercent = 0;
         this.assetsLoading = null;
         this.isLoading = false;
         this.assetsData = null;
         this.vars.ids = null;
         var dictTemp:Dictionary = new Dictionary(true);
         for(k in this.assetsLoaded)
         {
            dictTemp[k] = this.assetsLoaded[k];
            delete this.assetsLoaded[k];
         }
         this.assetsLoaded = null;
         dispatchEvent(new a_4641(a_4641.a_1124,dictTemp));
         if(this.vars != null)
         {
            if(this.vars.onComplete != undefined && this.vars.onComplete is Function)
            {
               parms = [dictTemp];
               if(this.vars.onCompleteParms != null)
               {
                  parms = parms.concat(this.vars.onCompleteParms);
               }
               this.vars.onComplete.apply(null,parms);
            }
         }
      }
      
      private function haveID(id:String) : Boolean
      {
         if(this.assetsData == null)
         {
            trace("异常报错,加载这个ID" + id + "有问题");
            return false;
         }
         return this.assetsData[id] != undefined;
      }
   }
}

