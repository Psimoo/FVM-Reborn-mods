package com.aurora.ui.maogoutd.component.dialog
{
   import flash.display.Sprite;
   
   public class DialogMask extends Sprite
   {
      
      public function DialogMask(wid:int, hei:int, color:int = 0, alpha:Number = 0.8)
      {
         super();
         this.drawMask(wid,hei,color,alpha);
      }
      
      private function drawMask(w:int, h:int, c:int, a:Number) : void
      {
         this.graphics.beginFill(c,a);
         this.graphics.drawRect(0,0,w,h);
         this.graphics.endFill();
      }
   }
}

