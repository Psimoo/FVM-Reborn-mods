package com.aurora.ui.maogoutd.crossshop
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol98")]
   public class Tip extends MovieClip
   {
      
      private var m_stText:TextField;
      
      public function Tip()
      {
         super();
         this.m_stText = new TextField();
         this.m_stText.x = 15;
         this.m_stText.y = 20;
         this.m_stText.width = 150;
         this.m_stText.height = 50;
         this.m_stText.multiline = true;
         this.m_stText.wordWrap = true;
         this.m_stText.textColor = 11652334;
         this.setValue(20);
         addChild(this.m_stText);
      }
      
      public function setValue(value:int) : void
      {
         var msg:String = "赤铜徽章:用来购买赤铜商店中的物品";
         if(value == 1)
         {
            msg = "赤铜徽章:用来购买赤铜商店中的物品";
         }
         else if(value == 2)
         {
            msg = "白银徽章:用来购买白银商店中的物品";
         }
         else if(value == 3)
         {
            msg = "黄金徽章:用来购买黄金商店中的物品";
         }
         this.m_stText.text = msg;
      }
   }
}

