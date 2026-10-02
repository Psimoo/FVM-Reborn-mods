package com.aurora.ui.maogoutd.component
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public class BaseButton extends MovieClip
   {
      
      private var m_isClick:Boolean = false;
      
      public var iGoodsIndex:int;
      
      public function BaseButton()
      {
         super();
         this.gotoAndStop(4);
         this.addEventListener(MouseEvent.ROLL_OVER,this.onMouseOverEvent);
         this.addEventListener(MouseEvent.ROLL_OUT,this.onMouseOutEvent);
         this.addEventListener(MouseEvent.CLICK,this.onMouseClickEvent);
         this.useHandCursor = true;
         this.buttonMode = true;
      }
      
      private function onMouseOverEvent(a_4730:MouseEvent) : void
      {
         if(this.m_isClick)
         {
            this.gotoAndStop(2);
         }
         else
         {
            this.gotoAndStop(5);
         }
      }
      
      private function onMouseOutEvent(a_4730:MouseEvent) : void
      {
         if(this.m_isClick)
         {
            this.gotoAndStop(1);
         }
         else
         {
            this.gotoAndStop(6);
         }
      }
      
      private function onMouseClickEvent(a_4730:MouseEvent) : void
      {
         this.m_isClick = true;
         if(this.m_isClick)
         {
            this.gotoAndStop(4);
         }
         else
         {
            this.gotoAndStop(5);
         }
      }
      
      public function set Click(isClick:Boolean) : void
      {
         this.m_isClick = isClick;
         if(this.m_isClick)
         {
            this.gotoAndStop(1);
         }
         else
         {
            this.gotoAndStop(6);
         }
      }
      
      public function get Click() : Boolean
      {
         return this.m_isClick;
      }
      
      public function removeClickEvent() : void
      {
         this.removeEventListener(MouseEvent.CLICK,this.onMouseClickEvent);
      }
   }
}

