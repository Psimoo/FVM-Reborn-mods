package com.aurora.ui.maogoutd.pag
{
   import a_4716.a_1730;
   import a_4716.a_1739;
   import a_4754.a_2155;
   import a_4754.a_2161;
   import com.aurora.ui.maogoutd.component.a_3228;
   import com.aurora.ui.maogoutd.role.a_4463;
   import flash.utils.Dictionary;
   
   public class a_3886
   {
      
      private static var instance:a_3886;
      
      public function a_3886()
      {
         super();
      }
      
      public static function getInstance() : a_3886
      {
         if(instance == null)
         {
            instance = new a_3886();
         }
         return instance;
      }
      
      public function dealCards(arrInsertCards:Array) : int
      {
         var iFFCardID:int = 0;
         var arrDefCards:Array = null;
         var arrHeroCards:Array = null;
         var defSize:int = 0;
         var defPacageSize:int = 0;
         var attr:a_3228 = null;
         var iCardID:int = 0;
         var IDFF:int = 0;
         var ID:int = 0;
         var def:Boolean = false;
         var hero:Boolean = false;
         var props:Boolean = false;
         for each(iFFCardID in arrInsertCards)
         {
            IDFF = iFFCardID & 0xFF000000;
            if(IDFF == 285212672)
            {
               def = true;
            }
            if(IDFF == 318767104 || IDFF == 335544320)
            {
               hero = true;
            }
            if(IDFF == 301989888)
            {
               props = true;
            }
         }
         arrDefCards = a_2161.e.GetCardsByType(a_1730.card_slot_package_game_card) as Array;
         arrHeroCards = a_2161.e.GetCardsByType(a_1730.card_slot_package_hero_item) as Array;
         defSize = int(arrDefCards.length);
         defPacageSize = a_2161.e.GetPackageOpenedNumByType(a_1730.card_slot_package_game_card) as int;
         if(defSize >= defPacageSize && def)
         {
            return a_1739.enmPackage_DefValidation;
         }
         var role:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         var heroSize:int = arrHeroCards.length + role.m_arrHeroItemID.length;
         var heroPackageSize:int = a_2161.e.GetPackageOpenedNumByType(a_1730.card_slot_package_hero_item) as int;
         if(heroSize >= heroPackageSize && hero)
         {
            return a_1739.enmPackage_HeroValidation;
         }
         var dictPorpsCards:Dictionary = new Dictionary(true);
         var arrPropsCards:Array = a_2161.e.GetCardsByType(a_1730.card_slot_package_game_props) as Array;
         var propsSize:int = int(arrPropsCards.length);
         var propspackageSize:int = a_2161.e.GetPackageOpenedNumByType(a_1730.card_slot_package_game_props) as int;
         for each(attr in arrPropsCards)
         {
            dictPorpsCards[attr.CardID] = attr.CardID;
         }
         for each(iCardID in arrInsertCards)
         {
            ID = iCardID & 0xFF000000;
            if(ID == 301989888 && dictPorpsCards[iCardID] == null)
            {
               propsSize++;
            }
            if(ID == 285212672)
            {
               defSize++;
            }
            if(ID == 318767104 || ID == 335544320)
            {
               heroSize++;
            }
         }
         if(defSize > defPacageSize && def)
         {
            return a_1739.enmPackage_DefValidation;
         }
         if(heroSize > heroPackageSize && hero)
         {
            return a_1739.enmPackage_HeroValidation;
         }
         if(propsSize > propspackageSize && props)
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

