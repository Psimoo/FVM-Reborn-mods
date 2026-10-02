package com.aurora.ui.maogoutd.compose.crystal
{
   import flash.utils.Dictionary;
   
   public class CrystalXML
   {
      
      private static var m_pInstance:CrystalXML;
      
      public var m_vLevelConfigs:Vector.<CrystalLevelConfig>;
      
      private var m_vSlotsConfig:Vector.<CrystalSlotItemConfig>;
      
      public var m_vCompose:Vector.<CrystalComposeMaterialConfig>;
      
      public var m_vUpgradeStone:Vector.<CrystalUpgradeStoneConfig>;
      
      public var m_vUpgradeBuff:Vector.<CrystalUpgradeBuffConfig>;
      
      public var m_vDeComposeConfig:Vector.<CrystalDecomposeConfig>;
      
      public var m_vDecomposeCoin:Vector.<int>;
      
      public var m_dictEffectLevel:Dictionary;
      
      public var m_iComposeCost:int;
      
      public var m_iDecomposeCost:int;
      
      public var m_stRelationTreeConfig:RelationTreeConfig;
      
      public var m_arrSendCharmCostByCharm:Array;
      
      public var m_arrSendCharmCostByCoin:Array;
      
      public function CrystalXML()
      {
         super();
      }
      
      public static function Get() : CrystalXML
      {
         if(!m_pInstance)
         {
            m_pInstance = new CrystalXML();
         }
         return m_pInstance;
      }
      
      public function a_2040(xml:XML) : void
      {
         var item:XML = null;
         var child:XML = null;
         var stSlotItem:CrystalSlotItemConfig = null;
         var stLevel:CrystalLevelConfig = null;
         var stMaterial:CrystalComposeMaterialConfig = null;
         var iID:int = 0;
         var iLevel:int = 0;
         var stDecompose:CrystalDecomposeConfig = null;
         var stUpgrade:CrystalUpgradeStoneConfig = null;
         var stUpgradeBuff:CrystalUpgradeBuffConfig = null;
         var peritem:XML = null;
         var obj:Object = null;
         this.m_iComposeCost = xml.compose.@cost;
         this.m_iDecomposeCost = xml.decompose.@cost;
         this.m_vSlotsConfig = new Vector.<CrystalSlotItemConfig>();
         for each(item in xml.crystoneslot.slot)
         {
            stSlotItem = new CrystalSlotItemConfig();
            stSlotItem.id = item.@id;
            stSlotItem.needItem = item.@item;
            stSlotItem.count = item.@count;
            stSlotItem.needLevel = item.@level;
            this.m_vSlotsConfig.push(stSlotItem);
         }
         this.m_vLevelConfigs = new Vector.<CrystalLevelConfig>();
         for each(item in xml.levels.level)
         {
            stLevel = new CrystalLevelConfig();
            stLevel.m_iLevelID = item.@id;
            stLevel.m_iCharm = item.@charm;
            stLevel.m_iMaxCrystalLevel = item.@max_crystone_level;
            stLevel.m_iMaxCrystalCount = item.@max_crystone_count;
            this.m_vLevelConfigs.push(stLevel);
         }
         this.m_vCompose = new Vector.<CrystalComposeMaterialConfig>();
         this.m_dictEffectLevel = new Dictionary();
         for each(item in xml.compose.crystone_compose)
         {
            stMaterial = new CrystalComposeMaterialConfig();
            stMaterial.m_iRecipeID = item.@recipe;
            stMaterial.m_iMaterialIDOne = item.@mat1;
            stMaterial.m_iMaterialIDTwo = item.@mat2;
            this.m_vCompose.push(stMaterial);
            for each(child in item.crystone)
            {
               iID = int(child.@id);
               iLevel = int(child.@effect_level);
               this.m_dictEffectLevel[iID] = iLevel;
            }
         }
         this.m_vDeComposeConfig = new Vector.<CrystalDecomposeConfig>();
         for each(item in xml.decompose.crystone)
         {
            stDecompose = new CrystalDecomposeConfig();
            stDecompose.m_iID = item.@id;
            stDecompose.m_iCharmCoin = item.@charm_coin;
            this.m_vDeComposeConfig.push(stDecompose);
         }
         this.m_vDecomposeCoin = new Vector.<int>(16);
         for each(item in xml.dec_level.level)
         {
            iLevel = int(item.@id);
            this.m_vDecomposeCoin[iLevel] = int(item.@charm_coin);
         }
         this.m_vUpgradeStone = new Vector.<CrystalUpgradeStoneConfig>();
         for each(item in xml.upgrade.crystone_upgrade)
         {
            stUpgrade = new CrystalUpgradeStoneConfig();
            stUpgrade.m_iCost = item.@cost;
            stUpgrade.m_iOrigLevel = item.@orig_level;
            stUpgrade.m_iStoneID = item.@stone_id;
            stUpgrade.m_iStoneCount = item.@stone_count;
            stUpgrade.m_iDownLeven = item.@down_level;
            stUpgrade.m_iRate = item.@rate;
            stUpgrade.m_iSafeMoney = item.@safemoney;
            this.m_vUpgradeStone.push(stUpgrade);
         }
         this.m_vUpgradeBuff = new Vector.<CrystalUpgradeBuffConfig>();
         for each(item in xml.crystonebuff.buff)
         {
            stUpgradeBuff = new CrystalUpgradeBuffConfig();
            stUpgradeBuff.m_iBuffID = item.@id;
            stUpgradeBuff.m_iItemID = item.@itemid;
            stUpgradeBuff.m_arrEffect = [];
            for each(peritem in item.effect)
            {
               obj = {};
               obj.m_iAddRate = int(peritem.@addrate);
               obj.m_iStartLevel = int(peritem.@startlv);
               obj.m_iEndLevel = int(peritem.@endlv);
               stUpgradeBuff.m_arrEffect.push(obj);
            }
            this.m_vUpgradeBuff.push(stUpgradeBuff);
         }
         this.m_stRelationTreeConfig = new RelationTreeConfig();
         this.m_stRelationTreeConfig.m_iLowLevel = xml.RelationTree.@low_level;
         this.m_stRelationTreeConfig.m_iFreeFlowerNum = xml.RelationTree.@freeFlowerNum;
         this.m_stRelationTreeConfig.m_iFreeFlowerCharmGet = xml.RelationTree.@freeFlowerCharmGet;
         this.m_stRelationTreeConfig.m_iFreeSenderCharmGet = xml.RelationTree.@freeSenderCharmGet;
         this.m_stRelationTreeConfig.m_iSendFlowerCharmGet = xml.RelationTree.@sendFlowerCharmGet;
         this.m_stRelationTreeConfig.m_iSenderCharmGet = xml.RelationTree.@senderCharmGet;
         this.m_stRelationTreeConfig.m_iMaxWeeklyCharmGet = xml.RelationTree.@maxWeeklyCharmGet;
         this.m_stRelationTreeConfig.m_iSendCoinFlowerCharmGet = xml.RelationTree.@sendCoinFlowerCharmGet;
         this.m_stRelationTreeConfig.m_iCoinSenderCharmGet = xml.RelationTree.@coinSenderCharmGet;
         this.m_stRelationTreeConfig.m_iMaxWeeklyCoinCharmGet = xml.RelationTree.@maxWeeklyCoinCharmGet;
         this.m_arrSendCharmCostByCharm = [];
         for each(item in xml.RelationTree.sendCharmingFlowers.Charming)
         {
            this.m_arrSendCharmCostByCharm.push(int(item.@CharmCost));
         }
         this.m_arrSendCharmCostByCharm.sort(Array.NUMERIC);
         this.m_arrSendCharmCostByCoin = [];
         for each(item in xml.RelationTree.sendCoinFlowers.Coin)
         {
            this.m_arrSendCharmCostByCoin.push(int(item.@CoinCost));
         }
         this.m_arrSendCharmCostByCoin.sort(Array.NUMERIC);
      }
      
      public function GetCrystalBuff(iLevel:int) : CrystalUpgradeBuffConfig
      {
         if(iLevel >= 1 && iLevel <= this.m_vUpgradeBuff.length)
         {
            return this.m_vUpgradeBuff[iLevel - 1];
         }
         return this.m_vUpgradeBuff[0];
      }
      
      public function GeCurrentMaxLevel(iCharmValue:int) : int
      {
         var stLevelConfig:CrystalLevelConfig = null;
         var iMaxCrystalLevel:int = 0;
         var iMaxLevelID:int = 0;
         for each(stLevelConfig in this.m_vLevelConfigs)
         {
            if(stLevelConfig.m_iCharm < iCharmValue)
            {
               if(iMaxLevelID < stLevelConfig.m_iLevelID)
               {
                  iMaxLevelID = stLevelConfig.m_iLevelID;
                  iMaxCrystalLevel = stLevelConfig.m_iMaxCrystalLevel;
               }
            }
            else if(stLevelConfig.m_iCharm == iCharmValue)
            {
               iMaxLevelID = stLevelConfig.m_iLevelID;
               iMaxCrystalLevel = stLevelConfig.m_iMaxCrystalLevel;
               break;
            }
         }
         return iMaxCrystalLevel;
      }
      
      public function GetCharmeLevel(iCharmValue:int) : int
      {
         var stLevelConfig:CrystalLevelConfig = null;
         var iMaxLevelID:int = 0;
         for each(stLevelConfig in this.m_vLevelConfigs)
         {
            if(stLevelConfig.m_iCharm <= iCharmValue)
            {
               if(iMaxLevelID < stLevelConfig.m_iLevelID)
               {
                  iMaxLevelID = stLevelConfig.m_iLevelID;
               }
            }
         }
         return iMaxLevelID;
      }
      
      public function GetUpgradeConfig(iLevel:int) : CrystalUpgradeStoneConfig
      {
         var stUpgrade:CrystalUpgradeStoneConfig = null;
         for each(stUpgrade in this.m_vUpgradeStone)
         {
            if(stUpgrade.m_iOrigLevel == iLevel)
            {
               return stUpgrade;
            }
         }
         return null;
      }
      
      public function GetNextLowLevel(iCurrentLevel:int) : int
      {
         var stLevelConfig:CrystalLevelConfig = null;
         var iMaxLevel:int = 0;
         var iNextLowLevel:int = 1000;
         for each(stLevelConfig in this.m_vLevelConfigs)
         {
            if(stLevelConfig.m_iMaxCrystalLevel == iCurrentLevel + 1)
            {
               if(iNextLowLevel > stLevelConfig.m_iLevelID)
               {
                  iNextLowLevel = stLevelConfig.m_iLevelID;
               }
            }
            if(iMaxLevel < stLevelConfig.m_iMaxCrystalLevel)
            {
               iMaxLevel = stLevelConfig.m_iMaxCrystalLevel;
            }
         }
         if(iNextLowLevel > iMaxLevel)
         {
            return -1;
         }
         return iNextLowLevel;
      }
      
      public function GetDeComposeConfig(id:int) : CrystalDecomposeConfig
      {
         var stDecomposeConfig:CrystalDecomposeConfig = null;
         for each(stDecomposeConfig in this.m_vDeComposeConfig)
         {
            if(stDecomposeConfig.m_iID == id)
            {
               return stDecomposeConfig;
            }
         }
         return null;
      }
      
      public function GetRecipeConfig(id:int) : CrystalComposeMaterialConfig
      {
         var stMaterial:CrystalComposeMaterialConfig = null;
         for each(stMaterial in this.m_vCompose)
         {
            if(stMaterial.m_iRecipeID == id)
            {
               return stMaterial;
            }
         }
         return null;
      }
      
      public function GetSlotsByPage(page:int) : Array
      {
         var startIdx:int = 0;
         var endIdx:int = 0;
         var i:int = 0;
         var list:Array = [];
         if(page < 2)
         {
            return list;
         }
         startIdx = (page - 2) * 6;
         endIdx = startIdx + 6;
         for(i = startIdx; i < endIdx; i++)
         {
            list.push(this.m_vSlotsConfig[i]);
         }
         return list;
      }
   }
}

