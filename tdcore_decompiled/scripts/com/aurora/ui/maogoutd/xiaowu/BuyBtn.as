package com.aurora.ui.maogoutd.xiaowu
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class BuyBtn extends MovieClip
   {
      
      public var m_ItenCost:TextField;
      
      public function BuyBtn()
      {
         super();
         this.gotoAndStop(1);
         this.addEventListener(MouseEvent.ROLL_OVER,this.onMouseOverEvent);
         this.addEventListener(MouseEvent.ROLL_OUT,this.onMouseOutEvent);
         this.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDownEvent);
         this.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUpEvent);
         this.useHandCursor = true;
         this.buttonMode = true;
         this.m_ItenCost.mouseEnabled = false;
      }
      
      protected function onMouseUpEvent(a_4730:MouseEvent) : void
      {
         this.gotoAndStop(1);
      }
      
      protected function onMouseDownEvent(a_4730:MouseEvent) : void
      {
         this.gotoAndStop(3);
      }
      
      protected function onMouseOutEvent(a_4730:MouseEvent) : void
      {
         this.gotoAndStop(1);
      }
      
      protected function onMouseOverEvent(a_4730:MouseEvent) : void
      {
         this.gotoAndStop(2);
      }
      
      public function setLabel(value:String) : void
      {
         this.m_ItenCost.text = value;
      }
   }
}

