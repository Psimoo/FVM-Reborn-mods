package com.aurora.ui.maogoutd.diy.myEditor.data
{
   import flash.display.Bitmap;
   import flash.display.Sprite;
   
   public class MonsterData extends Sprite
   {
      
      public var iMonsterID:int;
      
      public var sMonsterName:String;
      
      public var iMonsterBlood:int;
      
      public var iWave:int;
      
      public var iGroup:int;
      
      public var iTime:int;
      
      public var iRow:int;
      
      public var iType:int;
      
      public var sUrl:String;
      
      public var m_bitShowImage:Bitmap;
      
      public function MonsterData()
      {
         super();
         this.m_bitShowImage = new Bitmap();
         this.m_bitShowImage.scaleX = 0.85;
         this.m_bitShowImage.scaleY = 0.85;
         addChild(this.m_bitShowImage);
      }
   }
}

