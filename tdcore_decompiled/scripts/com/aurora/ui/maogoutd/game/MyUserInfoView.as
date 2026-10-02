package com.aurora.ui.maogoutd.game
{
   import com.aurora.ui.maogoutd.component.BlueDiamond;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.text.TextField;
   
   public class MyUserInfoView extends Sprite
   {
      
      public var m_stAvatarFaceBitmapData:BitmapData;
      
      public var m_stAvatarFaceBitmap:Bitmap;
      
      public var m_stLevelMovie:MovieClip;
      
      public var m_stUserNameText:TextField;
      
      public var m_BlueDiamondSp:BlueDiamond;
      
      public var m_iUin:int;
      
      public function MyUserInfoView()
      {
         super();
         this.m_stUserNameText.text = "乖妹";
         this.m_stAvatarFaceBitmap = new Bitmap();
         this.m_stAvatarFaceBitmap.x = 10;
         this.m_stAvatarFaceBitmap.y = 7;
         addChildAt(this.m_stAvatarFaceBitmap,1);
         this.m_stAvatarFaceBitmapData = new BitmapData(78,72);
         this.m_stAvatarFaceBitmap.bitmapData = this.m_stAvatarFaceBitmapData;
         this.m_stAvatarFaceBitmap.smoothing = true;
         this.m_stAvatarFaceBitmap.width = 60;
         this.m_stAvatarFaceBitmap.height = 55;
      }
      
      public function showBlueDiamond(iType:int = 0, iLevel:int = 1, iYear:Boolean = false) : void
      {
         this.m_BlueDiamondSp.ShowBlueDiamond(iType,iLevel,iYear);
      }
   }
}

