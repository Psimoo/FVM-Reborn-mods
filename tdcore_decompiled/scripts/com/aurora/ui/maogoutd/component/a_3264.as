package com.aurora.ui.maogoutd.component
{
   import a_4794.a_4689;
   import flash.display.Sprite;
   
   public class a_3264 extends Sprite
   {
      
      private var a_943:String;
      
      private var numDisplay:a_4689;
      
      private var vw:int = 142;
      
      private var vh:int = 15;
      
      private var numScaleX:Number = 1;
      
      private var numScaleY:Number = 1;
      
      private var value:int = -1;
      
      private var align:int = 0;
      
      public function a_3264(bcn:String)
      {
         super();
         this.a_943 = bcn;
         this.init();
      }
      
      public function setScale(sx:Number, sy:Number) : void
      {
         this.numScaleX = sx;
         this.numScaleY = sy;
         this.numDisplay.setScale(this.numScaleX,this.numScaleY);
         this.adjust();
      }
      
      public function setSize(w:int, h:int, align:int = 0) : void
      {
         this.vw = w;
         this.vh = h;
         this.align = align;
         if(this.align < -1 || this.align > 1)
         {
            this.align = 0;
         }
         this.adjust();
      }
      
      public function setValue(v:*) : void
      {
         var reg:RegExp = null;
         var strNum:String = "";
         if(v is String)
         {
            reg = /[^0-9]/ig;
            v = String(v).replace(reg,"");
            if(v == "")
            {
               v = "0";
            }
            strNum = v;
            v = Number(v);
         }
         else
         {
            if(v < 0)
            {
               v = 0;
            }
            strNum = v.toString(10);
         }
         if(v == this.value)
         {
            return;
         }
         this.value = v;
         this.numDisplay.num = strNum;
         this.adjust();
      }
      
      public function getValue() : int
      {
         return this.value;
      }
      
      private function init() : void
      {
         var nums:Array = new Array(10);
         for(var i:int = 0; i < 10; i++)
         {
            nums[i] = this.a_943 + i;
         }
         this.numDisplay = new a_4689(nums);
         this.numDisplay.setScale(this.numScaleX,this.numScaleY);
         addChild(this.numDisplay);
         this.setValue(0);
      }
      
      private function adjust() : void
      {
         this.numDisplay.y = Math.round((this.vh - this.numDisplay.height) / 2);
         if(this.align == 0)
         {
            this.numDisplay.x = Math.round((this.vw - this.numDisplay.width) / 2);
         }
         else if(this.align == 1)
         {
            this.numDisplay.x = this.vw - this.numDisplay.width;
         }
         else
         {
            this.numDisplay.x = 0;
         }
      }
   }
}

