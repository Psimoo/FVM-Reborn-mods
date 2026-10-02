package a_4795
{
   import a_4782.a_4638;
   import a_4802.ScrollBar;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   public class a_4680 extends EventDispatcher
   {
      
      private var _srollBarRef:ScrollBar;
      
      private var _totalHeight:Number;
      
      private var _viewHeight:Number;
      
      private var _currentY:Number;
      
      public function a_4680()
      {
         super();
         this._totalHeight = 0;
         this._viewHeight = 0;
         this._currentY = 0;
      }
      
      public function set srollBarRef(sb:ScrollBar) : void
      {
         if(sb == this._srollBarRef)
         {
            return;
         }
         if(this._srollBarRef != null)
         {
            if(this._srollBarRef.hasEventListener(ScrollBar.DRAGING))
            {
               this._srollBarRef.removeEventListener(ScrollBar.DRAG_START,this.onRollStart);
               this._srollBarRef.removeEventListener(ScrollBar.DRAG_STOP,this.onRollStop);
               this._srollBarRef.removeEventListener(ScrollBar.DRAGING,this.onRolling);
            }
         }
         this._srollBarRef = sb;
      }
      
      public function get srollBarRef() : ScrollBar
      {
         return this._srollBarRef;
      }
      
      public function set totalHeight(th:Number) : void
      {
         this._totalHeight = th;
      }
      
      public function get totalHeight() : Number
      {
         return this._totalHeight;
      }
      
      public function set viewHeight(vh:Number) : void
      {
         this._viewHeight = vh;
      }
      
      public function get viewHeight() : Number
      {
         return this._viewHeight;
      }
      
      public function get currentY() : Number
      {
         return this._currentY;
      }
      
      public function set currentY(y:Number) : void
      {
         if(y > 0)
         {
            y = 0;
         }
         if(y < this._viewHeight - this._totalHeight)
         {
            y = this._viewHeight - this._totalHeight;
         }
         this._currentY = y;
         if(this._viewHeight < this._totalHeight)
         {
            if(this._srollBarRef != null)
            {
               this._srollBarRef.position = this._currentY / (this._viewHeight - this._totalHeight);
            }
         }
      }
      
      public function scrollBarCheck() : Boolean
      {
         if(this._srollBarRef == null)
         {
            return false;
         }
         this._srollBarRef.setScrollProperties(this._viewHeight,this._totalHeight);
         if(this._viewHeight < this._totalHeight)
         {
            if(!this._srollBarRef.hasEventListener(ScrollBar.DRAGING))
            {
               this._srollBarRef.addEventListener(ScrollBar.DRAG_START,this.onRollStart);
               this._srollBarRef.addEventListener(ScrollBar.DRAG_STOP,this.onRollStop);
               this._srollBarRef.addEventListener(ScrollBar.DRAGING,this.onRolling);
            }
            return true;
         }
         if(this._srollBarRef.hasEventListener(ScrollBar.DRAGING))
         {
            this._srollBarRef.removeEventListener(ScrollBar.DRAG_START,this.onRollStart);
            this._srollBarRef.removeEventListener(ScrollBar.DRAG_STOP,this.onRollStop);
            this._srollBarRef.removeEventListener(ScrollBar.DRAGING,this.onRolling);
         }
         this._currentY = 0;
         return false;
      }
      
      public function hasScrollBar() : Boolean
      {
         return this._viewHeight < this._totalHeight;
      }
      
      private function onRollStart(a_4730:Event) : void
      {
         this._currentY = this._srollBarRef.position * (this._viewHeight - this._totalHeight);
         dispatchEvent(new a_4638(a_4638.a_1717));
      }
      
      private function onRollStop(a_4730:Event) : void
      {
         this._currentY = this._srollBarRef.position * (this._viewHeight - this._totalHeight);
         dispatchEvent(new a_4638(a_4638.a_1717));
      }
      
      private function onRolling(a_4730:Event) : void
      {
         var tempY:Number = this._srollBarRef.position * (this._viewHeight - this._totalHeight);
         if(tempY != this._currentY)
         {
            this._currentY = tempY;
            dispatchEvent(new a_4638(a_4638.a_1717));
         }
      }
   }
}

