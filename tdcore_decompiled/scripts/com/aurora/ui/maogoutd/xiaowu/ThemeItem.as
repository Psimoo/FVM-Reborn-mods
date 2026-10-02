package com.aurora.ui.maogoutd.xiaowu
{
   import a_4728.a_1778;
   import a_4729.a_1789;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class ThemeItem extends Sprite
   {
      
      public var m_itemName:TextField;
      
      public var m_itemBtn:SimpleButton;
      
      public var m_putInbtn:SimpleButton;
      
      public var m_Alreadybtn:SimpleButton;
      
      public var m_Buybtn:BuyBtn;
      
      public var mc_rightIcon:MovieClip;
      
      public var mc_SmileIcon:MovieClip;
      
      private var m_stDataInfo:ItemConfigVO;
      
      public var m_spImage:ItemCardImage;
      
      public var m_itemIcon:MovieClip;
      
      public function ThemeItem()
      {
         super();
         this.mc_rightIcon.visible = false;
         this.mc_SmileIcon.visible = false;
         this.m_spImage = new ItemCardImage();
         this.m_itemIcon.addChild(this.m_spImage);
         this.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      protected function onClick(a_4730:MouseEvent) : void
      {
         var dataEvent:a_1778 = null;
         switch(a_4730.target)
         {
            case this.m_Buybtn:
               dataEvent = new a_1778("ActionBuy");
               dataEvent.dataObject = this.m_stDataInfo;
               break;
            case this.m_putInbtn:
               dataEvent = new a_1778("ActionPutDown");
               dataEvent.dataObject = this.m_stDataInfo;
         }
         if(dataEvent != null)
         {
            a_1789.getInstance().dispatchEvent(dataEvent);
         }
      }
      
      public function setCard(info:ItemConfigVO) : void
      {
         this.m_stDataInfo = info;
         if(info.m_ItemType == 4)
         {
            this.m_itemIcon.x = 8;
         }
         else
         {
            this.m_itemIcon.x = 0;
         }
         this.m_Buybtn.visible = info.m_buyState;
         this.m_Buybtn.setLabel(info.m_iItemCost.toString());
         this.m_Alreadybtn.visible = info.m_putState;
         if(!info.m_buyState && !info.m_putState)
         {
            this.m_putInbtn.visible = true;
         }
         else
         {
            this.m_putInbtn.visible = false;
         }
         this.m_itemName.text = info.m_iItemName;
         this.m_spImage.setImage(info);
      }
   }
}

