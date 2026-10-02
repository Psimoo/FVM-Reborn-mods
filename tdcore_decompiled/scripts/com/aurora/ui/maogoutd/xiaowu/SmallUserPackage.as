package com.aurora.ui.maogoutd.xiaowu
{
   import a_4754.a_2161;
   import com.aurora.protocol.hallserver.CSmallRoomItemVO;
   import com.aurora.ui.maogoutd.component.a_3228;
   import com.aurora.ui.maogoutd.exchange.FragmentNumber;
   import com.aurora.ui.maogoutd.xiaowu.tabButton.TabdefCardBtn;
   import com.aurora.ui.maogoutd.xiaowu.tabButton.TabfurnitureBtn;
   import com.aurora.ui.maogoutd.xiaowu.tabButton.TabthemeBtn;
   import com.aurora.ui.maogoutd.xiaowu.tabButton.TabwallBtn;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.Dictionary;
   
   public class SmallUserPackage extends Sprite
   {
      
      public var closePackageBtn:SimpleButton;
      
      public var furnitureBtn:TabfurnitureBtn;
      
      public var wallBtn:TabwallBtn;
      
      public var themeBtn:TabthemeBtn;
      
      public var defCardBtn:TabdefCardBtn;
      
      public var furniturePackage:ThemePackage;
      
      public var wallPackage:ThemePackage;
      
      public var themePackage:ThemePackage;
      
      public var defCardPackage:ThemePackage;
      
      private var m_ishowfurniture:Boolean;
      
      private var m_ishowWall:Boolean;
      
      private var m_ishowTheme:Boolean;
      
      private var m_ishowDef:Boolean;
      
      public var packageMC:MovieClip;
      
      private const PACKAGE_SIZE:int = 200;
      
      public var m_stCharmValueText:FragmentNumber;
      
      public var deletedic:Dictionary;
      
      public function SmallUserPackage()
      {
         super();
         this.addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStageEvent);
         this.addEventListener(MouseEvent.CLICK,this.onMouseClickEvent);
      }
      
      private function onAddedToStageEvent(a_4730:Event) : void
      {
         if(this.furniturePackage == null)
         {
            this.furniturePackage = new ThemePackage();
            addChild(this.furniturePackage);
            this.furniturePackage.showCardPackage(this.packageMC);
            this.furniturePackage.dataProvice = SmallRoomConfig.Get().m_roomVec;
         }
         if(this.wallPackage == null)
         {
            this.wallPackage = new ThemePackage();
            addChild(this.wallPackage);
            this.wallPackage.showCardPackage(this.packageMC);
            this.wallPackage.dataProvice = SmallRoomConfig.Get().m_wallVec;
         }
         if(this.themePackage == null)
         {
            this.themePackage = new ThemePackage();
            addChild(this.themePackage);
            this.themePackage.showCardPackage(this.packageMC);
            this.themePackage.dataProvice = SmallRoomConfig.Get().m_themeVec;
         }
         if(this.defCardPackage == null)
         {
            this.defCardPackage = new ThemePackage();
            addChild(this.defCardPackage);
            this.defCardPackage.showCardPackage(this.packageMC);
            this.defCardPackage.dataProvice = SmallRoomConfig.Get().m_FoodVec;
         }
         if(this.packageMC != null && this.contains(this.packageMC))
         {
            this.removeChild(this.packageMC);
            this.packageMC = null;
         }
         this.m_stCharmValueText = new FragmentNumber();
         this.m_stCharmValueText.x = 478;
         this.m_stCharmValueText.y = 21;
         this.UpdateCharmValue();
         addChild(this.m_stCharmValueText);
         this.showTabIndex(1);
         this.onShowFurniturePackage();
      }
      
      private function showTabIndex(index:int) : void
      {
         this.furnitureBtn.Click = index == 1 ? true : false;
         this.wallBtn.Click = index == 2 ? true : false;
         this.themeBtn.Click = index == 3 ? true : false;
         this.defCardBtn.Click = index == 4 ? true : false;
      }
      
      private function onMouseClickEvent(a_4730:MouseEvent) : void
      {
         if(a_4730.target.name == "furnitureBtn")
         {
            if(!this.m_ishowfurniture)
            {
               this.onShowFurniturePackage();
               this.showTabIndex(1);
            }
         }
         else if(a_4730.target.name == "wallBtn")
         {
            if(!this.m_ishowWall)
            {
               this.onShowWallPackage();
               this.showTabIndex(2);
            }
         }
         else if(a_4730.target.name == "themeBtn")
         {
            if(!this.m_ishowTheme)
            {
               this.onShowThemePackage();
               this.showTabIndex(3);
            }
         }
         else if(a_4730.target.name == "defCardBtn")
         {
            if(!this.m_ishowDef)
            {
               this.onShowDefCardPackage();
               this.showTabIndex(4);
            }
         }
      }
      
      private function onShowDefCardPackage() : void
      {
         this.m_ishowDef = true;
         this.m_ishowWall = false;
         this.m_ishowTheme = false;
         this.m_ishowfurniture = false;
         this.defCardPackage.visible = true;
         this.themePackage.visible = false;
         this.furniturePackage.visible = false;
         this.wallPackage.visible = false;
         this.defCardPackage.showCurrentPage();
      }
      
      public function onShowThemePackage() : void
      {
         this.m_ishowDef = false;
         this.m_ishowWall = false;
         this.m_ishowTheme = true;
         this.m_ishowfurniture = false;
         this.defCardPackage.visible = false;
         this.themePackage.visible = true;
         this.furniturePackage.visible = false;
         this.wallPackage.visible = false;
         this.themePackage.showCurrentPage();
      }
      
      public function onShowWallPackage() : void
      {
         this.m_ishowDef = false;
         this.m_ishowWall = true;
         this.m_ishowTheme = false;
         this.m_ishowfurniture = false;
         this.defCardPackage.visible = false;
         this.themePackage.visible = false;
         this.furniturePackage.visible = false;
         this.wallPackage.visible = true;
         this.wallPackage.showCurrentPage();
      }
      
      public function onShowFurniturePackage() : void
      {
         this.m_ishowDef = false;
         this.m_ishowWall = false;
         this.m_ishowTheme = false;
         this.m_ishowfurniture = true;
         this.defCardPackage.visible = false;
         this.themePackage.visible = false;
         this.furniturePackage.visible = true;
         this.wallPackage.visible = false;
         this.furniturePackage.showCurrentPage();
      }
      
      public function onPutDownBack(m_ItemType:int, m_ItemID:int, bool:Boolean = true) : void
      {
         var vo:CSmallRoomItemVO = null;
         if(bool)
         {
            delete this.deletedic[m_ItemID];
         }
         else
         {
            vo = new CSmallRoomItemVO();
            vo.m_iID = m_ItemID;
            vo.m_iTypeID = m_ItemType;
            vo.m_iDirection = 0;
            this.deletedic[m_ItemID] = vo;
         }
         switch(m_ItemType)
         {
            case 1:
               this.furniturePackage.onPutDownBack(m_ItemID,bool);
               break;
            case 2:
               this.wallPackage.onPutDownBack(m_ItemID,bool);
               break;
            case 3:
               this.themePackage.onPutDownBack(m_ItemID,bool);
               break;
            case 4:
               this.defCardPackage.onPutDownBack(m_ItemID,bool);
         }
      }
      
      public function onBuyBack(m_ItemType:int, m_ItemID:int) : void
      {
         switch(m_ItemType)
         {
            case 1:
               this.furniturePackage.onBuyBack(m_ItemID);
               break;
            case 2:
               this.wallPackage.onBuyBack(m_ItemID);
               break;
            case 3:
               this.themePackage.onBuyBack(m_ItemID);
               break;
            case 4:
               this.defCardPackage.onBuyBack(m_ItemID);
         }
      }
      
      public function UpdateCharmValue() : void
      {
         var propsCards:Array = null;
         var card:a_3228 = null;
         var a_1684:Array = a_2161.e.GetTDCardsInfo() as Array;
         var count:int = 0;
         if(a_1684 != null && a_1684.length > 0)
         {
            propsCards = a_1684[1];
            for each(card in propsCards)
            {
               if(card.CardID == 308332304)
               {
                  count += card.CardCount;
               }
            }
         }
         this.m_stCharmValueText.setnumber(count);
      }
   }
}

