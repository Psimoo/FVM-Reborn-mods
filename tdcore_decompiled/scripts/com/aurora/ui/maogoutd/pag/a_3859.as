package com.aurora.ui.maogoutd.pag
{
   import a_4714.AssetType;
   import a_4714.AssetsItemData;
   import a_4714.AssetsLoader;
   import a_4716.a_1733;
   import a_4752.a_2027;
   import a_4754.a_2142;
   import a_4754.a_2160;
   import a_4795.a_4671;
   import a_4795.a_4677;
   import com.aurora.ui.maogoutd.component.DefCard;
   import com.aurora.ui.maogoutd.component.DefGrid;
   import com.aurora.ui.maogoutd.component.EditCardNumber;
   import com.aurora.ui.maogoutd.component.a_3228;
   import com.aurora.ui.maogoutd.component.scrollBar.a_3281;
   import flash.display.Bitmap;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.utils.Dictionary;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   
   public class a_3859 extends Sprite
   {
      
      private var _dataProvider:Array;
      
      private var _dictGrid:Dictionary;
      
      private var _horizontal:int;
      
      private var m_width:Number;
      
      private var m_height:Number;
      
      private var list:a_4677;
      
      private var mirrorCard:DefCard;
      
      private var currentCard:DefCard;
      
      private var a_1235:Boolean;
      
      private var a_1236:int;
      
      private var a_1237:int;
      
      private var loader:AssetsLoader;
      
      public var cardMoveOrPay:CardMoveOrPay;
      
      private var dictImage:Dictionary;
      
      public function a_3859(moveEnabled:Boolean = false)
      {
         this.dictImage = a_2027.getInstance().dictImage;
         super();
         var scrollBar:a_3281 = new a_3281();
         this.list = new a_4677(scrollBar);
         addChild(this.list);
         this.doubleClickEnabled = true;
         this.m_width = 480;
         this.m_height = 400;
         this.a_1235 = moveEnabled;
         if(this.a_1235)
         {
            this.doubleClickEnabled = true;
         }
         this.a_1237 = 0;
      }
      
      public function set moveEnabled(moveEnabled:Boolean) : void
      {
         var defCard:DefCard = null;
         this.a_1235 = moveEnabled;
         if(this._dataProvider != null)
         {
            for each(defCard in this._dataProvider)
            {
               if(this.a_1235)
               {
                  defCard.addEventListener(MouseEvent.MOUSE_DOWN,this.onCardMouseDownEvent);
                  defCard.addEventListener(MouseEvent.DOUBLE_CLICK,this.onCardDoubleClickEvent);
               }
               else
               {
                  defCard.removeEventListener(MouseEvent.MOUSE_DOWN,this.onCardMouseDownEvent);
                  defCard.removeEventListener(MouseEvent.DOUBLE_CLICK,this.onCardDoubleClickEvent);
               }
            }
         }
      }
      
      public function get moveEnabled() : Boolean
      {
         return this.a_1235;
      }
      
      public function removeAllEvent() : void
      {
         if(this.cardMoveOrPay != null)
         {
            if(this.cardMoveOrPay.moveBtn.hasEventListener(MouseEvent.CLICK))
            {
               this.cardMoveOrPay.moveBtn.removeEventListener(MouseEvent.CLICK,this.onMoveBtnClickEvent);
            }
            if(this.cardMoveOrPay.hasEventListener(MouseEvent.ROLL_OUT))
            {
               this.cardMoveOrPay.removeEventListener(MouseEvent.ROLL_OUT,this.onCardMoveOrPayOutEvent);
            }
            if(this.cardMoveOrPay.payBtn.hasEventListener(MouseEvent.CLICK))
            {
               this.cardMoveOrPay.payBtn.removeEventListener(MouseEvent.CLICK,this.onPayBtnClickEvent);
            }
         }
      }
      
      public function showCardPackage(display:DisplayObjectContainer) : void
      {
         this.x = display.x;
         this.y = display.y;
         this.m_height = display.height;
         this.m_width = display.width;
      }
      
      public function sortDefCardPackage(sortLimit:Array) : void
      {
         var attr:a_3228 = null;
         if(null == sortLimit)
         {
            sortLimit = ["DefCardType","CardID","IsExpiredTime"];
         }
         var arrAtts:Array = this.getAllDefCardAttrs();
         this.removeAllDefCard();
         var arrSortCards:Array = arrAtts.sortOn(sortLimit,Array.NUMERIC);
         var index:int = 0;
         var arrCards:Array = [];
         for each(attr in arrSortCards)
         {
            attr.CardPositionID = index;
            arrCards[index] = new DefCard(attr);
            index++;
         }
         this._dataProvider = arrCards;
      }
      
      private function init() : void
      {
         var dictLoad:Dictionary = null;
         var defCard:DefCard = null;
         var iGridID:int = 0;
         var defGrid:DefGrid = null;
         var URL:String = null;
         var iCardID:int = 0;
         var ID:String = null;
         if(this._dataProvider != null)
         {
            if(this.loader == null)
            {
               this.loader = new AssetsLoader();
            }
            for each(defCard in this._dataProvider)
            {
               iGridID = defCard.cardAttr.CardPositionID;
               defGrid = this._dictGrid[iGridID] as DefGrid;
               if(defGrid != null)
               {
                  if(!defGrid.isFull && defGrid.isOpen)
                  {
                     defCard.x = 4;
                     defCard.y = 3;
                     defGrid.addChild(defCard);
                     defGrid.isFull = true;
                     if(this.a_1235)
                     {
                        defCard.addEventListener(MouseEvent.MOUSE_DOWN,this.onCardMouseDownEvent);
                        defCard.addEventListener(MouseEvent.DOUBLE_CLICK,this.onCardDoubleClickEvent);
                     }
                  }
               }
               URL = defCard.cardAttr.URL;
               iCardID = defCard.cardAttr.CardID;
               ID = defCard.cardAttr.CardID.toString(16);
               if((iCardID & 0xFF000000) == 335544320)
               {
                  ID = (iCardID & 0x0FFFFFFF | 0x02000000).toString(16);
               }
               if(this.dictImage[ID] == null)
               {
                  if(dictLoad == null)
                  {
                     dictLoad = new Dictionary();
                  }
                  dictLoad[ID] = new AssetsItemData(URL,AssetType.JPG,ID);
               }
               else
               {
                  defCard.Image = this.dictImage[ID].data as Bitmap;
               }
            }
            if(dictLoad != null)
            {
               this.loader.load(dictLoad,{"onComplete":this.onLoaderDefCardImageEvent});
            }
         }
      }
      
      private function onLoaderDefCardImageEvent(dict:Dictionary) : void
      {
         var defCard:DefCard = null;
         var iCardID:int = 0;
         var ID:String = null;
         for each(defCard in this._dataProvider)
         {
            iCardID = defCard.cardAttr.CardID;
            ID = defCard.cardAttr.CardID.toString(16);
            if((iCardID & 0xFF000000) == 335544320)
            {
               ID = (iCardID & 0x0FFFFFFF | 0x02000000).toString(16);
            }
            if(dict[ID] != null && dict[ID].data != null)
            {
               defCard.Image = dict[ID].data;
               this.dictImage[ID] = dict[ID];
            }
            else
            {
               defCard.Image = new Bitmap();
            }
         }
      }
      
      private function onCardMouseMoveEvent(a_4730:MouseEvent) : void
      {
         if(!this.currentCard.hasEventListener(MouseEvent.CLICK))
         {
            this.mirrorCard = new DefCard(this.currentCard.cardAttr);
            this.mirrorCard.Image = this.currentCard.cloneImage();
            this.mirrorCard.alpha = 0.5;
            this.currentCard.addEventListener(MouseEvent.CLICK,this.onCardClickEvent);
         }
         this.removeMirrorCard();
         this.addMirrorCard();
         this.currentCard.x = this.parent.mouseX - Math.ceil(this.currentCard.width / 2);
         this.currentCard.y = this.parent.mouseY - Math.ceil(this.currentCard.height / 2);
         a_4730.updateAfterEvent();
      }
      
      private function onCardUp(defCard:DefCard) : void
      {
         var defGrid:DefGrid = null;
         if(defCard.parent as DefGrid)
         {
            defGrid = DefGrid(defCard.parent);
            defGrid.isFull = false;
            this.parent.addChild(defCard);
            defCard.x = this.parent.mouseX - Math.ceil(defCard.width / 2);
            defCard.y = this.parent.mouseY - Math.ceil(defCard.height / 2);
            defCard.scaleX = 1.05;
            defCard.scaleY = 1.05;
         }
         if(stage != null)
         {
            stage.frameRate = 12;
         }
      }
      
      private function addMirrorCard() : void
      {
         var defGrid:DefGrid = null;
         var iGridID:int = this.getTempDefGridID();
         if(iGridID > 0)
         {
            defGrid = this._dictGrid[iGridID] as DefGrid;
            if(defGrid != null && !defGrid.isFull)
            {
               defGrid.addChild(this.mirrorCard);
               this.mirrorCard.x = (defGrid.width - this.mirrorCard.width) / 2;
               this.mirrorCard.y = (defGrid.height - this.mirrorCard.height) / 2;
            }
         }
      }
      
      private function onCardDownCompleteEvent() : void
      {
         trace("onCardDownCompleteEvent.m_CardDownTime=" + this.a_1237);
         if(this.a_1237 == 1 && this.currentCard != null)
         {
            if(stage != null)
            {
               stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onCardMouseMoveEvent);
            }
            this.currentCard.removeEventListener(MouseEvent.MOUSE_DOWN,this.onCardMouseDownEvent);
            this.onCardUp(this.currentCard);
         }
         this.a_1237 = 0;
      }
      
      private function onCardMouseDownEvent(a_4730:MouseEvent) : void
      {
         var attr:a_3228 = null;
         var isExpired:Boolean = false;
         this.onCardMoveOrPayOutEvent(null);
         if(Boolean(a_4730.currentTarget as DefCard) && this.moveEnabled == true)
         {
            this.currentCard = a_4730.currentTarget as DefCard;
            attr = this.currentCard.cardAttr;
            isExpired = attr.IsExpiredTime;
            if(isExpired)
            {
               if(this.cardMoveOrPay == null)
               {
                  this.cardMoveOrPay = new CardMoveOrPay();
                  this.addChild(this.cardMoveOrPay);
                  this.cardMoveOrPay.x = this.mouseX;
                  this.cardMoveOrPay.y = this.mouseY;
                  this.cardMoveOrPay.moveBtn.addEventListener(MouseEvent.CLICK,this.onMoveBtnClickEvent);
                  this.cardMoveOrPay.payBtn.addEventListener(MouseEvent.CLICK,this.onPayBtnClickEvent);
                  this.cardMoveOrPay.addEventListener(MouseEvent.ROLL_OUT,this.onCardMoveOrPayOutEvent);
                  this.cardMoveOrPay.showPay();
               }
            }
            else
            {
               ++this.a_1237;
               clearTimeout(this.a_1236);
               this.a_1236 = setTimeout(this.onCardDownCompleteEvent,200);
            }
         }
      }
      
      private function onCardMoveOrPayOutEvent(a_4730:MouseEvent) : void
      {
         if(this.cardMoveOrPay != null && this.contains(this.cardMoveOrPay))
         {
            this.cardMoveOrPay.removeEventListener(MouseEvent.ROLL_OUT,this.onCardMoveOrPayOutEvent);
            this.removeChild(this.cardMoveOrPay);
            this.cardMoveOrPay = null;
         }
      }
      
      private function onMoveBtnClickEvent(a_4730:MouseEvent) : void
      {
         this.cardMoveOrPay.moveBtn.removeEventListener(MouseEvent.CLICK,this.onMoveBtnClickEvent);
         this.cardMoveOrPay.payBtn.removeEventListener(MouseEvent.CLICK,this.onPayBtnClickEvent);
         this.cardMoveOrPay.removeEventListener(MouseEvent.ROLL_OUT,this.onCardMoveOrPayOutEvent);
         if(this.contains(this.cardMoveOrPay))
         {
            this.removeChild(this.cardMoveOrPay);
            this.cardMoveOrPay = null;
         }
         this.a_1237 = 1;
         this.onCardDownCompleteEvent();
      }
      
      private function onPayBtnClickEvent(a_4730:MouseEvent) : void
      {
         this.cardMoveOrPay.moveBtn.removeEventListener(MouseEvent.CLICK,this.onMoveBtnClickEvent);
         this.cardMoveOrPay.payBtn.removeEventListener(MouseEvent.CLICK,this.onPayBtnClickEvent);
         if(this.contains(this.cardMoveOrPay))
         {
            this.removeChild(this.cardMoveOrPay);
            this.cardMoveOrPay = null;
         }
         a_2160.e.onRennewCardPayTip(this.currentCard.cardAttr,this.currentCard.Image);
      }
      
      private function onCardClickEvent(a_4730:MouseEvent) : void
      {
         this.removeMirrorCard();
         var defCard:DefCard = DefCard(a_4730.currentTarget);
         var iGridID:int = this.getTempDefGridID();
         if(stage != null)
         {
            stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onCardMouseMoveEvent);
         }
         this.onClickMoveCard(defCard,iGridID);
      }
      
      private function onClickMoveCard(defCard:DefCard, iGridID:int) : void
      {
         var tempCard:DefCard = null;
         var defGrid:DefGrid = this._dictGrid[iGridID] as DefGrid;
         if(defGrid != null)
         {
            if(defGrid.isFull)
            {
               tempCard = DefCard(defGrid.getChildByName("CARD"));
               if(tempCard != null)
               {
                  defGrid.isFull = false;
                  this.showCardByDefGrid(tempCard,defCard.cardAttr.CardPositionID);
               }
            }
         }
         else
         {
            iGridID = defCard.cardAttr.CardPositionID;
         }
         this.showCardByDefGrid(defCard,iGridID);
         defCard.removeEventListener(MouseEvent.CLICK,this.onCardClickEvent);
      }
      
      private function removeMirrorCard() : void
      {
         if(this.mirrorCard != null && this.mirrorCard.parent != null)
         {
            this.mirrorCard.parent.removeChild(this.mirrorCard);
         }
      }
      
      private function getTempDefGridID() : int
      {
         var defGrid:DefGrid = new DefGrid();
         var _mouseX:Number = this.list.mouseX;
         var _mouseY:Number = this.list.mouseY - this.list.listUIRef.RowsContainer.y;
         if(_mouseX < 0 || _mouseY < 0 || _mouseX > this.m_width - 30 || this.mouseY > this.m_height)
         {
            return -1;
         }
         var piontX:int = _mouseX / (1 + defGrid.width);
         var pointY:int = _mouseY / (1 + defGrid.height);
         return piontX + pointY * this._horizontal;
      }
      
      private function onCardDoubleClickEvent(a_4730:MouseEvent) : void
      {
         var defCard:DefCard = null;
         trace("onCardDoubleClickEvent");
         if(a_4730.currentTarget as DefCard)
         {
            defCard = a_4730.currentTarget as DefCard;
            if(this.removeDefCard(defCard))
            {
               this.removeCardEvent(defCard);
               a_2142.e.onClickDefCardMoveOut(defCard);
               ++this.a_1237;
               if(defCard.parent == null)
               {
                  this.showCardByDefGrid(defCard,defCard.cardAttr.CardPositionID);
               }
            }
         }
      }
      
      private function removeCardEvent(defCard:DefCard) : void
      {
         if(defCard.hasEventListener(MouseEvent.DOUBLE_CLICK))
         {
            defCard.removeEventListener(MouseEvent.DOUBLE_CLICK,this.onCardDoubleClickEvent);
         }
         if(defCard.hasEventListener(MouseEvent.CLICK))
         {
            defCard.removeEventListener(MouseEvent.CLICK,this.onCardClickEvent);
         }
         if(defCard.hasEventListener(MouseEvent.MOUSE_DOWN))
         {
            defCard.removeEventListener(MouseEvent.MOUSE_DOWN,this.onCardMouseDownEvent);
         }
         if(stage != null)
         {
            stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onCardMouseMoveEvent);
         }
      }
      
      public function setSize(size:int, horizontalSize:int = 1, horizontalSpace:int = 1) : void
      {
         var defCard:DefCard = null;
         var attr:a_3228 = null;
         var iGridID:int = 0;
         this.list.setSize(this.m_width,this.m_height,size,DefGrid,horizontalSize,horizontalSpace);
         this._horizontal = horizontalSize;
         this.initGrid();
         if(this._dataProvider != null && this._dataProvider.length > 0)
         {
            for each(defCard in this._dataProvider)
            {
               attr = defCard.cardAttr;
               iGridID = attr.CardPositionID;
               this.showCardByDefGrid(defCard,iGridID);
            }
         }
      }
      
      public function set dataProvider(rdp:Array) : void
      {
         this.initGrid();
         this.removeAllDefCard();
         this._dataProvider = rdp;
         this.init();
      }
      
      public function showCardByDefGrid(defCard:DefCard, iGridID:int) : Boolean
      {
         var defGrid:DefGrid = null;
         var isAdd:Boolean = false;
         defGrid = this._dictGrid[iGridID] as DefGrid;
         if(defGrid != null && !defGrid.isFull && defGrid.isOpen)
         {
            defCard.scaleX = 1;
            defCard.scaleY = 1;
            defCard.x = 4;
            defCard.y = 3;
            defGrid.addChild(defCard);
            defGrid.isFull = true;
            if(this.a_1235)
            {
               defCard.addEventListener(MouseEvent.MOUSE_DOWN,this.onCardMouseDownEvent);
               defCard.addEventListener(MouseEvent.DOUBLE_CLICK,this.onCardDoubleClickEvent);
            }
            defCard.cardAttr.CardPositionID = iGridID;
            isAdd = true;
            if(this.getDefCard(defCard.cardAttr.ID) == null)
            {
               this._dataProvider.push(defCard);
            }
         }
         return isAdd;
      }
      
      public function showDefCard(defCard:DefCard) : Boolean
      {
         var iGridID:int = 0;
         var defGrid:DefGrid = null;
         var isAdd:Boolean = false;
         if(this._dictGrid != null)
         {
            iGridID = 0;
            for each(defGrid in this._dictGrid)
            {
               if(!defGrid.isFull && defGrid.isOpen)
               {
                  defCard.scaleX = 1;
                  defCard.scaleY = 1;
                  defCard.x = 4;
                  defCard.y = 3;
                  defGrid.addChild(defCard);
                  defGrid.isFull = true;
                  if(this.getDefCard(defCard.cardAttr.ID) == null)
                  {
                     this._dataProvider.push(defCard);
                  }
                  defCard.cardAttr.CardPositionID = iGridID;
                  isAdd = true;
                  if(this.a_1235)
                  {
                     defCard.addEventListener(MouseEvent.MOUSE_DOWN,this.onCardMouseDownEvent);
                     defCard.addEventListener(MouseEvent.DOUBLE_CLICK,this.onCardDoubleClickEvent);
                  }
                  break;
               }
               iGridID++;
            }
         }
         return isAdd;
      }
      
      public function getAllDefCard() : Array
      {
         return this._dataProvider;
      }
      
      public function getAllDefCardAttrs() : Array
      {
         var card:DefCard = null;
         var arrCardAttr:Array = [];
         for each(card in this._dataProvider)
         {
            arrCardAttr.push(card.cardAttr);
         }
         return arrCardAttr;
      }
      
      public function removeAllDefCard() : void
      {
         var defCard:DefCard = null;
         var defGrid:DefGrid = null;
         if(this._dataProvider != null)
         {
            for each(defCard in this._dataProvider)
            {
               if(defCard.parent as DefGrid)
               {
                  defGrid = defCard.parent as DefGrid;
                  if(defGrid != null)
                  {
                     if(defGrid.isFull)
                     {
                        this.removeCardEvent(defCard);
                        defGrid.removeChild(defCard);
                        defGrid.isFull = false;
                     }
                  }
               }
            }
            while(this._dataProvider.length > 0)
            {
               this._dataProvider.splice(0);
            }
         }
      }
      
      public function removeDefCard(reomveCard:DefCard) : Boolean
      {
         var index:int = 0;
         var defCard:DefCard = null;
         var iGridID:int = 0;
         var defGrid:DefGrid = null;
         var isRemove:Boolean = false;
         if(this._dataProvider != null)
         {
            index = 0;
            for each(defCard in this._dataProvider)
            {
               iGridID = defCard.cardAttr.CardPositionID;
               if(defCard.cardAttr.ID == reomveCard.cardAttr.ID)
               {
                  defGrid = this._dictGrid[iGridID] as DefGrid;
                  if(defGrid != null)
                  {
                     if(defGrid.isFull)
                     {
                        this.removeCardEvent(defCard);
                        defGrid.removeChild(defCard);
                        defGrid.isFull = false;
                        isRemove = true;
                        this._dataProvider.splice(index,1);
                     }
                  }
                  break;
               }
               index++;
            }
         }
         return isRemove;
      }
      
      public function getDefCard(ID:String) : DefCard
      {
         var def:DefCard = null;
         var defCard:DefCard = null;
         if(this._dataProvider != null)
         {
            for each(def in this._dataProvider)
            {
               if(def.cardAttr.ID == ID)
               {
                  defCard = def;
                  break;
               }
            }
         }
         return defCard;
      }
      
      private function initGrid() : void
      {
         var rowGrid:a_4671 = null;
         var content:Dictionary = null;
         var defGrid:DefGrid = null;
         this._dictGrid = new Dictionary(true);
         var rows:Array = this.list.listUIRef.getRows();
         var iGridID:int = 0;
         for each(rowGrid in rows)
         {
            content = rowGrid.content;
            for each(defGrid in content)
            {
               this._dictGrid[iGridID] = defGrid;
               defGrid.isOpen = true;
               iGridID++;
            }
         }
      }
      
      public function showOpenDefGrid(iOpenSize:int, DefenseCardCounts:int = 21) : void
      {
         var defGrid:DefGrid = null;
         var num:EditCardNumber = null;
         for(var index:int = 0; index < DefenseCardCounts; index++)
         {
            defGrid = this._dictGrid[index] as DefGrid;
            if(defGrid != null)
            {
               if(index < iOpenSize)
               {
                  defGrid.isOpen = true;
                  if(defGrid.bg.numChildren == 1)
                  {
                     num = new EditCardNumber();
                     num.gotoAndStop(index + 1);
                     defGrid.bg.addChild(num);
                     num.x = int(defGrid.bg.width - num.width) / 2;
                     num.y = int(defGrid.bg.height - num.height) / 2;
                  }
               }
               else
               {
                  defGrid.isOpen = false;
               }
            }
         }
      }
      
      public function addPropsCards(arrPropsCard:Array, iOpenSize:int, DefenseCardCounts:int = 21) : void
      {
         var defCardsx:DefCard = null;
         var m_dictAttr:Dictionary = null;
         var loader:AssetsLoader = null;
         var i:int = 0;
         var defGrid:DefGrid = null;
         var defCard:DefCard = null;
         var defCards:DefCard = null;
         var defCardd:DefCard = null;
         var defCardf:DefCard = null;
         for each(defCardsx in arrPropsCard)
         {
            if(defCardsx.cardAttr.CardID == a_1733.enm_ZhanDou19 || defCardsx.cardAttr.CardID == a_1733.enm_ZhanDou20 || defCardsx.cardAttr.CardID == a_1733.enm_ZhanDou21)
            {
               m_dictAttr = new Dictionary();
               m_dictAttr[defCardsx.cardAttr.URLID] = new AssetsItemData(defCardsx.cardAttr.URL,AssetType.JPG,defCardsx.cardAttr.URLID);
               loader = new AssetsLoader();
               loader.load(m_dictAttr,{
                  "onComplete":this.onLoaderCardImageEvent,
                  "onCompleteParms":[[defCardsx]]
               });
            }
         }
         if(iOpenSize < DefenseCardCounts)
         {
            for(i = 0; i < arrPropsCard.length; i++)
            {
               if(iOpenSize >= DefenseCardCounts)
               {
                  break;
               }
               defGrid = this._dictGrid[iOpenSize] as DefGrid;
               defCard = arrPropsCard[i];
               if(!(defCard.cardAttr.CardID == a_1733.enm_ZhanDou19 || defCard.cardAttr.CardID == a_1733.enm_ZhanDou20 || defCard.cardAttr.CardID == a_1733.enm_ZhanDou21))
               {
                  if(iOpenSize >= 18)
                  {
                     break;
                  }
                  if(defGrid != null && !defGrid.isOpen)
                  {
                     defGrid.addChild(defCard);
                     defCard.x = (defGrid.width - defCard.width) / 2;
                     defCard.y = (defGrid.height - defCard.height) / 2;
                  }
                  iOpenSize++;
               }
            }
            defGrid = this._dictGrid[iOpenSize] as DefGrid;
            if(iOpenSize == 18)
            {
               for each(defCards in arrPropsCard)
               {
                  if(defCards.cardAttr.CardID == a_1733.enm_ZhanDou19)
                  {
                     break;
                  }
               }
               if(defGrid != null && !defGrid.isOpen && defCards.cardAttr.CardID == a_1733.enm_ZhanDou19)
               {
                  defGrid.addChild(defCards);
                  defCards.x = (defGrid.width - defCards.width) / 2;
                  defCards.y = (defGrid.height - defCards.height) / 2;
                  iOpenSize++;
               }
            }
            defGrid = this._dictGrid[iOpenSize] as DefGrid;
            if(iOpenSize == 19)
            {
               for each(defCardd in arrPropsCard)
               {
                  if(defCardd.cardAttr.CardID == a_1733.enm_ZhanDou20)
                  {
                     break;
                  }
               }
               if(defGrid != null && !defGrid.isOpen && defCardd.cardAttr.CardID == a_1733.enm_ZhanDou20)
               {
                  defGrid.addChild(defCardd);
                  defCardd.x = (defGrid.width - defCardd.width) / 2;
                  defCardd.y = (defGrid.height - defCardd.height) / 2;
                  iOpenSize++;
               }
            }
            defGrid = this._dictGrid[iOpenSize] as DefGrid;
            if(iOpenSize == 20)
            {
               for each(defCardf in arrPropsCard)
               {
                  if(defCardf.cardAttr.CardID == a_1733.enm_ZhanDou21)
                  {
                     break;
                  }
               }
               if(defGrid != null && !defGrid.isOpen && defCardf.cardAttr.CardID == a_1733.enm_ZhanDou21)
               {
                  defGrid.addChild(defCardf);
                  defCardf.x = (defGrid.width - defCardf.width) / 2;
                  defCardf.y = (defGrid.height - defCardf.height) / 2;
                  iOpenSize++;
               }
            }
         }
      }
      
      public function removePropsCards(DefenseCardCounts:int = 21) : void
      {
         var defGrid:DefGrid = null;
         var defCard:DefCard = null;
         var index:int = 0;
         while(index < DefenseCardCounts)
         {
            defGrid = this._dictGrid[index] as DefGrid;
            if(defGrid != null)
            {
               defCard = DefCard(defGrid.getChildByName("CARD"));
               if(defCard != null && (defCard.cardAttr.CardID == a_1733.enm_ZhanDouJiaYiGe || defCard.cardAttr.CardID == a_1733.enm_ZhanDou19 || defCard.cardAttr.CardID == a_1733.enm_ZhanDou20 || defCard.cardAttr.CardID == a_1733.enm_ZhanDou21))
               {
                  defGrid.removeChild(defCard);
                  trace("removePropsCards=" + defCard.cardAttr.CardID.toString(16) + ",defGrid.isFull=" + defGrid.isFull);
               }
            }
            index++;
         }
      }
      
      public function getListPosition() : Number
      {
         if(null == this.list)
         {
            return 0;
         }
         return this.list.currentListPosition;
      }
      
      public function setListPosition(p:Number) : void
      {
         if(null == this.list)
         {
            return;
         }
         this.list.currentListPosition = p;
      }
      
      private function onLoaderCardImageEvent(dict:Dictionary, arrPropsCards:Array) : void
      {
         var props:DefCard = null;
         var attr:a_3228 = null;
         var CardID:int = 0;
         var ID:String = null;
         var image:Bitmap = null;
         for each(props in arrPropsCards)
         {
            attr = props.cardAttr;
            CardID = attr.CardID;
            ID = attr.URLID;
            if(dict[ID] != null && Boolean(dict[ID].data))
            {
               image = dict[ID].data;
               props.Image = image;
            }
         }
      }
   }
}

