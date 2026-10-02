package com.aurora.ui.maogoutd.compose
{
   import a_4754.a_2161;
   import flash.utils.Dictionary;
   
   public class ComposeConfig
   {
      
      private static var _instance:ComposeConfig;
      
      private static var sign:Boolean;
      
      private var configData:XML;
      
      private var protectLevel:int = -100;
      
      private var openLevel:int = -100;
      
      private var vipRate:Number = -100;
      
      private var gemInLayGold:Number = -100;
      
      private var m_aryCanSlotItem:Array;
      
      private var m_TransferCardMap:Dictionary = new Dictionary();
      
      public function ComposeConfig()
      {
         super();
         if(!sign)
         {
            throw new Error("ComposeConfig不允许实例化，请通过getInstance()获取！");
         }
      }
      
      public static function getInstance() : ComposeConfig
      {
         if(_instance == null)
         {
            sign = true;
            _instance = new ComposeConfig();
            sign = false;
         }
         return _instance;
      }
      
      public function setConfigData(xml:XML) : void
      {
         this.configData = xml;
         this.buildTransferCardMap(this.configData);
      }
      
      public function getProtectLevel() : int
      {
         if(this.protectLevel == -100)
         {
            this.protectLevel = this.configData..ProtectLevel[0].@value;
         }
         return this.protectLevel;
      }
      
      public function getOpenLevel() : int
      {
         if(this.openLevel == -100)
         {
            this.openLevel = this.configData..OpenLevel[0].@value;
         }
         return this.openLevel;
      }
      
      public function getVIPRate() : Number
      {
         var level:Number = NaN;
         var xmllist:XMLList = null;
         level = Number(a_2161.e.GetPlayerCommon().m_stVIP.getVipLevel());
         xmllist = this.configData..VIPRate.item.(@lv == int(level));
         this.vipRate = Number(xmllist[0].@value);
         return this.vipRate;
      }
      
      public function getGemInLayGold() : Number
      {
         if(this.gemInLayGold == -100)
         {
            this.gemInLayGold = this.configData..GemInLay[0].@gold;
         }
         return this.gemInLayGold;
      }
      
      public function getConsortiaExtraItem(level:int) : XML
      {
         var xmlList:XMLList = null;
         xmlList = this.configData..ConsortiaExtra.Item.(@lv == level);
         if(Boolean(xmlList) && xmlList.length() > 0)
         {
            return xmlList[0];
         }
         return null;
      }
      
      public function getAssistantItem(id:int) : XML
      {
         var xmlList:XMLList = null;
         xmlList = this.configData..Assistant..Item.(@id == toString16(id));
         if(Boolean(xmlList) && xmlList.length() > 0)
         {
            return xmlList[0];
         }
         return null;
      }
      
      public function getSameTypeAssistantItem(id:int) : XML
      {
         var sameItem:XMLList;
         var targetItem:XML = null;
         var i:int = 0;
         var n:int = 0;
         targetItem = this.getAssistantItem(id);
         if(!targetItem)
         {
            return null;
         }
         sameItem = targetItem.parent().Item.(@value == targetItem.@value);
         if(!sameItem)
         {
            return null;
         }
         i = 0;
         n = sameItem.length();
         while(i < n)
         {
            if(targetItem.@id != sameItem[i].@id)
            {
               return sameItem[i];
            }
            i++;
         }
         return null;
      }
      
      public function getAward(id:int) : XML
      {
         var xmlList:XMLList = null;
         var MaterialItem:XML = null;
         xmlList = this.configData..Compose.Rule.Award.(@id == toString16(id));
         if(Boolean(xmlList) && xmlList.length() > 0)
         {
            return xmlList[0];
         }
         MaterialItem = this.getMaterial(id);
         if(MaterialItem)
         {
            return MaterialItem.parent().Award[0];
         }
         return null;
      }
      
      public function getMaterial(id:int) : XML
      {
         var xmlList:XMLList = null;
         xmlList = this.configData..Material.Expressions.(@id == toString16(id));
         if(Boolean(xmlList) && xmlList.length() > 0)
         {
            return xmlList[0].parent();
         }
         return null;
      }
      
      public function getMaterialsID(id:int) : Array
      {
         var MaterialXML:XML = this.getMaterial(id);
         if(!MaterialXML)
         {
            return [];
         }
         var Items:XMLList = MaterialXML.Items.Item;
         if(!Items)
         {
            return null;
         }
         var a:Array = [];
         var i:int = 0;
         var n:int = Items.length();
         while(i < n)
         {
            a.push(parseInt(Items[i].@id));
            i++;
         }
         return a;
      }
      
      public function getTransferCard(id:int) : XML
      {
         var xmlList:XMLList = this.configData..Translate;
         xmlList = xmlList.Material;
         xmlList = xmlList.raw_item.(@id == toString16(id));
         if(Boolean(xmlList) && xmlList.length() > 0)
         {
            return xmlList[0].parent().parent();
         }
         return null;
      }
      
      public function buildTransferCardMap(configData:XML) : void
      {
         var node:XML = null;
         var materialNode:XML = null;
         var id:int = 0;
         var id2:int = 0;
         var xmlList:XMLList = configData..Translate;
         for each(node in xmlList)
         {
            id = parseInt(node.@id,16);
            this.m_TransferCardMap[id] = true;
         }
         for each(materialNode in xmlList.Material.raw_item)
         {
            id2 = parseInt(materialNode.@id,16);
            this.m_TransferCardMap[id2] = true;
         }
      }
      
      public function isTransferCard(id:int) : Boolean
      {
         return this.m_TransferCardMap[id] == true;
      }
      
      public function getTransferCardID(id:int) : Array
      {
         var TransferCardXML:XML = this.getTransferCard(id);
         TransferCardXML = TransferCardXML.Material[0];
         if(!TransferCardXML)
         {
            return [];
         }
         var Items:XMLList = TransferCardXML.Items.Item;
         if(!Items)
         {
            return null;
         }
         var a:Array = [];
         var i:int = 0;
         var n:int = Items.length();
         while(i < n)
         {
            a.push(parseInt(Items[i].@id));
            i++;
         }
         return a;
      }
      
      public function getTransferCardInfo(id:int) : Object
      {
         var cardInfo:Object = {};
         var TransferCardXML:XML = this.getTransferCard(id);
         if(TransferCardXML == null)
         {
            return null;
         }
         cardInfo.new_card_id = Number(TransferCardXML.Material.raw_item.@id);
         cardInfo.gold = Number(TransferCardXML.@gold);
         cardInfo.insurance = Number(TransferCardXML.@insurance);
         cardInfo.minlevel = Number(TransferCardXML.@minlevel);
         cardInfo.probability = Number(TransferCardXML.@probability);
         cardInfo.pingzhengs = this.getTransferCardID(id);
         return cardInfo;
      }
      
      public function getUpgradeRate(mainLevel:int, subID:int, subLevel:int) : Number
      {
         var groupLevel:XML;
         var LevelXML:XML = null;
         var GroupXML:XMLList = null;
         var RateXML:XMLList = null;
         LevelXML = this.getUpgradeLevel(mainLevel);
         if(!LevelXML)
         {
            return 0;
         }
         groupLevel = this.getCardLevel(subID);
         if(!groupLevel)
         {
            return 0;
         }
         GroupXML = LevelXML..Group.(@id == groupLevel.@id);
         if(!GroupXML)
         {
            return 0;
         }
         RateXML = GroupXML.Rate.(@lv == subLevel);
         if(!RateXML)
         {
            return 0;
         }
         return RateXML[0].@value;
      }
      
      public function getDiscount() : Number
      {
         var discount:Number = 100;
         var discountXML:XML = this.configData.Discount.data[0];
         if(discountXML)
         {
            discount = Number(discountXML.@value);
         }
         return discount;
      }
      
      public function getDiscountTime(type:int) : Date
      {
         var timeStr:String = null;
         var discountXML:XML = this.configData.Discount.data[0];
         if(!discountXML)
         {
            return null;
         }
         if(type == 1)
         {
            timeStr = String(discountXML.@begin);
         }
         else
         {
            timeStr = String(discountXML.@end);
         }
         var tmpArr:Array = timeStr.split(" ");
         var dateArr:Array = tmpArr[0].split("-");
         var timerArr:Array = tmpArr[1].split(":");
         return new Date(dateArr[0],int(dateArr[1]) - 1,dateArr[2],timerArr[0],timerArr[1],timerArr[2]);
      }
      
      public function getUpgradeInsurance(mainLevel:int) : Number
      {
         var LevelXML:XML = this.getUpgradeLevel(mainLevel);
         if(!LevelXML)
         {
            return 10000;
         }
         return Number(LevelXML.@insurance);
      }
      
      public function getUpgradeLevel(level:int) : XML
      {
         var xmlList:XMLList = null;
         xmlList = this.configData..Upgrade.Level.(@lv == level);
         if(Boolean(xmlList) && xmlList.length() > 0)
         {
            return xmlList[0];
         }
         return null;
      }
      
      public function getRecomposeItem(level:int) : XML
      {
         var xmlList:XMLList = null;
         xmlList = this.configData..Recompose.Item.(@lv == level);
         if(Boolean(xmlList) && xmlList.length() > 0)
         {
            return xmlList[0];
         }
         return null;
      }
      
      public function getXMLNodeAttributeValue(node:XML, name:String) : *
      {
         return node.@name;
      }
      
      public function getOpenslotItem(slotPosition:int) : XML
      {
         var xmlList:XMLList = null;
         xmlList = this.configData..Openslot.Item.(@index == slotPosition);
         if(Boolean(xmlList) && xmlList.length() > 0)
         {
            return xmlList[0];
         }
         return null;
      }
      
      public function getGemUpgradeItem(level:int) : XML
      {
         var xmlList:XMLList = null;
         xmlList = this.configData..GemUpgrade.Item.(@lv == level);
         if(Boolean(xmlList) && xmlList.length() > 0)
         {
            return xmlList[0];
         }
         return null;
      }
      
      public function getGemUpgradeInsurance(level:int) : Number
      {
         var xml:XML = this.getGemUpgradeItem(level);
         if(!xml)
         {
            return 10000;
         }
         return Number(xml.@insurance);
      }
      
      public function getGemDecomposeItem(level:int) : XML
      {
         var xmlList:XMLList = null;
         xmlList = this.configData..GemDecompose.Item.(@lv == level);
         if(Boolean(xmlList) && xmlList.length() > 0)
         {
            return xmlList[0];
         }
         return null;
      }
      
      public function getGemItem(id:int) : XML
      {
         var xmlList:XMLList = null;
         xmlList = this.configData..Gem.Item.(@id == toString16(id));
         if(Boolean(xmlList) && xmlList.length() > 0)
         {
            return xmlList[0];
         }
         return null;
      }
      
      public function gemInlayAble(gemID:int, weaponID:int) : Boolean
      {
         var strID:String = null;
         var gemItem:XML = this.getGemItem(gemID);
         if(!gemItem)
         {
            return false;
         }
         if((weaponID == 336724736 || weaponID == 336664576 || weaponID == 336724784) && gemID == 343986192)
         {
            return false;
         }
         var strWeaponID:String = this.toString16(weaponID);
         var aryWeapon:Array = gemItem.@mosaic.toString().split("|");
         for(var i:int = 0; i < aryWeapon.length; i++)
         {
            strID = aryWeapon[i];
            if(strID == "")
            {
               return false;
            }
            if(strWeaponID == strID)
            {
               return true;
            }
         }
         return false;
      }
      
      public function getInlayEnableGems(weaponID:int) : Array
      {
         var gemID:int = 0;
         var a:Array = [];
         var gemItems:XMLList = this.configData..Gem.Item;
         var i:int = 0;
         var n:int = gemItems.length();
         while(i < n)
         {
            gemID = parseInt(gemItems[i].@id);
            if(!this.gemInlayAble(gemID,weaponID))
            {
               a.push(gemID);
            }
            i++;
         }
         return a;
      }
      
      public function GetCanSlotItem() : Array
      {
         var szItemID:String = null;
         if(!this.m_aryCanSlotItem)
         {
            szItemID = this.configData..WeaponSlot[0].@able;
            this.m_aryCanSlotItem = szItemID.split("|");
         }
         return this.m_aryCanSlotItem;
      }
      
      private function getCardLevel(id:int) : XML
      {
         var xmlList:XMLList = null;
         xmlList = this.configData..Groups.Group.Item.(@id == toString16(id));
         if(Boolean(xmlList) && xmlList.length() > 0)
         {
            return xmlList[0].parent();
         }
         return null;
      }
      
      private function toString16(value:int) : String
      {
         return "0x" + value.toString(16);
      }
   }
}

