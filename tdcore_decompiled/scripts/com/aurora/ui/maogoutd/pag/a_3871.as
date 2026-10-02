package com.aurora.ui.maogoutd.pag
{
   import a_4714.AssetType;
   import a_4714.AssetsItemData;
   import a_4714.AssetsLoader;
   import a_4716.a_1733;
   import a_4728.a_1778;
   import a_4729.EventType;
   import a_4729.a_1789;
   import a_4752.GlobalVariables;
   import a_4752.a_2027;
   import a_4754.a_2142;
   import a_4754.a_2160;
   import a_4754.a_2161;
   import a_4795.a_4671;
   import a_4795.a_4677;
   import com.aurora.ui.maogoutd.component.PropsCard;
   import com.aurora.ui.maogoutd.component.PropsGrid;
   import com.aurora.ui.maogoutd.component.a_3228;
   import com.aurora.ui.maogoutd.component.scrollBar.a_3281;
   import com.aurora.ui.maogoutd.role.a_4461;
   import com.aurora.ui.maogoutd.role.a_4463;
   import flash.display.Bitmap;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.utils.Dictionary;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   
   public class a_3871 extends Sprite
   {
      
      private var _dataProvider:Array;
      
      private var _dictGrid:Dictionary;
      
      private var _horizontal:int;
      
      private var m_width:Number;
      
      private var m_height:Number;
      
      private var list:a_4677;
      
      private var m_size:int;
      
      private var mirrorCard:PropsCard;
      
      private var currentCard:PropsCard;
      
      private var a_1235:Boolean;
      
      private var a_1236:int;
      
      public var a_1237:int;
      
      private var loader:AssetsLoader;
      
      public var cardMoveOrPay:CardMoveOrPay;
      
      private var useSkillBook:UseSkillBook;
      
      private var dictImage:Dictionary;
      
      public function a_3871(moveEnabled:Boolean = false)
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
         var propsCard:PropsCard = null;
         this.a_1235 = moveEnabled;
         if(this._dataProvider != null)
         {
            for each(propsCard in this._dataProvider)
            {
               if(this.a_1235)
               {
                  propsCard.addEventListener(MouseEvent.MOUSE_DOWN,this.onCardMouseDownEvent);
                  propsCard.addEventListener(MouseEvent.DOUBLE_CLICK,this.onCardDoubleClickEvent);
               }
               else
               {
                  propsCard.removeEventListener(MouseEvent.MOUSE_DOWN,this.onCardMouseDownEvent);
                  propsCard.removeEventListener(MouseEvent.DOUBLE_CLICK,this.onCardDoubleClickEvent);
               }
            }
         }
      }
      
      public function removeAllEvent() : void
      {
         if(this.cardMoveOrPay != null)
         {
            if(this.cardMoveOrPay.moveBtn.hasEventListener(MouseEvent.CLICK))
            {
               this.cardMoveOrPay.moveBtn.removeEventListener(MouseEvent.CLICK,this.onMoveBtnClickEvent);
            }
            if(this.cardMoveOrPay.onceMoveBtn.hasEventListener(MouseEvent.CLICK))
            {
               this.cardMoveOrPay.onceMoveBtn.removeEventListener(MouseEvent.CLICK,this.onMoveBtnClickEvent);
            }
            if(this.cardMoveOrPay.hasEventListener(MouseEvent.ROLL_OUT))
            {
               this.cardMoveOrPay.removeEventListener(MouseEvent.ROLL_OUT,this.onCardMoveOrPayOutEvent);
            }
            if(this.cardMoveOrPay.useBtn.hasEventListener(MouseEvent.CLICK))
            {
               this.cardMoveOrPay.useBtn.removeEventListener(MouseEvent.CLICK,this.onUseBtnClickEvent);
            }
            if(this.cardMoveOrPay.onceUseBtn.hasEventListener(MouseEvent.CLICK))
            {
               this.cardMoveOrPay.onceUseBtn.removeEventListener(MouseEvent.CLICK,this.onUseBtnClickEvent);
            }
            if(this.cardMoveOrPay.payBtn.hasEventListener(MouseEvent.CLICK))
            {
               this.cardMoveOrPay.payBtn.removeEventListener(MouseEvent.CLICK,this.onPayBtnClickEvent);
            }
         }
      }
      
      public function get moveEnabled() : Boolean
      {
         return this.a_1235;
      }
      
      public function showCardPackage(display:DisplayObjectContainer) : void
      {
         this.x = display.x;
         this.y = display.y;
         this.m_height = display.height;
         this.m_width = display.width;
      }
      
      public function sortPropsCardPackage(sortLimit:Array) : void
      {
         var attr:a_3228 = null;
         if(null == sortLimit)
         {
            sortLimit = ["CardID","CardComposeProps"];
         }
         var arrAtts:Array = this.getAllPropsCardAttrs();
         this.removeAllPropsCard();
         var arrSortCards:Array = arrAtts.sortOn(sortLimit,Array.NUMERIC);
         var index:int = 0;
         var arrCards:Array = [];
         for each(attr in arrSortCards)
         {
            attr.CardPositionID = index;
            arrCards[index] = new PropsCard(attr);
            index++;
         }
         this._dataProvider = arrCards;
         this.init();
      }
      
      public function sortEquipmentCardPackage(sortLimit:Array) : void
      {
         var index:int = 0;
         var attr:a_3228 = null;
         if(null == sortLimit)
         {
            sortLimit = ["ExpiredTime","CardID"];
         }
         var arrAtts:Array = this.getAllPropsCardAttrs();
         this.removeAllPropsCard();
         var arrSortCards:Array = arrAtts.sortOn(sortLimit,Array.NUMERIC);
         index = 0;
         var arrCards:Array = [];
         for each(attr in arrSortCards)
         {
            attr.CardPositionID = index;
            arrCards[index] = new PropsCard(attr);
            index++;
         }
         this._dataProvider = arrCards;
         this.setListPosition(this.getListPosition());
         this.showEquipmentInHero();
      }
      
      private function showEquipmentInHero() : void
      {
         var heroItem:a_4461 = null;
         var attr:a_3228 = null;
         var propsCard:PropsCard = null;
         var role:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         var arrHeroItemID:Array = role.m_arrHeroItemID;
         var arrPropsCards:Array = [];
         for each(heroItem in arrHeroItemID)
         {
            attr = new a_3228();
            attr.CardCount = heroItem.m_nItemCount;
            attr.CardID = heroItem.m_iItemID;
            attr.CardPositionID = heroItem.m_nItemPosition;
            attr.CardSeq = heroItem.m_iItemSeq;
            attr.IsBind = heroItem.m_cIsBind;
            attr.ExpiredTime = heroItem.m_iUsedTime;
            attr.Type = heroItem.m_iType;
            attr.TypeValue = heroItem.m_iTypeValue;
            attr.DeltaTime = heroItem.m_iDeltaTime;
            attr.DictExtraAttr = heroItem.m_dictExtraAttr;
            propsCard = new PropsCard(attr);
            arrPropsCards.push(propsCard);
         }
         this.showHeroAvatarEquip(arrPropsCards);
      }
      
      private function init() : void
      {
         var dictLoad:Dictionary = null;
         var propsCard:PropsCard = null;
         var iGridID:int = 0;
         var propsGrid:PropsGrid = null;
         var URL:String = null;
         var ID:String = null;
         if(this._dataProvider != null)
         {
            if(this.loader == null)
            {
               this.loader = new AssetsLoader();
            }
            dictLoad = new Dictionary();
            for each(propsCard in this._dataProvider)
            {
               iGridID = propsCard.cardAttr.CardPositionID;
               propsGrid = this._dictGrid[iGridID] as PropsGrid;
               if(propsGrid != null)
               {
                  propsGrid.isOpen = true;
                  if(!propsGrid.isFull && propsGrid.isOpen)
                  {
                     propsCard.x = (propsGrid.width - propsCard.width) / 2;
                     propsCard.y = (propsGrid.height - propsCard.height) / 2;
                     propsGrid.addChild(propsCard);
                     propsGrid.isFull = true;
                     propsGrid.addChild(propsGrid.alreadymc);
                     propsGrid.alreadymc.visible = propsCard.cardAttr.m_bIsEquip;
                     propsCard.CardClickStatus = !propsCard.cardAttr.m_bIsClick;
                     if(this.a_1235)
                     {
                        propsCard.addEventListener(MouseEvent.MOUSE_DOWN,this.onCardMouseDownEvent);
                        propsCard.addEventListener(MouseEvent.DOUBLE_CLICK,this.onCardDoubleClickEvent);
                     }
                  }
               }
               URL = propsCard.cardAttr.URL;
               ID = propsCard.cardAttr.URLID;
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
                  propsCard.Image = this.dictImage[ID].data as Bitmap;
               }
            }
            if(dictLoad != null)
            {
               this.loader.load(dictLoad,{"onComplete":this.onLoaderPropsCardImageEvent});
            }
         }
      }
      
      private function onLoaderPropsCardImageEvent(dict:Dictionary) : void
      {
         var propsCard:PropsCard = null;
         var CardID:int = 0;
         var ID:String = null;
         for each(propsCard in this._dataProvider)
         {
            CardID = propsCard.cardAttr.CardID;
            ID = propsCard.cardAttr.URLID;
            if(dict[ID] != null && Boolean(dict[ID].data))
            {
               propsCard.Image = dict[ID].data;
               this.dictImage[ID] = dict[ID];
            }
            else
            {
               propsCard.Image = new Bitmap();
            }
         }
      }
      
      private function cardIsMoveable(cardAttr:a_3228) : Boolean
      {
         if(cardAttr.IsExpiredTime)
         {
            return false;
         }
         return (cardAttr.CardID & 0x14000000) == 335544320 || (cardAttr.CardID & 0x13C00000) == 331350016;
      }
      
      private function onCardMouseMoveEvent(a_4730:MouseEvent) : void
      {
         var CardID:int = 0;
         if(!this.currentCard.hasEventListener(MouseEvent.CLICK))
         {
            CardID = this.currentCard.cardAttr.CardID;
            this.mirrorCard = new PropsCard(this.currentCard.cardAttr);
            this.mirrorCard.Image = this.currentCard.cloneImage();
            if(this.cardIsMoveable(this.currentCard.cardAttr))
            {
               this.mirrorCard.Image.scaleX = 0.6;
               this.mirrorCard.Image.scaleY = 0.6;
            }
            this.mirrorCard.alpha = 0.5;
            this.currentCard.addEventListener(MouseEvent.CLICK,this.onCardClickEvent);
         }
         this.removeMirrorCard();
         this.addMirrorCard();
         if(this.parent.parent != null)
         {
            this.currentCard.x = this.parent.parent.mouseX - Math.ceil(this.currentCard.width / 2);
            this.currentCard.y = this.parent.parent.mouseY - Math.ceil(this.currentCard.height / 2);
         }
         a_4730.updateAfterEvent();
      }
      
      private function onCardUp(propsCard:PropsCard) : void
      {
         var propsGrid:PropsGrid = null;
         if(propsCard.parent as PropsGrid)
         {
            if(this.parent.parent != null)
            {
               propsGrid = PropsGrid(propsCard.parent);
               propsGrid.isFull = false;
               this.parent.parent.addChild(propsCard);
               propsCard.x = this.parent.parent.mouseX - Math.ceil(propsCard.width / 2);
               propsCard.y = this.parent.parent.mouseY - Math.ceil(propsCard.height / 2);
               propsCard.scaleX = 1.05;
               propsCard.scaleY = 1.05;
               if(!propsCard.cardAttr.IsExpiredTime)
               {
                  a_2142.e.onShowPropsCardMoveTip(propsCard);
               }
            }
         }
      }
      
      private function addMirrorCard() : void
      {
         var propsGrid:PropsGrid = null;
         var iGridID:int = this.getTempDefGridID();
         if(iGridID > 0)
         {
            propsGrid = this._dictGrid[iGridID] as PropsGrid;
            if(propsGrid != null && !propsGrid.isFull && propsGrid.isOpen)
            {
               propsGrid.addChild(this.mirrorCard);
               this.mirrorCard.x = (propsGrid.width - this.mirrorCard.width) / 2;
               this.mirrorCard.y = (propsGrid.height - this.mirrorCard.height) / 2;
            }
         }
      }
      
      private function onCardDownCompleteEvent() : void
      {
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
         var CardID:int = 0;
         var dataEvent1:a_1778 = null;
         this.onCardMoveOrPayOutEvent(null);
         if(a_4730.currentTarget as PropsCard)
         {
            this.currentCard = a_4730.currentTarget as PropsCard;
            attr = this.currentCard.cardAttr;
            isExpired = attr.IsExpiredTime;
            CardID = attr.CardID;
            if((CardID & 0xFF000000) == 335544320)
            {
               if(GlobalVariables.getInstance().m_iSecpwd == false && GlobalVariables.getInstance().m_iHasSecpwd == true)
               {
                  dataEvent1 = new a_1778(EventType.UNEED_SECPWD);
                  dataEvent1.dataObject = null;
                  a_1789.getInstance().dispatchEvent(dataEvent1);
                  return;
               }
            }
            if(this.cardMoveOrPay == null)
            {
               this.cardMoveOrPay = new CardMoveOrPay();
            }
            if(320864528 == CardID || 320864784 == CardID || 320865040 == CardID)
            {
               this.addChild(this.cardMoveOrPay);
               this.cardMoveOrPay.x = this.mouseX;
               this.cardMoveOrPay.y = this.mouseY;
               this.cardMoveOrPay.moveBtn.addEventListener(MouseEvent.CLICK,this.onMoveBtnClickEvent);
               this.cardMoveOrPay.addEventListener(MouseEvent.ROLL_OUT,this.onCardMoveOrPayOutEvent);
               this.cardMoveOrPay.useBtn.addEventListener(MouseEvent.CLICK,this.onUseBtnClickEvent);
               this.cardMoveOrPay.showUse();
            }
            else if(CardID != a_1733.enm_DaLaBa && (CardID & 0xFFF00000) != 320864256 && (CardID & 0xFFF00000) != 331350016)
            {
               if(isExpired || (CardID & 0xFFF00000) == 304087040 || (CardID & 0xFF000000) == 318767104 && (CardID & 0xFFF00000) != 325058560)
               {
                  this.addChild(this.cardMoveOrPay);
                  this.cardMoveOrPay.x = this.mouseX;
                  this.cardMoveOrPay.y = this.mouseY;
                  this.cardMoveOrPay.moveBtn.addEventListener(MouseEvent.CLICK,this.onMoveBtnClickEvent);
                  this.cardMoveOrPay.addEventListener(MouseEvent.ROLL_OUT,this.onCardMoveOrPayOutEvent);
                  if(isExpired)
                  {
                     this.cardMoveOrPay.payBtn.addEventListener(MouseEvent.CLICK,this.onPayBtnClickEvent);
                     this.cardMoveOrPay.showPay();
                  }
                  else if((CardID & 0xFFF00000) == 304087040 || (CardID & 0xFFF00000) == 319815680 || (CardID & 0xFFF00000) == 320864256 || (CardID & 0xFFF00000) == 324009984)
                  {
                     this.cardMoveOrPay.useBtn.addEventListener(MouseEvent.CLICK,this.onUseBtnClickEvent);
                     this.cardMoveOrPay.showUse();
                  }
                  else if((CardID & 0xFF000000) == 318767104)
                  {
                     this.cardMoveOrPay.onceUseBtn.addEventListener(MouseEvent.CLICK,this.onUseBtnClickEvent);
                     this.cardMoveOrPay.onceMoveBtn.addEventListener(MouseEvent.CLICK,this.onMoveBtnClickEvent);
                     this.cardMoveOrPay.onceKeyOpenBtn.addEventListener(MouseEvent.CLICK,this.onOnceKeyOpenBtnClickEvent);
                     this.cardMoveOrPay.showOnceKeyOpen();
                  }
               }
               else
               {
                  ++this.a_1237;
                  clearTimeout(this.a_1236);
                  this.a_1236 = setTimeout(this.onCardDownCompleteEvent,200);
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
         if(this.currentCard.cardAttr.CardID == a_1733.enm_XinRenLibaoNan || this.currentCard.cardAttr.CardID == a_1733.enm_XinRenLibaoNv)
         {
            return;
         }
         this.cardMoveOrPay.moveBtn.removeEventListener(MouseEvent.CLICK,this.onMoveBtnClickEvent);
         this.cardMoveOrPay.payBtn.removeEventListener(MouseEvent.CLICK,this.onPayBtnClickEvent);
         this.cardMoveOrPay.useBtn.removeEventListener(MouseEvent.CLICK,this.onUseBtnClickEvent);
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
      
      private function onOnceKeyOpenBtnClickEvent(a_4730:MouseEvent) : void
      {
         this.cardMoveOrPay.onceMoveBtn.removeEventListener(MouseEvent.CLICK,this.onMoveBtnClickEvent);
         this.cardMoveOrPay.onceUseBtn.removeEventListener(MouseEvent.CLICK,this.onUseBtnClickEvent);
         this.cardMoveOrPay.onceKeyOpenBtn.removeEventListener(MouseEvent.CLICK,this.onOnceKeyOpenBtnClickEvent);
         if(this.contains(this.cardMoveOrPay))
         {
            this.removeChild(this.cardMoveOrPay);
            this.cardMoveOrPay = null;
         }
         if(!this.useSkillBook)
         {
            this.useSkillBook = new UseSkillBook();
         }
         this.useSkillBook.setSkillBook(this.currentCard);
         addChild(this.useSkillBook);
      }
      
      private function onUseBtnClickEvent(a_4730:MouseEvent) : void
      {
         this.cardMoveOrPay.moveBtn.removeEventListener(MouseEvent.CLICK,this.onMoveBtnClickEvent);
         this.cardMoveOrPay.useBtn.removeEventListener(MouseEvent.CLICK,this.onUseBtnClickEvent);
         if(this.contains(this.cardMoveOrPay))
         {
            this.removeChild(this.cardMoveOrPay);
            this.cardMoveOrPay = null;
         }
         if((this.currentCard.cardAttr.CardID & 0xFFF00000) == 304087040)
         {
            if(!this.useSkillBook)
            {
               this.useSkillBook = new UseSkillBook();
            }
            this.useSkillBook.setSkillBook(this.currentCard);
            addChild(this.useSkillBook);
         }
         else
         {
            a_2142.e.onUsePropsCard(this.currentCard);
         }
      }
      
      private function onCardClickEvent(a_4730:MouseEvent) : void
      {
         this.removeMirrorCard();
         var propsCard:PropsCard = PropsCard(a_4730.currentTarget);
         var iGridID:int = this.getTempDefGridID();
         if(stage != null)
         {
            stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onCardMouseMoveEvent);
         }
         this.onClickMoveCard(propsCard,iGridID);
      }
      
      private function onClickMoveCard(propsCard:PropsCard, iGridID:int) : void
      {
         var tempCard:PropsCard = null;
         var attr:a_3228 = null;
         var index:int = 0;
         var dataCard:PropsCard = null;
         var propsGrid:PropsGrid = this._dictGrid[iGridID] as PropsGrid;
         a_2142.e.onHidePropsCardMoveTip(propsCard);
         if(propsGrid != null && propsGrid.isOpen)
         {
            if(propsGrid.isFull)
            {
               tempCard = PropsCard(propsGrid.getChildByName("CARD"));
               if(tempCard != null)
               {
                  propsGrid.isFull = false;
                  this.showCardByPropsGrid(tempCard,propsCard.cardAttr.CardPositionID);
               }
            }
            this.showCardByPropsGrid(propsCard,iGridID);
         }
         else
         {
            attr = propsCard.cardAttr;
            if(this.cardIsMoveable(attr))
            {
               trace("CardID=" + attr.CardID.toString(16));
               propsCard.parent.removeChild(propsCard);
               index = 0;
               for each(dataCard in this._dataProvider)
               {
                  if(attr.ID == dataCard.cardAttr.ID)
                  {
                     this.removeCardEvent(propsCard);
                     this._dataProvider.splice(index,1);
                     a_2142.e.onClickEquipmentCardMoveOut(propsCard);
                     break;
                  }
                  index++;
               }
               if(propsCard.parent == null)
               {
                  this.showCardByPropsGrid(propsCard,propsCard.cardAttr.CardPositionID);
               }
            }
            else
            {
               iGridID = propsCard.cardAttr.CardPositionID;
               this.showCardByPropsGrid(propsCard,iGridID);
            }
         }
         propsCard.removeEventListener(MouseEvent.CLICK,this.onCardClickEvent);
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
         var propsGrid:PropsGrid = new PropsGrid();
         var _mouseX:Number = this.list.mouseX;
         var _mouseY:Number = this.list.mouseY - this.list.listUIRef.RowsContainer.y;
         if(_mouseX < 0 || _mouseY < 0 || _mouseX > this.m_width - 30 || this.mouseY > this.m_height)
         {
            return -1;
         }
         var pointX:int = _mouseX / (1 + propsGrid.width);
         var pointY:int = _mouseY / (1 + propsGrid.height);
         return pointX + pointY * this._horizontal;
      }
      
      private function onCardDoubleClickEvent(a_4730:MouseEvent) : void
      {
         if(!(a_4730.currentTarget as PropsCard))
         {
         }
      }
      
      private function removeCardEvent(propsCard:PropsCard) : void
      {
         if(propsCard.hasEventListener(MouseEvent.DOUBLE_CLICK))
         {
            propsCard.removeEventListener(MouseEvent.DOUBLE_CLICK,this.onCardDoubleClickEvent);
         }
         if(propsCard.hasEventListener(MouseEvent.CLICK))
         {
            propsCard.removeEventListener(MouseEvent.CLICK,this.onCardClickEvent);
         }
         if(propsCard.hasEventListener(MouseEvent.MOUSE_DOWN))
         {
            propsCard.removeEventListener(MouseEvent.MOUSE_DOWN,this.onCardMouseDownEvent);
         }
         if(stage != null)
         {
            stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onCardMouseMoveEvent);
         }
      }
      
      public function setSize(size:int, horizontalSize:int = 1, horizontalSpace:int = 1) : void
      {
         var propsCard:PropsCard = null;
         var attr:a_3228 = null;
         var iGridID:int = 0;
         this.m_size = size;
         this.list.setSize(this.m_width,this.m_height,size,PropsGrid,horizontalSize,horizontalSpace);
         this._horizontal = horizontalSize;
         this.initGrid();
         if(this._dataProvider != null && this._dataProvider.length > 0)
         {
            this.setListPosition(0);
            for each(propsCard in this._dataProvider)
            {
               attr = propsCard.cardAttr;
               iGridID = attr.CardPositionID;
               this.showCardByPropsGrid(propsCard,iGridID);
            }
         }
      }
      
      public function set dataProvider(rdp:Array) : void
      {
         this.initGrid();
         this.removeAllPropsCard();
         this._dataProvider = rdp;
         this.init();
      }
      
      private function initGrid() : void
      {
         var rows:Array = null;
         var iGridID:int = 0;
         var rowGrid:a_4671 = null;
         var ID:String = null;
         var content:Dictionary = null;
         var propsGrid:PropsGrid = null;
         if(this._dictGrid == null)
         {
            this._dictGrid = new Dictionary(true);
         }
         else
         {
            for(ID in this._dictGrid)
            {
               delete this._dictGrid[ID];
            }
         }
         rows = this.list.listUIRef.getRows();
         iGridID = 0;
         for each(rowGrid in rows)
         {
            content = rowGrid.content;
            for each(propsGrid in content)
            {
               this._dictGrid[iGridID] = propsGrid;
               propsGrid.isOpen = true;
               propsGrid.alreadymc.visible = false;
               iGridID++;
            }
         }
      }
      
      public function showCardByPropsGrid(propsCard:PropsCard, iGridID:int) : Boolean
      {
         var propsGrid:PropsGrid = null;
         var isAdd:Boolean = false;
         propsGrid = this._dictGrid[iGridID] as PropsGrid;
         propsCard.scaleX = 1;
         propsCard.scaleY = 1;
         if(propsGrid != null && !propsGrid.isFull && propsGrid.isOpen)
         {
            propsCard.x = (propsGrid.width - propsCard.width) / 2;
            propsCard.y = (propsGrid.height - propsCard.height) / 2;
            propsGrid.addChild(propsCard);
            propsGrid.addChild(propsGrid.alreadymc);
            propsGrid.alreadymc.visible = propsCard.cardAttr.m_bIsEquip;
            propsCard.CardClickStatus = !propsCard.cardAttr.m_bIsClick;
            propsGrid.isFull = true;
            if(this.a_1235)
            {
               propsCard.addEventListener(MouseEvent.MOUSE_DOWN,this.onCardMouseDownEvent);
               propsCard.addEventListener(MouseEvent.DOUBLE_CLICK,this.onCardDoubleClickEvent);
            }
            if(this.getPropsCard(propsCard.cardAttr.ID) == null)
            {
               this._dataProvider.push(propsCard);
            }
            propsCard.cardAttr.CardPositionID = iGridID;
            isAdd = true;
         }
         return isAdd;
      }
      
      public function showPropsCard(propsCard:PropsCard, isOpen:Boolean = false) : Boolean
      {
         var m_isOpen:Boolean = false;
         var arrGridIDs:Array = null;
         var szIGridID:String = null;
         var size:int = 0;
         var index:int = 0;
         var propsGrid:PropsGrid = null;
         var isAdd:Boolean = false;
         if(this._dictGrid != null)
         {
            m_isOpen = true;
            arrGridIDs = [];
            for(szIGridID in this._dictGrid)
            {
               arrGridIDs.push(Number(szIGridID));
            }
            arrGridIDs.sort();
            for(size = int(arrGridIDs.length); index < size; )
            {
               propsGrid = this._dictGrid[index];
               if(!isOpen)
               {
                  m_isOpen = propsGrid.isOpen;
               }
               if(!propsGrid.isFull && m_isOpen)
               {
                  propsCard.scaleX = 1;
                  propsCard.scaleY = 1;
                  propsCard.x = (propsGrid.width - propsCard.width) / 2;
                  propsCard.y = (propsGrid.height - propsCard.height) / 2;
                  propsGrid.addChild(propsCard);
                  propsGrid.isFull = true;
                  if(this.getPropsCard(propsCard.cardAttr.ID) == null)
                  {
                     this._dataProvider.push(propsCard);
                  }
                  propsCard.cardAttr.CardPositionID = index;
                  isAdd = true;
                  if(this.a_1235)
                  {
                     propsCard.addEventListener(MouseEvent.MOUSE_DOWN,this.onCardMouseDownEvent);
                     propsCard.addEventListener(MouseEvent.DOUBLE_CLICK,this.onCardDoubleClickEvent);
                  }
                  break;
               }
               index++;
            }
         }
         return isAdd;
      }
      
      public function getAllPropsCard() : Array
      {
         return this._dataProvider;
      }
      
      public function getAllPropsCardAttrs() : Array
      {
         var card:PropsCard = null;
         var arrCardAttr:Array = [];
         for each(card in this._dataProvider)
         {
            arrCardAttr.push(card.cardAttr);
         }
         return arrCardAttr;
      }
      
      public function removeAllPropsCard() : void
      {
         var propsCard:PropsCard = null;
         var propsGrid:PropsGrid = null;
         if(this._dataProvider != null)
         {
            for each(propsCard in this._dataProvider)
            {
               if(null != propsCard && Boolean(propsCard.parent as PropsGrid))
               {
                  propsGrid = propsCard.parent as PropsGrid;
                  if(propsGrid != null)
                  {
                     if(propsGrid.isFull)
                     {
                        this.removeCardEvent(propsCard);
                        propsGrid.removeChild(propsCard);
                        propsGrid.isFull = false;
                     }
                  }
               }
            }
            while(this._dataProvider.length > 0)
            {
               trace("_dataProvider");
               this._dataProvider.splice(0);
            }
         }
      }
      
      public function removePropsCard(reomveCard:PropsCard) : Boolean
      {
         var index:int = 0;
         var propsCard:PropsCard = null;
         var iGridID:int = 0;
         var propsGrid:PropsGrid = null;
         var isRemove:Boolean = false;
         if(this._dataProvider != null)
         {
            index = 0;
            for each(propsCard in this._dataProvider)
            {
               iGridID = propsCard.cardAttr.CardPositionID;
               if(propsCard.cardAttr.ID == reomveCard.cardAttr.ID)
               {
                  propsGrid = this._dictGrid[iGridID] as PropsGrid;
                  if(propsGrid != null && propsGrid.isFull)
                  {
                     if(propsCard.parent)
                     {
                        propsCard.parent.removeChild(propsCard);
                     }
                     this.removeCardEvent(propsCard);
                     propsGrid.isFull = false;
                     isRemove = true;
                     this._dataProvider.splice(index,1);
                     break;
                  }
               }
               index++;
            }
         }
         return isRemove;
      }
      
      public function removePropsCardAttr(attr:a_3228) : void
      {
         var index:int = 0;
         var propsCard:PropsCard = null;
         var iGridID:int = 0;
         var cardAttr:a_3228 = null;
         var propsGrid:PropsGrid = null;
         if(this._dataProvider != null)
         {
            index = 0;
            for each(propsCard in this._dataProvider)
            {
               iGridID = propsCard.cardAttr.CardPositionID;
               cardAttr = propsCard.cardAttr;
               if(cardAttr.ID == attr.ID)
               {
                  cardAttr.CardCount -= attr.CardCount;
                  if(cardAttr.CardCount < 1)
                  {
                     propsGrid = this._dictGrid[iGridID] as PropsGrid;
                     if(propsGrid != null && propsGrid.isFull)
                     {
                        propsGrid.removeChild(propsCard);
                        this.removeCardEvent(propsCard);
                        propsGrid.isFull = false;
                        this._dataProvider.splice(index,1);
                     }
                  }
                  else
                  {
                     propsCard.showCardCount();
                  }
                  break;
               }
               index++;
            }
         }
      }
      
      public function addPropsCardAttr(attr:a_3228) : void
      {
         var index:int = 0;
         var propsCard:PropsCard = null;
         var iGridID:int = 0;
         var cardAttr:a_3228 = null;
         if(this._dataProvider != null)
         {
            index = 0;
            for each(propsCard in this._dataProvider)
            {
               iGridID = propsCard.cardAttr.CardPositionID;
               cardAttr = propsCard.cardAttr;
               if(cardAttr.ID == attr.ID)
               {
                  cardAttr.CardCount += attr.CardCount;
                  propsCard.showCardCount();
                  break;
               }
               index++;
            }
         }
      }
      
      public function getPropsCard(ID:String) : PropsCard
      {
         var propsCard:PropsCard = null;
         if(this._dataProvider != null)
         {
            for each(propsCard in this._dataProvider)
            {
               if(propsCard.cardAttr.ID == ID)
               {
                  break;
               }
               propsCard = null;
            }
         }
         return propsCard;
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
      
      public function showHeroAvatarEquip(arrPorpsCards:Array) : void
      {
         var grid:PropsGrid = null;
         var iClose:int = 0;
         var arrGridID:Array = null;
         var index:int = 0;
         var propsGrid:PropsGrid = null;
         var dSize:int = int(this._dataProvider.length);
         var iImageCount:int = int(arrPorpsCards.length);
         var iCount:int = dSize + iImageCount <= this.m_size ? iImageCount : int(this.m_size - dSize);
         iCount = iCount > 0 ? iCount : 0;
         for each(grid in this._dictGrid)
         {
            grid.showPropsGridBg(null);
         }
         iClose = 0;
         arrGridID = [];
         for(index = 0; index < this.m_size; index++)
         {
            propsGrid = this._dictGrid[index] as PropsGrid;
            if(iCount <= iClose)
            {
               break;
            }
            if(propsGrid != null && !propsGrid.isFull)
            {
               arrGridID.push(index);
               iClose++;
            }
         }
         this.showAvatarEquipImage(arrPorpsCards,arrGridID);
      }
      
      private function showAvatarEquipImage(arrPorpsCards:Array, arrGridID:Array) : void
      {
         var props:PropsCard = null;
         var attr:a_3228 = null;
         var iGridID:int = 0;
         var propsGrid:PropsGrid = null;
         var loader:AssetsLoader = null;
         var dictAttr:Dictionary = null;
         for each(props in arrPorpsCards)
         {
            if(props.Image == null || props.Image.bitmapData == null)
            {
               if(dictAttr == null)
               {
                  dictAttr = new Dictionary(true);
               }
               attr = props.cardAttr;
               dictAttr[attr.ID] = new AssetsItemData(attr.URL,AssetType.JPG,attr.ID);
            }
            else if(arrGridID.length > 0)
            {
               iGridID = arrGridID.shift();
               propsGrid = this._dictGrid[iGridID] as PropsGrid;
               propsGrid.showPropsGridBg(props.Image);
            }
         }
         if(dictAttr != null)
         {
            loader = new AssetsLoader();
            loader.load(dictAttr,{
               "onComplete":this.loaderAvatarImage,
               "onCompleteParms":[arrPorpsCards,arrGridID]
            });
         }
      }
      
      private function loaderAvatarImage(dict:Dictionary, arrPorpsCards:Array, arrGridID:Array) : void
      {
         var props:PropsCard = null;
         var attr:a_3228 = null;
         var iGridID:int = 0;
         var propsGrid:PropsGrid = null;
         for each(props in arrPorpsCards)
         {
            attr = props.cardAttr;
            if(dict[attr.ID] != null && dict[attr.ID].data != null)
            {
               if(arrGridID.length > 0)
               {
                  iGridID = arrGridID.shift();
                  propsGrid = this._dictGrid[iGridID] as PropsGrid;
                  propsGrid.showPropsGridBg(dict[attr.ID].data);
               }
            }
         }
      }
   }
}

