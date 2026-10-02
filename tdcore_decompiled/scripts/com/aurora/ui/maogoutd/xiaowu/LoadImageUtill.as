package com.aurora.ui.maogoutd.xiaowu
{
   import a_4714.AssetType;
   import a_4714.AssetsItemData;
   import a_4714.AssetsLoader;
   import flash.display.Bitmap;
   import flash.utils.Dictionary;
   
   public class LoadImageUtill
   {
      
      private static var instance:LoadImageUtill;
      
      private var m_dictImage:Dictionary;
      
      private var m_dictSWF:Dictionary;
      
      private var dictLoad:Dictionary;
      
      private var m_stLoader:AssetsLoader;
      
      public function LoadImageUtill()
      {
         super();
      }
      
      public static function getinstance() : LoadImageUtill
      {
         if(!instance)
         {
            instance = new LoadImageUtill();
         }
         return instance;
      }
      
      public function get dictImage() : Dictionary
      {
         if(this.m_dictImage == null)
         {
            this.m_dictImage = new Dictionary();
         }
         return this.m_dictImage;
      }
      
      public function get dictSWF() : Dictionary
      {
         if(this.m_dictSWF == null)
         {
            this.m_dictSWF = new Dictionary();
         }
         return this.m_dictSWF;
      }
      
      public function loadDisplayObject(m_iItemID:uint, callbackFun:Function) : void
      {
         var dictLoadSWF:Dictionary = new Dictionary();
         var m_stLoader:AssetsLoader = new AssetsLoader();
         var url:String = LoadImageUtill.getinstance().getCardImageUrl(m_iItemID);
         if((m_iItemID & 0x15D00000) == 365953024)
         {
            dictLoadSWF[m_iItemID] = new AssetsItemData(url,AssetType.SWF,m_iItemID.toString());
         }
         else
         {
            dictLoadSWF[m_iItemID] = new AssetsItemData(url,AssetType.PNG,m_iItemID.toString());
         }
         m_stLoader.load(dictLoadSWF,{"onComplete":callbackFun});
      }
      
      public function loadIcon(m_iItemID:uint, callbackFun:Function) : void
      {
         if(this.dictLoad == null)
         {
            this.dictLoad = new Dictionary();
         }
         if(this.m_stLoader == null)
         {
            this.m_stLoader = new AssetsLoader();
         }
         var url:String = LoadImageUtill.getinstance().getCardIconUrl(m_iItemID);
         var imgID:int = m_iItemID + 268435456;
         this.dictLoad[imgID] = new AssetsItemData(url,AssetType.PNG,imgID.toString());
         this.m_stLoader.load(this.dictLoad,{"onComplete":callbackFun});
      }
      
      public function getCardIconUrl(m_iItemID:uint) : String
      {
         var imgID:int = int(m_iItemID);
         return "images/home/icon" + "/0x" + imgID.toString(16).toLowerCase() + ".png";
      }
      
      public function getCardImageUrl(m_iItemID:uint) : String
      {
         var iType:int = 0;
         var imgID:int = int(m_iItemID);
         if((m_iItemID & 0x15D00000) == 365953024)
         {
            return "resource/smallRoom" + "/0x" + imgID.toString(16).toUpperCase() + ".swf";
         }
         return "images/home/picture" + "/0x" + imgID.toString(16).toLowerCase() + ".png";
      }
      
      private function a_4629(imageBitmapData:Bitmap, resPath:String) : void
      {
         var dic:Dictionary = new Dictionary();
         var url:String = "./images/" + resPath + ".png";
         dic[resPath] = new AssetsItemData(url,AssetType.PNG,resPath);
         var loader:AssetsLoader = new AssetsLoader();
         loader.load(dic,{
            "onComplete":this.onImageLoadComplete,
            "onCompleteParms":[resPath,imageBitmapData]
         },1);
      }
      
      private function onImageLoadComplete(dic:Dictionary, key:String, imageBitmapData:Bitmap) : void
      {
         if(dic[key])
         {
            imageBitmapData.bitmapData = dic[key].data.bitmapData;
         }
      }
   }
}

