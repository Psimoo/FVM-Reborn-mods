package com.aurora.ui.maogoutd.handbook.model
{
   import com.aurora.ui.maogoutd.PayAward.AwardData;
   import flash.utils.Dictionary;
   
   public class HandbookConfigData
   {
      
      private static var m_pInstance:HandbookConfigData;
      
      public var m_vCardHandbook:Vector.<CardHandbookData>;
      
      public var m_vSuitHandbook:Vector.<SuitHandbookData>;
      
      public var m_vCookeryHandbook:Vector.<HandbookCookeryData>;
      
      public var m_vAward:Vector.<HandbookDataAward>;
      
      public var m_vTotalProgress:Vector.<HandbookProgressLevelItemData>;
      
      public var m_dTypeProgressDic:Dictionary;
      
      public var m_arrMenuData:Array;
      
      public function HandbookConfigData()
      {
         super();
      }
      
      public static function Get() : HandbookConfigData
      {
         if(!m_pInstance)
         {
            m_pInstance = new HandbookConfigData();
         }
         return m_pInstance;
      }
      
      public function a_2040(xml:XML) : void
      {
         var typeProg:XML = null;
         var classifyProg:XML = null;
         var vCardHandbook:CardHandbookData = null;
         var vSuitHandbook:SuitHandbookData = null;
         var vCookery:HandbookCookeryData = null;
         var vAward:HandbookDataAward = null;
         if(!xml)
         {
            return;
         }
         var data:XML = null;
         this.m_arrMenuData = this.ParseMenuRoot(xml.menu);
         this.m_vCardHandbook = new Vector.<CardHandbookData>();
         for each(data in xml.cardhandbook.item)
         {
            vCardHandbook = new CardHandbookData();
            vCardHandbook.iID = int(data.@id);
            vCardHandbook.iItemID = int(data.@itemid);
            vCardHandbook.sItemName = String(data.@itemname);
            vCardHandbook.iType = int(data.@type);
            vCardHandbook.iClassify = int(data.@classify);
            vCardHandbook.iTransID = int(data.@transid);
            vCardHandbook.iTransType = int(data.@transtype);
            vCardHandbook.iNeedNum = int(data.@neednum);
            vCardHandbook.iAddType = int(data.@addtype);
            vCardHandbook.iAddValue = Number(data.@addvalue);
            vCardHandbook.sTypeDesc = String(data.@typedesc);
            vCardHandbook.sEnergyDesc = String(data.@energydesc);
            vCardHandbook.sAreaDesc = String(data.@areadesc);
            vCardHandbook.sAddDesc = String(data.@adddesc);
            vCardHandbook.sAbilityDesc = String(data.@abilitydesc);
            vCardHandbook.sGetwayDesc = String(data.@getwaydesc);
            vCardHandbook.sSkilldesc = String(data.@skilldesc);
            vCardHandbook.iTransID_1 = int(data.@transid_1);
            vCardHandbook.sGrowthDesc = String(data.@growthdesc);
            vCardHandbook.sBaseFusion = String(data.@baseFusion);
            vCardHandbook.iFinalFusion = int(data.@finalFusion);
            vCardHandbook.iNeedSkillLevel = int(data.@needSkillLevel);
            vCardHandbook.iNeedCrystalLevel = int(data.@needCrystalLevel);
            vCardHandbook.iNeedFusionQualityLevel = int(data.@needFusionQualityLevel);
            vCardHandbook.iCardCollectPt = int(data.@cardCollectPt);
            vCardHandbook.iSkillCollectPt = int(data.@skillCollectPt);
            vCardHandbook.iCrystalCollectPt = int(data.@crystalCollectPt);
            vCardHandbook.iFusionQualityLevelPt = int(data.@fusionQualityLevelPt);
            this.m_vCardHandbook.push(vCardHandbook);
         }
         this.m_vSuitHandbook = new Vector.<SuitHandbookData>();
         for each(data in xml.suithandbook.item)
         {
            vSuitHandbook = new SuitHandbookData();
            vSuitHandbook.iID = int(data.@id);
            vSuitHandbook.iItemID = int(data.@itemid);
            vSuitHandbook.sItemName = String(data.@itemname);
            vSuitHandbook.iClassify = int(data.@classify);
            vSuitHandbook.iNeedNum = int(data.@neednum);
            vSuitHandbook.iAddType = int(data.@addtype);
            vSuitHandbook.iAddValue = int(data.@addvalue);
            vSuitHandbook.iSex = int(data.@sex);
            vSuitHandbook.sHPDesc = String(data.@hpdesc);
            vSuitHandbook.sUptimeDesc = String(data.@uptimedesc);
            vSuitHandbook.sSuitDesc = String(data.@suitdesc);
            vSuitHandbook.sGetWayDesc = String(data.@getwaydesc);
            vSuitHandbook.iCardCollectPt = int(data.@cardCollectPt);
            this.m_vSuitHandbook.push(vSuitHandbook);
         }
         this.m_vCookeryHandbook = new Vector.<HandbookCookeryData>();
         for each(data in xml.cookery.item)
         {
            vCookery = new HandbookCookeryData();
            vCookery.iID = int(data.@id);
            vCookery.iItemID = int(data.@itemid);
            vCookery.iDishID = parseInt(data.@dishID);
            vCookery.sItemName = String(data.@itemname);
            vCookery.iType = int(data.@type);
            vCookery.iClassify = int(data.@classify);
            vCookery.iCardCollectPt = int(data.@cardCollectPt);
            this.m_vCookeryHandbook.push(vCookery);
         }
         this.m_vAward = new Vector.<HandbookDataAward>();
         for each(data in xml.award.item)
         {
            vAward = new HandbookDataAward();
            vAward.iID = int(data.@id);
            vAward.iItemID = int(data.@itemid);
            vAward.iNeedNum = int(data.@neednum);
            vAward.iType = int(data.@type);
            vAward.iTime = int(data.@time);
            vAward.iIsBind = int(data.@isBind);
            vAward.iAddValue = int(data.@addvalue);
            vAward.iAddExp = int(data.@addpveexp);
            vAward.iAddDroprate = int(data.@adddroprate);
            vAward.iAddProficiency = int(data.@addproficiency);
            vAward.iAddPvPExp = int(data.@addpvpexp);
            this.m_vAward.push(vAward);
         }
         this.m_vTotalProgress = new Vector.<HandbookProgressLevelItemData>();
         this.m_dTypeProgressDic = new Dictionary();
         if(xml.cardTotalProgress.length() > 0)
         {
            this.m_vTotalProgress = this.parseHandbookTotalProgressBlock(xml.cardTotalProgress[0]);
         }
         for each(typeProg in xml.typeProgress[0].cType)
         {
            this.m_dTypeProgressDic[int(typeProg.@id)] = this.parseHandbookTotalProgressBlock(typeProg);
         }
         for each(classifyProg in xml.classifyProgress[0].cType)
         {
            this.m_dTypeProgressDic[int(classifyProg.@id)] = this.parseHandbookTotalProgressBlock(classifyProg);
         }
      }
      
      private function parseHandbookTotalProgressBlock(blockXml:XML) : Vector.<HandbookProgressLevelItemData>
      {
         var itemData:HandbookProgressLevelItemData = null;
         var ix:XML = null;
         var elements:XMLList = null;
         var ex:XML = null;
         var aw:AwardData = null;
         var list:Vector.<HandbookProgressLevelItemData> = new Vector.<HandbookProgressLevelItemData>();
         var itemsXml:XMLList = blockXml.level;
         for each(ix in itemsXml)
         {
            itemData = new HandbookProgressLevelItemData();
            itemData.level = int(ix.@lv);
            itemData.minVal = int(ix.@minVal);
            itemData.maxVal = int(ix.@maxVal);
            itemData.awardIcon = String(ix.@awardIcon);
            itemData.topBGIcon = String(ix.@topBGIcon);
            elements = ix.item;
            for each(ex in elements)
            {
               aw = new AwardData();
               aw.AnalysisXML(ex);
               if(aw.m_iItemID > 0)
               {
                  itemData.awards.push(aw);
               }
            }
            list.push(itemData);
         }
         return list;
      }
      
      public function GetMenuData() : Array
      {
         return this.m_arrMenuData;
      }
      
      private function ParseMenuRoot(menuList:XMLList) : Array
      {
         var classsifyNode:XML = null;
         var subClassifyNode:XML = null;
         var itemXml:XML = null;
         var classifyNodeData:HandbookMenuNodeData = null;
         var subClassifyNodeData:HandbookMenuNodeData = null;
         var childNodeData:HandbookMenuNodeData = null;
         var classifyVector:Array = [];
         var menuNode:XML = menuList[0];
         for each(classsifyNode in menuNode.classify)
         {
            classifyNodeData = new HandbookMenuNodeData();
            classifyNodeData.id = classsifyNode.@id;
            classifyNodeData.name = classsifyNode.@name;
            classifyNodeData.enable = classsifyNode.@enable;
            classifyNodeData.classifyType = classsifyNode.@classifyType;
            classifyVector.push(classifyNodeData);
            for each(subClassifyNode in classsifyNode.subClassify)
            {
               subClassifyNodeData = new HandbookMenuNodeData();
               subClassifyNodeData.id = subClassifyNode.@id;
               subClassifyNodeData.name = subClassifyNode.@name;
               subClassifyNodeData.enable = subClassifyNode.@enable;
               subClassifyNodeData.classifyType = subClassifyNode.@classifyType;
               classifyNodeData.children.push(subClassifyNodeData);
               for each(itemXml in subClassifyNode.item)
               {
                  childNodeData = new HandbookMenuNodeData();
                  childNodeData.id = itemXml.@id;
                  childNodeData.name = itemXml.@name;
                  childNodeData.enable = itemXml.@enable;
                  childNodeData.classifyType = itemXml.@classifyType;
                  subClassifyNodeData.children.push(childNodeData);
               }
            }
         }
         return classifyVector;
      }
   }
}

