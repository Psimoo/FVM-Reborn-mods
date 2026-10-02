package com.aurora.ui.maogoutd.component.tip
{
   import a_4714.AssetType;
   import a_4714.AssetsItemData;
   import a_4714.AssetsLoader;
   import com.aurora.ui.maogoutd.component.a_3228;
   import com.aurora.ui.maogoutd.component.a_3306;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.text.TextField;
   import flash.utils.Dictionary;
   
   public class BuffTip extends Sprite implements CardTip
   {
      
      public var nameText:TextField;
      
      public var typeText:TextField;
      
      public var functionText:TextField;
      
      public var iconNode:MovieClip;
      
      public var backGroundNode:MovieClip;
      
      private var tipBg:TipBG;
      
      private var iconBitmap:Bitmap;
      
      public function BuffTip()
      {
         super();
         this.tipBg = new TipBG();
         this.backGroundNode.addChild(this.tipBg);
         this.iconBitmap = new Bitmap();
         this.iconNode.addChild(this.iconBitmap);
      }
      
      public function showCardTip(tipDesc:a_3306, attr:a_3228) : void
      {
         this.nameText.htmlText = "<b>" + tipDesc.Name + "</b>";
         this.typeText.text = tipDesc.Type;
         this.functionText.htmlText = tipDesc.Desc;
         this.tipBg.setSize(0,0,213,200);
         if(this.iconBitmap)
         {
            this.iconBitmap.bitmapData = null;
         }
         this.loadIcon(attr.CardID);
      }
      
      private function loadIcon(buffId:int) : void
      {
         var key:String = "0x" + buffId.toString(16);
         var dic:Dictionary = new Dictionary();
         var url:String = "./images/1/2/" + key + ".png";
         dic[key] = new AssetsItemData(url,AssetType.PNG,key);
         var loader:AssetsLoader = new AssetsLoader();
         loader.load(dic,{
            "onComplete":this.buffImageLoadComplete,
            "onCompleteParms":[key]
         });
      }
      
      private function buffImageLoadComplete(dic:Dictionary, key:String) : void
      {
         var avatarBitmapData:BitmapData = null;
         if(dic[key])
         {
            avatarBitmapData = dic[key].data.bitmapData;
            this.iconBitmap.bitmapData = avatarBitmapData;
         }
      }
   }
}

