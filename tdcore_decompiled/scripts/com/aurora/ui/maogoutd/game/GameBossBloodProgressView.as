package com.aurora.ui.maogoutd.game
{
   import a_4714.AssetType;
   import a_4714.AssetsItemData;
   import a_4714.AssetsLoader;
   import a_4752.a_2037;
   import com.aurora.ui.maogoutd.diy.xml.DIYConfigData;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4269;
   import com.aurora.ui.maogoutd.resource.bitmap.BloodProgressMaskBitmapData;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import flash.utils.Dictionary;
   
   public class GameBossBloodProgressView extends Sprite
   {
      
      public static var ms_arrLocalizedDataArray:Array = [];
      
      public static var ms_arrMapInfoDataArray:Array = [];
      
      public static var m_stGameInfo:Object = {};
      
      public var m_stBossNameText:TextField;
      
      public var m_iMapID:int;
      
      public var m_stBloodProgressMaskBitmap:Bitmap = new Bitmap();
      
      private var a_1085:Rectangle = new Rectangle();
      
      private var a_1086:BitmapData = new BloodProgressMaskBitmapData(516,12,true,0);
      
      private var a_1087:BitmapData;
      
      private var avatarBitmap:Bitmap;
      
      public function GameBossBloodProgressView()
      {
         super();
         m_stGameInfo = {};
         this.m_stBossNameText.text = "洞君";
         this.a_1087 = new BitmapData(516,12,true,0);
         this.m_stBloodProgressMaskBitmap.bitmapData = this.a_1087;
         this.m_stBloodProgressMaskBitmap.x = 57;
         this.m_stBloodProgressMaskBitmap.y = 44;
         addChild(this.m_stBloodProgressMaskBitmap);
         if(!this.avatarBitmap)
         {
            this.avatarBitmap = new Bitmap();
            this.addChild(this.avatarBitmap);
            this.avatarBitmap.x = 4;
            this.avatarBitmap.y = 19;
         }
         this.a_1797(0,0);
      }
      
      public function a_1797(iMapID:int, iBossNum:int, pendingAddMoveIntruderVector:Vector.<a_4269> = null) : Boolean
      {
         var i:int = 0;
         var objMapInfo:Object = null;
         var nameArr:Array = null;
         var idArr:Array = null;
         this.m_iMapID = iMapID;
         var bossID:int = 29;
         var strBossName:String = "洞君";
         var max:int = 0;
         if((iMapID & 0xF0000000) == 1610612736)
         {
            if(pendingAddMoveIntruderVector != null && Boolean(pendingAddMoveIntruderVector.length))
            {
               for(i = 0; i < pendingAddMoveIntruderVector.length; i++)
               {
                  if(pendingAddMoveIntruderVector[i].m_iIntruderYGridNo < 0)
                  {
                     bossID = pendingAddMoveIntruderVector[i].m_iIntruderType - 8388608;
                     strBossName = DIYConfigData.Get().GetBossData(bossID).sBossName;
                     break;
                  }
               }
            }
         }
         else if(a_2037.getInstance().m_dictMapMouse[iMapID] != null)
         {
            objMapInfo = a_2037.getInstance().m_dictMapMouse[iMapID];
            nameArr = objMapInfo.szBossName.split(",");
            idArr = objMapInfo.szBossID.split(",");
            if(iBossNum >= 0 && iBossNum <= nameArr.length - 1)
            {
               strBossName = nameArr[iBossNum];
            }
            if(iBossNum >= 0 && iBossNum <= idArr.length - 1)
            {
               bossID = int(idArr[iBossNum]);
            }
            max = int(idArr.length);
         }
         this.m_stBossNameText.text = strBossName;
         this.loadAvatar(bossID.toString());
         this.m_stBloodProgressMaskBitmap.visible = true;
         this.a_1087.fillRect(this.a_1087.rect,0);
         if(Boolean(this.m_stBossNameText.text) && Boolean(ms_arrLocalizedDataArray[this.m_stBossNameText.text]))
         {
            this.m_stBossNameText.text = ms_arrLocalizedDataArray[this.m_stBossNameText.text];
         }
         return true;
      }
      
      private function loadAvatar(bossId:String) : void
      {
         var key:String = null;
         var dic:Dictionary = null;
         key = bossId + "_minHpBar_boss";
         dic = new Dictionary();
         var url:String = "./images/head/minHpBar/" + bossId + ".png";
         dic[key] = new AssetsItemData(url,AssetType.PNG,key);
         this.avatarBitmap.visible = false;
         var loader:AssetsLoader = new AssetsLoader();
         loader.load(dic,{
            "onComplete":this.avatarImageLoadComplete,
            "onCompleteParms":[key]
         },1);
      }
      
      private function avatarImageLoadComplete(dic:Dictionary, key:String) : void
      {
         var avatarBitmapData:BitmapData = null;
         if(dic[key])
         {
            avatarBitmapData = dic[key].data.bitmapData;
            this.avatarBitmap.bitmapData = avatarBitmapData;
            this.avatarBitmap.visible = true;
         }
      }
      
      public function a_3510(numProgress:Number) : Boolean
      {
         if(numProgress <= 0)
         {
            numProgress = 0;
         }
         this.a_1087.copyPixels(this.a_1086,this.a_1086.rect,new Point(0,0));
         this.a_1085.width = this.a_1086.width * numProgress;
         this.a_1085.height = this.a_1086.height;
         this.a_1087.fillRect(this.a_1085,0);
         return true;
      }
   }
}

