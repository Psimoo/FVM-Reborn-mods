package com.aurora.ui.maogoutd.recipes
{
   import a_4716.a_1730;
   import a_4754.a_2161;
   import com.aurora.ui.maogoutd.component.a_3228;
   import com.aurora.ui.maogoutd.pag.CryAdditionXML;
   import com.aurora.ui.maogoutd.recipes.datatype.MenuConfigStruct;
   import com.aurora.ui.maogoutd.recipes.datatype.RecipesAttrStruct;
   import com.aurora.ui.maogoutd.recipes.datatype.RecipesComposeStruct;
   import com.aurora.ui.maogoutd.recipes.datatype.RecipesMenuListItemStruct;
   import com.aurora.ui.maogoutd.recipes.datatype.RecipesOpenRuleStruct;
   import com.aurora.ui.maogoutd.recipes.datatype.RecipesPostCardInfo;
   import com.aurora.ui.maogoutd.recipes.datatype.RecipesStructAvtiveResponse;
   import com.aurora.ui.maogoutd.recipes.datatype.RecipesStructComposeResponse;
   import com.aurora.ui.maogoutd.recipes.datatype.RecipesStructGetInfoResponse;
   import com.aurora.ui.maogoutd.recipes.datatype.RecipesStructPlayerInfo;
   import com.aurora.ui.maogoutd.role.a_4461;
   import com.aurora.ui.maogoutd.role.a_4463;
   import flash.utils.Dictionary;
   
   public class RecipesData
   {
      
      private static var g_RecipesData:RecipesData = new RecipesData();
      
      public var m_aryRecipesConfig:Array;
      
      public var m_aryOpenRule:Array;
      
      public var m_stRecipesInfo:RecipesStructGetInfoResponse;
      
      public var m_iActiveNum:int;
      
      public var m_iToRecipesNum:int;
      
      private var m_RecipesFood:Object;
      
      private var role:a_4463;
      
      public function RecipesData()
      {
         super();
         if(g_RecipesData)
         {
            return;
         }
      }
      
      public static function GetInstance() : RecipesData
      {
         return g_RecipesData;
      }
      
      public function SetProcInstance(recipesFood:Object) : void
      {
         this.m_RecipesFood = recipesFood;
      }
      
      public function SetRecipesConfig(aryRecipesConfig:Array, aryOpenRule:Array, iToRecipesNum:int) : void
      {
         var arySelectCards:Array = null;
         var enterRoom:Object = null;
         this.m_aryRecipesConfig = aryRecipesConfig;
         this.m_aryOpenRule = aryOpenRule;
         this.m_iToRecipesNum = iToRecipesNum;
         if(this.m_stRecipesInfo)
         {
            arySelectCards = this.CombRecipesAttrCard();
            enterRoom = a_2161.e.getEnterRoom();
            if(!enterRoom.m_arrSelectCards)
            {
               enterRoom.m_arrSelectCards = [];
            }
            enterRoom.m_arrSelectCards[0] = [];
            enterRoom.m_arrSelectCards[5] = arySelectCards;
            if(Boolean(this.m_RecipesFood) && Boolean(this.m_RecipesFood.m_Instance.visible))
            {
               this.m_RecipesFood.ComposeRecipesList();
               this.UpdataRecipesNumInfo();
               this.CombData();
            }
         }
      }
      
      public function GetPlayerRecipesInfo(stRecipesInfo:RecipesStructGetInfoResponse) : void
      {
         var arySelectCards:Array = null;
         var enterRoom:Object = null;
         this.m_stRecipesInfo = stRecipesInfo;
         if(this.m_aryRecipesConfig)
         {
            arySelectCards = this.CombRecipesAttrCard();
            enterRoom = a_2161.e.getEnterRoom();
            if(!enterRoom.m_arrSelectCards)
            {
               enterRoom.m_arrSelectCards = [];
            }
            enterRoom.m_arrSelectCards[0] = [];
            enterRoom.m_arrSelectCards[5] = arySelectCards;
            if(Boolean(this.m_RecipesFood) && Boolean(this.m_RecipesFood.m_Instance.visible))
            {
               this.m_RecipesFood.ComposeRecipesList();
               this.UpdataRecipesNumInfo();
               this.CombData();
            }
         }
      }
      
      public function RecipesCompose(stRecipesCompose:RecipesStructComposeResponse) : void
      {
         var aryPlayerRecipesInfo:Array = this.m_stRecipesInfo.m_aryRecipesInfo;
         var stRecipes:RecipesStructPlayerInfo = new RecipesStructPlayerInfo();
         stRecipes.m_iRecipesId = stRecipesCompose.m_iCookeryID;
         stRecipes.m_iStatus = RecipesMenuListItemStruct.RECIPES_LISTITEM_OPEN;
         this.m_stRecipesInfo.m_aryRecipesInfo.push(stRecipes);
         this.CombData();
         this.UpdataRecipesNumInfo();
         this.m_RecipesFood.SetBoxBtnStatus();
      }
      
      public function RecipesActive(stRecipesActive:RecipesStructAvtiveResponse) : void
      {
         var stRecipes:RecipesStructPlayerInfo = null;
         var aryPlayerRecipesInfo:Array = this.m_stRecipesInfo.m_aryRecipesInfo;
         for(var i:int = 0; i < aryPlayerRecipesInfo.length; i++)
         {
            stRecipes = aryPlayerRecipesInfo[i];
            if(stRecipes.m_iRecipesId == stRecipesActive.m_iCookeryID)
            {
               stRecipes.m_iStatus = stRecipesActive.m_iStatus;
               break;
            }
         }
         var arySelectCards:Array = this.CombRecipesAttrCard();
         var enterRoom:Object = a_2161.e.getEnterRoom();
         if(!enterRoom.m_arrSelectCards)
         {
            enterRoom.m_arrSelectCards = [];
         }
         enterRoom.m_arrSelectCards[0] = [];
         enterRoom.m_arrSelectCards[5] = arySelectCards;
         this.UpdataRecipesNumInfo();
         this.CombData();
      }
      
      public function SetAddEffect() : void
      {
         var arySelectCards:Array = this.CombRecipesAttrCard();
         var enterRoom:Object = a_2161.e.getEnterRoom();
         if(!enterRoom.m_arrSelectCards)
         {
            enterRoom.m_arrSelectCards = [];
         }
         enterRoom.m_arrSelectCards[0] = [];
         enterRoom.m_arrSelectCards[5] = arySelectCards;
      }
      
      public function ShowMsgTip(msg:String) : void
      {
         this.m_RecipesFood.ShowMsgTip(msg);
      }
      
      private function CombData() : void
      {
         var stMenuConfig:MenuConfigStruct = null;
         var stHaveRecipes:RecipesStructPlayerInfo = null;
         var bCompsoe:Boolean = false;
         var stRecipesData:RecipesMenuListItemStruct = null;
         var j:int = 0;
         var k:int = 0;
         var aryHaveCard:Array = null;
         var cardHave:a_3228 = null;
         var cardNeed:RecipesComposeStruct = null;
         var t:int = 0;
         this.m_iActiveNum = 0;
         var aryPlayerRecipesInfo:Array = this.m_stRecipesInfo.m_aryRecipesInfo;
         for(var i:int = 0; i < this.m_aryRecipesConfig.length; i++)
         {
            stMenuConfig = this.m_aryRecipesConfig[i];
            for(j = 0; j < stMenuConfig.m_aryListItem.length; j++)
            {
               bCompsoe = false;
               stRecipesData = stMenuConfig.m_aryListItem[j];
               stRecipesData.m_CuProgress = 0;
               stRecipesData.m_iStatus = RecipesMenuListItemStruct.RECIPES_LISTITEM_CLOSE;
               for(k = 0; k < aryPlayerRecipesInfo.length; k++)
               {
                  stHaveRecipes = aryPlayerRecipesInfo[k];
                  if(stRecipesData.m_iRecipesId == stHaveRecipes.m_iRecipesId)
                  {
                     stRecipesData.m_iStatus = stHaveRecipes.m_iStatus;
                     stRecipesData.m_CuProgress = stRecipesData.m_ToProgress;
                     bCompsoe = true;
                     if(RecipesMenuListItemStruct.RECIPES_LISTITEM_ACTIVE == stRecipesData.m_iStatus)
                     {
                        ++this.m_iActiveNum;
                     }
                     break;
                  }
               }
               if(!bCompsoe)
               {
                  aryHaveCard = a_2161.e.GetCardsByType(a_1730.card_slot_package_game_card) as Array;
                  for(t = 0; t < stRecipesData.m_aryCompose.length; t++)
                  {
                     cardNeed = stRecipesData.m_aryCompose[t];
                     for(k = 0; k < aryHaveCard.length; k++)
                     {
                        cardHave = aryHaveCard[k];
                        if(cardNeed.m_iCardId == cardHave.CardID && cardNeed.m_iCardStar <= cardHave.TypeValue)
                        {
                           ++stRecipesData.m_CuProgress;
                           break;
                        }
                     }
                  }
               }
            }
         }
         this.m_RecipesFood.UpdataRecipesListData();
      }
      
      private function CombRecipesAttrCard() : Array
      {
         var aryListItem:Array = null;
         var stRecipesInfo:RecipesMenuListItemStruct = null;
         var stMenuConfig:MenuConfigStruct = null;
         var heroItem:a_4461 = null;
         var activeInfo:RecipesStructPlayerInfo = null;
         var stPostInfo:RecipesPostCardInfo = null;
         var j:int = 0;
         var k:int = 0;
         var l:int = 0;
         var recipesPostInfo:RecipesPostCardInfo = null;
         var recipesAttrStruct:RecipesAttrStruct = null;
         var m:int = 0;
         var arySelectCards:Array = [];
         if(!this.m_stRecipesInfo || !this.m_stRecipesInfo.m_aryRecipesInfo)
         {
            return arySelectCards;
         }
         var aryActiveRecipesInfo:Array = this.m_stRecipesInfo.m_aryRecipesInfo;
         var aryRecipesConfig:Array = RecipesConfig.GetInstance().GetRecipesConfig();
         for(var i:int = 0; i < aryActiveRecipesInfo.length; i++)
         {
            activeInfo = aryActiveRecipesInfo[i];
            if(RecipesMenuListItemStruct.RECIPES_LISTITEM_ACTIVE == activeInfo.m_iStatus)
            {
               stPostInfo = new RecipesPostCardInfo();
               stPostInfo.m_iRecipesId = activeInfo.m_iRecipesId;
               for(j = 0; j < aryRecipesConfig.length; j++)
               {
                  stMenuConfig = aryRecipesConfig[j];
                  aryListItem = stMenuConfig.m_aryListItem;
                  for(k = 0; k < aryListItem.length; )
                  {
                     stRecipesInfo = aryListItem[k];
                     if(stRecipesInfo.m_iRecipesId == stPostInfo.m_iRecipesId)
                     {
                        stPostInfo.m_aryAttrInfo = stRecipesInfo.m_aryAttr;
                        break;
                     }
                     k++;
                  }
                  if(k < aryListItem.length)
                  {
                     break;
                  }
               }
               arySelectCards.push(stPostInfo);
            }
         }
         var role:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         var limit:int = 0;
         var size:int = int(arySelectCards.length);
         for each(heroItem in role.m_arrHeroItemID)
         {
            if((heroItem.m_iItemID & 0xFFF00000) == 344981504)
            {
               for(l = 0; l < CryAdditionXML.Get().m_vLevelConfigs.length; l++)
               {
                  if(heroItem.m_iItemID == CryAdditionXML.Get().m_vLevelConfigs[l].m_iCryID)
                  {
                     recipesPostInfo = new RecipesPostCardInfo();
                     recipesPostInfo.m_aryAttrInfo = new Array();
                     recipesAttrStruct = new RecipesAttrStruct();
                     recipesAttrStruct.m_iAttrType = this.getAddType(CryAdditionXML.Get().m_vLevelConfigs[l].m_iType);
                     recipesAttrStruct.m_aryCardId = this.getAddCard(CryAdditionXML.Get().m_vLevelConfigs[l].m_iType);
                     if(heroItem.m_arrExtraAttr == null)
                     {
                        recipesAttrStruct.m_iValue = CryAdditionXML.Get().m_vLevelConfigs[l].m_iAddition[0];
                     }
                     else
                     {
                        for(m = 0; m < heroItem.m_arrExtraAttr.length; m++)
                        {
                           if(heroItem.m_arrExtraAttr[m].m_cItemType == 10)
                           {
                              recipesAttrStruct.m_iValue = CryAdditionXML.Get().m_vLevelConfigs[l].m_iAddition[heroItem.m_arrExtraAttr[m].m_iItemAdd];
                              break;
                           }
                        }
                     }
                     limit += 1;
                     recipesPostInfo.m_iRecipesId = 0;
                     recipesPostInfo.m_aryAttrInfo.push(recipesAttrStruct);
                     arySelectCards.push(recipesPostInfo);
                  }
               }
            }
         }
         if(arySelectCards.length - size > 24)
         {
            while(arySelectCards.length > 0)
            {
               arySelectCards.pop();
            }
         }
         return arySelectCards;
      }
      
      private function UpdataRecipesNumInfo() : void
      {
         var stRecipesPlayerInfo:RecipesStructPlayerInfo = null;
         var openRule:RecipesOpenRuleStruct = null;
         var aryRecipesInfo:Array = this.m_stRecipesInfo.m_aryRecipesInfo;
         var iActive:int = 0;
         for(var i:int = 0; i < aryRecipesInfo.length; i++)
         {
            stRecipesPlayerInfo = aryRecipesInfo[i];
            if(RecipesMenuListItemStruct.RECIPES_LISTITEM_ACTIVE == stRecipesPlayerInfo.m_iStatus)
            {
               iActive++;
            }
         }
         var iMax:int = 0;
         for(i = 0; i < this.m_aryOpenRule.length; i++)
         {
            openRule = this.m_aryOpenRule[i];
            if(this.m_stRecipesInfo.m_iValue >= openRule.m_iFoodPoint)
            {
               iMax = iMax < openRule.m_iMaxOpen ? openRule.m_iMaxOpen : iMax;
            }
         }
         this.m_RecipesFood.UpdataPoint(this.m_stRecipesInfo.m_iValue,iActive,iMax);
      }
      
      private function getAddType(iRecipesInfo:int) : int
      {
         var reType:int = 1;
         if(iRecipesInfo >= 1 && iRecipesInfo <= 3 || iRecipesInfo == 19 || iRecipesInfo == 42 || iRecipesInfo == 35 || iRecipesInfo == 32)
         {
            reType = 11;
         }
         else
         {
            reType = 3;
         }
         return reType;
      }
      
      private function getAddCard(iRecipesInfo:int) : Array
      {
         var reAddArray:* = new Array();
         reAddArray = [];
         if(iRecipesInfo == 1)
         {
            reAddArray.push("0x11110014");
            reAddArray.push("0x1111001e");
            reAddArray.push("0x1111001f");
         }
         else if(iRecipesInfo == 2)
         {
            reAddArray.push("0x11930040");
            reAddArray.push("0x1193004e");
            reAddArray.push("0x1193004f");
         }
         else if(iRecipesInfo == 3)
         {
            reAddArray.push("0x11111024");
            reAddArray.push("0x1111102e");
            reAddArray.push("0x1111102f");
         }
         else if(iRecipesInfo == 4)
         {
            reAddArray.push("0x111300b0");
            reAddArray.push("0x111300be");
            reAddArray.push("0x111300bf");
         }
         else if(iRecipesInfo == 5)
         {
            reAddArray.push("0x11130140");
            reAddArray.push("0x1113014e");
            reAddArray.push("0x1113014f");
         }
         else if(iRecipesInfo == 6)
         {
            reAddArray.push("0x111300a0");
            reAddArray.push("0x111300ae");
            reAddArray.push("0x111300af");
         }
         else if(iRecipesInfo == 7)
         {
            reAddArray.push("0x11930020");
            reAddArray.push("0x1193002e");
            reAddArray.push("0x1193002f");
         }
         else if(iRecipesInfo == 8)
         {
            reAddArray.push("0x11130094");
            reAddArray.push("0x1113002e");
            reAddArray.push("0x1113002f");
         }
         else if(iRecipesInfo == 9)
         {
            reAddArray.push("0x11930060");
            reAddArray.push("0x1193006e");
            reAddArray.push("0x1193006f");
         }
         else if(iRecipesInfo == 10)
         {
            reAddArray.push("0x11130060");
            reAddArray.push("0x1113006e");
            reAddArray.push("0x1113006f");
         }
         else if(iRecipesInfo == 11)
         {
            reAddArray.push("0x11930010");
            reAddArray.push("0x1193001e");
            reAddArray.push("0x1193001f");
         }
         else if(iRecipesInfo == 12)
         {
            reAddArray.push("0x11430030");
            reAddArray.push("0x1113004e");
            reAddArray.push("0x1113005f");
         }
         else if(iRecipesInfo == 13)
         {
            reAddArray.push("0x11130280");
            reAddArray.push("0x1113028e");
            reAddArray.push("0x1113028f");
         }
         else if(iRecipesInfo == 14)
         {
            reAddArray.push("0x11930030");
            reAddArray.push("0x1193003e");
            reAddArray.push("0x1193003f");
         }
         else if(iRecipesInfo == 15)
         {
            reAddArray.push("0x11931060");
            reAddArray.push("0x1193106e");
            reAddArray.push("0x1193106f");
         }
         else if(iRecipesInfo == 16)
         {
            reAddArray.push("0x11130240");
            reAddArray.push("0x1113024e");
            reAddArray.push("0x1113024f");
         }
         else if(iRecipesInfo == 17)
         {
            reAddArray.push("0x11130250");
            reAddArray.push("0x1113025e");
            reAddArray.push("0x1113025f");
         }
         else if(iRecipesInfo == 18)
         {
            reAddArray.push("0x11130260");
            reAddArray.push("0x1113026e");
            reAddArray.push("0x1113026f");
         }
         else if(iRecipesInfo == 19)
         {
            reAddArray.push("0x11110054");
            reAddArray.push("0x11110064");
            reAddArray.push("0x1111005f");
         }
         else if(iRecipesInfo == 20)
         {
            reAddArray.push("0x111300e4");
            reAddArray.push("0x111300ee");
            reAddArray.push("0x111300ef");
         }
         else if(iRecipesInfo == 21)
         {
            reAddArray.push("0x111300c4");
            reAddArray.push("0x111300d4");
            reAddArray.push("0x111300cf");
         }
         else if(iRecipesInfo == 22)
         {
            reAddArray.push("0x11130074");
            reAddArray.push("0x1113007e");
            reAddArray.push("0x1113000f");
         }
         else if(iRecipesInfo == 23)
         {
            reAddArray.push("0x11130064");
            reAddArray.push("0x111300de");
            reAddArray.push("0x111300df");
         }
         else if(iRecipesInfo == 24)
         {
            reAddArray.push("0x11930074");
            reAddArray.push("0x1193007e");
            reAddArray.push("0x1193007f");
         }
         else if(iRecipesInfo == 25)
         {
            reAddArray.push("0x111300a4");
            reAddArray.push("0x111300ce");
         }
         else if(iRecipesInfo == 26)
         {
            reAddArray.push("0x11930090");
            reAddArray.push("0x1193009e");
            reAddArray.push("0x1193009f");
         }
         else if(iRecipesInfo == 27)
         {
            reAddArray.push("0x11120334");
            reAddArray.push("0x1112033e");
            reAddArray.push("0x1112033f");
         }
         else if(iRecipesInfo == 28)
         {
            reAddArray.push("0x113903d4");
            reAddArray.push("0x113903de");
            reAddArray.push("0x113903df");
         }
         else if(iRecipesInfo == 29)
         {
            reAddArray.push("0x11130304");
            reAddArray.push("0x1113030e");
            reAddArray.push("0x1113030f");
         }
         else if(iRecipesInfo == 30)
         {
            reAddArray.push("0x111303c4");
            reAddArray.push("0x111303ce");
            reAddArray.push("0x111303cf");
         }
         else if(iRecipesInfo == 31)
         {
            reAddArray.push("0x11130364");
            reAddArray.push("0x1113036e");
            reAddArray.push("0x1113036f");
         }
         else if(iRecipesInfo == 32)
         {
            reAddArray.push("0x11110354");
            reAddArray.push("0x1111035e");
            reAddArray.push("0x1111035f");
         }
         else if(iRecipesInfo == 33)
         {
            reAddArray.push("0x111303e4");
            reAddArray.push("0x111303ee");
            reAddArray.push("0x111303ef");
         }
         else if(iRecipesInfo == 34)
         {
            reAddArray.push("0x111303a4");
            reAddArray.push("0x111303ae");
            reAddArray.push("0x111303af");
         }
         else if(iRecipesInfo == 35)
         {
            reAddArray.push("0x11111324");
            reAddArray.push("0x1111132e");
            reAddArray.push("0x1111132f");
         }
         else if(iRecipesInfo == 36)
         {
            reAddArray.push("0x11930374");
            reAddArray.push("0x1193037e");
            reAddArray.push("0x1193037f");
         }
         else if(iRecipesInfo == 37)
         {
            reAddArray.push("0x1113000a");
            reAddArray.push("0x1113000b");
            reAddArray.push("0x1113000c");
            reAddArray.push("0x1113000d");
         }
         else if(iRecipesInfo == 38)
         {
            reAddArray.push("0x111300ea");
            reAddArray.push("0x111300eb");
            reAddArray.push("0x111300ec");
            reAddArray.push("0x111300ed");
         }
         else if(iRecipesInfo == 39)
         {
            reAddArray.push("0x111300ca");
            reAddArray.push("0x111300cb");
            reAddArray.push("0x111300cc");
            reAddArray.push("0x111300cd");
         }
         else if(iRecipesInfo == 40)
         {
            reAddArray.push("0x1193007a");
            reAddArray.push("0x1193007b");
            reAddArray.push("0x1193007c");
         }
         else if(iRecipesInfo == 41)
         {
            reAddArray.push("0x111300da");
            reAddArray.push("0x111300db");
            reAddArray.push("0x111300dc");
            reAddArray.push("0x111300dd");
         }
         else if(iRecipesInfo == 42)
         {
            reAddArray.push("0x1111005a");
            reAddArray.push("0x1111005b");
            reAddArray.push("0x1111005c");
         }
         else if(iRecipesInfo == 43)
         {
            reAddArray.push("0x1193009a");
            reAddArray.push("0x1193009b");
            reAddArray.push("0x1193009c");
         }
         else if(iRecipesInfo == 44)
         {
            reAddArray.push("0x1124002a");
            reAddArray.push("0x1124002b");
            reAddArray.push("0x1124002c");
         }
         else if(iRecipesInfo == 45)
         {
            reAddArray.push("0x111302a4");
            reAddArray.push("0x111302ae");
            reAddArray.push("0x111302af");
         }
         else if(iRecipesInfo == 46)
         {
            reAddArray.push("0x11110024");
            reAddArray.push("0x1111002e");
            reAddArray.push("0x1111002f");
         }
         else if(iRecipesInfo == 47)
         {
            reAddArray.push("0x11130114");
            reAddArray.push("0x1113011e");
            reAddArray.push("0x1113011f");
         }
         else if(iRecipesInfo == 48)
         {
            reAddArray.push("0x11130104");
            reAddArray.push("0x1113010e");
            reAddArray.push("0x1113010f");
         }
         else if(iRecipesInfo == 49)
         {
            reAddArray.push("0x11130124");
            reAddArray.push("0x1113012e");
            reAddArray.push("0x1113012f");
         }
         else if(iRecipesInfo == 50)
         {
            reAddArray.push("0x11430034");
            reAddArray.push("0x1143003e");
            reAddArray.push("0x1143003f");
         }
         else if(iRecipesInfo == 51)
         {
            reAddArray.push("0x11130164");
            reAddArray.push("0x1113016e");
            reAddArray.push("0x1113016f");
         }
         else if(iRecipesInfo == 52)
         {
            reAddArray.push("0x111301a0");
            reAddArray.push("0x111301ae");
            reAddArray.push("0x111301af");
         }
         else if(iRecipesInfo == 53)
         {
            reAddArray.push("0x11130200");
            reAddArray.push("0x1113020e");
            reAddArray.push("0x1113020f");
         }
         else if(iRecipesInfo == 54)
         {
            reAddArray.push("0x111310a0");
            reAddArray.push("0x111310ae");
            reAddArray.push("0x111310af");
         }
         else if(iRecipesInfo == 55)
         {
            reAddArray.push("0x11120090");
            reAddArray.push("0x1112009e");
            reAddArray.push("0x1112009f");
         }
         else if(iRecipesInfo == 56)
         {
            reAddArray.push("0x11120100");
            reAddArray.push("0x1112010e");
            reAddArray.push("0x1112010f");
         }
         else if(iRecipesInfo == 57)
         {
            reAddArray.push("0x11120120");
            reAddArray.push("0x1112012e");
            reAddArray.push("0x1112012f");
         }
         else if(iRecipesInfo == 58)
         {
            reAddArray.push("0x11120130");
            reAddArray.push("0x1112013e");
            reAddArray.push("0x1112013f");
         }
         else if(iRecipesInfo == 59)
         {
            reAddArray.push("0x11120150");
            reAddArray.push("0x1112015e");
            reAddArray.push("0x1112015f");
         }
         else if(iRecipesInfo == 60)
         {
            reAddArray.push("0x11131140");
            reAddArray.push("0x1113114e");
            reAddArray.push("0x1113114f");
         }
         else if(iRecipesInfo == 61)
         {
            reAddArray.push("0x1113120a");
            reAddArray.push("0x1113120b");
            reAddArray.push("0x1113120c");
         }
         else if(iRecipesInfo == 62)
         {
            reAddArray.push("0x11132200");
            reAddArray.push("0x1113220e");
            reAddArray.push("0x1113220f");
         }
         else if(iRecipesInfo == 63)
         {
            reAddArray.push("0x11132140");
            reAddArray.push("0x1113214e");
            reAddArray.push("0x1113214f");
         }
         else if(iRecipesInfo == 64)
         {
            reAddArray.push("0x111311a0");
            reAddArray.push("0x111311ae");
            reAddArray.push("0x111311af");
         }
         else if(iRecipesInfo == 65)
         {
            reAddArray.push("0x11120190");
            reAddArray.push("0x1112019e");
            reAddArray.push("0x1112019f");
         }
         else if(iRecipesInfo == 66)
         {
            reAddArray.push("0x11120210");
            reAddArray.push("0x1112021e");
            reAddArray.push("0x1112021f");
         }
         else if(iRecipesInfo == 67)
         {
            reAddArray.push("0x1112012a");
            reAddArray.push("0x1112012b");
            reAddArray.push("0x1112012c");
         }
         else if(iRecipesInfo == 68)
         {
            reAddArray.push("0x1112041a");
            reAddArray.push("0x1112041b");
            reAddArray.push("0x1112041c");
         }
         else if(iRecipesInfo == 69)
         {
            reAddArray.push("0x1112090a");
            reAddArray.push("0x1112090b");
            reAddArray.push("0x1112090c");
         }
         trace("结晶配置完毕!！!");
         return reAddArray;
      }
      
      private function TestInit() : void
      {
         var stuRecipesType:MenuConfigStruct = null;
         var aryRecipes:Array = null;
         var id:int = 0;
         var xmlRecipesInfo:RecipesMenuListItemStruct = null;
         var aryCompose:Array = null;
         var aryAttr:Array = null;
         var recipesAttr:RecipesAttrStruct = null;
         var recipesComp:RecipesComposeStruct = null;
         var openRule:RecipesOpenRuleStruct = null;
         var j:int = 0;
         this.m_aryRecipesConfig = [];
         var dictType:Dictionary = new Dictionary();
         for(var i:int = 0; i < 3; i++)
         {
            stuRecipesType = new MenuConfigStruct();
            id = i;
            stuRecipesType.m_MenuId = id;
            aryRecipes = [];
            dictType[id] = aryRecipes;
            stuRecipesType.m_aryListItem = aryRecipes;
            this.m_aryRecipesConfig.push(stuRecipesType);
         }
         for(i = 0; i < 3; i++)
         {
            aryAttr = [];
            aryCompose = [];
            xmlRecipesInfo = new RecipesMenuListItemStruct();
            xmlRecipesInfo.m_iSortId = 0;
            xmlRecipesInfo.m_szRecipesId = "0x0" + i + "000001";
            id = parseInt(xmlRecipesInfo.m_szRecipesId);
            xmlRecipesInfo.m_iRecipesId = id;
            id = id >> 24 & 0xFF;
            xmlRecipesInfo.m_iValue = 100;
            xmlRecipesInfo.m_szRecipesName = "测试" + i;
            xmlRecipesInfo.m_szRecipesDesc = "描述" + i;
            xmlRecipesInfo.m_aryAttr = aryAttr;
            xmlRecipesInfo.m_aryCompose = aryCompose;
            xmlRecipesInfo.m_iStatus = i + 1;
            xmlRecipesInfo.m_iValue = 10 * i;
            aryRecipes = dictType[id];
            aryRecipes.push(xmlRecipesInfo);
            xmlRecipesInfo.m_CuProgress = 1;
            for(j = 0; j < 3; j++)
            {
               recipesAttr = new RecipesAttrStruct();
               recipesAttr.m_iAttrType = j;
               recipesAttr.m_iValue = i * 10;
               aryAttr.push(recipesAttr);
            }
            recipesComp = new RecipesComposeStruct();
            recipesComp.m_iCardId = 286457888;
            recipesComp.m_iCardStar = 5;
            aryCompose.push(recipesComp);
            recipesComp = new RecipesComposeStruct();
            recipesComp.m_iCardId = 286457888;
            recipesComp.m_iCardStar = 5;
            aryCompose.push(recipesComp);
            xmlRecipesInfo.m_ToProgress = 2;
            if(2 == i)
            {
               xmlRecipesInfo.m_ToProgress = 3;
               recipesComp = new RecipesComposeStruct();
               recipesComp.m_iCardId = 286457888;
               recipesComp.m_iCardStar = 5;
               aryCompose.push(recipesComp);
            }
         }
         if(!this.m_aryOpenRule)
         {
            this.m_aryOpenRule = [];
         }
         for(i = 0; i < 10; i++)
         {
            openRule = new RecipesOpenRuleStruct();
            openRule.m_iFoodPoint = i * 10;
            openRule.m_iMaxOpen = 2;
            this.m_aryOpenRule.push(openRule);
         }
      }
   }
}

