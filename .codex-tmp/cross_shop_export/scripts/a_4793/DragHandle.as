package a_4793
{
   import a_4782.a_4636;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class DragHandle extends EventDispatcher
   {
      
      private var _dragTarget:DragTarget;
      
      private var _moveRect:Rectangle;
      
      private var mouseXOffset:Number;
      
      private var mouseYOffset:Number;
      
      private var _addEvents:Boolean = false;
      
      public function DragHandle(dragTarget:DragTarget, rect:Rectangle = null)
      {
         super();
         this._dragTarget = dragTarget;
         this._moveRect = rect;
         this._dragTarget.addEventListener(Event.ENTER_FRAME,this.stageCheck);
         this.mouseXOffset = 0;
         this.mouseYOffset = 0;
      }
      
      public function set moveRect(rect:Rectangle) : void
      {
         this._moveRect = rect;
      }
      
      public function get moveRect() : Rectangle
      {
         return this._moveRect;
      }
      
      public function get dragTarget() : DragTarget
      {
         return this._dragTarget;
      }
      
      public function setPosition(point:Point, innerAction:Boolean = false) : void
      {
         var tempv0:Number = NaN;
         var tempv1:Number = NaN;
         if(this.dragTarget == null)
         {
            return;
         }
         var size:Rectangle = this.dragTarget.getSize();
         point.x -= this.mouseXOffset;
         point.y -= this.mouseYOffset;
         if(this._moveRect.width == 0)
         {
            this.dragTarget.x = this._moveRect.x;
         }
         else
         {
            tempv0 = Math.abs(size.x);
            tempv1 = size.width - tempv0;
            if(point.x - tempv0 < this._moveRect.x)
            {
               point.x = this._moveRect.x + tempv0;
            }
            if(point.x + tempv1 > this._moveRect.x + this._moveRect.width)
            {
               point.x = this._moveRect.x + this._moveRect.width - tempv1;
            }
            this.dragTarget.x = point.x;
         }
         if(this._moveRect.height == 0)
         {
            this.dragTarget.y = this._moveRect.y;
         }
         else
         {
            tempv0 = Math.abs(size.y);
            tempv1 = size.height - tempv0;
            if(point.y - tempv0 < this._moveRect.y)
            {
               point.y = this._moveRect.y + tempv0;
            }
            if(point.y + tempv1 > this._moveRect.y + this._moveRect.height)
            {
               point.y = this._moveRect.y + this._moveRect.height - tempv1;
            }
            this.dragTarget.y = point.y;
         }
         if(innerAction)
         {
            dispatchEvent(new a_4636(a_4636.DRAGING,new Point(this.dragTarget.x,this.dragTarget.y)));
         }
      }
      
      public function getPosition() : Point
      {
         return new Point(this.dragTarget.x,this.dragTarget.y);
      }
      
      public function activeEvents() : void
      {
         this.onMouseDownHandler(null);
      }
      
      private function stageCheck(a_4730:Event) : void
      {
         if(this.dragTarget.stage == null)
         {
            this.removeEvents();
         }
         else
         {
            this.addEvents();
         }
      }
      
      private function addEvents() : void
      {
         if(!this.dragTarget.getMouseHotTarget().hasEventListener(MouseEvent.MOUSE_DOWN))
         {
            this.dragTarget.getMouseHotTarget().addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDownHandler);
            dispatchEvent(new a_4636(a_4636.ADDED_TO_STAGE));
         }
      }
      
      private function removeEvents() : void
      {
         if(this.dragTarget.getMouseHotTarget().hasEventListener(MouseEvent.MOUSE_DOWN))
         {
            this.dragTarget.getMouseHotTarget().removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDownHandler);
            dispatchEvent(new a_4636(a_4636.REMOVED_FROM_STAGE));
         }
      }
      
      private function onMouseDownHandler(a_4730:MouseEvent) : void
      {
         if(this.dragTarget.stage == null)
         {
            return;
         }
         this.dragTarget.getMouseHotTarget().addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMoveHandler);
         this.dragTarget.getMouseHotTarget().addEventListener(MouseEvent.MOUSE_UP,this.onMouseUpHandler);
         this.dragTarget.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMoveHandler);
         this.dragTarget.stage.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUpHandler);
         this.mouseXOffset = this.dragTarget.mouseX;
         this.mouseYOffset = this.dragTarget.mouseY;
         dispatchEvent(new a_4636(a_4636.DRAG_START,new Point(this.dragTarget.x,this.dragTarget.y)));
      }
      
      private function onMouseMoveHandler(a_4730:MouseEvent) : void
      {
         if(this.dragTarget.stage == null)
         {
            this.onMouseUpHandler(null);
            return;
         }
         this.setPosition(new Point(this.dragTarget.parent.mouseX,this.dragTarget.parent.mouseY),true);
         a_4730.updateAfterEvent();
      }
      
      private function onMouseUpHandler(a_4730:MouseEvent) : void
      {
         this.dragTarget.getMouseHotTarget().removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUpHandler);
         this.dragTarget.getMouseHotTarget().removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMoveHandler);
         if(this.dragTarget.stage != null)
         {
            this.dragTarget.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMoveHandler);
            this.dragTarget.stage.removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUpHandler);
         }
         this.mouseXOffset = 0;
         this.mouseYOffset = 0;
         dispatchEvent(new a_4636(a_4636.DRAG_STOP,new Point(this.dragTarget.x,this.dragTarget.y)));
      }
   }
}

