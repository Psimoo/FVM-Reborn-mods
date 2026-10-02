package a_4795
{
   import a_4802.ScrollBar;
   import flash.display.DisplayObject;
   import flash.display.Shape;
   import flash.display.Sprite;
   
   public class a_4678 extends Sprite
   {
      
      public static var a_1723:int = 1;
      
      private var _totalHeight:Number;
      
      private var _rowStartIndex:uint;
      
      private var scrollBar:ScrollBar;
      
      private var rowsContainer:Sprite;
      
      private var masker:Shape;
      
      private var viewW:uint = 200;
      
      private var viewH:uint = 300;
      
      private var a_1721:int;
      
      private var m_size:int;
      
      private var _ChildClass:Class;
      
      private var a_1722:int = 1;
      
      public function a_4678(sb:ScrollBar)
      {
         super();
         this.scrollBar = sb;
         this.rowsContainer = new Sprite();
         this.masker = new Shape();
         this.masker.graphics.beginFill(16711680,1);
         this.masker.graphics.drawRect(0,0,this.viewW,this.viewH);
         this.masker.graphics.endFill();
         this.rowsContainer.mask = this.masker;
         addChild(this.rowsContainer);
         addChild(this.masker);
         this.doubleClickEnabled = true;
      }
      
      public function setSize(w:uint, h:uint, size:int, ChildClass:Class, horizontalSize:int = 1, horizontalSpace:int = 0) : void
      {
         this.viewW = w;
         this.viewH = h;
         this.masker.width = this.viewW;
         this.masker.height = this.viewH;
         this.a_1721 = horizontalSize;
         this._ChildClass = ChildClass;
         this.m_size = size;
         this.a_1722 = horizontalSpace;
         this.init();
      }
      
      public function getSize() : Object
      {
         return {
            "w":this.viewW,
            "h":this.viewH
         };
      }
      
      public function get RowsContainer() : Sprite
      {
         return this.rowsContainer;
      }
      
      public function get totalHeight() : Number
      {
         return this._totalHeight;
      }
      
      public function get rowStartIndex() : uint
      {
         return this._rowStartIndex;
      }
      
      public function getRows() : Array
      {
         var rows:Array = new Array();
         var len:uint = uint(this.rowsContainer.numChildren);
         for(var i:uint = 0; i < len; i++)
         {
            rows.push(this.rowsContainer.getChildAt(i) as a_4671);
         }
         return rows;
      }
      
      public function updateRowsPosition(currentY:Number) : void
      {
         this.changing(currentY);
      }
      
      private function init() : void
      {
         var row:a_4671 = null;
         var nextRow:a_4671 = null;
         this._rowStartIndex = 0;
         this._totalHeight = 0;
         this.rowsContainer.y = 0;
         while(this.rowsContainer.numChildren > 0)
         {
            this.rowsContainer.removeChildAt(0);
         }
         var rowSize:int = Math.floor(this.m_size / this.a_1721);
         var yuSize:int = this.m_size % this.a_1721;
         var display:DisplayObject = new this._ChildClass();
         var h:Number = display.height + 1;
         var w:Number = display.width;
         for(var i:uint = 0; i < rowSize; i++)
         {
            row = new a_4671(w * this.a_1721,h);
            row.addGrid(this._ChildClass,this.a_1721,this.a_1722);
            this.rowsContainer.addChild(row);
            row.index = i;
            row.y = this._totalHeight;
            this._totalHeight += row.height;
         }
         if(yuSize > 0)
         {
            nextRow = new a_4671(w * this.a_1721,h);
            nextRow.addGrid(this._ChildClass,yuSize,this.a_1722);
            this.rowsContainer.addChild(nextRow);
            nextRow.index = rowSize;
            nextRow.y = this._totalHeight;
            this._totalHeight += nextRow.height + a_1723;
         }
         this.adjustSize();
      }
      
      private function adjustSize(newHeightValue:Boolean = true) : void
      {
         if(this.rowsContainer.numChildren == 0)
         {
            return;
         }
         if(!this.scrollBar.hidden)
         {
            if(this.scrollBar.skin.parent != this)
            {
               addChild(this.scrollBar.skin);
            }
         }
         if(this.viewH < this._totalHeight)
         {
            this.scrollBar.isActivated = true;
            if(this.scrollBar.skin.parent != this)
            {
               addChild(this.scrollBar.skin);
            }
         }
         else
         {
            this.scrollBar.isActivated = false;
            if(this.scrollBar.hidden)
            {
               if(this.scrollBar.skin.parent == this)
               {
                  removeChild(this.scrollBar.skin);
               }
            }
         }
         var w:Number = this.viewW;
         if(this.scrollBar.skin.parent == this)
         {
            this.scrollBar.skin.x = w - this.scrollBar.skin.width;
            w = this.scrollBar.skin.x;
            this.scrollBar.setSize(this.scrollBar.skin.width,this.viewH);
         }
      }
      
      private function changing(currentY:Number) : void
      {
         this.rowsContainer.y = Math.round(currentY);
      }
   }
}

