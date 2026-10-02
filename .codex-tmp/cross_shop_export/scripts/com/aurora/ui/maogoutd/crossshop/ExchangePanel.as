package com.aurora.ui.maogoutd.crossshop
{
   import a_4714.AssetType;
   import a_4714.AssetsItemData;
   import a_4714.AssetsLoader;
   import a_4716.a_1739;
   import a_4728.a_1778;
   import a_4729.EventType;
   import a_4729.a_1789;
   import a_4752.GameStringManager;
   import a_4754.a_2155;
   import a_4754.a_2161;
   import com.aurora.event.activity.ActivityEventManagerFactory;
   import com.aurora.event.activity.ActivityEventType;
   import com.aurora.ui.maogoutd.component.dialog.IDialog;
   import com.aurora.ui.maogoutd.crossshop.xml.ExchangeItemInfo;
   import com.aurora.ui.maogoutd.iface.ITDMessageTip;
   import com.aurora.ui.maogoutd.pag.VerifyPackageSize;
   import com.aurora.ui.maogoutd.pag.a_3886;
   import com.aurora.ui.maogoutd.role.a_4463;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol65")]
   public class ExchangePanel extends Sprite
   {
      
      public var m_spClassifyTabbar:ClassifyTabbar;
      
      public var m_spPager:Pager;
      
      public var m_vExchangeCard:Vector.<ExchangeCard>;
      
      public var m_vCardData:Vector.<ExchangeItemInfo>;
      
      public var m_stTDTipDialog:IDialog;
      
      public var m_stDealItem:ExchangeItemInfo;
      
      public var m_iMoneyType:int;
      
      public var m_iPage:int;
      
      public var m_iAllPage:int;
      
      public var m_stLoader:AssetsLoader;
      
      public var m_iExchangeID:int;
      
      public function ExchangePanel()
      {
         super();
         this.m_stLoader = new AssetsLoader();
         this.m_spClassifyTabbar = new ClassifyTabbar();
         this.m_spClassifyTabbar.x = 688;
         this.m_spClassifyTabbar.y = 90;
         addChild(this.m_spClassifyTabbar);
         this.m_spPager = new Pager();
         this.m_spPager.x = 405;
         this.m_spPager.y = 493;
         addChild(this.m_spPager);
         this.m_vExchangeCard = new Vector.<ExchangeCard>();
         for(var i:int = 0; i < 16; i++)
         {
            this.m_vExchangeCard.push(new ExchangeCard());
            this.m_vExchangeCard[i].x = 20 + 228 * int(i % 4);
            this.m_vExchangeCard[i].y = 118 + 92 * int(i / 4);
            addChild(this.m_vExchangeCard[i]);
         }
         this.m_spClassifyTabbar.allTab.addEventListener(MouseEvent.CLICK,this.onTabClick);
         this.m_spPager.prebtn.addEventListener(MouseEvent.CLICK,this.onPrePage);
         this.m_spPager.nextbtn.addEventListener(MouseEvent.CLICK,this.onNextPage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.cleanStage);
      }
      
      public function cleanStage(e:Event = null) : void
      {
         ActivityEventManagerFactory.getInstance().removeEventListener(ActivityEventType.GET_HOLIDAY_EXCHANGE_AWARD,this.onExchangeResponse);
         a_1789.getInstance().removeEventListener(EventType.DEAL_DARKCRYSTAL_EXCHANGE,this.onDealExchange);
      }
      
      public function init() : void
      {
         ActivityEventManagerFactory.getInstance().addEventListener(ActivityEventType.GET_HOLIDAY_EXCHANGE_AWARD,this.onExchangeResponse);
         a_1789.getInstance().addEventListener(EventType.DEAL_DARKCRYSTAL_EXCHANGE,this.onDealExchange);
         this.m_vCardData = ExchangeDataModel.getinstance().getShopData(this.m_iMoneyType,0);
         this.showTab(0);
         var role:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         a_2161.e.notify("onRequestGetHolidayExchangeInfo",role.m_iRoleUin);
      }
      
      public function onTabClick(e:MouseEvent = null) : void
      {
         this.m_vCardData = ExchangeDataModel.getinstance().getShopData(this.m_iMoneyType,0);
         this.showTab(0);
      }
      
      private function showTab(tabIndex:int) : void
      {
         this.m_spClassifyTabbar.setAllTab();
         this.m_iPage = 1;
         if(this.m_vCardData.length % 16 == 0)
         {
            this.m_iAllPage = this.m_vCardData.length / 16;
         }
         else
         {
            this.m_iAllPage = int(this.m_vCardData.length / 16) + 1;
         }
         this.showCurrentPage();
      }
      
      private function showCurrentPage() : void
      {
         var dictLoad:Dictionary = null;
         var index:int = 0;
         var id:int = 0;
         var url:String = null;
         var dictImage:Dictionary = ExchangeDataModel.getinstance().dictImage;
         this.m_spPager.m_textPage.text = this.m_iPage.toString() + "/" + this.m_iAllPage.toString();
         for(var i:int = 0; i < 16; i++)
         {
            index = (this.m_iPage - 1) * 16 + i;
            if(index >= this.m_vCardData.length)
            {
               this.m_vExchangeCard[i].visible = false;
            }
            else
            {
               id = this.m_vCardData[index].m_iItemID;
               if(dictImage[id] == null)
               {
                  url = this.getCardUrl(this.m_vCardData[index]);
                  if(dictLoad == null)
                  {
                     dictLoad = new Dictionary();
                  }
                  dictLoad[id] = new AssetsItemData(url,AssetType.PNG,id.toString());
               }
               this.m_vExchangeCard[i].visible = true;
               this.m_vExchangeCard[i].setCard(this.m_vCardData[index]);
            }
         }
         if(dictLoad != null)
         {
            this.m_stLoader.load(dictLoad,{"onComplete":this.onImageLoadComplete});
         }
      }
      
      public function updateCurrentPage() : void
      {
         var index:int = 0;
         this.m_spPager.m_textPage.text = this.m_iPage.toString() + "/" + this.m_iAllPage.toString();
         for(var i:int = 0; i < 16; i++)
         {
            index = (this.m_iPage - 1) * 16 + i;
            if(index >= this.m_vCardData.length)
            {
               this.m_vExchangeCard[i].visible = false;
            }
            else
            {
               this.m_vExchangeCard[i].visible = true;
               this.m_vExchangeCard[i].setCard(this.m_vCardData[index]);
            }
         }
      }
      
      public function onImageLoadComplete(dict:Dictionary) : void
      {
         var key:Object = null;
         var dictImage:Dictionary = ExchangeDataModel.getinstance().dictImage;
         for(key in dict)
         {
            dictImage[key] = dict[key];
         }
         this.updateCurrentPage();
      }
      
      public function getCardUrl(info:ExchangeItemInfo) : String
      {
         var imgID:int = info.m_iItemID + 268435456;
         return "images/2/" + info.m_iType.toString() + "/0x" + imgID.toString(16) + ".png";
      }
      
      private function onPrePage(e:MouseEvent) : void
      {
         if(this.m_iPage > 1)
         {
            --this.m_iPage;
            this.showCurrentPage();
         }
      }
      
      private function onNextPage(e:MouseEvent) : void
      {
         if(this.m_iPage < this.m_iAllPage)
         {
            ++this.m_iPage;
            this.showCurrentPage();
         }
      }
      
      private function onDealExchange(e:CrossShopEvent) : void
      {
         this.m_stDealItem = e.m_stInfoStruct;
         var arrBagCheckInfo:Array = [];
         if(this.m_stDealItem.m_iItemID >= 285212672 && this.m_stDealItem.m_iItemID < 301989888)
         {
            arrBagCheckInfo.push(285212672);
         }
         else if(this.m_stDealItem.m_iItemID >= 318767104 && this.m_stDealItem.m_iItemID < 335544320)
         {
            arrBagCheckInfo.push(318767104);
         }
         else if(this.m_stDealItem.m_iItemID >= 301989888 && this.m_stDealItem.m_iItemID < 318767104)
         {
            arrBagCheckInfo.push(301989888);
         }
         var fullType:Boolean = false;
         fullType = VerifyPackageSize.getInstance().checkAction(this.m_stDealItem.m_iItemID,1);
         if(!fullType)
         {
            return;
         }
         if(this.m_stTDTipDialog == null)
         {
            this.m_stTDTipDialog = a_2155.e.GetTipDialog() as IDialog;
         }
         this.m_iExchangeID = e.m_stInfoStruct.m_iID;
         var role:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         a_2161.e.notify("onRequestGetHolidayExchangeDiscountAward",role.m_iRoleUin,this.m_iExchangeID);
      }
      
      private function onExchangeResponse(e:a_1778) : void
      {
         var strMsg:String = null;
         var response:Object = e.dataObject;
         strMsg = "兑换成功";
         this.showTextTip(strMsg);
         var role:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         a_2161.e.notify("onRequestGetHolidayExchangeInfo",role.m_iRoleUin);
      }
      
      private function checkBag(arr:Array) : Boolean
      {
         var fullType:int = -1;
         fullType = a_3886.getInstance().dealCards(arr);
         if(fullType != a_1739.enmGame_DefaultID)
         {
            switch(fullType)
            {
               case a_1739.enmPackage_DefValidation:
                  this.showTextTip(GameStringManager.getInstance().getString(132105));
                  break;
               case a_1739.enmPackage_HeroValidation:
                  this.showTextTip(GameStringManager.getInstance().getString(132106));
                  break;
               case a_1739.enmPackage_PropsValidation:
                  this.showTextTip(GameStringManager.getInstance().getString(132107));
            }
            return false;
         }
         return true;
      }
      
      private function showTextTip(msg:String) : void
      {
         var tempMsg:String = null;
         if(!msg)
         {
            return;
         }
         var textTip:ITDMessageTip = a_2155.e.GetMessageTip() as ITDMessageTip;
         if(msg.length > 12)
         {
            tempMsg = msg;
            msg = tempMsg.substr(0,12) + "<br>" + tempMsg.substr(12);
         }
         textTip.showTextTip(stage,msg,new Rectangle(250,300,0,0));
      }
   }
}

