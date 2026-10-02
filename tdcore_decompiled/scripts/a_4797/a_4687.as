package a_4797
{
   import com.aurora.ui.maogoutd.mouse.a_3854;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class a_4687 extends Sprite
   {
      
      private var _mc:MovieClip;
      
      private var _id:String;
      
      private var _mcPosition:Point;
      
      private var _state:int;
      
      private var _currentFrame:int;
      
      private var _totalFrames:int;
      
      private var _urlGetter:Function;
      
      private var mcImages:Vector.<Bitmap>;
      
      public function a_4687(mc:MovieClip = null, id:String = "", pst:String = "0-0", state:int = 0, urlGetter:Function = null)
      {
         super();
         this.mouseChildren = false;
         this.id = id;
         this.state = state;
         this.mc = mc;
         this.urlGetter = urlGetter;
         this.setMCPosition(pst);
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
      
      public function set mc(v:MovieClip) : void
      {
         this._mc = v;
         this.dispose();
         if(this._mc != null)
         {
            this.mcImages = new Vector.<Bitmap>(this._mc.totalFrames);
            this._totalFrames = this.mcImages.length;
            this._currentFrame = -1;
            this.gotoAndStop(this._currentFrame);
         }
         else
         {
            this._currentFrame = 1;
            this._totalFrames = -1;
         }
         if(this.parent != null)
         {
            this.x = this._mcPosition.x;
            this.y = this._mcPosition.y;
         }
      }
      
      public function get mc() : MovieClip
      {
         return this._mc;
      }
      
      public function set id(v:String) : void
      {
         this._id = v;
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function set state(v:int) : void
      {
         this._state = a_4685.getState(v);
      }
      
      public function get state() : int
      {
         return this._state;
      }
      
      public function setMCPosition(p:String) : void
      {
         this._mcPosition = new Point();
         p = p.replace(/\s/ig,"");
         var index:int = p.indexOf("-",1);
         var n1:int = parseInt(p.substring(0,index));
         var n2:int = parseInt(p.substring(index + 1));
         var temp:Array = [n1,n2];
         if(temp.length > 1)
         {
            if(!isNaN(Number(temp[0])))
            {
               this._mcPosition.x = Number(temp[0]);
            }
            if(!isNaN(Number(temp[1])))
            {
               this._mcPosition.y = Number(temp[1]);
            }
         }
         if(this.parent != null)
         {
            this.x = this._mcPosition.x;
            this.y = this._mcPosition.y;
         }
      }
      
      public function getMCPosition() : Point
      {
         return this._mcPosition;
      }
      
      public function destroy() : void
      {
         this.dispose();
         this._mc = null;
         this._urlGetter = null;
         this._currentFrame = -1;
         this._totalFrames = -1;
      }
      
      public function getURL() : String
      {
         if(this._urlGetter == null)
         {
            return null;
         }
         return this._urlGetter.apply(this,[this.id]);
      }
      
      public function set urlGetter(fun:Function) : void
      {
         this._urlGetter = fun;
      }
      
      public function get currentFrame() : int
      {
         return this._currentFrame;
      }
      
      public function set currentFrame(i:int) : void
      {
         this.gotoAndStop(i);
      }
      
      public function get totalFrames() : int
      {
         return this._totalFrames;
      }
      
      public function gotoAndStop(i:int) : void
      {
         var bm:Bitmap = null;
         if(i < 1)
         {
            i = 1;
         }
         if(this._currentFrame == i)
         {
            return;
         }
         this._currentFrame = i;
         if(this._totalFrames != -1)
         {
            if(this._currentFrame > this._totalFrames)
            {
               this._currentFrame = this._totalFrames;
            }
            if(numChildren > 0)
            {
               removeChildAt(0);
            }
            if(this.mcImages[this._currentFrame - 1] == undefined)
            {
               bm = this.getImageInMC(this._mc,this._currentFrame);
               this.mcImages[this._currentFrame - 1] = bm;
            }
            else
            {
               bm = this.mcImages[this._currentFrame - 1];
            }
            if(this.transferComplete())
            {
               if(this._mc != null)
               {
                  this._mc.stop();
                  this._mc = null;
               }
            }
            addChild(bm);
         }
      }
      
      public function nextFrame() : void
      {
         var i:int = this._currentFrame + 1;
         this.gotoAndStop(i);
      }
      
      public function prevFrame() : void
      {
         var i:int = this._currentFrame - 1;
         this.gotoAndStop(i);
      }
      
      private function getImageInMC(mc:MovieClip, frame:int, rate:int = 4) : Bitmap
      {
         mc.gotoAndStop(frame);
         var w:Number = mc.width * rate;
         var h:Number = mc.height * rate;
         var tempBmd:BitmapData = new BitmapData(w,h,true,16777215);
         tempBmd.draw(mc,new Matrix(1,0,0,1,w / 2,h / 2));
         var rect:Rectangle = tempBmd.getColorBoundsRect(4278190080,0,false);
         var bmd:BitmapData = new BitmapData(rect.width,rect.height,true,16777215);
         var pixels:Vector.<uint> = tempBmd.getVector(rect);
         bmd.setVector(new Rectangle(0,0,rect.width,rect.height),pixels);
         return new Bitmap(bmd);
      }
      
      private function dispose() : void
      {
         var bm:Bitmap = null;
         if(this.mcImages == null)
         {
            return;
         }
         var i:int = 0;
         var len:int = int(this.mcImages.length);
         while(i < len)
         {
            bm = this.mcImages[i];
            if(bm == null)
            {
               break;
            }
            if(bm.parent == this)
            {
               removeChild(bm);
               if(bm.bitmapData != null)
               {
                  bm.bitmapData.dispose();
               }
               bm = null;
            }
            i++;
         }
         this.mcImages.splice(0,len);
      }
      
      private function transferComplete() : Boolean
      {
         if(this.mcImages == null)
         {
            return false;
         }
         if(this.mcImages.length < this._totalFrames)
         {
            return false;
         }
         if(this.mcImages[this._totalFrames - 1] == undefined)
         {
            return false;
         }
         for(var i:int = 0; i < this._totalFrames; i++)
         {
            if(this.mcImages[i] == undefined)
            {
               return false;
            }
         }
         return true;
      }
      
      private function onAddedToStage(a_4730:Event) : void
      {
         this.addEvents();
      }
      
      private function onRemovedFromeStage(a_4730:Event) : void
      {
         this.removeEvents();
      }
      
      private function addEvents() : void
      {
         mouseEnabled = true;
         addEventListener(MouseEvent.ROLL_OVER,this.onOverHandle);
         addEventListener(MouseEvent.ROLL_OUT,this.onOutHandle);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromeStage);
         removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
      
      private function removeEvents() : void
      {
         mouseEnabled = false;
         removeEventListener(MouseEvent.ROLL_OVER,this.onOverHandle);
         removeEventListener(MouseEvent.ROLL_OUT,this.onOutHandle);
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
      
      private function onOverHandle(a_4730:MouseEvent) : void
      {
         dispatchEvent(new a_3854(a_3854.OVER_MOUSE,false));
      }
      
      private function onOutHandle(a_4730:MouseEvent) : void
      {
         dispatchEvent(new a_3854(a_3854.OUT_MOUSE,false));
      }
   }
}

