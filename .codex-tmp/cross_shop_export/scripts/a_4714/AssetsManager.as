package a_4714
{
   import a_4782.a_4641;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.utils.Dictionary;
   
   public class AssetsManager extends EventDispatcher
   {
      
      private static var _instance:AssetsManager;
      
      private static var assetsList:Dictionary;
      
      private static var sign:Boolean = false;
      
      public function AssetsManager(target:IEventDispatcher = null)
      {
         super(target);
         if(!sign)
         {
            throw new Error("AssetsManager 是一个静态类，请通过getInstance()获取AssetsManager的引用！");
         }
      }
      
      public static function getInstance() : AssetsManager
      {
         if(_instance == null)
         {
            sign = true;
            _instance = new AssetsManager();
            sign = false;
         }
         return _instance;
      }
      
      public static function addAssetsToList(data:AssetsItemData) : void
      {
         if(assetsList == null)
         {
            assetsList = new Dictionary(true);
         }
         if(assetsList[data.id] == undefined)
         {
            assetsList[data.id] = data;
         }
      }
      
      public static function removeAssetsFromList(id:String) : Boolean
      {
         if(assetsList == null)
         {
            return false;
         }
         if(assetsList[id] == undefined)
         {
            return false;
         }
         var data:AssetsItemData = assetsList[id];
         if(data.itemRef != null)
         {
            if(data.itemRef.hasEventListener(a_4641.a_1124))
            {
               data.itemRef.removeEventListener(a_4641.a_1124,onAssetItemLoadComplete);
               data.itemRef.removeEventListener(a_4641.LOAD_ERROR,onAssetItemLoadError);
               data.itemRef.removeEventListener(a_4641.LOAD_PROGRESS,onAssetItemLoadProgress);
            }
         }
         data.destory();
         delete assetsList[id];
         return true;
      }
      
      public static function getAsset(id:String) : void
      {
         if(id == "")
         {
            throw new Error("提供的ID不能为空！");
         }
         if(assetsList[id] == undefined)
         {
            throw new Error("提供的ID=" + id + "不存在，请检查你的ID是否正确或者通过addAssetsToList设置该ID对应的数据然后再获取！");
         }
         var data:AssetsItemData = assetsList[id];
         if(data.itemRef == null)
         {
            data.itemRef = new AssetItem(data);
         }
         if(!data.itemRef.hasEventListener(a_4641.a_1124))
         {
            data.itemRef.addEventListener(a_4641.a_1124,onAssetItemLoadComplete);
            data.itemRef.addEventListener(a_4641.LOAD_ERROR,onAssetItemLoadError);
            data.itemRef.addEventListener(a_4641.LOAD_PROGRESS,onAssetItemLoadProgress);
         }
         data.itemRef.getAsset();
      }
      
      private static function onAssetItemLoadComplete(a_4730:a_4641) : void
      {
         a_4730.target.removeEventListener(a_4641.a_1124,onAssetItemLoadComplete);
         a_4730.target.removeEventListener(a_4641.LOAD_ERROR,onAssetItemLoadError);
         a_4730.target.removeEventListener(a_4641.LOAD_PROGRESS,onAssetItemLoadProgress);
         var data:Object = a_4730.value;
         if(!assetsList[data.code].holder)
         {
            assetsList[data.code].destory();
            delete assetsList[data.code];
         }
         _instance.dispatchEvent(new AssetsManagerEvent(AssetsManagerEvent.GET_SUCCESS,data));
      }
      
      private static function onAssetItemLoadError(a_4730:a_4641) : void
      {
         a_4730.target.removeEventListener(a_4641.a_1124,onAssetItemLoadComplete);
         a_4730.target.removeEventListener(a_4641.LOAD_ERROR,onAssetItemLoadError);
         _instance.dispatchEvent(new AssetsManagerEvent(AssetsManagerEvent.GET_FAIL,a_4730.value));
      }
      
      private static function onAssetItemLoadProgress(a_4730:a_4641) : void
      {
         _instance.dispatchEvent(new AssetsManagerEvent(AssetsManagerEvent.a_101,a_4730.value));
      }
   }
}

