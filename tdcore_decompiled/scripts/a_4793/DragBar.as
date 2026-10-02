package a_4793
{
   import a_4782.a_4636;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class DragBar extends Sprite
   {
      
      public static const DRAG_START:String = "dragStart";
      
      public static const DRAG_STOP:String = "dragStop";
      
      public static const DRAGING:String = "draging";
      
      private var viewW:uint;
      
      private var viewH:uint;
      
      private var dragCtrl:DragHandle;
      
      private var hitBg:Sprite;
      
      private var _position:Number;
      
      public function DragBar(dragTarget:DragTarget, w:int, h:int, derect:String = "h")
      {
         super();
         this.viewW = w;
         this.viewH = h;
         this._position = 0;
         this.dragCtrl = new DragHandle(dragTarget,new Rectangle());
         this.dragCtrl.addEventListener(a_4636.ADDED_TO_STAGE,this.dmOnAddedToStage);
         this.dragCtrl.addEventListener(a_4636.REMOVED_FROM_STAGE,this.dmOnRemovedFromStage);
         this.hitBg = new Sprite();
         this.hitBg.graphics.beginFill(16711680,0);
         this.hitBg.graphics.drawRect(0,0,this.viewW,this.viewH);
         this.hitBg.graphics.endFill();
         this.hitBg.buttonMode = true;
         addChild(this.hitBg);
         addChild(dragTarget);
         this.setSize(this.viewW,this.viewH,derect);
      }
      
      public function setSize(w:int, h:int, derect:String = "h") : void
      {
         this.viewW = w;
         this.viewH = h;
         this.hitBg.width = this.viewW;
         this.hitBg.height = this.viewH;
         var tempRect:Rectangle = new Rectangle(0,0,this.viewW,this.viewH);
         if(derect == "h")
         {
            tempRect.height = 0;
            tempRect.y = this.viewH / 2;
         }
         else
         {
            tempRect.width = 0;
            tempRect.x = this.viewW / 2;
         }
         this.dragCtrl.moveRect = tempRect;
         this.dragCtrl.setPosition(this.dragCtrl.getPosition());
      }
      
      public function getSize() : Object
      {
         return {
            "w":this.viewW,
            "h":this.viewH
         };
      }
      
      public function set position(n:Number) : void
      {
         var maxValue:Number = NaN;
         var tempValue:Number = NaN;
         if(n < 0)
         {
            n = 0;
         }
         if(n > 1)
         {
            n = 1;
         }
         this._position = n;
         var moveRect:Rectangle = this.dragCtrl.moveRect;
         var tempRect:Rectangle = this.dragCtrl.dragTarget.getSize();
         if(moveRect.width == 0)
         {
            maxValue = this.viewH - tempRect.height;
            tempValue = Math.abs(tempRect.y) + maxValue * this._position;
            this.dragCtrl.setPosition(new Point(0,tempValue));
         }
         else
         {
            maxValue = this.viewW - tempRect.width;
            tempValue = Math.abs(tempRect.x) + maxValue * this._position;
            this.dragCtrl.setPosition(new Point(tempValue,0));
         }
      }
      
      public function get position() : Number
      {
         return this._position;
      }
      
      public function get dragTarget() : DragTarget
      {
         return this.dragCtrl.dragTarget;
      }
      
      private function dmOnAddedToStage(a_4730:a_4636) : void
      {
         this.addDragHandleEvents();
      }
      
      private function dmOnRemovedFromStage(a_4730:a_4636) : void
      {
         this.removeDragHandleEvents();
      }
      
      private function addDragHandleEvents() : void
      {
         this.dragCtrl.addEventListener(a_4636.DRAGING,this.onDMDraging);
         this.dragCtrl.addEventListener(a_4636.DRAG_START,this.onDMDragStart);
         this.dragCtrl.addEventListener(a_4636.DRAG_STOP,this.onDMDragStop);
         var dtRect:Rectangle = this.dragCtrl.dragTarget.getSize();
         this.hitBg.addEventListener(MouseEvent.MOUSE_DOWN,this.hitBgOnMouseDown);
      }
      
      private function removeDragHandleEvents() : void
      {
         this.dragCtrl.removeEventListener(a_4636.DRAGING,this.onDMDraging);
         this.dragCtrl.removeEventListener(a_4636.DRAG_START,this.onDMDragStart);
         this.dragCtrl.removeEventListener(a_4636.DRAG_STOP,this.onDMDragStop);
         this.hitBg.removeEventListener(MouseEvent.MOUSE_DOWN,this.hitBgOnMouseDown);
      }
      
      private function onDMDragStart(a_4730:a_4636) : void
      {
         this._position = this.getDMPosition();
         dispatchEvent(new Event(DragBar.DRAG_START));
      }
      
      private function onDMDragStop(a_4730:a_4636) : void
      {
         this._position = this.getDMPosition();
         dispatchEvent(new Event(DragBar.DRAGING));
         dispatchEvent(new Event(DragBar.DRAG_STOP));
      }
      
      private function onDMDraging(a_4730:a_4636) : void
      {
         var temp:Number = this.getDMPosition();
         if(this._position == temp)
         {
            return;
         }
         this._position = temp;
         dispatchEvent(new Event(DragBar.DRAGING));
      }
      
      private function hitBgOnMouseDown(a_4730:MouseEvent) : void
      {
         if(!this.dragCtrl.dragTarget.hitTestPoint(this.mouseX,this.mouseY,true))
         {
            this.dragCtrl.setPosition(new Point(this.mouseX,this.mouseY));
            this.dragCtrl.activeEvents();
         }
      }
      
      private function getDMPosition() : Number
      {
         var tempRect:Rectangle = this.dragCtrl.dragTarget.getSize();
         var p:Point = this.dragCtrl.getPosition();
         if(this.dragCtrl.moveRect.width == 0)
         {
            return (p.y - Math.abs(tempRect.y)) / (this.viewH - tempRect.height);
         }
         return (p.x - Math.abs(tempRect.x)) / (this.viewW - tempRect.width);
      }
   }
}

