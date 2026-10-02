package a_4795
{
   import flash.display.DisplayObject;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.utils.Dictionary;
   
   public class a_4671 extends Sprite
   {
      
      private var viewW:uint;
      
      private var viewH:uint;
      
      private var bg:Shape;
      
      private var _content:Dictionary;
      
      private var _size:int;
      
      private var _index:int;
      
      public function a_4671(w:uint, h:uint)
      {
         super();
         this.viewW = w;
         this.viewH = h;
         this.bgInit();
         this._content = new Dictionary(true);
      }
      
      public function getSize() : Object
      {
         return {
            "w":this.viewW,
            "h":this.viewH
         };
      }
      
      public function get content() : Dictionary
      {
         return this._content;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function set index(i:int) : void
      {
         this._index = i;
      }
      
      public function addGrid(ChildGrid:Class, size:int, horizontalSpace:int = 0) : void
      {
         var i:int = 0;
         var display:DisplayObject = null;
         if(ChildGrid != null)
         {
            for(i = 0; i < size; i++)
            {
               display = new ChildGrid();
               this.addChild(display);
               display.x = i * (display.width + horizontalSpace);
               this._content[i] = display;
            }
         }
      }
      
      public function removeGrid(i:int) : void
      {
         if(i < this._size && i < this.numChildren)
         {
            this.removeChildAt(i);
            delete this._content[i];
         }
      }
      
      public function get bgRef() : Shape
      {
         return this.bg;
      }
      
      private function bgInit() : void
      {
         this.bg = new Shape();
         this.bg.graphics.beginFill(16711680,0);
         this.bg.graphics.drawRect(0,0,this.viewW,this.viewH);
         this.bg.graphics.endFill();
         addChild(this.bg);
      }
   }
}

