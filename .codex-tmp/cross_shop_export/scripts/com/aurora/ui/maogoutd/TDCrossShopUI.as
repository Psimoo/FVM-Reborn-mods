package com.aurora.ui.maogoutd
{
   import a_4728.a_1778;
   import a_4754.a_2161;
   import com.aurora.event.activity.ActivityEventManagerFactory;
   import com.aurora.event.activity.ActivityEventType;
   import com.aurora.ui.maogoutd.PayAward.HolidayExchangeXML;
   import com.aurora.ui.maogoutd.PayAward.RechargeActivityConfig;
   import com.aurora.ui.maogoutd.crossshop.ExchangeMoneyShow;
   import com.aurora.ui.maogoutd.crossshop.ExchangePanel;
   import com.aurora.ui.maogoutd.crossshop.ExchangeTabbar;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   [SWF(width="950", height="600", backgroundColor="#ffffff", frameRate="24")]
   public class TDCrossShopUI extends Sprite
   {
      
      public var m_ClosCrossServerShopBtn:SimpleButton;
      
      public var smallFragment:Sprite;
      
      public var m_spTabbar:ExchangeTabbar;
      
      public var m_spExchangePanel:ExchangePanel;
      
      public var m_Exchangebg:MovieClip;
      
      public var m_MoneyCuSp:ExchangeMoneyShow;
      
      public var m_MoneyAgSp:ExchangeMoneyShow;
      
      public var m_MoneyAuSp:ExchangeMoneyShow;
      
      public var stExchangeXML:HolidayExchangeXML;
      
      private var m_iCuPieceID:int = 308326400;
      
      private var m_iAgPieceID:int = 308326416;
      
      private var m_iAuPieceID:int = 308326432;
      
      public var m_iDarkCoin:int;
      
      public function TDCrossShopUI()
      {
         super();
         this.stExchangeXML = RechargeActivityConfig.GetInstance().GetHolidayExchangeXML();
         this.m_spExchangePanel = new ExchangePanel();
         this.m_spExchangePanel.x = 0;
         this.m_spExchangePanel.y = 0;
         addChild(this.m_spExchangePanel);
         this.m_spTabbar = new ExchangeTabbar();
         this.m_spTabbar.x = 12;
         this.m_spTabbar.y = 57;
         addChild(this.m_spTabbar);
         setChildIndex(this.m_MoneyCuSp,numChildren - 1);
         setChildIndex(this.m_MoneyAgSp,numChildren - 1);
         setChildIndex(this.m_MoneyAuSp,numChildren - 1);
         this.m_spTabbar.chitongTab.buttonMode = true;
         this.m_spTabbar.baiyinTab.buttonMode = true;
         this.m_spTabbar.huangjinTab.buttonMode = true;
         this.m_spTabbar.zongheTab.buttonMode = true;
         this.m_spTabbar.chitongTab.addEventListener(MouseEvent.CLICK,this.onChitongTab);
         this.m_spTabbar.baiyinTab.addEventListener(MouseEvent.CLICK,this.onBaiyinTab);
         this.m_spTabbar.huangjinTab.addEventListener(MouseEvent.CLICK,this.onHuangjinTab);
         this.m_spTabbar.zongheTab.addEventListener(MouseEvent.CLICK,this.onZongheTab);
         addEventListener(Event.ADDED_TO_STAGE,this.onAddToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRmStage);
      }
      
      private function onChitongTab(a_4730:MouseEvent = null) : void
      {
         this.m_spTabbar.setChitong();
         this.m_spExchangePanel.m_iMoneyType = this.m_iCuPieceID;
         this.m_spExchangePanel.onTabClick();
      }
      
      private function onBaiyinTab(a_4730:MouseEvent = null) : void
      {
         this.m_spTabbar.setBaiyin();
         this.m_spExchangePanel.m_iMoneyType = this.m_iAgPieceID;
         this.m_spExchangePanel.onTabClick();
      }
      
      private function onHuangjinTab(a_4730:MouseEvent = null) : void
      {
         this.m_spTabbar.setHuangjin();
         this.m_spExchangePanel.m_iMoneyType = this.m_iAuPieceID;
         this.m_spExchangePanel.onTabClick();
      }
      
      private function onZongheTab(a_4730:MouseEvent = null) : void
      {
         this.m_spTabbar.setZonghe();
         this.m_spExchangePanel.m_iMoneyType = this.m_iCuPieceID;
         this.m_spExchangePanel.onTabClick();
      }
      
      protected function onRmStage(e:Event) : void
      {
         ActivityEventManagerFactory.getInstance().removeEventListener(ActivityEventType.GET_HOLIDAY_EXCHANGE_INFO,this.setNum);
      }
      
      protected function onAddToStage(e:Event) : void
      {
         this.onChitongTab();
         this.m_spTabbar.zongheTab.visible = false;
         this.m_MoneyCuSp.setMoneyType(1);
         this.m_MoneyAgSp.setMoneyType(2);
         this.m_MoneyAuSp.setMoneyType(3);
         this.m_Exchangebg.visible = false;
         this.showExchangePanel();
         this.m_spExchangePanel.init();
         ActivityEventManagerFactory.getInstance().addEventListener(ActivityEventType.GET_HOLIDAY_EXCHANGE_INFO,this.setNum);
      }
      
      public function setNum(e:a_1778 = null) : void
      {
         var CurCards:Object = a_2161.e.GetTDCardsInfo();
         var iCuNum:int = 0;
         var iAgNum:int = 0;
         var iAuNum:int = 0;
         for(var l:int = 0; l < CurCards[1].length; l++)
         {
            iCuNum += CurCards[1][l].CardID == this.m_iCuPieceID ? CurCards[1][l].CardCount : 0;
            iAgNum += CurCards[1][l].CardID == this.m_iAgPieceID ? CurCards[1][l].CardCount : 0;
            iAuNum += CurCards[1][l].CardID == this.m_iAuPieceID ? CurCards[1][l].CardCount : 0;
         }
         this.m_MoneyCuSp.setNumber(iCuNum);
         this.m_MoneyAgSp.setNumber(iAgNum);
         this.m_MoneyAuSp.setNumber(iAuNum);
      }
      
      private function showExchangePanel() : void
      {
         this.m_spExchangePanel.visible = true;
         this.setNum();
      }
   }
}

