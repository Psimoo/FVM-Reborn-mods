package com.aurora.ui.maogoutd.component.tip
{
   import com.aurora.ui.maogoutd.component.a_3228;
   import com.aurora.ui.maogoutd.component.a_3306;
   import flash.display.Sprite;
   import flash.text.TextField;
   
   public class ExploreTaskTip extends Sprite
   {
      
      public var nameText:TextField;
      
      public var completeNumText:TextField;
      
      public var DescText:TextField;
      
      public var tipbg:TipBG;
      
      public function ExploreTaskTip()
      {
         super();
         this.DescText.wordWrap = true;
         this.DescText.multiline = true;
      }
      
      public function showTaskTip(tipDesc:Object) : void
      {
         if(tipDesc != null)
         {
            this.showType(tipDesc.completeNum);
            this.DescText.htmlText = tipDesc.mDesc;
            this.DescText.height = this.DescText.textHeight + 20;
            this.showName(tipDesc.m_id);
         }
         var height:int = this.DescText.height + this.DescText.y + 10;
         this.tipbg.setSize(0,0,220,height);
         this.nameText.x = this.tipbg.x + (this.tipbg.width - this.nameText.width) * 0.5;
      }
      
      public function showCardTip(tipDesc:a_3306, attr:a_3228) : void
      {
      }
      
      private function showName(Name:String) : void
      {
         if(Name != null)
         {
            this.nameText.htmlText = Name;
         }
         else
         {
            this.nameText.htmlText = "";
         }
      }
      
      private function showType(Type:String) : void
      {
         if(Type != null)
         {
            this.completeNumText.text = Type;
         }
         else
         {
            this.completeNumText.text = "";
         }
      }
      
      private function showDesc(Desc:String) : void
      {
         if(Desc != null)
         {
            this.DescText.htmlText = Desc;
         }
         else
         {
            this.DescText.htmlText = "";
         }
         this.DescText.height = this.DescText.textHeight + 20;
      }
   }
}

