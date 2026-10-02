package com.aurora.ui.maogoutd.component
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class DefGrid extends Sprite
   {
      
      private var _isOpen:Boolean;
      
      private var _isFull:Boolean;
      
      public var closeGridBg:MovieClip;
      
      public var bg:MovieClip;
      
      public var moveOverTip:MovieClip;
      
      public function DefGrid()
      {
         super();
         this._isOpen = false;
         this._isFull = false;
         this.moveOverTip.visible = false;
         this.closeGridBg.visible = true;
         addEventListener(MouseEvent.ROLL_OVER,this.onMouseOverEvent);
         addEventListener(MouseEvent.ROLL_OUT,this.onMouseOutEvent);
         this.doubleClickEnabled = true;
         this.addEventListener(MouseEvent.DOUBLE_CLICK,this.onCardDoubleClickEvent);
      }
      
      private function onCardDoubleClickEvent(a_4730:MouseEvent) : void
      {
         trace("s");
      }
      
      public function onMouseOverEvent(a_4730:MouseEvent) : void
      {
         if(this._isOpen)
         {
            this.moveOverTip.visible = true;
            this.closeGridBg.visible = false;
         }
         if(this._isFull)
         {
            this.moveOverTip.visible = false;
         }
      }
      
      public function onMouseOutEvent(a_4730:MouseEvent) : void
      {
         if(this._isOpen)
         {
            this.moveOverTip.visible = false;
            this.closeGridBg.visible = false;
         }
      }
      
      public function get isOpen() : Boolean
      {
         return this._isOpen;
      }
      
      public function get isFull() : Boolean
      {
         return this._isFull;
      }
      
      public function set isFull(isFull:Boolean) : void
      {
         this._isFull = isFull;
         this.moveOverTip.visible = false;
         this.closeGridBg.visible = false;
         if(this._isFull)
         {
            removeEventListener(MouseEvent.ROLL_OVER,this.onMouseOverEvent);
            removeEventListener(MouseEvent.ROLL_OUT,this.onMouseOutEvent);
         }
         else
         {
            addEventListener(MouseEvent.ROLL_OVER,this.onMouseOverEvent);
            addEventListener(MouseEvent.ROLL_OUT,this.onMouseOutEvent);
         }
      }
      
      public function set isOpen(isOpen:Boolean) : void
      {
         this._isOpen = isOpen;
         this.closeGridBg.visible = !isOpen;
         this.moveOverTip.visible = false;
      }
   }
}

