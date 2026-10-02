package com.aurora.ui.maogoutd.game
{
   import a_4714.AssetType;
   import a_4714.AssetsItemData;
   import a_4714.AssetsLoader;
   import a_4752.a_2037;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.utils.Dictionary;
   import flash.utils.clearTimeout;
   import flash.utils.setInterval;
   
   public class GameEnterExtraStageView extends Sprite
   {
      
      public var m_stGameIslandNameMovie:MovieClip;
      
      public var m_stContinueButton:SimpleButton;
      
      public var m_stCancelGetRewardButton:SimpleButton;
      
      public var m_stWaitingSelectView:Sprite;
      
      public var m_stWaitingTimeTextField:TextField;
      
      private var a_1110:int = -1;
      
      private var bossAvatarBitmap:Bitmap;
      
      private var bossKeyNameBitmap:Bitmap;
      
      private var bossKeyIconBitmap:Bitmap;
      
      public function GameEnterExtraStageView()
      {
         super();
         this.m_stContinueButton.addEventListener(MouseEvent.CLICK,this.a_3530);
         this.m_stCancelGetRewardButton.addEventListener(MouseEvent.CLICK,this.a_3531);
         this.m_stWaitingSelectView.visible = false;
         this.m_stWaitingTimeTextField.visible = false;
      }
      
      public function a_1797(iTypeID:int, iMapID:int) : void
      {
         if(this.bossAvatarBitmap != null)
         {
            this.bossAvatarBitmap.visible = false;
         }
         if(this.bossKeyNameBitmap != null)
         {
            this.bossKeyNameBitmap.visible = false;
         }
         if(this.bossKeyIconBitmap != null)
         {
            this.bossKeyIconBitmap.visible = false;
         }
         if(1 == iTypeID)
         {
            this.m_stContinueButton.visible = true;
            this.m_stCancelGetRewardButton.visible = true;
            this.m_stWaitingSelectView.visible = false;
            this.m_stWaitingTimeTextField.visible = false;
         }
         else if(0 == iTypeID)
         {
            this.m_stContinueButton.visible = false;
            this.m_stCancelGetRewardButton.visible = false;
            this.m_stWaitingSelectView.visible = true;
            this.m_stWaitingTimeTextField.visible = true;
         }
         else if(2 == iTypeID)
         {
            visible = false;
         }
         var iCurMapID:int = iMapID;
         if(iCurMapID >= 1090519040 && iCurMapID < 1140850688)
         {
            iCurMapID &= 65535;
         }
         var objMapInfo:Object = a_2037.getInstance().m_dictMapMouse[iMapID];
         var idArr:Array = objMapInfo.szBossID.split(",");
         var iBossID:int = 0;
         if(Boolean(idArr) && Boolean(idArr.length))
         {
            iBossID = int(idArr[idArr.length - 1]);
         }
         this.loadAvatar(iBossID.toString());
         this.loadKey(objMapInfo.szMapKey.split(",")[0]);
         this.m_stWaitingTimeTextField.visible = true;
         this.m_stWaitingTimeTextField.text = "9";
         this.a_1110 = setInterval(this.OnTimeIntervalEvent,1000);
      }
      
      private function loadAvatar(bossId:String) : void
      {
         if(!this.bossAvatarBitmap)
         {
            this.bossAvatarBitmap = new Bitmap();
            this.m_stGameIslandNameMovie.addChild(this.bossAvatarBitmap);
            this.bossAvatarBitmap.x = 7;
            this.bossAvatarBitmap.y = 736;
         }
         var key:String = bossId + "_bigBossHead_avatar";
         var dic:Dictionary = new Dictionary();
         var url:String = "./images/head/bigBossHead/" + bossId + ".png";
         dic[key] = new AssetsItemData(url,AssetType.PNG,key);
         var loader:AssetsLoader = new AssetsLoader();
         loader.load(dic,{
            "onComplete":this.avatarImageLoadComplete,
            "onCompleteParms":[key]
         });
      }
      
      private function loadKey(keyID:String) : void
      {
         if(!this.bossKeyNameBitmap)
         {
            this.bossKeyNameBitmap = new Bitmap();
            this.m_stGameIslandNameMovie.addChild(this.bossKeyNameBitmap);
            this.bossKeyNameBitmap.x = -274;
            this.bossKeyNameBitmap.y = 826;
         }
         if(!this.bossKeyIconBitmap)
         {
            this.bossKeyIconBitmap = new Bitmap();
            this.m_stGameIslandNameMovie.addChild(this.bossKeyIconBitmap);
            this.bossKeyIconBitmap.x = -175;
            this.bossKeyIconBitmap.y = 817;
         }
         var key1:String = keyID + "_keyName_avatar";
         var key2:String = keyID + "_keyIcon_avatar";
         var dic1:Dictionary = new Dictionary();
         var dic2:Dictionary = new Dictionary();
         dic1[key1] = new AssetsItemData("./images/head/keyName/" + keyID + ".png",AssetType.PNG,key1);
         dic2[key2] = new AssetsItemData("./images/head/keyIcon/" + keyID + ".png",AssetType.PNG,key2);
         var loader1:AssetsLoader = new AssetsLoader();
         loader1.load(dic1,{
            "onComplete":this.keyNameImageLoadComplete,
            "onCompleteParms":[key1]
         });
         var loader2:AssetsLoader = new AssetsLoader();
         loader2.load(dic2,{
            "onComplete":this.keyIconImageLoadComplete,
            "onCompleteParms":[key2]
         });
      }
      
      private function avatarImageLoadComplete(dic:Dictionary, key:String) : void
      {
         var avatarBitmapData:BitmapData = null;
         if(dic[key])
         {
            avatarBitmapData = dic[key].data.bitmapData;
            this.bossAvatarBitmap.bitmapData = avatarBitmapData;
            this.bossAvatarBitmap.visible = true;
         }
      }
      
      private function keyNameImageLoadComplete(dic:Dictionary, key:String) : void
      {
         var avatarBitmapData:BitmapData = null;
         if(dic[key])
         {
            avatarBitmapData = dic[key].data.bitmapData;
            this.bossKeyNameBitmap.bitmapData = avatarBitmapData;
            this.bossKeyNameBitmap.visible = true;
         }
      }
      
      private function keyIconImageLoadComplete(dic:Dictionary, key:String) : void
      {
         var avatarBitmapData:BitmapData = null;
         if(dic[key])
         {
            avatarBitmapData = dic[key].data.bitmapData;
            this.bossKeyIconBitmap.bitmapData = avatarBitmapData;
            this.bossKeyIconBitmap.visible = true;
         }
      }
      
      private function a_3530(stEvent:Event) : void
      {
         visible = false;
         if(this.a_1110 >= 0)
         {
            clearTimeout(this.a_1110);
            this.a_1110 = -1;
         }
      }
      
      private function a_3531(stEvent:Event) : void
      {
         visible = false;
         if(this.a_1110 >= 0)
         {
            clearTimeout(this.a_1110);
            this.a_1110 = -1;
         }
      }
      
      private function OnTimeIntervalEvent() : void
      {
         var iTime:int = parseInt(this.m_stWaitingTimeTextField.text);
         if(iTime > 0)
         {
            iTime--;
            this.m_stWaitingTimeTextField.text = iTime.toString();
         }
      }
      
      private function a_3532() : void
      {
         this.m_stCancelGetRewardButton.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
      }
   }
}

