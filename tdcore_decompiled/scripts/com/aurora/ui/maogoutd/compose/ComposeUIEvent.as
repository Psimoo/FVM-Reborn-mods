package com.aurora.ui.maogoutd.compose
{
   import flash.events.Event;
   
   public class ComposeUIEvent extends Event
   {
      
      public static const CARD_CLICK:String = "cardClick";
      
      public static const SHOW_TIP:String = "showTip";
      
      public static const SHOW_CARD_TIP:String = "showCardTip";
      
      public static const SHOW_DETAIL:String = "showDetail";
      
      public static const REQUEST_REMOVE_CARD:String = "requestRemoveCard";
      
      public static const REQUEST_ADD_CARD:String = "requestAddCard";
      
      public static const REQUEST_ADD_CRYSTAL:String = "requestAddCrystal";
      
      public static const REQUEST_BUY_CARD:String = "requestBuyCard";
      
      public static const REQUEST_CARD:String = "requestCard";
      
      public static const REQUEST_MAKE:String = "requestMake";
      
      public static const REQUEST_REMAKE:String = "requestRemake";
      
      public static const REQUEST_UPGRADE_CARD:String = "requestUpgradeCard";
      
      public static const REQUEST_SET_CARD_STATUS:String = "requestSetCardStatus";
      
      public static const REQUEST_TRANSFER_CARD:String = "requestTransferCard";
      
      public static const REQUEST_ADD_CHARM_CRYSTAL_RECIPE:String = "requestAddCharmCrystalRecipe";
      
      public static const REQUEST_ADD_CHARM_CRYSYAL:String = "requestAddCrystal";
      
      public static const REQUEST_REMOVE_CHARM_CRYSTAL:String = "requestRemoveCrystal";
      
      public static const SLOT_ITEM:String = "0x3A16";
      
      public static const ITEM_GEM_UNLOAD:String = "0x3A18";
      
      public static const ITEM_GEM_IN_LAY:String = "0x3A17";
      
      public static const ITEM_GEM_DECOMPOSE:String = "0x3A1A";
      
      public static const ITEM_GEM_UPGRADE:String = "0x3A19";
      
      public static const ASK_SLOT_ITEM:String = "askSlotItem";
      
      public static const ASK_GEM_UNLOAD:String = "askGenUnload";
      
      public static const ASK_NEED_COUNT:String = "askNeedCount";
      
      public var value:*;
      
      public function ComposeUIEvent(type:String, value:* = -1)
      {
         super(type);
         this.value = value;
      }
      
      override public function toString() : String
      {
         return super.toString() + " value=" + this.value;
      }
   }
}

