package a_4795
{
   import a_4782.a_4638;
   import flash.display.DisplayObjectContainer;
   import flash.events.EventDispatcher;
   import flash.events.MouseEvent;
   
   public class a_4679 extends EventDispatcher
   {
      
      private var _listCt:DisplayObjectContainer;
      
      private var _currentY:Number;
      
      private var _totalHeight:Number;
      
      private var _viewHeight:Number;
      
      private var _rollOffset:Number = 10;
      
      public function a_4679(lc:DisplayObjectContainer)
      {
         super();
         this._listCt = lc;
      }
      
      public function set currentY(cy:Number) : void
      {
         this._currentY = cy;
         if(this._currentY > 0)
         {
            this._currentY = 0;
         }
         if(this._currentY < this._viewHeight - this._totalHeight)
         {
            this._currentY = this._viewHeight - this._totalHeight;
         }
         if(isNaN(this._currentY))
         {
            this._currentY = 0;
         }
      }
      
      public function get currentY() : Number
      {
         return this._currentY;
      }
      
      public function valueInit(th:Number, vh:Number) : void
      {
         this._totalHeight = th;
         this._viewHeight = vh;
         if(this._viewHeight >= this._totalHeight)
         {
            if(this._listCt.hasEventListener(MouseEvent.MOUSE_WHEEL))
            {
               this._listCt.removeEventListener(MouseEvent.MOUSE_WHEEL,this.mouseWheelHandle);
            }
         }
         else if(!this._listCt.hasEventListener(MouseEvent.MOUSE_WHEEL))
         {
            this._listCt.addEventListener(MouseEvent.MOUSE_WHEEL,this.mouseWheelHandle);
         }
      }
      
      public function set listCt(lc:DisplayObjectContainer) : void
      {
         this._listCt = lc;
      }
      
      public function set rollOffset(v:Number) : void
      {
         if(v < 0)
         {
            v = 1;
         }
         this._rollOffset = v;
      }
      
      private function mouseWheelHandle(a_4730:MouseEvent) : void
      {
         this.currentY += Math.abs(a_4730.delta) / a_4730.delta * this._rollOffset;
         dispatchEvent(new a_4638(a_4638.a_1717));
      }
   }
}

