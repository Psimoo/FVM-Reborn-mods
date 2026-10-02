package a_4802
{
   import a_4793.DragBar;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class ScrollBar extends EventDispatcher
   {
      
      public static const DRAG_START:String = "dragStart";
      
      public static const DRAG_STOP:String = "dragStop";
      
      public static const DRAGING:String = "draging";
      
      private var _sbSkin:a_4706;
      
      private var _autoScrollSpeed:Number = 0.05;
      
      private var _direction:String;
      
      private var viewSize:Number;
      
      private var totalSize:Number;
      
      private var moveSize:Number;
      
      private var _hidden:Boolean = true;
      
      private var _isActivated:Boolean;
      
      private var speedSign:int;
      
      private var timer:Timer;
      
      private var db:DragBar;
      
      public function ScrollBar(skin:a_4706, direct:String = "v")
      {
         super();
         this._sbSkin = skin;
         this._direction = direct;
         this.init();
      }
      
      public function setScrollProperties(viewSize:Number, totalSize:Number) : void
      {
         this.isActivated = viewSize < totalSize;
         this.viewSize = viewSize;
         this.totalSize = totalSize;
         if(this.moveSize == 0)
         {
            return;
         }
         if(viewSize >= totalSize)
         {
            this.position = 0;
         }
         var v:int = this.moveSize * viewSize / totalSize;
         if(this._direction == "v")
         {
            this.setThumbSize(0,v);
         }
         else
         {
            this.setThumbSize(v,0);
         }
      }
      
      public function get skin() : a_4706
      {
         return this._sbSkin;
      }
      
      public function get direction() : String
      {
         return this._direction;
      }
      
      public function setSize(w:int, h:int) : void
      {
         var tempDBV:Number = NaN;
         var tempW:Number = NaN;
         var tempH:Number = NaN;
         if(this._direction == "v")
         {
            tempDBV = this.db.width;
            tempW = Math.max(tempDBV,this._sbSkin.scrollArrowDown.width,this._sbSkin.scrollArrowUp.width,this._sbSkin.scrollTrack.width);
            this._sbSkin.scrollArrowDown.x = (tempW - this._sbSkin.scrollArrowDown.width) / 2;
            this._sbSkin.scrollArrowUp.x = (tempW - this._sbSkin.scrollArrowUp.width) / 2;
            this._sbSkin.scrollTrack.x = (tempW - this._sbSkin.scrollTrack.width) / 2;
            this.db.x = (tempW - tempDBV) / 2;
            this._sbSkin.scrollArrowUp.y = 0;
            this._sbSkin.scrollArrowDown.y = h - this._sbSkin.scrollArrowDown.height;
            this.db.y = this._sbSkin.scrollTrack.y = this._sbSkin.scrollArrowUp.y + this._sbSkin.scrollArrowUp.height;
            tempH = this._sbSkin.scrollTrack.height = this._sbSkin.scrollArrowDown.y - this._sbSkin.scrollTrack.y;
            this.moveSize = tempH;
         }
         else
         {
            tempDBV = this.db.height;
            tempH = Math.max(tempDBV,this._sbSkin.scrollArrowDown.height,this._sbSkin.scrollArrowUp.height,this._sbSkin.scrollTrack.height);
            this._sbSkin.scrollArrowDown.y = (tempH - this._sbSkin.scrollArrowDown.height) / 2;
            this._sbSkin.scrollArrowUp.y = (tempH - this._sbSkin.scrollArrowUp.height) / 2;
            this._sbSkin.scrollTrack.y = (tempH - this._sbSkin.scrollTrack.height) / 2;
            this.db.y = (tempH - tempDBV) / 2;
            this._sbSkin.scrollArrowUp.x = 0;
            this.db.x = this._sbSkin.scrollTrack.x = this._sbSkin.scrollArrowUp.x + this._sbSkin.scrollArrowUp.width;
            this._sbSkin.scrollArrowDown.x = w - this._sbSkin.scrollArrowDown.width;
            tempW = this._sbSkin.scrollTrack.width = this._sbSkin.scrollArrowDown.x - this._sbSkin.scrollTrack.x;
            this.moveSize = tempW;
         }
         this.db.setSize(tempW,tempH,this._direction);
         if(this.viewSize != -1)
         {
            this.setScrollProperties(this.viewSize,this.totalSize);
         }
      }
      
      public function set position(n:Number) : void
      {
         if(n < 0)
         {
            n = 0;
         }
         if(n > 1)
         {
            n = 1;
         }
         this.db.position = n;
      }
      
      public function get position() : Number
      {
         return this.db.position;
      }
      
      public function set autoScrollSpeed(s:Number) : void
      {
         this._autoScrollSpeed = s;
      }
      
      public function set hidden(b:Boolean) : void
      {
         this._hidden = b;
         if(!this._isActivated)
         {
            if(!this._hidden)
            {
               if(this.db.parent == this._sbSkin)
               {
                  this._sbSkin.removeChild(this.db);
               }
            }
            else if(this.db.parent != this._sbSkin)
            {
               this._sbSkin.addChild(this.db);
            }
         }
      }
      
      public function get hidden() : Boolean
      {
         return this._hidden;
      }
      
      public function set isActivated(b:Boolean) : void
      {
         this._isActivated = b;
         this._sbSkin.mouseChildren = this._isActivated;
         if(this._isActivated)
         {
            if(this.db.parent != this._sbSkin)
            {
               this._sbSkin.addChild(this.db);
            }
         }
         else if(!this._hidden)
         {
            if(this.db.parent == this._sbSkin)
            {
               this._sbSkin.removeChild(this.db);
            }
         }
      }
      
      public function get isActivated() : Boolean
      {
         return this._isActivated;
      }
      
      private function init() : void
      {
         this.viewSize = 0;
         this.totalSize = 0;
         this.arrowBtnsInit();
         this.dbInit();
      }
      
      private function dbInit() : void
      {
         var w:uint = 200;
         var h:uint = 200;
         if(this._direction == "v")
         {
            w = Math.max(this._sbSkin.scrollArrowDown.width,this._sbSkin.scrollArrowUp.width,this._sbSkin.scrollTrack.width);
            this.setThumbSize(w,Math.round(h / 3));
         }
         else
         {
            h = Math.max(this._sbSkin.scrollArrowDown.height,this._sbSkin.scrollArrowUp.height,this._sbSkin.scrollTrack.height);
            this.setThumbSize(Math.round(w / 3),h);
         }
         this.db = new DragBar(this._sbSkin.scrollThumb.thumb,w,h,this._direction);
         this._sbSkin.addChild(this.db);
         this.db.addEventListener(DragBar.DRAG_START,this.onDragStart);
         this.db.addEventListener(DragBar.DRAG_STOP,this.onDragStop);
         this.db.addEventListener(DragBar.DRAGING,this.onDraging);
      }
      
      private function arrowBtnsInit() : void
      {
         this._sbSkin.scrollArrowUp.simpleButton.addEventListener(MouseEvent.MOUSE_DOWN,this.arrowUpMouseDownHandler);
         this._sbSkin.scrollArrowDown.simpleButton.addEventListener(MouseEvent.MOUSE_DOWN,this.arrowDownMouseDownHandler);
         this._sbSkin.scrollArrowUp.addEventListener(Event.ENTER_FRAME,this.stageCheck);
         this.timer = new Timer(100);
      }
      
      private function onDragStart(a_4730:Event) : void
      {
         dispatchEvent(new Event(ScrollBar.DRAG_START));
      }
      
      private function onDragStop(a_4730:Event) : void
      {
         dispatchEvent(new Event(ScrollBar.DRAG_STOP));
      }
      
      private function onDraging(a_4730:Event) : void
      {
         dispatchEvent(new Event(ScrollBar.DRAGING));
      }
      
      private function arrowUpMouseDownHandler(a_4730:MouseEvent) : void
      {
         this._sbSkin.scrollArrowUp.simpleButton.addEventListener(MouseEvent.MOUSE_UP,this.arrowBtnsMouseUpHandler);
         this.speedSign = -1;
         this.db.position += this.speedSign * this._autoScrollSpeed;
         this.onDragStart(null);
         this.startAutoRoll();
      }
      
      private function arrowDownMouseDownHandler(a_4730:MouseEvent) : void
      {
         this._sbSkin.scrollArrowDown.simpleButton.addEventListener(MouseEvent.MOUSE_UP,this.arrowBtnsMouseUpHandler);
         this.speedSign = 1;
         this.db.position += this.speedSign * this._autoScrollSpeed;
         this.onDragStart(null);
         this.startAutoRoll();
      }
      
      private function stageCheck(a_4730:Event) : void
      {
         if(this._sbSkin.scrollArrowUp.stage != null)
         {
            this._sbSkin.scrollArrowUp.removeEventListener(Event.ENTER_FRAME,this.stageCheck);
            this._sbSkin.scrollArrowUp.stage.addEventListener(MouseEvent.MOUSE_UP,this.arrowBtnsMouseUpHandler);
         }
      }
      
      private function arrowBtnsMouseUpHandler(a_4730:MouseEvent) : void
      {
         this._sbSkin.scrollArrowUp.simpleButton.removeEventListener(MouseEvent.MOUSE_UP,this.arrowBtnsMouseUpHandler);
         this._sbSkin.scrollArrowDown.simpleButton.removeEventListener(MouseEvent.MOUSE_UP,this.arrowBtnsMouseUpHandler);
         if(this.timer.running)
         {
            this.onDragStop(null);
            this.stopAutoRoll();
         }
      }
      
      private function timerHandler(a_4730:TimerEvent) : void
      {
         this.db.position += this.speedSign * this._autoScrollSpeed;
         if(this.speedSign < 0)
         {
            if(this.db.position == 0)
            {
               this.stopAutoRoll();
            }
         }
         else if(this.db.position == 1)
         {
            this.stopAutoRoll();
         }
         if(this.timer.running)
         {
            this.onDraging(null);
         }
         else
         {
            this.onDragStop(null);
         }
      }
      
      private function startAutoRoll() : void
      {
         if(!this.timer.hasEventListener(TimerEvent.TIMER))
         {
            this.timer.addEventListener(TimerEvent.TIMER,this.timerHandler);
         }
         if(!this.timer.running)
         {
            this.timer.start();
         }
      }
      
      private function stopAutoRoll() : void
      {
         if(this.timer.hasEventListener(TimerEvent.TIMER))
         {
            this.timer.removeEventListener(TimerEvent.TIMER,this.timerHandler);
         }
         if(this.timer.running)
         {
            this.timer.stop();
         }
      }
      
      private function setThumbSize(w:int = 0, h:int = 0) : void
      {
         if(this._direction == "v")
         {
            w = this._sbSkin.scrollTrack.width;
         }
         else
         {
            h = this._sbSkin.scrollTrack.height;
         }
         this._sbSkin.scrollThumb.setSize(w,h,this._direction);
         if(this.db != null)
         {
            this.position = this.position;
         }
      }
   }
}

