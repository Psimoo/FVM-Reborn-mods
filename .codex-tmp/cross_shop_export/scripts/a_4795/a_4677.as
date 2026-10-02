package a_4795
{
   import a_4782.a_4638;
   import a_4802.*;
   import flash.display.Sprite;
   
   public class a_4677 extends Sprite
   {
      
      private var _scrollBar:ScrollBar;
      
      private var _listSB:a_4680;
      
      private var _listUI:a_4678;
      
      private var _listDataHandle:a_4676;
      
      private var _listMouseCtrl:a_4679;
      
      public function a_4677(sb:ScrollBar)
      {
         super();
         this._scrollBar = sb;
         this.init();
         this.doubleClickEnabled = true;
      }
      
      public function setSize(w:uint, h:uint, size:int, ChildClass:Class, horizontal:int = 1, horizontalSpace:int = 0) : void
      {
         this._listUI.setSize(w,h,size,ChildClass,horizontal,horizontalSpace);
         this.scrollCheck();
      }
      
      public function get dataHandleRef() : a_4676
      {
         return this._listDataHandle;
      }
      
      public function get listUIRef() : a_4678
      {
         return this._listUI;
      }
      
      public function set mouseWheelDelta(v:Number) : void
      {
         this._listMouseCtrl.rollOffset = v;
      }
      
      public function get currentListPosition() : Number
      {
         if(this._listSB == null)
         {
            return 0;
         }
         return this._listSB.currentY;
      }
      
      public function set currentListPosition(p:Number) : void
      {
         if(this._listSB != null)
         {
            if(this._listSB.hasScrollBar())
            {
               this._listSB.currentY = p;
               this._listMouseCtrl.currentY = p;
               this._listUI.updateRowsPosition(p);
            }
         }
      }
      
      private function init() : void
      {
         this.instancesInit();
         this.eventsInit();
      }
      
      private function instancesInit() : void
      {
         this._listUI = new a_4678(this._scrollBar);
         this._listSB = new a_4680();
         this._listSB.srollBarRef = this._scrollBar;
         this._listDataHandle = new a_4676();
         this._listMouseCtrl = new a_4679(this._listUI);
         addChild(this._listUI);
      }
      
      private function eventsInit() : void
      {
         this._listDataHandle.addEventListener(a_4638.DATA_UPDATE,this.a_4674);
         this._listUI.addEventListener(a_4638.UPDATE_ROWS,this.a_4675);
      }
      
      private function scrollCheck() : void
      {
         this._listSB.totalHeight = this._listUI.totalHeight;
         this._listSB.viewHeight = this._listUI.getSize().h;
         this._listMouseCtrl.valueInit(this._listUI.totalHeight,this._listUI.getSize().h);
         this._listMouseCtrl.currentY = this._listSB.currentY;
         if(this._listUI.totalHeight > this._listUI.getSize().h)
         {
            this._listSB.scrollBarCheck();
            if(!this._listSB.hasEventListener(a_4638.a_1717))
            {
               this._listSB.addEventListener(a_4638.a_1717,this.a_4673);
               this._listMouseCtrl.addEventListener(a_4638.a_1717,this.a_4673);
            }
         }
         else if(this._listSB.hasEventListener(a_4638.a_1717))
         {
            this._listSB.removeEventListener(a_4638.a_1717,this.a_4673);
            this._listMouseCtrl.removeEventListener(a_4638.a_1717,this.a_4673);
         }
      }
      
      private function a_4673(a_4730:a_4638) : void
      {
         var v:Number = NaN;
         if(a_4730.target == this._listMouseCtrl)
         {
            v = this._listMouseCtrl.currentY;
            this._listSB.currentY = v;
         }
         else
         {
            v = this._listSB.currentY;
         }
         this._listUI.updateRowsPosition(v);
      }
      
      private function a_4674(a_4730:a_4638) : void
      {
         this.scrollCheck();
      }
      
      private function a_4675(a_4730:a_4638) : void
      {
         dispatchEvent(new a_4638(a_4638.UPDATE_ROWS,a_4730.value));
      }
   }
}

