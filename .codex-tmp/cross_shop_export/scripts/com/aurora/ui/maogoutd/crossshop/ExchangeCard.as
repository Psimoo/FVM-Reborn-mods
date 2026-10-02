package com.aurora.ui.maogoutd.crossshop
{
   import a_4729.EventType;
   import a_4729.a_1789;
   import a_4752.a_2027;
   import com.aurora.ui.maogoutd.crossshop.xml.ExchangeItemInfo;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol40")]
   public class ExchangeCard extends Sprite
   {
      
      public var exchangecardbtn:SimpleButton;
      
      public var textName:TextField;
      
      public var textFragment:TextField;
      
      public var m_spImage:ExchangeCardImage;
      
      public var m_MoneyIconMc:MovieClip;
      
      public var a_862:ExchangeItemInfo;
      
      public function ExchangeCard()
      {
         super();
         this.m_spImage = new ExchangeCardImage();
         this.m_spImage.x = 0;
         this.m_spImage.y = 0;
         addChild(this.m_spImage);
         this.exchangecardbtn.addEventListener(MouseEvent.CLICK,this.onExchangeCardClicked);
      }
      
      protected function onExchangeCardClicked(e:MouseEvent) : void
      {
         var dataEvent:CrossShopEvent = null;
         if(this.a_862)
         {
            dataEvent = new CrossShopEvent(EventType.DEAL_DARKCRYSTAL_EXCHANGE);
            dataEvent.m_stInfoStruct = this.a_862;
            a_1789.getInstance().dispatchEvent(dataEvent);
         }
      }
      
      public function setCard(cardinfo:ExchangeItemInfo) : void
      {
         var iFrame:int = 1;
         if(cardinfo.m_iNeedItemID == 308326400)
         {
            iFrame = 1;
         }
         else if(cardinfo.m_iNeedItemID == 308326416)
         {
            iFrame = 2;
         }
         else if(cardinfo.m_iNeedItemID == 308326432)
         {
            iFrame = 3;
         }
         this.m_MoneyIconMc.gotoAndStop(iFrame);
         this.a_862 = cardinfo;
         this.textName.text = a_2027.getInstance().m_dictDesc[this.a_862.m_iItemID].Name;
         this.textFragment.htmlText = "<b>消耗" + this.a_862.m_iNeedNum.toString() + "个</b>";
         this.m_spImage.setImage(cardinfo,a_2027.getInstance().m_dictDesc[this.a_862.m_iItemID].Use);
      }
   }
}

