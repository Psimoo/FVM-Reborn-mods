package com.aurora.ui.maogoutd.xiaowu
{
   import a_4728.a_1778;
   import a_4729.a_1789;
   import com.aurora.protocol.hallserver.CSmallRoomItemVO;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   
   public class MoveItem extends Sprite
   {
      
      public var m_bmpImage:Bitmap;
      
      private var ms_Dragable:Boolean;
      
      public var m_RoleNameText:TextField;
      
      public var m_CardDemo:MovieClip;
      
      public var m_RectMask:MovieClip;
      
      public var m_Shadow:MovieClip;
      
      public var m_CancleBtn:SimpleButton;
      
      private var mst_data:CSmallRoomItemVO;
      
      private var a_1236:int;
      
      public var isDrag:Boolean = false;
      
      public var tempX:int = 0;
      
      public var tempY:int = 0;
      
      public function MoveItem()
      {
         super();
         this.m_Dragable = false;
         this.m_Shadow.visible = false;
         this.m_RectMask.visible = false;
         this.m_RoleNameText.visible = false;
         this.m_RoleNameText.width = 0;
         this.m_bmpImage = new Bitmap();
         addChild(this.m_bmpImage);
         this.m_CancleBtn.scaleX = 0.75;
         this.m_CancleBtn.scaleY = 0.75;
         this.m_CancleBtn.visible = false;
         this.m_CancleBtn.addEventListener(MouseEvent.CLICK,this.onCancleHandler);
         addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDownHandle);
         addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
      }
      
      protected function onCancleHandler(a_4730:MouseEvent) : void
      {
         var dataEvent:a_1778 = null;
         var obj:Object = null;
         if(this.m_data.m_iID != 15728641)
         {
            dataEvent = new a_1778("ActionCanclePutDown");
            obj = new Object();
            obj.m_parentName = this.parent.name;
            obj.m_iID = this.m_data.m_iID;
            dataEvent.dataObject = obj;
            if(dataEvent != null)
            {
               a_1789.getInstance().dispatchEvent(dataEvent);
            }
         }
      }
      
      public function onMouseUp(a_4730:MouseEvent) : void
      {
         var item:Bitmap = null;
         if(!this.isDrag)
         {
            return;
         }
         if(stage != null)
         {
            stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onCardMouseMoveEvent);
         }
         this.stopDrag();
         this.isDrag = false;
         if(this.IsHitTest())
         {
            this.x = this.tempX;
            this.y = this.tempY;
         }
         else
         {
            this.tempX = this.x;
            this.tempY = this.y;
         }
         for(var i:int = 0; i < this.parent.numChildren; i++)
         {
            item = this.parent.getChildAt(i) as Bitmap;
            if(item != null)
            {
               item.alpha = 0;
            }
         }
         var mc:MovieClip = null;
         switch(this.parent.name)
         {
            case "m_containerWall":
               mc = this.parent.parent.getChildByName("m_containerFloor") as MovieClip;
               break;
            case "m_containerFloor":
               mc = this.parent.parent.getChildByName("m_containerWall") as MovieClip;
         }
         if(mc != null)
         {
            this.resetPosition(mc);
         }
      }
      
      protected function onMouseDownHandle(a_4730:MouseEvent) : void
      {
         if(this.m_Dragable)
         {
            this.parent.addChild(this);
            this.isDrag = true;
            this.startDrag(false,this.getRectangle());
            if(stage != null)
            {
               stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onCardMouseMoveEvent);
            }
         }
      }
      
      private function getRectangle() : Rectangle
      {
         var temxX0:int = 0;
         var temxY0:int = 0;
         var temxX1:int = 952;
         var temxY1:int = 212;
         if(this.parent.name == "m_containerWall")
         {
            temxX1 = 952;
            temxY1 = 342;
         }
         temxX0 -= this.m_RectMask.x;
         temxY0 -= this.m_RectMask.y;
         temxX1 -= this.m_RectMask.width;
         temxY1 -= this.m_RectMask.height;
         if(this.m_data.m_iID == 364052481)
         {
            temxY1 += 30;
         }
         return new Rectangle(temxX0,temxY0,temxX1,temxY1);
      }
      
      public function resetPosition(mc:*) : void
      {
         var item:MoveItem = null;
         for(var i:int = 0; i < mc.numChildren; i++)
         {
            item = mc.getChildAt(i) as MoveItem;
            if(item != null && item.isDrag)
            {
               item.onMouseUp(null);
            }
         }
      }
      
      private function onCardMouseMoveEvent(a_4730:MouseEvent) : void
      {
         var item:MoveItem = null;
         var rect:Rectangle = null;
         var m_bmpImage:Bitmap = null;
         var bitmapData:BitmapData = null;
         var point:Point = null;
         if(this.parent == null)
         {
            return;
         }
         for(var i:int = 0; i < this.parent.numChildren; i++)
         {
            item = this.parent.getChildAt(i) as MoveItem;
            if(item != null && this != item)
            {
               rect = a_4351.complexIntersectionRectangle(this.m_RectMask,item.m_RectMask);
               m_bmpImage = this.parent.getChildByName("hitRect" + item.m_data.m_iID.toString()) as Bitmap;
               if(m_bmpImage == null)
               {
                  m_bmpImage = new Bitmap();
                  m_bmpImage.name = "hitRect" + item.m_data.m_iID.toString();
               }
               this.parent.addChild(m_bmpImage);
               trace("rect.width:" + rect.width + "rect.height:" + rect.height);
               if(rect.width != 0 && rect.height != 0)
               {
                  bitmapData = new BitmapData(rect.width,rect.height,false,16711680);
                  m_bmpImage.bitmapData = bitmapData;
                  m_bmpImage.alpha = 1;
                  point = new Point(rect.x,rect.y);
                  m_bmpImage.x = this.parent.globalToLocal(point).x;
                  m_bmpImage.y = this.parent.globalToLocal(point).y;
               }
               else
               {
                  m_bmpImage.alpha = 0;
               }
            }
         }
         a_4730.updateAfterEvent();
      }
      
      private function IsHitTest() : Boolean
      {
         var item:MoveItem = null;
         var hit:Boolean = false;
         for(var i:int = 0; i < this.parent.numChildren; i++)
         {
            item = this.parent.getChildAt(i) as MoveItem;
            if(item != null && this != item)
            {
               hit = a_4351.complexHitTestObject(this.m_RectMask,item.m_RectMask);
               if(hit)
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      public function setImage(value:BitmapData) : void
      {
         this.m_bmpImage.bitmapData = value;
         this.m_RectMask.y = this.m_bmpImage.height - this.m_RectMask.height;
      }
      
      public function setMovie(mc:MovieClip) : void
      {
         var p:Point = null;
         mc.x = mc.y = 0;
         this.m_CardDemo.addChild(mc);
         p = this.getPoint();
         this.m_RectMask.y = this.m_CardDemo.height - this.m_RectMask.height + p.y;
         this.m_RectMask.x = (this.m_CardDemo.width - this.m_RectMask.width) / 2 + p.x;
      }
      
      private function getPoint() : Point
      {
         switch(this.mst_data.m_iID)
         {
            case 366346241:
               return new Point(0,2);
            case 366346242:
               return new Point(0,2);
            case 366346243:
               return new Point(0,-1);
            case 366346244:
               return new Point(0,-6);
            case 366346245:
               return new Point(0,0);
            case 366346246:
               return new Point(-42,-30);
            case 366346247:
               return new Point(0,12);
            case 366346248:
               return new Point(0,-8);
            default:
               return new Point(0,0);
         }
      }
      
      public function get m_data() : CSmallRoomItemVO
      {
         return this.mst_data;
      }
      
      public function set m_data(value:CSmallRoomItemVO) : void
      {
         this.x = this.tempX = value.m_iPositonX;
         this.y = this.tempY = value.m_iPositonY;
         this.mst_data = value;
         var vo:ItemConfigVO = SmallRoomConfig.Get().m_dictDesc[this.mst_data.m_iID];
         if(vo != null)
         {
            this.m_RectMask.width = vo.m_iItemWidth;
            this.m_RectMask.height = vo.m_iItemHeight;
         }
         else
         {
            this.m_RectMask.width = 60;
            this.m_RectMask.height = 30;
         }
      }
      
      public function CancelPositon() : void
      {
         this.x = this.tempX = this.mst_data.m_iPositonX;
         this.y = this.tempY = this.mst_data.m_iPositonY;
      }
      
      public function SurePositon() : void
      {
         this.mst_data.m_iPositonX = this.tempX;
         this.mst_data.m_iPositonY = this.tempY;
      }
      
      public function get m_Dragable() : Boolean
      {
         return this.ms_Dragable;
      }
      
      public function set m_Dragable(value:Boolean) : void
      {
         this.ms_Dragable = value;
         if(this.m_data != null && this.m_data.m_iID == 15728641)
         {
            this.m_CancleBtn.visible = false;
         }
         else
         {
            this.m_CancleBtn.visible = this.ms_Dragable ? true : false;
         }
         this.m_RectMask.visible = this.ms_Dragable ? true : false;
         this.alpha = this.ms_Dragable ? 0.5 : 1;
      }
   }
}

