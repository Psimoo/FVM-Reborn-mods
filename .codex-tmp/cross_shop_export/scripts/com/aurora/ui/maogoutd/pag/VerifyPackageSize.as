package com.aurora.ui.maogoutd.pag
{
   import a_4716.a_1730;
   import a_4716.a_1739;
   import a_4752.GameStringManager;
   import a_4754.a_2155;
   import a_4754.a_2161;
   import com.aurora.ui.maogoutd.ClientLog.MessageTipHandler;
   import com.aurora.ui.maogoutd.component.a_3228;
   import com.aurora.ui.maogoutd.role.a_4463;
   import flash.utils.Dictionary;
   
   public class VerifyPackageSize
   {
      
      private static var instance:VerifyPackageSize;
      
      public function VerifyPackageSize()
      {
         super();
      }
      
      public static function getInstance() : VerifyPackageSize
      {
         if(instance == null)
         {
            instance = new VerifyPackageSize();
         }
         return instance;
      }
      
      public function init() : void
      {
         trace("VerifyPackageSize初始化....");
         trace(a_1739.enmPackage_PropsCountValidation);
      }
      
      public function checkAction(CardID:int, CardCount:* = 1) : Boolean
      {
         var fullType:int = -1;
         fullType = this.CheckCards(CardID,CardCount);
         if(fullType != a_1739.enmGame_DefaultID)
         {
            switch(fullType)
            {
               case a_1739.enmPackage_DefValidation:
                  MessageTipHandler.Get().a_3146(GameStringManager.getInstance().getString(132105));
                  break;
               case a_1739.enmPackage_HeroValidation:
                  MessageTipHandler.Get().a_3146(GameStringManager.getInstance().getString(132106));
                  break;
               case a_1739.enmPackage_PropsValidation:
                  MessageTipHandler.Get().a_3146(GameStringManager.getInstance().getString(132107));
                  break;
               case 4173:
                  MessageTipHandler.Get().a_3146(GameStringManager.getInstance().getString(132113));
            }
            return false;
         }
         return true;
      }
      
      public function CheckCards(CardID:int, CardCount:* = 1) : int
      {
         var attr:a_3228 = null;
         var i:int = 0;
         var heroAdd:a_3228 = null;
         var newAdd:a_3228 = null;
         var arrDefCards:Array = a_2161.e.GetCardsByType(a_1730.card_slot_package_game_card) as Array;
         var arrHeroCards:Array = a_2161.e.GetCardsByType(a_1730.card_slot_package_hero_item) as Array;
         var defSize:int = int(arrDefCards.length);
         var defPacageSize:int = a_2161.e.GetPackageOpenedNumByType(a_1730.card_slot_package_game_card) as int;
         var role:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         var heroSize:int = arrHeroCards.length + role.m_arrHeroItemID.length;
         var heroPackageSize:int = a_2161.e.GetPackageOpenedNumByType(a_1730.card_slot_package_hero_item) as int;
         var arrPropsCards:Array = a_2161.e.GetCardsByType(a_1730.card_slot_package_game_props) as Array;
         var propsSize:int = int(arrPropsCards.length);
         var propspackageSize:int = a_2161.e.GetPackageOpenedNumByType(a_1730.card_slot_package_game_props) as int;
         var dictPorpsCards:Dictionary = new Dictionary(true);
         for each(attr in arrPropsCards)
         {
            dictPorpsCards[attr.CardID] = attr;
         }
         for(i = 0; i < arrHeroCards.length; i++)
         {
            heroAdd = arrHeroCards[i];
            if((heroAdd.CardID & 0xFF000000) == 318767104 && (heroAdd.CardID & 0xFFF00000) != 331350016)
            {
               dictPorpsCards[heroAdd.CardID] = heroAdd;
            }
         }
         var ID:int = CardID & 0xFF000000;
         if(ID == 301989888 || ID == 318767104 && (CardID & 0xFFF00000) != 331350016)
         {
            if(dictPorpsCards[CardID] == null)
            {
               newAdd = new a_3228();
               newAdd.CardID = CardID;
               newAdd.CardCount = CardCount;
               dictPorpsCards[CardID] = newAdd;
               if(ID == 301989888)
               {
                  propsSize++;
               }
               else if(ID == 318767104 && (CardID & 0xFFF00000) != 331350016)
               {
                  heroSize++;
               }
            }
            else if(dictPorpsCards[CardID].CardCount + CardCount >= 32767)
            {
               trace(a_1739.enmPackage_PropsCountValidation);
               return 4173;
            }
         }
         if(ID == 285212672)
         {
            defSize++;
         }
         if(ID == 335544320 || (CardID & 0xFFF00000) == 331350016)
         {
            heroSize++;
         }
         if(defSize > defPacageSize)
         {
            return a_1739.enmPackage_DefValidation;
         }
         if(heroSize > heroPackageSize)
         {
            return a_1739.enmPackage_HeroValidation;
         }
         if(propsSize > propspackageSize)
         {
            return a_1739.enmPackage_PropsValidation;
         }
         return a_1739.enmGame_DefaultID;
      }
      
      public function checkCardList(arrInsertCards:Array) : Boolean
      {
         var fullType:int = -1;
         fullType = this.dealCards(arrInsertCards);
         if(fullType != a_1739.enmGame_DefaultID)
         {
            switch(fullType)
            {
               case a_1739.enmPackage_DefValidation:
                  MessageTipHandler.Get().a_3146(GameStringManager.getInstance().getString(132105));
                  break;
               case a_1739.enmPackage_HeroValidation:
                  MessageTipHandler.Get().a_3146(GameStringManager.getInstance().getString(132106));
                  break;
               case a_1739.enmPackage_PropsValidation:
                  MessageTipHandler.Get().a_3146(GameStringManager.getInstance().getString(132107));
                  break;
               case 4173:
                  MessageTipHandler.Get().a_3146(GameStringManager.getInstance().getString(132113));
            }
            return false;
         }
         return true;
      }
      
      public function dealCards(arrInsertCards:Array) : int
      {
         var attr:a_3228 = null;
         var i:int = 0;
         var data:Object = null;
         var heroAdd:a_3228 = null;
         var iCardID:int = 0;
         var ID:int = 0;
         var newAdd:a_3228 = null;
         var arrDefCards:Array = a_2161.e.GetCardsByType(a_1730.card_slot_package_game_card) as Array;
         var arrHeroCards:Array = a_2161.e.GetCardsByType(a_1730.card_slot_package_hero_item) as Array;
         var defSize:int = int(arrDefCards.length);
         var defPacageSize:int = a_2161.e.GetPackageOpenedNumByType(a_1730.card_slot_package_game_card) as int;
         var role:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         var heroSize:int = arrHeroCards.length + role.m_arrHeroItemID.length;
         var heroPackageSize:int = a_2161.e.GetPackageOpenedNumByType(a_1730.card_slot_package_hero_item) as int;
         var arrPropsCards:Array = a_2161.e.GetCardsByType(a_1730.card_slot_package_game_props) as Array;
         var propsSize:int = int(arrPropsCards.length);
         var propspackageSize:int = a_2161.e.GetPackageOpenedNumByType(a_1730.card_slot_package_game_props) as int;
         var dictPorpsCards:Dictionary = new Dictionary(true);
         for each(attr in arrPropsCards)
         {
            dictPorpsCards[attr.CardID] = attr;
         }
         for(i = 0; i < arrHeroCards.length; i++)
         {
            heroAdd = arrHeroCards[i];
            if((heroAdd.CardID & 0xFF000000) == 318767104 && (heroAdd.CardID & 0xFFF00000) != 331350016)
            {
               dictPorpsCards[heroAdd.CardID] = heroAdd;
            }
         }
         for each(data in arrInsertCards)
         {
            iCardID = int(data.m_iItemID);
            ID = iCardID & 0xFF000000;
            if(ID == 301989888 || ID == 318767104 && (iCardID & 0xFFF00000) != 331350016)
            {
               if(dictPorpsCards[iCardID] == null)
               {
                  newAdd = new a_3228();
                  newAdd.CardID = iCardID;
                  newAdd.CardCount = data.m_iNum;
                  dictPorpsCards[iCardID] = newAdd;
                  if(ID == 301989888)
                  {
                     propsSize++;
                  }
                  else if(ID == 318767104 && (iCardID & 0xFFF00000) != 331350016)
                  {
                     heroSize++;
                  }
               }
               else if(dictPorpsCards[iCardID].CardCount + data.m_iNum >= 32767)
               {
                  trace(a_1739.enmPackage_PropsCountValidation);
                  return 4173;
               }
            }
            if(ID == 285212672)
            {
               defSize++;
            }
            if(ID == 335544320 || (iCardID & 0xFFF00000) == 331350016)
            {
               heroSize++;
            }
         }
         if(defSize > defPacageSize)
         {
            return a_1739.enmPackage_DefValidation;
         }
         if(heroSize > heroPackageSize)
         {
            return a_1739.enmPackage_HeroValidation;
         }
         if(propsSize > propspackageSize)
         {
            return a_1739.enmPackage_PropsValidation;
         }
         return a_1739.enmGame_DefaultID;
      }
      
      public function dealGiftPackageAndCard(arrCards:Array) : int
      {
         var iCardID:int = 0;
         var ID:int = 0;
         var attr:Object = null;
         var arrItem:Array = null;
         var item:Object = null;
         var arrInsertCards:Array = [];
         var dictGoods:Dictionary = a_2155.e.GetStoreGoodsList() as Dictionary;
         var msgID:int = a_1739.enmGame_DefaultID;
         for each(iCardID in arrCards)
         {
            ID = iCardID & 0xFFF00000;
            if(ID == 771751936 || ID == 329252864)
            {
               attr = dictGoods[iCardID];
               if(attr == null)
               {
                  msgID = a_1739.enmPackage_GiftValidation;
                  break;
               }
               arrItem = attr.arrItems;
               for each(item in arrItem)
               {
                  arrInsertCards.push(item.itemCardID);
               }
            }
            else
            {
               arrInsertCards.push(iCardID);
            }
         }
         if(msgID == a_1739.enmGame_DefaultID)
         {
            msgID = this.dealCards(arrInsertCards);
         }
         return msgID;
      }
      
      public function dealGiftPackage(iGiftCardID:int) : int
      {
         var arrItem:Array = null;
         var arrInsertCards:Array = null;
         var item:Object = null;
         var msgID:int = a_1739.enmGame_DefaultID;
         var dictGoods:Dictionary = a_2155.e.GetStoreGoodsList() as Dictionary;
         var attr:Object = dictGoods[iGiftCardID];
         if(attr != null)
         {
            arrItem = attr.arrItems;
            arrInsertCards = [];
            for each(item in arrItem)
            {
               arrInsertCards.push(item.itemCardID);
            }
            msgID = this.dealCards(arrInsertCards);
         }
         else
         {
            msgID = a_1739.enmPackage_GiftValidation;
         }
         return msgID;
      }
   }
}

