package com.aurora.ui.maogoutd.handbook.controller
{
   import a_4716.a_1730;
   import a_4729.EventType;
   import a_4729.a_1789;
   import a_4731.CommonEvent;
   import a_4752.GameStringManager;
   import a_4752.a_2027;
   import a_4752.a_2041;
   import a_4754.a_2161;
   import a_4781.Tool;
   import a_4789.a_4657;
   import com.aurora.protocol.hallserver.handbook.CResponseHandbookLightOrReceiveInfo;
   import com.aurora.protocol.hallserver.handbook.CResponseHandbookTypeInfo;
   import com.aurora.protocol.hallserver.handbook.HandbookActiveCard;
   import com.aurora.protocol.hallserver.handbook.HandbookCollectCard;
   import com.aurora.protocol.hallserver.handbook.HandbookCollectProgress;
   import com.aurora.ui.maogoutd.ClientLog.MessageTipHandler;
   import com.aurora.ui.maogoutd.component.a_3228;
   import com.aurora.ui.maogoutd.component.a_3286;
   import com.aurora.ui.maogoutd.handbook.model.CardHandbookData;
   import com.aurora.ui.maogoutd.handbook.model.HandbookConfigData;
   import com.aurora.ui.maogoutd.handbook.model.HandbookCookeryData;
   import com.aurora.ui.maogoutd.handbook.model.HandbookMenuNodeData;
   import com.aurora.ui.maogoutd.handbook.model.SuitHandbookData;
   import com.aurora.ui.maogoutd.handbook.model.TDHandbookConst;
   import com.aurora.ui.maogoutd.handbook.model.vo.HandbookCollectProgressVo;
   import com.aurora.ui.maogoutd.handbook.model.vo.HandbookItemVo;
   import com.aurora.ui.maogoutd.pag.CryAdditionXML;
   import com.aurora.ui.maogoutd.pag.CrystalLevelAdditionConfig;
   import com.aurora.ui.maogoutd.pag.RecipeItem;
   import com.aurora.ui.maogoutd.pag.RecipeXMLParser;
   import com.aurora.ui.maogoutd.pag.StorageRoom.StorageBagConfig;
   import com.aurora.ui.maogoutd.pag.StorageRoom.StorageBagVO;
   import com.aurora.ui.maogoutd.recipes.RecipesData;
   import com.aurora.ui.maogoutd.recipes.datatype.RecipesAttrStruct;
   import com.aurora.ui.maogoutd.recipes.datatype.RecipesPostCardInfo;
   import com.aurora.ui.maogoutd.role.a_4461;
   import com.aurora.ui.maogoutd.role.a_4463;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   
   public class HandbookController
   {
      
      private static var m_pInstance:HandbookController;
      
      private var loginInitDataDic:Dictionary;
      
      public var handbookConfigData:HandbookConfigData;
      
      public var role:a_4463;
      
      private var onUpdateServerDataFun:Function;
      
      private var m_iLookUin:int = -1;
      
      private var m_sLookName:String = "";
      
      private var m_iSex:int = -1;
      
      private var m_iLookPlatform:int;
      
      private var m_iLookGroup:int;
      
      private var m_bInitHandbookCfg:Boolean;
      
      private var m_dicCardToCrystoneDic:Dictionary;
      
      private var m_dicHandbookConf:Dictionary;
      
      private var m_dicHandbookSuitConf:Dictionary;
      
      private var m_dicHandbookCookerConf:Dictionary;
      
      private var m_dicHookbookActiveOrCanActiveCard:Dictionary;
      
      private var m_dicPackageAndStoreCard:Dictionary;
      
      private var m_dicServerHasActiveCardMySelf:Dictionary;
      
      private var m_dicServerProgressSelf:Dictionary;
      
      private var m_dicServerHasActiveCardOther:Dictionary;
      
      private var m_dicServerProgressOther:Dictionary;
      
      private var m_dicHaveRecipes:Dictionary;
      
      private var flyEffectGlobalPt:Point;
      
      public function HandbookController()
      {
         super();
         this.m_dicCardToCrystoneDic = null;
         this.m_bInitHandbookCfg = false;
         this.m_dicHaveRecipes = new Dictionary();
         this.m_dicServerHasActiveCardMySelf = new Dictionary();
         this.m_dicServerProgressSelf = new Dictionary();
         this.m_dicServerHasActiveCardOther = new Dictionary();
         this.m_dicServerProgressOther = new Dictionary();
         this.m_dicPackageAndStoreCard = new Dictionary();
         this.m_dicHookbookActiveOrCanActiveCard = new Dictionary();
         this.m_dicHandbookConf = new Dictionary();
         this.m_dicHandbookSuitConf = new Dictionary();
         this.m_dicHandbookCookerConf = new Dictionary();
         this.handbookConfigData = HandbookConfigData.Get();
      }
      
      public static function Get() : HandbookController
      {
         if(!m_pInstance)
         {
            m_pInstance = new HandbookController();
         }
         return m_pInstance;
      }
      
      public function InitEvent() : void
      {
         a_4657.getInstance().addListener(this);
         a_1789.getInstance().addEventListener(EventType.LOOK_USER_HANDBOOK,this.onLookUserHandbook);
         a_1789.getInstance().addEventListener(EventType.HANDBOOK_GET_TYPE_DATA,this.onResponseGetTypeData);
         a_1789.getInstance().addEventListener(EventType.HANDBOOK_LIGHT_OR_RECEIVE,this.onResponseLightOrReceiveData);
      }
      
      public function init() : void
      {
         var recipesAry:Array = null;
         var k:int = 0;
         var sKey:String = null;
         var isSelf:Boolean = this.getIsSelf();
         if(isSelf)
         {
            recipesAry = RecipesData.GetInstance().m_stRecipesInfo.m_aryRecipesInfo;
            for(k = 0; k < recipesAry.length; k++)
            {
               if(recipesAry[k].m_iRecipesId > 0)
               {
                  this.m_dicHaveRecipes[recipesAry[k].m_iRecipesId] = recipesAry[k].m_iStatus;
               }
            }
            this.inheritAllLine();
         }
         else
         {
            for(sKey in this.m_dicHaveRecipes)
            {
               delete this.m_dicHaveRecipes[sKey];
            }
         }
      }
      
      public function setBackcallFun(onUpdateServerData:Function) : void
      {
         this.onUpdateServerDataFun = onUpdateServerData;
      }
      
      private function initConfigToDic() : void
      {
         var i:int = 0;
         var itemConf:CardHandbookData = null;
         var suitConf:SuitHandbookData = null;
         var cookerConf:HandbookCookeryData = null;
         for(i = 0; i < this.handbookConfigData.m_vCardHandbook.length; i++)
         {
            itemConf = this.handbookConfigData.m_vCardHandbook[i];
            this.m_dicHandbookConf[itemConf.iItemID] = itemConf;
         }
         for(i = 0; i < this.handbookConfigData.m_vSuitHandbook.length; i++)
         {
            suitConf = this.handbookConfigData.m_vSuitHandbook[i];
            this.m_dicHandbookSuitConf[suitConf.iItemID] = suitConf;
         }
         for(i = 0; i < this.handbookConfigData.m_vCookeryHandbook.length; i++)
         {
            cookerConf = this.handbookConfigData.m_vCookeryHandbook[i];
            this.m_dicHandbookCookerConf[cookerConf.iDishID] = cookerConf;
         }
      }
      
      public function onSetPlayersCommonData(dict:Dictionary) : void
      {
         var lookRole:Object = null;
         var role:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         if(role.m_iRoleUin != this.m_iLookUin && this.m_iLookUin > 0)
         {
            if(dict.hasOwnProperty(this.m_iLookUin))
            {
               lookRole = dict[this.m_iLookUin];
               if(this.m_iSex == 0)
               {
                  this.m_iSex = lookRole.m_iUserSex;
               }
            }
         }
      }
      
      private function onLookUserHandbook(evt:CommonEvent) : void
      {
         var role:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         var param:Object = evt.Data;
         var isSelf:Boolean = param.roleUin == role.m_iRoleUin;
         var isOtherRole:Boolean = false;
         if(!isSelf)
         {
            if(this.m_iLookUin != param.roleUin)
            {
               this.clearOtherData();
            }
            isOtherRole = true;
         }
         this.m_iLookUin = param.roleUin;
         this.m_sLookName = param.roleName;
         if(param.sex > 0)
         {
            this.m_iSex = param.sex;
         }
         else
         {
            this.m_iSex = isSelf ? role.m_iUserSex : 0;
         }
         this.m_iLookPlatform = param.rolePlat;
         this.m_iLookGroup = param.roleGroup;
         if(isOtherRole)
         {
            this.requestHandbookTypeData(role.m_iRoleUin,-1,this.m_iLookPlatform,this.m_iLookGroup,this.m_iLookUin);
         }
      }
      
      private function clearOtherData() : void
      {
         var key:String = null;
         for(key in this.m_dicServerHasActiveCardOther)
         {
            delete this.m_dicServerHasActiveCardOther[key];
         }
         for(key in this.m_dicServerProgressOther)
         {
            delete this.m_dicServerProgressOther[key];
         }
      }
      
      public function clear(flag:Boolean) : void
      {
         var key:String = null;
         if(flag)
         {
            this.m_iLookUin = 0;
            this.m_iSex = -1;
            this.m_iLookPlatform = 0;
            this.m_iLookGroup = 0;
            this.m_sLookName = "";
            this.clearOtherData();
         }
         for(key in this.m_dicCardToCrystoneDic)
         {
            delete this.m_dicCardToCrystoneDic[key];
         }
         this.m_dicCardToCrystoneDic = null;
      }
      
      public function getLookUin() : int
      {
         return this.m_iLookUin;
      }
      
      public function getLookUserName() : String
      {
         return this.m_sLookName;
      }
      
      public function getLookPlat() : int
      {
         return this.m_iLookPlatform;
      }
      
      public function getLookGroup() : int
      {
         return this.m_iLookGroup;
      }
      
      public function getSex() : int
      {
         return this.m_iSex;
      }
      
      public function getIsSelf() : Boolean
      {
         var role:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         if(role)
         {
            if(this.m_iLookUin <= 0)
            {
               return true;
            }
            return this.m_iLookUin == role.m_iRoleUin;
         }
         return false;
      }
      
      public function getDefCardsByItemID(itemID:int) : Array
      {
         var bag:StorageBagVO = null;
         var out:Array = [];
         if(itemID == 0)
         {
            return out;
         }
         var arrDefCards:Array = a_2161.e.GetCardsByType(a_1730.card_slot_package_game_card) as Array;
         this.appendCardAttrByItemId(out,arrDefCards,itemID);
         var bagCfg:StorageBagConfig = StorageBagConfig.GetInstance();
         if(bagCfg != null && bagCfg.storageBagDict != null)
         {
            for each(bag in bagCfg.storageBagDict)
            {
               if(bag != null)
               {
                  this.appendCardAttrByItemId(out,bag.m_arrCardInfos,itemID);
               }
            }
         }
         return out;
      }
      
      private function appendCardAttrByItemId(out:Array, list:Array, itemID:int) : void
      {
         var ca:a_3228 = null;
         if(list == null)
         {
            return;
         }
         for each(ca in list)
         {
            if(ca != null && ca.CardID == itemID)
            {
               out.push(ca);
            }
         }
      }
      
      private function collectOwnedCardIdSet() : Dictionary
      {
         var bag:StorageBagVO = null;
         var hi:a_4461 = null;
         var allDic:Dictionary = new Dictionary();
         var arrEquips:Array = a_2161.e.GetCardsByType(a_1730.card_slot_package_hero_item) as Array;
         var arrDefCards:Array = a_2161.e.GetCardsByType(a_1730.card_slot_package_game_card) as Array;
         this.addCardIdsFromListToSet(arrEquips,allDic);
         this.addCardIdsFromListToSet(arrDefCards,allDic);
         var bagCfg:StorageBagConfig = StorageBagConfig.GetInstance();
         if(bagCfg != null && bagCfg.storageBagDict != null)
         {
            for each(bag in bagCfg.storageBagDict)
            {
               if(bag != null)
               {
                  this.addCardIdsFromListToSet(bag.m_arrCardInfos,allDic);
               }
            }
         }
         var role:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         if(role != null && role.m_arrHeroItemID != null)
         {
            for each(hi in role.m_arrHeroItemID)
            {
               if(hi != null && hi.m_iItemID != 0)
               {
                  allDic[hi.m_iItemID] = true;
               }
            }
         }
         return allDic;
      }
      
      private function addCardIdsFromListToSet(list:Array, dic:Dictionary) : void
      {
         var attr:a_3228 = null;
         if(list == null)
         {
            return;
         }
         for each(attr in list)
         {
            if(attr != null && attr.CardID != 0)
            {
               if(!attr.IsExpiredTime)
               {
                  dic[attr.CardID] = true;
               }
            }
         }
      }
      
      public function rebuildDefCardToCrystoneEquimentDic() : void
      {
         var cardAttr:a_3228 = null;
         var hi:a_4461 = null;
         var bag:StorageBagVO = null;
         this.m_dicCardToCrystoneDic = new Dictionary();
         var arrHeroCards:Array = a_2161.e.GetCardsByType(a_1730.card_slot_package_hero_item) as Array;
         var cryAdditionConfList:Vector.<CrystalLevelAdditionConfig> = CryAdditionXML.Get().m_vLevelConfigs;
         if(cryAdditionConfList == null)
         {
            return;
         }
         var maxByCryItemId:Dictionary = new Dictionary();
         if(arrHeroCards != null)
         {
            for each(cardAttr in arrHeroCards)
            {
               this.mergeCryInstanceFromCardAttr(cardAttr,cryAdditionConfList,maxByCryItemId);
            }
         }
         var role:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         if(role != null && role.m_arrHeroItemID != null)
         {
            for each(hi in role.m_arrHeroItemID)
            {
               this.mergeCryInstanceFromHeroItem(hi,cryAdditionConfList,maxByCryItemId);
            }
         }
         var bagCfg:StorageBagConfig = StorageBagConfig.GetInstance();
         if(bagCfg != null && bagCfg.storageBagDict != null)
         {
            for each(bag in bagCfg.storageBagDict)
            {
               if(bag != null)
               {
                  for each(cardAttr in bag.m_arrCardInfos)
                  {
                     this.mergeCryInstanceFromCardAttr(cardAttr,cryAdditionConfList,maxByCryItemId);
                  }
               }
            }
         }
         this.applyMaxCrystalMapToCrystoneDic(maxByCryItemId,cryAdditionConfList);
      }
      
      public function getDefCardActiveState(itemID:int) : Boolean
      {
         var canActive:Boolean = false;
         var isSelf:Boolean = this.getIsSelf();
         if(isSelf && this.m_dicHookbookActiveOrCanActiveCard.hasOwnProperty(itemID))
         {
            canActive = Boolean(this.m_dicHookbookActiveOrCanActiveCard[itemID]);
         }
         return canActive;
      }
      
      public function checkMenuRed() : void
      {
         var secMenuItem:HandbookMenuNodeData = null;
         var thirdMenuItem:HandbookMenuNodeData = null;
         var i:int = 0;
         var j:int = 0;
         var isSelf:Boolean = this.getIsSelf();
         if(!isSelf)
         {
            return;
         }
         var ary:Array = [];
         var dataSource:Array = HandbookConfigData.Get().GetMenuData();
         var cardMenuNodeData:HandbookMenuNodeData = dataSource[0];
         var propMenuNodeData:HandbookMenuNodeData = dataSource[1];
         for(i = 0; i < cardMenuNodeData.children.length; i++)
         {
            secMenuItem = cardMenuNodeData.children[i];
            if(secMenuItem != null && secMenuItem.children.length > 0)
            {
               for(j = 0; j < secMenuItem.children.length; j++)
               {
                  thirdMenuItem = secMenuItem.children[j];
                  if(ary.indexOf(thirdMenuItem.classifyType) == -1)
                  {
                     this.checkTypeClassifyCanActive(secMenuItem.classifyType,thirdMenuItem.classifyType,ary);
                  }
               }
            }
            else if(ary.indexOf(secMenuItem.classifyType) == -1)
            {
               this.checkTypeClassifyCanActive(secMenuItem.classifyType,secMenuItem.classifyType,ary);
            }
         }
         for(i = 0; i < propMenuNodeData.children.length; i++)
         {
            secMenuItem = propMenuNodeData.children[i];
            if(secMenuItem != null && secMenuItem.children.length > 0)
            {
               for(j = 0; j < secMenuItem.children.length; j++)
               {
                  thirdMenuItem = secMenuItem.children[j];
                  if(ary.indexOf(thirdMenuItem.classifyType) == -1)
                  {
                     this.checkTypeClassifyCanActive(secMenuItem.classifyType,thirdMenuItem.classifyType,ary);
                  }
               }
            }
            else if(ary.indexOf(secMenuItem.classifyType) == -1)
            {
               this.checkTypeClassifyCanActive(secMenuItem.classifyType,secMenuItem.classifyType,ary);
            }
         }
         var dataEvent:CommonEvent = new CommonEvent(EventType.HANDBOOK_UPDATE_MENU_RED);
         dataEvent.Data = ary;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function checkTypeClassifyCanActive(type:int, classify:int, sourceAry:Array) : void
      {
         var itemVo:HandbookItemVo = null;
         var key:* = undefined;
         var suitConf:SuitHandbookData = null;
         var cookerConf:HandbookCookeryData = null;
         var itemConf:CardHandbookData = null;
         var canActiveSkill:Boolean = false;
         var canCrystoneCurrent:Boolean = false;
         var canFusionQualityCurrent:Boolean = false;
         for(key in this.m_dicHookbookActiveOrCanActiveCard)
         {
            if(sourceAry.indexOf(key) == -1)
            {
               if(type == TDHandbookConst.SUIT_CLASSIFY_TYPE || type == TDHandbookConst.MARRIAGE_SUIT_CLASSIFY_TYPE)
               {
                  if(this.m_dicHandbookSuitConf.hasOwnProperty(key))
                  {
                     suitConf = this.m_dicHandbookSuitConf[key];
                     if(suitConf.iClassify == classify)
                     {
                        itemVo = this.getServerItemInfoByID(suitConf.iItemID);
                        if(itemVo == null || itemVo != null && itemVo.cardHasCollect != 1)
                        {
                           if(sourceAry.indexOf(classify) == -1)
                           {
                              sourceAry.push(classify);
                           }
                           if(sourceAry.indexOf(type) == -1)
                           {
                              sourceAry.push(type);
                           }
                        }
                     }
                  }
               }
               else if(type == TDHandbookConst.FOOD_RECIPES_CLASSIFY_TYPE)
               {
                  if(this.m_dicHandbookCookerConf.hasOwnProperty(key))
                  {
                     cookerConf = this.m_dicHandbookCookerConf[key];
                     if(cookerConf.iType == classify)
                     {
                        itemVo = this.getServerItemInfoByID(cookerConf.iDishID);
                        if(itemVo == null || itemVo != null && itemVo.cardHasCollect != 1)
                        {
                           if(this.getCookeryActiveStateFrom(key))
                           {
                              if(sourceAry.indexOf(classify) == -1)
                              {
                                 sourceAry.push(classify);
                              }
                              if(sourceAry.indexOf(type) == -1)
                              {
                                 sourceAry.push(type);
                              }
                           }
                        }
                     }
                  }
               }
               else if(this.m_dicHandbookConf.hasOwnProperty(key))
               {
                  itemConf = this.m_dicHandbookConf[key];
                  if(itemConf.iClassify == classify)
                  {
                     itemVo = this.getServerItemInfoByID(itemConf.iItemID);
                     if(itemVo == null || itemVo.cardHasCollect != 1)
                     {
                        if(sourceAry.indexOf(classify) == -1)
                        {
                           sourceAry.push(classify);
                        }
                        if(sourceAry.indexOf(type) == -1)
                        {
                           sourceAry.push(type);
                        }
                     }
                     else if(itemVo.cardHasCollect == 1)
                     {
                        if(itemConf.iNeedSkillLevel > 0 && !itemVo.isSkillCollected() && itemVo.skillCurrentLevel >= itemConf.iNeedSkillLevel)
                        {
                           canActiveSkill = true;
                        }
                        if(itemConf.iNeedCrystalLevel > 0 && !itemVo.isCrystoneCollected() && itemVo.crystoneCurrentLevel >= itemConf.iNeedCrystalLevel)
                        {
                           canCrystoneCurrent = true;
                        }
                        if(itemConf.iNeedFusionQualityLevel > 0 && !itemVo.isFusionQualityCollected() && itemVo.fusionQualityCurrentLevel >= itemConf.iNeedFusionQualityLevel)
                        {
                           canFusionQualityCurrent = true;
                        }
                        if(canActiveSkill || canCrystoneCurrent || canFusionQualityCurrent)
                        {
                           if(sourceAry.indexOf(classify) == -1)
                           {
                              sourceAry.push(classify);
                           }
                           if(sourceAry.indexOf(type) == -1)
                           {
                              sourceAry.push(type);
                           }
                        }
                     }
                  }
               }
            }
         }
      }
      
      public function getCollectProgressByTypeOrClassify(typeOrclassify:int) : HandbookCollectProgressVo
      {
         var progress:HandbookCollectProgressVo = null;
         var isSelf:Boolean = this.getIsSelf();
         if(isSelf)
         {
            if(this.m_dicServerProgressSelf.hasOwnProperty(typeOrclassify))
            {
               progress = this.m_dicServerProgressSelf[typeOrclassify];
            }
         }
         else if(this.m_dicServerProgressOther.hasOwnProperty(typeOrclassify))
         {
            progress = this.m_dicServerProgressOther[typeOrclassify];
         }
         return progress;
      }
      
      public function getSuitActiveStateFromPackageOrStore(itemID:int) : Boolean
      {
         var canActive:Boolean = false;
         var isSelf:Boolean = this.getIsSelf();
         if(isSelf && this.m_dicPackageAndStoreCard != null && this.m_dicPackageAndStoreCard.hasOwnProperty(itemID))
         {
            canActive = Boolean(this.m_dicPackageAndStoreCard[itemID]);
         }
         return canActive;
      }
      
      public function getCookeryActiveStateFrom(dishID:int) : Boolean
      {
         var canActive:Boolean = false;
         var isSelf:Boolean = this.getIsSelf();
         if(isSelf && this.m_dicHaveRecipes != null && this.m_dicHaveRecipes.hasOwnProperty(dishID))
         {
            canActive = Boolean(this.m_dicHaveRecipes[dishID]);
         }
         return canActive;
      }
      
      public function getServerItemInfoList() : Dictionary
      {
         var isSelf:Boolean = this.getIsSelf();
         if(isSelf)
         {
            return this.m_dicServerHasActiveCardMySelf;
         }
         return this.m_dicServerHasActiveCardOther;
      }
      
      public function getServerItemInfoByID(itemID:int) : HandbookItemVo
      {
         var isSelf:Boolean = this.getIsSelf();
         if(isSelf)
         {
            if(this.m_dicServerHasActiveCardMySelf.hasOwnProperty(itemID))
            {
               return this.m_dicServerHasActiveCardMySelf[itemID];
            }
         }
         else if(this.m_dicServerHasActiveCardOther.hasOwnProperty(itemID))
         {
            return this.m_dicServerHasActiveCardOther[itemID];
         }
         return null;
      }
      
      public function getItemHasActiveOrInPackageStore(itemID:int) : Boolean
      {
         var vo:HandbookItemVo = null;
         var bool:Boolean = false;
         var isSelf:Boolean = this.getIsSelf();
         if(isSelf)
         {
            if(this.m_dicServerHasActiveCardMySelf.hasOwnProperty(itemID))
            {
               vo = this.m_dicServerHasActiveCardMySelf[itemID];
               if(vo != null && vo.cardHasCollect == 1)
               {
                  bool = true;
               }
               else if(this.m_dicPackageAndStoreCard != null && this.m_dicPackageAndStoreCard.hasOwnProperty(itemID))
               {
                  bool = Boolean(this.m_dicPackageAndStoreCard[itemID]);
               }
            }
            else if(this.m_dicPackageAndStoreCard != null && this.m_dicPackageAndStoreCard.hasOwnProperty(itemID))
            {
               bool = Boolean(this.m_dicPackageAndStoreCard[itemID]);
            }
         }
         return bool;
      }
      
      public function setServerItemInfoByID(vo:HandbookItemVo) : void
      {
         var isSelf:Boolean = this.getIsSelf();
         if(isSelf)
         {
            this.m_dicServerHasActiveCardMySelf[vo.itemID] = vo;
         }
         else
         {
            this.m_dicServerHasActiveCardOther[vo.itemID] = vo;
         }
      }
      
      private function mergeCryInstanceFromCardAttr(cardAttr:a_3228, cryAdditionConfList:Vector.<CrystalLevelAdditionConfig>, maxByCryItemId:Dictionary) : void
      {
         if(cardAttr == null || (cardAttr.CardID & 0xFFF00000) != 344981504)
         {
            return;
         }
         var conf:CrystalLevelAdditionConfig = this.findCrystalConfigByCryId(cardAttr.CardID,cryAdditionConfList);
         if(conf == null)
         {
            return;
         }
         var tv:Object = this.getCryTierAndValueFromExtra(cardAttr.m_arrExtraAttr,conf);
         this.mergeMaxCrystalTier(maxByCryItemId,cardAttr.CardID,int(tv.addID),int(tv.value));
      }
      
      private function mergeCryInstanceFromHeroItem(hi:a_4461, cryAdditionConfList:Vector.<CrystalLevelAdditionConfig>, maxByCryItemId:Dictionary) : void
      {
         if(hi == null || (hi.m_iItemID & 0xFFF00000) != 344981504)
         {
            return;
         }
         var conf:CrystalLevelAdditionConfig = this.findCrystalConfigByCryId(hi.m_iItemID,cryAdditionConfList);
         if(conf == null)
         {
            return;
         }
         var tv:Object = this.getCryTierAndValueFromExtra(hi.m_arrExtraAttr,conf);
         this.mergeMaxCrystalTier(maxByCryItemId,hi.m_iItemID,int(tv.addID),int(tv.value));
      }
      
      private function findCrystalConfigByCryId(cryItemId:int, cryAdditionConfList:Vector.<CrystalLevelAdditionConfig>) : CrystalLevelAdditionConfig
      {
         var i:int = 0;
         for(i = 0; i < cryAdditionConfList.length; i++)
         {
            if(cryAdditionConfList[i].m_iCryID == cryItemId)
            {
               return cryAdditionConfList[i];
            }
         }
         return null;
      }
      
      private function getCryTierAndValueFromExtra(extra:Array, crystalConf:CrystalLevelAdditionConfig) : Object
      {
         var m:int = 0;
         var addID:int = 0;
         var value:int = 0;
         if(crystalConf.m_iAddition != null && crystalConf.m_iAddition.length > 0)
         {
            value = int(crystalConf.m_iAddition[0]);
         }
         if(extra != null)
         {
            for(m = 0; m < extra.length; m++)
            {
               if(extra[m].m_cItemType == 10)
               {
                  addID = int(extra[m].m_iItemAdd);
                  if(crystalConf.m_iAddition != null && addID >= 0 && addID < crystalConf.m_iAddition.length)
                  {
                     value = int(crystalConf.m_iAddition[addID]);
                  }
                  break;
               }
            }
         }
         return {
            "addID":addID,
            "value":value
         };
      }
      
      private function mergeMaxCrystalTier(maxByCryItemId:Dictionary, cryItemId:int, addID:int, value:int) : void
      {
         var o:Object = maxByCryItemId[cryItemId];
         if(o == null || addID > int(o.addID))
         {
            maxByCryItemId[cryItemId] = {
               "addID":addID,
               "value":value,
               "cryId":cryItemId
            };
         }
      }
      
      private function applyMaxCrystalMapToCrystoneDic(maxByCryItemId:Dictionary, cryAdditionConfList:Vector.<CrystalLevelAdditionConfig>) : void
      {
         var cryItemId:* = undefined;
         var best:Object = null;
         var conf:CrystalLevelAdditionConfig = null;
         var recipeItem:RecipeItem = null;
         var cardTok:String = null;
         var defItemId:int = 0;
         var entry:Object = null;
         var old:Object = null;
         for(cryItemId in maxByCryItemId)
         {
            best = maxByCryItemId[cryItemId];
            if(best != null)
            {
               conf = this.findCrystalConfigByCryId(int(cryItemId),cryAdditionConfList);
               if(conf != null)
               {
                  recipeItem = RecipeXMLParser.instance().getRecipeByID(conf.m_iType);
                  if(!(recipeItem == null || recipeItem.cards == null))
                  {
                     for each(cardTok in recipeItem.cards)
                     {
                        defItemId = int(cardTok);
                        if(defItemId != 0)
                        {
                           entry = {
                              "addID":int(best.addID),
                              "value":int(best.value),
                              "cryId":int(best.cryId),
                              "addType":recipeItem.recipeType
                           };
                           old = this.m_dicCardToCrystoneDic[defItemId];
                           if(old == null || int(entry.addID) > int(old.addID))
                           {
                              this.m_dicCardToCrystoneDic[defItemId] = entry;
                           }
                        }
                     }
                  }
               }
            }
         }
      }
      
      public function getCardCrystoneLevel(cardItemID:int) : int
      {
         if(!this.m_dicCardToCrystoneDic)
         {
            this.rebuildDefCardToCrystoneEquimentDic();
         }
         if(!this.m_dicCardToCrystoneDic.hasOwnProperty(cardItemID))
         {
            return 0;
         }
         var e:Object = this.m_dicCardToCrystoneDic[cardItemID];
         return e != null ? int(e.addID) : 0;
      }
      
      public function getCardMaxFusionQuailyLevel(cardAry:Array) : int
      {
         var cardAttr:a_3228 = null;
         var fusionQualityLevel:int = 0;
         for(var i:int = 0; i < cardAry.length; i++)
         {
            cardAttr = cardAry[i];
            if(cardAttr.GradeLevel > fusionQualityLevel)
            {
               fusionQualityLevel = cardAttr.GradeLevel;
            }
         }
         return fusionQualityLevel;
      }
      
      public function getCardSkillLevel(itemID:int) : int
      {
         var arrSkillCards:Array = null;
         var dict:Dictionary = null;
         var skill:Object = null;
         var arrBooks:Array = null;
         var skillBook:a_3286 = null;
         var skillLevel:int = 0;
         var iBaseDefCardID:int = a_4657.getInstance().execute("GetDefCardIDShineBaseCardDefID",null,itemID);
         var arrCards:Array = a_2161.e.GetTDCardsInfo() as Array;
         if(iBaseDefCardID > 0 && arrCards != null && arrCards.length > 3)
         {
            arrSkillCards = arrCards[4];
            dict = a_2041.getInstance().m_dictSkillCards;
            for each(skill in arrSkillCards)
            {
               if(iBaseDefCardID == skill.m_iSkillID)
               {
                  arrBooks = dict[iBaseDefCardID];
                  for each(skillBook in arrBooks)
                  {
                     if(skill.m_nSkillLevel == skillBook.iBookLevel)
                     {
                        skillBook.iSkillOpened = skill.m_iSkillOpened;
                        skillBook.iSkillUsed = skill.m_iSkillUsed;
                        skillBook.nSkillLevel = skill.m_nSkillLevel;
                        break;
                     }
                     skillBook.iSkillUsed = 0;
                     skillBook.nSkillLevel = 0;
                     skillBook.iSkillOpened = 0;
                  }
                  skillLevel = skillBook.CurrentLevel;
                  break;
               }
            }
         }
         return skillLevel;
      }
      
      private function heroItemToCardAttr(hi:a_4461) : a_3228
      {
         var ei:int = 0;
         var attr:a_3228 = new a_3228();
         attr.CardCount = hi.m_nItemCount;
         attr.CardID = hi.m_iItemID;
         attr.CardPositionID = hi.m_nItemPosition;
         attr.CardSeq = hi.m_iItemSeq;
         attr.IsBind = hi.m_cIsBind;
         attr.ExpiredTime = hi.m_iUsedTime;
         attr.Type = hi.m_iType;
         attr.TypeValue = hi.m_iTypeValue;
         attr.DeltaTime = hi.m_iDeltaTime;
         attr.m_nItemSlotNum = hi.m_nItemSlotNum;
         if(hi.m_arrExtraAttr != null)
         {
            for(ei = 0; ei < hi.m_arrExtraAttr.length; ei++)
            {
               if(hi.m_arrExtraAttr[ei].m_cItemType == 7)
               {
                  attr.GradeLevel = hi.m_arrExtraAttr[ei].m_iItemAdd;
                  break;
               }
            }
            attr.m_arrExtraAttr = Tool.a_4653(hi.m_arrExtraAttr) as Array;
         }
         if(hi.m_dictExtraAttr != null)
         {
            attr.DictExtraAttr = Tool.a_4653(hi.m_dictExtraAttr) as Dictionary;
         }
         var desc:Dictionary = a_2027.getInstance().m_dictDesc;
         if(desc != null && desc[attr.CardID] != null)
         {
            attr.Name = desc[attr.CardID].Name;
         }
         return attr;
      }
      
      public function inheritAllLine() : void
      {
         var key:String = null;
         var hasKey:Object = null;
         for(key in this.m_dicPackageAndStoreCard)
         {
            delete this.m_dicPackageAndStoreCard[key];
         }
         for(hasKey in this.m_dicHookbookActiveOrCanActiveCard)
         {
            delete this.m_dicHookbookActiveOrCanActiveCard[hasKey];
         }
         this.m_dicPackageAndStoreCard = this.collectOwnedCardIdSet();
         this.inheritHasActiveOrInPackageStore();
         this.inheritGoldLine();
         this.inheritBaseFusionLine(TDHandbookConst.GOOD_FOOD_FUSION_CLASSIFY_TYPE);
      }
      
      private function inheritFinalFusionLine() : void
      {
      }
      
      private function inheritHasActiveOrInPackageStore() : void
      {
         var i:int = 0;
         var handbookData:CardHandbookData = null;
         var sid:* = undefined;
         var isHas:Boolean = false;
         var gid:* = undefined;
         var activeId:* = undefined;
         var targetSex:int = 0;
         var isSelf:Boolean = false;
         var suitConf:SuitHandbookData = null;
         var cookerConf:HandbookCookeryData = null;
         var sVo:HandbookItemVo = null;
         var tid:int = 0;
         var arr:Array = null;
         var gArr:Array = null;
         var aid:int = 0;
         var aData:CardHandbookData = null;
         var group:Array = null;
         var aTransType:int = 0;
         var j:int = 0;
         var member:CardHandbookData = null;
         var role:a_4463 = null;
         var groupByTransId:Dictionary = new Dictionary();
         var itemIdToData:Dictionary = new Dictionary();
         var activeServerSet:Dictionary = new Dictionary();
         var serverList:Dictionary = this.getServerItemInfoList();
         for(sid in serverList)
         {
            sVo = this.m_dicServerHasActiveCardMySelf[sid];
            if(sVo != null && sVo.cardHasCollect == 1)
            {
               activeServerSet[sVo.itemID] = true;
            }
         }
         for(i = 0; i < this.handbookConfigData.m_vCardHandbook.length; i++)
         {
            handbookData = this.handbookConfigData.m_vCardHandbook[i];
            if(handbookData != null)
            {
               itemIdToData[handbookData.iItemID] = handbookData;
               isHas = this.getItemHasActiveOrInPackageStore(handbookData.iItemID);
               if(isHas)
               {
                  this.m_dicHookbookActiveOrCanActiveCard[handbookData.iItemID] = true;
               }
               tid = handbookData.iTransID;
               arr = groupByTransId[tid] as Array;
               if(arr == null)
               {
                  arr = [];
                  groupByTransId[tid] = arr;
               }
               arr.push(handbookData);
            }
         }
         for(gid in groupByTransId)
         {
            gArr = groupByTransId[gid] as Array;
            if(gArr != null && gArr.length > 1)
            {
               gArr.sort(function(a:CardHandbookData, b:CardHandbookData):Number
               {
                  return b.iTransType - a.iTransType;
               });
            }
         }
         for(activeId in activeServerSet)
         {
            aid = int(activeId);
            aData = itemIdToData[aid];
            if(aData != null)
            {
               group = groupByTransId[aData.iTransID] as Array;
               if(group != null)
               {
                  aTransType = aData.iTransType;
                  for(j = 0; j < group.length; j++)
                  {
                     member = group[j] as CardHandbookData;
                     if(member != null)
                     {
                        if(member.iType == aData.iType && member.iClassify == aData.iClassify && member.iTransType < aTransType)
                        {
                           this.m_dicHookbookActiveOrCanActiveCard[member.iItemID] = true;
                        }
                     }
                  }
               }
            }
         }
         isSelf = this.getIsSelf();
         if(isSelf)
         {
            role = a_2161.e.GetCurrentRole() as a_4463;
            targetSex = role.m_iUserSex;
         }
         else
         {
            targetSex = this.getSex();
         }
         for(i = 0; i < this.handbookConfigData.m_vSuitHandbook.length; i++)
         {
            suitConf = this.handbookConfigData.m_vSuitHandbook[i];
            if(suitConf.iSex == 0 || suitConf.iSex == targetSex)
            {
               isHas = this.getItemHasActiveOrInPackageStore(suitConf.iItemID);
               if(isHas)
               {
                  this.m_dicHookbookActiveOrCanActiveCard[suitConf.iItemID] = true;
               }
            }
         }
         for(i = 0; i < this.handbookConfigData.m_vCookeryHandbook.length; i++)
         {
            cookerConf = this.handbookConfigData.m_vCookeryHandbook[i];
            isHas = this.getCookeryActiveStateFrom(cookerConf.iDishID);
            if(isHas)
            {
               this.m_dicHookbookActiveOrCanActiveCard[cookerConf.iDishID] = true;
            }
         }
      }
      
      private function inheritGoldLine() : void
      {
         var i:int = 0;
         var k:int = 0;
         var handbookData:CardHandbookData = null;
         var checkHandbookData:CardHandbookData = null;
         var hasLightItem:HandbookItemVo = null;
         for(i = 0; i < this.handbookConfigData.m_vCardHandbook.length; i++)
         {
            handbookData = this.handbookConfigData.m_vCardHandbook[i];
            hasLightItem = null;
            if(handbookData.iType == TDHandbookConst.GOLD_CARD_CLASSIFY_TYPE)
            {
               hasLightItem = this.getServerItemInfoByID(handbookData.iItemID);
               if(Boolean(hasLightItem) && hasLightItem.cardHasCollect == 1)
               {
                  for(k = 0; k < this.handbookConfigData.m_vCardHandbook.length; k++)
                  {
                     checkHandbookData = this.handbookConfigData.m_vCardHandbook[k];
                     if(handbookData.iTransID_1 == checkHandbookData.iTransID_1 && (checkHandbookData.iType != TDHandbookConst.GOOD_FOOD_FUSION_CLASSIFY_TYPE && checkHandbookData.iType != TDHandbookConst.ZODIAC_FUSION_CLASSIFY_TYPE && checkHandbookData.iType != TDHandbookConst.GOLD_CARD_FUSION_CLASSIFY_TYPE && checkHandbookData.iType != TDHandbookConst.GOLD_CARD_CLASSIFY_TYPE))
                     {
                        this.m_dicHookbookActiveOrCanActiveCard[checkHandbookData.iItemID] = true;
                     }
                  }
               }
            }
         }
      }
      
      private function inheritBaseFusionLine(checkType:int) : void
      {
         var i:int = 0;
         var k:int = 0;
         var handbookData:CardHandbookData = null;
         var checkHandbookData:CardHandbookData = null;
         var hasLightItem:HandbookItemVo = null;
         var buseFusionAry:Array = null;
         var baseFusion:int = 0;
         var inBuseFusion:int = 0;
         for(i = 0; i < this.handbookConfigData.m_vCardHandbook.length; i++)
         {
            handbookData = this.handbookConfigData.m_vCardHandbook[i];
            hasLightItem = null;
            if(handbookData.iType == checkType)
            {
               hasLightItem = this.getServerItemInfoByID(handbookData.iItemID);
               if(Boolean(hasLightItem) && hasLightItem.cardHasCollect == 1)
               {
                  buseFusionAry = handbookData.getBaseFusionAry();
                  if(buseFusionAry != null && buseFusionAry.length > 0)
                  {
                     baseFusion = int(buseFusionAry[0]);
                     for(k = 0; k < this.handbookConfigData.m_vCardHandbook.length; k++)
                     {
                        checkHandbookData = this.handbookConfigData.m_vCardHandbook[k];
                        inBuseFusion = checkHandbookData.sBaseFusion.indexOf(baseFusion.toString());
                        if(inBuseFusion != -1 && (checkHandbookData.iType != TDHandbookConst.GOOD_FOOD_FUSION_CLASSIFY_TYPE && checkHandbookData.iType != TDHandbookConst.ZODIAC_FUSION_CLASSIFY_TYPE && checkHandbookData.iType != TDHandbookConst.GOLD_CARD_FUSION_CLASSIFY_TYPE && checkHandbookData.iType != TDHandbookConst.GOLD_CARD_CLASSIFY_TYPE))
                        {
                           this.m_dicHookbookActiveOrCanActiveCard[checkHandbookData.iItemID] = true;
                        }
                     }
                  }
               }
            }
         }
      }
      
      public function resolveLevel(itemVo:HandbookItemVo) : void
      {
         var itemConf:CardHandbookData = null;
         var cardAry:Array = null;
         var isSelf:Boolean = this.getIsSelf();
         if(isSelf)
         {
            if(itemVo.type != TDHandbookConst.SUIT_CLASSIFY_TYPE && itemVo.type != TDHandbookConst.MARRIAGE_SUIT_CLASSIFY_TYPE && itemVo.type != TDHandbookConst.FOOD_RECIPES_CLASSIFY_TYPE)
            {
               itemConf = this.m_dicHandbookConf[itemVo.itemID];
               if(itemConf.iNeedSkillLevel > 0)
               {
                  itemVo.skillCurrentLevel = this.getCardSkillLevel(itemVo.itemID);
               }
               if(itemConf.iNeedCrystalLevel > 0)
               {
                  itemVo.crystoneCurrentLevel = this.getCardCrystoneLevel(itemVo.itemID);
               }
               cardAry = this.getDefCardsByItemID(itemVo.itemID);
               if(cardAry != null && cardAry.length > 0)
               {
                  itemVo.fusionQualityCurrentLevel = this.getCardMaxFusionQuailyLevel(cardAry);
               }
            }
         }
      }
      
      private function onResponseGetTypeData(evt:CommonEvent) : void
      {
         var isSelf:Boolean = false;
         var a_4730:CommonEvent = null;
         if(!this.m_bInitHandbookCfg)
         {
            this.m_bInitHandbookCfg = true;
            this.initConfigToDic();
         }
         var info:CResponseHandbookTypeInfo = evt.Data as CResponseHandbookTypeInfo;
         if(info.m_nResultID == 0)
         {
            if(this.m_iLookUin == -1 && this.onUpdateServerDataFun == null)
            {
               if(!this.loginInitDataDic)
               {
                  this.loginInitDataDic = new Dictionary();
               }
               this.loginInitDataDic[info.m_nType] = info;
               return;
            }
            this.parseHandbookData(info);
            isSelf = this.getIsSelf();
            if(!isSelf && info.m_nType == TDHandbookConst.MARRIAGE_SUIT_CLASSIFY_TYPE)
            {
               a_4730 = new CommonEvent(EventType.HANDBOOK_UPDATE_PACKAGE);
               a_4730.Data = false;
               a_1789.getInstance().dispatchEvent(a_4730);
            }
            this.checkMenuRed();
         }
         else
         {
            MessageTipHandler.Get().a_3146("error:" + info.m_nResultID);
         }
      }
      
      private function onResponseLightOrReceiveData(evt:CommonEvent) : void
      {
         var collectProgressVo:HandbookCollectProgressVo = null;
         var progressVo:HandbookCollectProgress = null;
         var dataEvent:CommonEvent = null;
         var i:int = 0;
         var activeCardVo:HandbookActiveCard = null;
         var handbook:HandbookItemVo = null;
         var m:int = 0;
         var n:int = 0;
         var k:int = 0;
         var typeName:String = null;
         var levelName:String = null;
         var menuListData:Array = null;
         var oneMenuNodeData:HandbookMenuNodeData = null;
         var twoMenuNodeData:HandbookMenuNodeData = null;
         var threeMenuNodeData:HandbookMenuNodeData = null;
         var info:CResponseHandbookLightOrReceiveInfo = evt.Data as CResponseHandbookLightOrReceiveInfo;
         if(info.m_nResultID == 0)
         {
            if(info.m_cOpt == 1)
            {
               for(i = 0; i < info.m_aryCardCollection.length; i++)
               {
                  activeCardVo = info.m_aryCardCollection[i];
                  handbook = this.getServerItemInfoByID(activeCardVo.m_iID);
                  if(!handbook)
                  {
                     handbook = new HandbookItemVo();
                     handbook.itemID = activeCardVo.m_iID;
                     handbook.type = activeCardVo.m_cType;
                     handbook.classify = activeCardVo.m_cClassify;
                     handbook.collectState = activeCardVo.m_cCollect;
                     handbook.collectPt = 0;
                     this.m_dicServerHasActiveCardMySelf[handbook.itemID] = handbook;
                  }
                  if(info.m_cType == 1)
                  {
                     handbook.collectTime = info.m_iTime;
                     handbook.setCardCollected(true);
                  }
                  else if(info.m_cType == 2)
                  {
                     handbook.setSkillCollected(true);
                  }
                  else if(info.m_cType == 3)
                  {
                     handbook.setCrystoneCollected(true);
                  }
                  else if(info.m_cType == 4)
                  {
                     handbook.setFusionQualityCollected(true);
                  }
                  handbook.parseData();
               }
            }
            else if(info.m_cOpt == 2)
            {
               if(info.m_nAwardType == TDHandbookConst.RECEIVE_ALL_PROGRESS_AWARD_ID)
               {
                  MessageTipHandler.Get().a_3146(GameStringManager.getInstance().getString(131736,[info.m_cAwardLevel]));
               }
               else
               {
                  typeName = "";
                  levelName = "";
                  menuListData = HandbookConfigData.Get().GetMenuData();
                  for(m = 0; m < menuListData.length; m++)
                  {
                     oneMenuNodeData = menuListData[m];
                     if(oneMenuNodeData.children != null)
                     {
                        for(n = 0; n < oneMenuNodeData.children.length; n++)
                        {
                           twoMenuNodeData = oneMenuNodeData.children[n];
                           if(twoMenuNodeData.classifyType == info.m_nAwardType)
                           {
                              typeName = twoMenuNodeData.name;
                              break;
                           }
                           if(twoMenuNodeData.children != null)
                           {
                              for(k = 0; k < twoMenuNodeData.children.length; k++)
                              {
                                 threeMenuNodeData = twoMenuNodeData.children[k];
                                 if(threeMenuNodeData.classifyType == info.m_nAwardType)
                                 {
                                    typeName = threeMenuNodeData.name;
                                    break;
                                 }
                              }
                           }
                           if(typeName != "")
                           {
                              break;
                           }
                        }
                        if(typeName != "")
                        {
                           break;
                        }
                     }
                  }
                  MessageTipHandler.Get().a_3146(GameStringManager.getInstance().getString(131737,[typeName,info.m_cAwardLevel]));
               }
            }
            for(i = 0; i < info.m_aryCollectProgress.length; i++)
            {
               progressVo = info.m_aryCollectProgress[i];
               collectProgressVo = this.getCollectProgressByTypeOrClassify(progressVo.m_cCollectType);
               if(!collectProgressVo)
               {
                  collectProgressVo = new HandbookCollectProgressVo();
                  collectProgressVo.type = progressVo.m_cCollectType;
                  this.m_dicServerProgressSelf[collectProgressVo.type] = collectProgressVo;
               }
               collectProgressVo.collectPt = progressVo.m_nCollectPoint;
               collectProgressVo.collectAwardState = progressVo.m_cCollectAward;
            }
            dataEvent = new CommonEvent(EventType.CLIENT_HANDBOOK_UPDATE_DATA);
            dataEvent.Data = info;
            a_1789.getInstance().dispatchEvent(dataEvent);
            this.checkMenuRed();
         }
         else
         {
            MessageTipHandler.Get().a_3146("Error:" + info.m_nResultID);
         }
      }
      
      private function parseLoginInitData() : void
      {
         var item:CResponseHandbookTypeInfo = null;
         if(this.loginInitDataDic)
         {
            for each(item in this.loginInitDataDic)
            {
               this.parseHandbookData(item);
            }
            this.loginInitDataDic = null;
         }
      }
      
      private function checkCardInConf(type:int, itemID:int) : Boolean
      {
         var itemConf:CardHandbookData = null;
         var isSelf:Boolean = this.getIsSelf();
         if(isSelf)
         {
            if(type != TDHandbookConst.SUIT_CLASSIFY_TYPE && type != TDHandbookConst.MARRIAGE_SUIT_CLASSIFY_TYPE && type != TDHandbookConst.FOOD_RECIPES_CLASSIFY_TYPE)
            {
               itemConf = this.m_dicHandbookConf[itemID];
               return itemConf != null;
            }
         }
         return true;
      }
      
      private function parseHandbookData(info:CResponseHandbookTypeInfo) : void
      {
         var i:int = 0;
         var itemVo:HandbookItemVo = null;
         var serverVo:HandbookCollectCard = null;
         var collectVo:HandbookCollectProgressVo = null;
         var serverCollectVo:HandbookCollectProgress = null;
         if(info.m_iUin == info.m_iTargetUin || info.m_iTargetUin <= 0)
         {
            for(i = 0; i < info.m_aryCardCollection.length; i++)
            {
               serverVo = info.m_aryCardCollection[i];
               if(!this.checkCardInConf(serverVo.m_cType,serverVo.m_iID))
               {
                  MessageTipHandler.Get().a_3146("图鉴卡牌配置error:" + serverVo.m_iID.toString(16));
               }
               else
               {
                  itemVo = new HandbookItemVo();
                  itemVo.itemID = serverVo.m_iID;
                  itemVo.type = serverVo.m_cType;
                  itemVo.classify = serverVo.m_cClassify;
                  itemVo.collectTime = serverVo.m_iCollectTime;
                  itemVo.collectState = serverVo.m_cCollect;
                  itemVo.collectPt = serverVo.m_cPoint;
                  itemVo.parseData();
                  this.resolveLevel(itemVo);
                  this.m_dicServerHasActiveCardMySelf[itemVo.itemID] = itemVo;
               }
            }
            for(i = 0; i < info.m_aryCollectProgress.length; i++)
            {
               serverCollectVo = info.m_aryCollectProgress[i];
               collectVo = new HandbookCollectProgressVo();
               collectVo.type = serverCollectVo.m_cCollectType;
               collectVo.collectPt = serverCollectVo.m_nCollectPoint;
               collectVo.collectAwardState = serverCollectVo.m_cCollectAward;
               this.m_dicServerProgressSelf[collectVo.type] = collectVo;
            }
         }
         else
         {
            for(i = 0; i < info.m_aryCardCollection.length; i++)
            {
               serverVo = info.m_aryCardCollection[i];
               itemVo = new HandbookItemVo();
               itemVo.itemID = serverVo.m_iID;
               itemVo.type = serverVo.m_cType;
               itemVo.classify = serverVo.m_cType;
               itemVo.collectTime = serverVo.m_iCollectTime;
               itemVo.collectState = serverVo.m_cCollect;
               itemVo.collectPt = serverVo.m_cPoint;
               itemVo.parseData();
               this.m_dicServerHasActiveCardOther[itemVo.itemID] = itemVo;
            }
            for(i = 0; i < info.m_aryCollectProgress.length; i++)
            {
               serverCollectVo = info.m_aryCollectProgress[i];
               collectVo = new HandbookCollectProgressVo();
               collectVo.type = serverCollectVo.m_cCollectType;
               collectVo.collectPt = serverCollectVo.m_nCollectPoint;
               collectVo.collectAwardState = serverCollectVo.m_cCollectAward;
               this.m_dicServerProgressOther[collectVo.type] = collectVo;
            }
         }
         this.inheritHasActiveOrInPackageStore();
         this.inheritGoldLine();
         this.inheritBaseFusionLine(TDHandbookConst.GOOD_FOOD_FUSION_CLASSIFY_TYPE);
         if(this.m_iLookUin > 0 && this.onUpdateServerDataFun != null)
         {
            this.onUpdateServerDataFun();
         }
      }
      
      public function AddString(iItemID:int) : String
      {
         var progressVo:HandbookCollectProgressVo = null;
         this.parseLoginInitData();
         var activeItem:HandbookItemVo = this.getServerItemInfoByID(iItemID);
         if(!activeItem || activeItem.cardHasCollect != 1)
         {
            return "";
         }
         if(!this.m_bInitHandbookCfg)
         {
            this.m_bInitHandbookCfg = true;
            this.initConfigToDic();
         }
         var cardConf:CardHandbookData = null;
         var suitConf:SuitHandbookData = null;
         if(this.m_dicHandbookConf.hasOwnProperty(iItemID))
         {
            cardConf = this.m_dicHandbookConf[iItemID];
         }
         if(this.m_dicHandbookSuitConf.hasOwnProperty(iItemID))
         {
            suitConf = this.m_dicHandbookSuitConf[iItemID];
         }
         if(cardConf != null)
         {
            progressVo = this.getCollectProgressByTypeOrClassify(cardConf.iClassify);
            if(progressVo != null && cardConf.iNeedNum <= progressVo.collectPt)
            {
               if(cardConf.iAddType == 6)
               {
                  return "攻速 +" + (cardConf.iAddValue * 100).toString() + "%";
               }
               if(cardConf.iAddType == 3)
               {
                  return "攻击力 +" + (cardConf.iAddValue * 100).toString() + "%";
               }
               if(cardConf.iAddType == 8)
               {
                  return "冷却 " + cardConf.iAddValue.toString();
               }
               if(cardConf.iAddType == 10)
               {
                  return "能耗 " + cardConf.iAddValue.toString();
               }
               if(cardConf.iAddType == 2)
               {
                  return "体力 +" + cardConf.iAddValue.toString();
               }
               if(cardConf.iAddType == 9)
               {
                  return "攻击力加成 +" + (cardConf.iAddValue * 100).toString() + "%";
               }
            }
         }
         else if(suitConf != null)
         {
            progressVo = this.getCollectProgressByTypeOrClassify(suitConf.iClassify);
            if(progressVo != null && suitConf.iNeedNum <= progressVo.collectPt)
            {
               return "体力 +" + suitConf.iAddValue.toString();
            }
         }
         return "";
      }
      
      public function AddRecipe(iItemID:int) : RecipesPostCardInfo
      {
         var progressVo:HandbookCollectProgressVo = null;
         var recipesPostInfo:RecipesPostCardInfo = null;
         var recipesAttrStruct:RecipesAttrStruct = null;
         this.parseLoginInitData();
         var activeItem:HandbookItemVo = this.getServerItemInfoByID(iItemID);
         if(!activeItem || activeItem.cardHasCollect != 1)
         {
            return null;
         }
         if(!this.m_bInitHandbookCfg)
         {
            this.m_bInitHandbookCfg = true;
            this.initConfigToDic();
         }
         var cardConf:CardHandbookData = null;
         var suitConf:SuitHandbookData = null;
         if(this.m_dicHandbookConf.hasOwnProperty(iItemID))
         {
            cardConf = this.m_dicHandbookConf[iItemID];
         }
         if(this.m_dicHandbookSuitConf.hasOwnProperty(iItemID))
         {
            suitConf = this.m_dicHandbookSuitConf[iItemID];
         }
         if(cardConf != null && cardConf.iAddType > 0)
         {
            progressVo = this.getCollectProgressByTypeOrClassify(cardConf.iClassify);
            if(progressVo != null && cardConf.iNeedNum <= progressVo.collectPt)
            {
               recipesPostInfo = new RecipesPostCardInfo();
               recipesPostInfo.m_aryAttrInfo = new Array();
               recipesAttrStruct = new RecipesAttrStruct();
               recipesAttrStruct.m_iAttrType = cardConf.iAddType;
               recipesAttrStruct.m_aryCardId = [iItemID.toString(16)];
               recipesPostInfo.m_iRecipesId = 20000000 + cardConf.iAddType;
               recipesPostInfo.m_aryAttrInfo.push(recipesAttrStruct);
               if(cardConf.iAddType == 1)
               {
                  recipesAttrStruct.m_iValue = cardConf.iAddValue;
               }
               else if(cardConf.iAddType == 3 || cardConf.iAddType == 6 || cardConf.iAddType == 9)
               {
                  recipesAttrStruct.m_iValue = cardConf.iAddValue * 100;
               }
               else if(cardConf.iAddType == 8)
               {
                  recipesAttrStruct.m_iValue = -cardConf.iAddValue * 10;
               }
               else if(cardConf.iAddType == 10)
               {
                  recipesAttrStruct.m_iValue = -cardConf.iAddValue;
               }
               return recipesPostInfo;
            }
         }
         else if(suitConf != null)
         {
            progressVo = this.getCollectProgressByTypeOrClassify(suitConf.iClassify);
            if(progressVo != null && suitConf.iNeedNum <= progressVo.collectPt)
            {
               recipesPostInfo = new RecipesPostCardInfo();
               recipesPostInfo.m_aryAttrInfo = new Array();
               recipesAttrStruct = new RecipesAttrStruct();
               recipesAttrStruct.m_iAttrType = suitConf.iAddType;
               recipesAttrStruct.m_aryCardId = ["0xF00001"];
               recipesAttrStruct.m_iValue = suitConf.iAddValue;
               recipesPostInfo.m_iRecipesId = 30000000 + 2;
               recipesPostInfo.m_aryAttrInfo.push(recipesAttrStruct);
               return recipesPostInfo;
            }
         }
         return null;
      }
      
      public function setFlyEffectGlobalPoint(point:Point) : void
      {
         this.flyEffectGlobalPt = point;
      }
      
      public function getFlyEffectGlobalPoint() : Point
      {
         return this.flyEffectGlobalPt;
      }
      
      public function requestHandbookTypeData(roleID:int, type:int, platform:int, group:int, targetUin:int) : void
      {
         a_2161.e.RequestHandbookTypeData(roleID,type,platform,group,targetUin);
      }
      
      public function requestHandbookLightOrReceive(type:int, opt:int, awardType:int, awardLevel:int, activeCards:Array) : void
      {
         var role:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         a_2161.e.RequestHandbookLightOrReceive(role.m_iRoleUin,opt,type,awardType,awardLevel,activeCards);
      }
   }
}

