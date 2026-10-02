package com.aurora.ui.maogoutd.component.tip
{
   import com.aurora.ui.maogoutd.component.a_3306;
   import flash.display.Sprite;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   public class MouseTip extends Sprite
   {
      
      public var nameText:TextField;
      
      public var TypeText:TextField;
      
      public var HitText:TextField;
      
      public var SpeedText:TextField;
      
      public var DescText:TextField;
      
      public var SloganText:TextField;
      
      public var m_TeText:TextField;
      
      public var m_DianText:TextField;
      
      public var tipbg:TipBG;
      
      public function MouseTip()
      {
         super();
         this.mouseEnabled = false;
         this.mouseChildren = false;
         this.SpeedText.autoSize = TextFieldAutoSize.LEFT;
         this.SpeedText.wordWrap = true;
         this.DescText.autoSize = TextFieldAutoSize.LEFT;
         this.DescText.wordWrap = true;
         this.SloganText.autoSize = TextFieldAutoSize.LEFT;
         this.SloganText.wordWrap = true;
      }
      
      public function setMouseTip(mouseDesc:a_3306) : void
      {
         this.showType(mouseDesc.Type);
         this.showName(mouseDesc.Name);
         this.showDesc(mouseDesc.Desc);
         this.showHit(mouseDesc.Hit);
         this.showSlogan(mouseDesc.Slogan);
         this.showSpeed(mouseDesc.Speed);
         this.DescText.y = this.m_TeText.y = this.m_DianText.y = this.SpeedText.height + this.SpeedText.y + 8;
         this.SloganText.y = this.DescText.height + this.DescText.y + 11;
         var height:int = this.SloganText.height + this.SloganText.y + 12;
         this.tipbg.setSize(0,0,206,height);
         this.nameText.x = this.tipbg.x + 0.5 * (this.tipbg.width - this.nameText.width);
      }
      
      public function showType(Type:String) : void
      {
         if(Type != null)
         {
            this.TypeText.text = Type;
         }
         else
         {
            this.TypeText.text = Type;
         }
      }
      
      private function showName(Name:String) : void
      {
         if(Name != null)
         {
            this.nameText.htmlText = "<b>" + Name + "</b>";
         }
         else
         {
            this.nameText.htmlText = "";
         }
      }
      
      public function showHit(Hit:String) : void
      {
         var formate:TextFormat = null;
         if(Hit != null)
         {
            this.HitText.text = Hit;
            formate = this.HitText.getTextFormat();
            if(Hit == "极高")
            {
               formate.color = 16269633;
            }
            else if(Hit == "高")
            {
               formate.color = 5066061;
            }
            else if(Hit == "中")
            {
               formate.color = 10275484;
            }
            else if(Hit == "底")
            {
               formate.color = 13302008;
            }
            else
            {
               formate.color = 16269633;
            }
         }
         else
         {
            this.HitText.text = "";
         }
      }
      
      public function showSpeed(Speed:String) : void
      {
         if(Speed != null)
         {
            this.SpeedText.htmlText = Speed;
         }
         else
         {
            this.SpeedText.htmlText = Speed;
         }
      }
      
      public function showSlogan(Slogan:String) : void
      {
         if(Slogan != null)
         {
            this.SloganText.htmlText = Slogan;
         }
         else
         {
            this.SloganText.htmlText = "";
         }
      }
      
      public function showDesc(Desc:String) : void
      {
         if(Desc != null)
         {
            this.DescText.htmlText = Desc;
         }
         else
         {
            this.DescText.htmlText = "";
         }
      }
   }
}

