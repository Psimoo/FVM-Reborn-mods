package com.aurora.ui.maogoutd.component.tip
{
   import com.aurora.ui.maogoutd.component.a_3228;
   import com.aurora.ui.maogoutd.component.a_3306;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.text.TextField;
   
   public class DuanweiTip extends Sprite implements CardTip
   {
      
      public var functionText:TextField;
      
      public var backGroundNode:MovieClip;
      
      private var tipBg:TipBG;
      
      public function DuanweiTip()
      {
         super();
         this.tipBg = new TipBG();
         this.backGroundNode.addChild(this.tipBg);
      }
      
      public function showCardTip(tipDesc:a_3306, attr:a_3228) : void
      {
         this.functionText.htmlText = tipDesc.Desc;
         this.tipBg.setSize(0,0,180,100);
      }
   }
}

