package com.aurora.ui.maogoutd.worldBossLevel
{
   import a_4716.EnmPlatform;
   import com.aurora.ui.maogoutd.PayAward.AwardData;
   import com.aurora.ui.maogoutd.component.ItemAttConf;
   import com.aurora.ui.maogoutd.worldBossLevel.conf.WorldBossBossConf;
   import com.aurora.ui.maogoutd.worldBossLevel.conf.WorldBossConf;
   import com.aurora.ui.maogoutd.worldBossLevel.conf.WorldBossSeasonConf;
   import com.aurora.ui.maogoutd.worldBossLevel.conf.WorldBossShopItemConf;
   import com.aurora.ui.maogoutd.worldBossLevel.conf.WorldBossSkillConf;
   import com.aurora.ui.maogoutd.worldBossLevel.conf.WorldBossSystemMsgConf;
   import flash.utils.Dictionary;
   
   public class AnalysisWorldBossXml
   {
      
      private static var a_921:AnalysisWorldBossXml;
      
      private var openLevel:int;
      
      private var reasonDic:Dictionary;
      
      private var shopDic:Dictionary;
      
      private var summaryDic:Dictionary;
      
      private var seasonShopRule:String;
      
      private var worldBossRule:String;
      
      private var worldBossDic:Dictionary;
      
      private var autoScrollCD:int;
      
      private var fastPKRule:String;
      
      private var fastPKCostItemID:int;
      
      private var fastPKAnimationPlayTm:int;
      
      private var fastPKAwardPreview:Array;
      
      private var transRuleMsg:String;
      
      private var systemMsg:WorldBossSystemMsgConf;
      
      public function AnalysisWorldBossXml()
      {
         super();
      }
      
      public static function GetInstance() : AnalysisWorldBossXml
      {
         if(null == a_921)
         {
            a_921 = new AnalysisWorldBossXml();
         }
         return a_921;
      }
      
      public function getOpenRoleLevel() : int
      {
         return this.openLevel;
      }
      
      public function getPlat(platId:int) : String
      {
         var platName:String = EnmPlatform.PLAT_JOYYOU;
         if(platId == 3)
         {
            platName = EnmPlatform.PLAT_4399;
         }
         else if(platId == 4)
         {
            platName = EnmPlatform.PLAT_QQ;
         }
         else if(platId == 5)
         {
            platName = EnmPlatform.PLAT_3366;
         }
         else if(platId == 6)
         {
            platName = EnmPlatform.PLAT_7K7K;
         }
         else if(platId == 11)
         {
            platName = EnmPlatform.PLAT_QQGAME;
         }
         return platName;
      }
      
      public function getSeasonData(seasonId:int) : WorldBossSeasonConf
      {
         if(this.reasonDic[seasonId])
         {
            return this.reasonDic[seasonId];
         }
         return null;
      }
      
      public function getSeasonDataByTm(serverTm:Number) : WorldBossSeasonConf
      {
         var seasonCfg:WorldBossSeasonConf = null;
         var key:String = null;
         for(key in this.reasonDic)
         {
            seasonCfg = this.reasonDic[key];
            if(serverTm >= seasonCfg.startTm && serverTm <= seasonCfg.endTm)
            {
               return seasonCfg;
            }
         }
         return null;
      }
      
      public function getWorldBossDic() : Dictionary
      {
         return this.worldBossDic;
      }
      
      public function getAutoScrollCD() : int
      {
         return Math.max(1,this.autoScrollCD);
      }
      
      public function getSeasonShop() : Dictionary
      {
         return this.shopDic;
      }
      
      public function getSeasonShopByType(type:int) : Array
      {
         if(this.shopDic.hasOwnProperty(type))
         {
            return this.shopDic[type];
         }
         return [];
      }
      
      public function getSeasonShopRule() : String
      {
         return this.seasonShopRule;
      }
      
      public function getWorldBossBuff(bossId:int) : Array
      {
         var worldBossConf:WorldBossConf = null;
         var list:Array = [];
         if(Boolean(this.worldBossDic) && Boolean(this.worldBossDic[bossId]))
         {
            worldBossConf = this.worldBossDic[bossId];
            if(worldBossConf)
            {
               list = worldBossConf.buffs;
            }
         }
         return list;
      }
      
      public function getBossListInWorldBoss(worldBossId:String) : Array
      {
         var worldBossConf:WorldBossConf = null;
         var list:Array = [];
         if(this.worldBossDic[worldBossId])
         {
            worldBossConf = this.worldBossDic[worldBossId];
            if(worldBossConf)
            {
               list = worldBossConf.bossList;
            }
         }
         return list;
      }
      
      public function getWorldBossRule() : String
      {
         return this.worldBossRule;
      }
      
      public function getSummary() : Dictionary
      {
         return this.summaryDic;
      }
      
      public function getSystemMsgSet() : WorldBossSystemMsgConf
      {
         return this.systemMsg;
      }
      
      public function getFastPKRule() : String
      {
         return this.fastPKRule;
      }
      
      public function getFastPKAwardPreview() : Array
      {
         return this.fastPKAwardPreview;
      }
      
      public function getFastPKCostItemID() : int
      {
         return this.fastPKCostItemID;
      }
      
      public function getFastPKAnimationPlayTm() : int
      {
         return this.fastPKAnimationPlayTm;
      }
      
      public function getTransRuleDes() : String
      {
         return this.transRuleMsg;
      }
      
      public function AnalysisShopXML(xml:XML) : void
      {
         var itemTypeXml:XML = null;
         var seasonCfg:WorldBossSeasonConf = null;
         var ruleDes:String = null;
         var ruleXml:XML = null;
         var itemsList:Array = null;
         var id:int = 0;
         var itemXml:XML = null;
         var itemConf:WorldBossShopItemConf = null;
         var propConf:ItemAttConf = null;
         this.shopDic = new Dictionary(true);
         for each(itemTypeXml in xml.items)
         {
            itemsList = [];
            id = int(itemTypeXml.@id);
            for each(itemXml in itemTypeXml.item)
            {
               itemConf = new WorldBossShopItemConf();
               itemConf.id = itemXml.@id;
               itemConf.currencyType = itemXml.@currencyType;
               itemConf.currencyPrice = itemXml.@currencyPrice;
               itemConf.limitBuyCnt = itemXml.@limitBuyCnt;
               itemConf.maxBuyCnt = itemXml.@maxBuyCnt;
               propConf = new ItemAttConf();
               propConf.AnalysisXML(itemXml);
               itemConf.itemAttConf = propConf;
               itemsList.push(itemConf);
            }
            this.shopDic[id] = itemsList;
         }
         ruleDes = "";
         for each(ruleXml in xml.rule.row)
         {
            if(ruleDes != "")
            {
               ruleDes += "\n";
               if(ruleXml.@color)
               {
                  ruleDes += "<font color= \'" + ruleXml.@color + "\'>" + ruleXml.@des + "</font>";
               }
               else
               {
                  ruleDes += ruleXml.@des;
               }
            }
            else if(ruleXml.@color)
            {
               ruleDes = "<font color= \'" + ruleXml.@color + "\'>" + ruleXml.@des + "</font>";
            }
            else
            {
               ruleDes = ruleXml.@des;
            }
         }
         this.seasonShopRule = ruleDes;
      }
      
      public function AnalysisXML(xml:XML) : void
      {
         var seasonXml:XML = null;
         var seasonCfg:WorldBossSeasonConf = null;
         var contentXml:XML = null;
         var dayStart:String = null;
         var dayEnd:String = null;
         var dayStartAry:Array = null;
         var dayEndAry:Array = null;
         var duanweiXml:XML = null;
         var awardXml:XML = null;
         var worldBossListXml:XML = null;
         var worldBossItemXml:XML = null;
         var worldBossConf:WorldBossConf = null;
         var buffInfo:String = null;
         var bossXml:XML = null;
         var bossConf:WorldBossBossConf = null;
         var skillXml:XML = null;
         var skillConf:WorldBossSkillConf = null;
         var id:int = 0;
         var list:Array = null;
         var itemXml:XML = null;
         var fastPKRuleDes:String = null;
         var fastPKXml:XML = null;
         var defColor:String = null;
         var fastPKRuleRowXml:XML = null;
         var rewardPreviewPropXml:XML = null;
         var propXml:XML = null;
         var propConf:AwardData = null;
         var transRuleDes:String = null;
         var transXml:XML = null;
         var transDefColor:String = null;
         var transRuleRow:XML = null;
         var worldBossRuleXml:XML = null;
         var ruleDes:String = null;
         var ruleRowXml:XML = null;
         this.reasonDic = new Dictionary(true);
         this.openLevel = xml.base.open.@needLevel;
         for each(seasonXml in xml.season)
         {
            seasonCfg = new WorldBossSeasonConf();
            seasonCfg.reasonId = seasonXml.@id;
            seasonCfg.reasonName = seasonXml.@name;
            seasonCfg.startTm = Number(seasonXml.@startTm);
            seasonCfg.endTm = Number(seasonXml.@endTm);
            seasonCfg.accountStartTm = Number(seasonXml.@accountStartTm);
            seasonCfg.previewTm = seasonXml.@previewTm;
            dayStart = seasonXml.@dayPkStartTm;
            dayEnd = seasonXml.@dayPkEndTm;
            dayStartAry = dayStart.split(":");
            seasonCfg.dayPkStartHour = dayStartAry[0];
            seasonCfg.dayPkStartMinute = dayStartAry[1];
            dayEndAry = dayEnd.split(":");
            seasonCfg.dayPkEndHour = dayEndAry[0];
            seasonCfg.dayPkEndMinute = dayEndAry[1];
            seasonCfg.speakerId = seasonXml.speaker.@id;
            for each(duanweiXml in seasonXml.duanwei)
            {
               seasonCfg.AddDuanweiItem(duanweiXml);
            }
            for each(awardXml in seasonXml.awards)
            {
               seasonCfg.AddAwardItem(awardXml);
            }
            this.reasonDic[seasonCfg.reasonId] = seasonCfg;
         }
         if(xml.base.worldBossList.length() > 0)
         {
            worldBossListXml = xml.base.worldBossList[0];
            this.autoScrollCD = worldBossListXml.@autoScrollCD;
            this.worldBossDic = new Dictionary(true);
            for each(worldBossItemXml in worldBossListXml.worldBoss)
            {
               worldBossConf = new WorldBossConf();
               worldBossConf.id = worldBossItemXml.@id;
               worldBossConf.name = worldBossItemXml.@name;
               worldBossConf.icon = worldBossItemXml.@icon;
               worldBossConf.story = worldBossItemXml.@story;
               worldBossConf.previewOpen = int(worldBossItemXml.@previewOpen) > 0;
               worldBossConf.trainOpen = int(worldBossItemXml.@trainOpen) > 0;
               worldBossConf.trainSort = int(worldBossItemXml.@trainSort);
               buffInfo = worldBossItemXml.@buffs;
               if(buffInfo)
               {
                  worldBossConf.buffs = buffInfo.split(",");
               }
               for each(bossXml in worldBossItemXml.boss)
               {
                  bossConf = new WorldBossBossConf();
                  bossConf.id = bossXml.@id;
                  bossConf.stateName = bossXml.@stateName;
                  for each(skillXml in bossXml.skill)
                  {
                     skillConf = new WorldBossSkillConf();
                     skillConf.name = skillXml.@name;
                     skillConf.des = skillXml.@des;
                     bossConf.skill.push(skillConf);
                  }
                  worldBossConf.bossList.push(bossConf);
               }
               this.worldBossDic[worldBossConf.id] = worldBossConf;
            }
         }
         var systemMsgSet:XML = xml.base.systemMsgSet[0];
         this.systemMsg = new WorldBossSystemMsgConf();
         this.systemMsg.noticeDailyPKEndTm = systemMsgSet.@noticeDailyPKEndTm;
         this.systemMsg.noticeAccountTm = systemMsgSet.@noticeAccountTm;
         this.systemMsg.noticeReceiveAwardTm = systemMsgSet.@noticeReceiveAwardTm;
         this.summaryDic = new Dictionary(true);
         var summaryXml:XML = xml.base.summary[0];
         for each(contentXml in summaryXml.content)
         {
            id = int(contentXml.@id);
            if(!this.summaryDic.hasOwnProperty(id))
            {
               this.summaryDic[id] = [];
            }
            list = this.summaryDic[id];
            for each(itemXml in contentXml.item)
            {
               list.push(itemXml.toString());
            }
         }
         if(xml.base.fastPK.length() > 0)
         {
            fastPKRuleDes = "";
            fastPKXml = xml.base.fastPK[0];
            defColor = fastPKXml.rule.@baseColor;
            for each(fastPKRuleRowXml in fastPKXml.rule.row)
            {
               if(fastPKRuleDes != "")
               {
                  fastPKRuleDes += "\n";
               }
               fastPKRuleDes += fastPKRuleRowXml.toString();
            }
            this.fastPKRule = "<font color= \'" + defColor + "\'>" + fastPKRuleDes + "</font>";
            this.fastPKCostItemID = fastPKXml.costItem[0].@id;
            this.fastPKAnimationPlayTm = fastPKXml.animation[0].@playTm;
         }
         if(xml.base.rewardPreview.length() > 0)
         {
            this.fastPKAwardPreview = [];
            rewardPreviewPropXml = xml.base.rewardPreview[0];
            for each(propXml in rewardPreviewPropXml.item)
            {
               propConf = new AwardData();
               propConf.AnalysisXML(propXml);
               this.fastPKAwardPreview.push(propConf);
            }
         }
         if(xml.base.train.length() > 0)
         {
            transRuleDes = "";
            transXml = xml.base.train[0];
            transDefColor = transXml.rule.@baseColor;
            for each(transRuleRow in transXml.rule.row)
            {
               if(transRuleDes != "")
               {
                  transRuleDes += "\n";
               }
               transRuleDes += transRuleRow.toString();
            }
            this.transRuleMsg = "<font color= \'" + transDefColor + "\'>" + transRuleDes + "</font>";
         }
         if(xml.base.worldBossRule.length() > 0)
         {
            worldBossRuleXml = xml.base.worldBossRule[0];
            ruleDes = "";
            for each(ruleRowXml in worldBossRuleXml.row)
            {
               if(ruleDes != "")
               {
                  ruleDes += "\n";
                  if(ruleRowXml.@color)
                  {
                     ruleDes += "<font color= \'" + ruleRowXml.@color + "\'>" + ruleRowXml.@des + "</font>";
                  }
                  else
                  {
                     ruleDes += ruleRowXml.@des;
                  }
               }
               else if(ruleRowXml.@color)
               {
                  ruleDes = "<font color= \'" + ruleRowXml.@color + "\'>" + ruleRowXml.@des + "</font>";
               }
               else
               {
                  ruleDes = ruleRowXml.@des;
               }
            }
            this.worldBossRule = ruleDes;
         }
      }
   }
}

