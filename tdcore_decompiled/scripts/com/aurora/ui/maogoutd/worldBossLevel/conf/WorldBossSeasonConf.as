package com.aurora.ui.maogoutd.worldBossLevel.conf
{
   import com.aurora.ui.maogoutd.PayAward.AwardData;
   import flash.utils.Dictionary;
   
   public class WorldBossSeasonConf
   {
      
      public var reasonId:int;
      
      public var reasonName:String;
      
      public var startTm:Number;
      
      public var endTm:Number;
      
      public var accountStartTm:Number;
      
      public var previewTm:int;
      
      public var dayPkStartHour:int;
      
      public var dayPkStartMinute:int;
      
      public var dayPkEndHour:int;
      
      public var dayPkEndMinute:int;
      
      public var speakerId:int;
      
      public var worldBossDic:Dictionary;
      
      public var duanweiDic:Dictionary;
      
      public var awardDic:Dictionary;
      
      public function WorldBossSeasonConf()
      {
         super();
         this.duanweiDic = new Dictionary();
         this.awardDic = new Dictionary();
      }
      
      public function AddDuanweiItem(xml:XML) : void
      {
         var levelXml:XML = null;
         var duanweiLevel:WorldBossDuanweiConf = null;
         var qualityXml:XML = null;
         var qualityConf:WorldBossQualityConf = null;
         for each(levelXml in xml.level)
         {
            duanweiLevel = new WorldBossDuanweiConf();
            duanweiLevel.level = levelXml.@level;
            duanweiLevel.name = levelXml.@name;
            duanweiLevel.icon = levelXml.@icon;
            duanweiLevel.mapId = levelXml.@mapId;
            for each(qualityXml in levelXml.quality)
            {
               qualityConf = new WorldBossQualityConf();
               qualityConf.level = qualityXml.@level;
               qualityConf.name = qualityXml.@name;
               qualityConf.startPoint = qualityXml.@startPoint;
               qualityConf.endPoint = qualityXml.@endPoint;
               qualityConf.cardMinLevel = qualityXml.@cardMinLevel;
               qualityConf.cardMinLevelCnt = qualityXml.@cardMinLevelCnt;
               qualityConf.bossBloodAdd = qualityXml.@bossBloodAdd;
               qualityConf.bossBloodPer = qualityXml.@bossBloodPer;
               qualityConf.normalMouseBloodAdd = qualityXml.@normalMouseBloodAdd;
               qualityConf.normalMouseBloodPer = qualityXml.@normalMouseBloodPer;
               duanweiLevel.quality.push(qualityConf);
            }
            this.duanweiDic[duanweiLevel.level] = duanweiLevel;
         }
      }
      
      public function getRankAwardDic() : Dictionary
      {
         return this.awardDic;
      }
      
      public function AddAwardItem(xml:XML) : void
      {
         if(xml.userCrossServer.length() > 0)
         {
            this.AddUserRankAwardInfo(xml.userCrossServer[0]);
         }
         if(xml.userLocalServer.length() > 0)
         {
            this.AddUserRankAwardInfo(xml.userLocalServer[0]);
         }
         if(xml.userDuanwei.length() > 0)
         {
            this.AddDuanweiAward(xml.userDuanwei[0]);
         }
         if(xml.unionCrossServer.length() > 0)
         {
            this.AddUnionRankAwardInfo(xml.unionCrossServer[0]);
         }
         if(xml.unionLocalServer.length() > 0)
         {
            this.AddUnionRankAwardInfo(xml.unionLocalServer[0]);
         }
      }
      
      private function AddUserRankAwardInfo(xml:XML) : void
      {
         var itemsXml:XML = null;
         var itemsConf:WorldBossUserRankAwardConf = null;
         var propXml:XML = null;
         var propConf:AwardData = null;
         var awardsConf:WorldBossAwardTypeConf = new WorldBossAwardTypeConf();
         awardsConf.id = xml.@id;
         awardsConf.name = xml.@name;
         for each(itemsXml in xml.items)
         {
            itemsConf = new WorldBossUserRankAwardConf();
            itemsConf.id = itemsXml.@id;
            itemsConf.startRank = itemsXml.@startRank;
            itemsConf.endRank = itemsXml.@endRank;
            itemsConf.name = itemsXml.@name;
            for each(propXml in itemsXml.item)
            {
               propConf = new AwardData();
               propConf.AnalysisXML(propXml);
               itemsConf.awards.push(propConf);
            }
            awardsConf.keyDic[itemsConf.id] = itemsConf;
         }
         this.awardDic[awardsConf.id] = awardsConf;
      }
      
      private function AddDuanweiAward(xml:XML) : void
      {
         var itemsXml:XML = null;
         var itemsConf:WorldBossDuanweiAwardConf = null;
         var qualityXml:XML = null;
         var qualityConf:WorldBossQualityAwardConf = null;
         var propXml:XML = null;
         var propConf:AwardData = null;
         var awardsConf:WorldBossAwardTypeConf = new WorldBossAwardTypeConf();
         awardsConf.id = xml.@id;
         awardsConf.name = xml.@name;
         for each(itemsXml in xml.items)
         {
            itemsConf = new WorldBossDuanweiAwardConf();
            itemsConf.id = itemsXml.@level;
            itemsConf.name = itemsXml.@name;
            for each(qualityXml in itemsXml.quality)
            {
               qualityConf = new WorldBossQualityAwardConf();
               qualityConf.id = qualityXml.@level;
               qualityConf.name = qualityXml.@name;
               qualityConf.limitScrore = qualityXml.@limitScore;
               for each(propXml in qualityXml.item)
               {
                  propConf = new AwardData();
                  propConf.AnalysisXML(propXml);
                  qualityConf.awards.push(propConf);
               }
               itemsConf.qualityConf.push(qualityConf);
            }
            awardsConf.keyDic[itemsConf.id] = itemsConf;
         }
         this.awardDic[awardsConf.id] = awardsConf;
      }
      
      private function AddUnionRankAwardInfo(xml:XML) : void
      {
         var itemsXml:XML = null;
         var itemsConf:WorldBossUnionRankAwardConf = null;
         var memberRankXml:XML = null;
         var memberRankConf:WorldBossMemberInUnionRankAwardConf = null;
         var propXml:XML = null;
         var propConf:AwardData = null;
         var leaderXml:XML = null;
         var leaderPropXml:XML = null;
         var leaderPropConf:AwardData = null;
         var awardsConf:WorldBossAwardTypeConf = new WorldBossAwardTypeConf();
         awardsConf.id = xml.@id;
         awardsConf.name = xml.@name;
         for each(itemsXml in xml.items)
         {
            itemsConf = new WorldBossUnionRankAwardConf();
            itemsConf.id = itemsXml.@id;
            itemsConf.startRank = itemsXml.@startRank;
            itemsConf.endRank = itemsXml.@endRank;
            itemsConf.name = itemsXml.@name;
            for each(memberRankXml in itemsXml.memberRank)
            {
               memberRankConf = new WorldBossMemberInUnionRankAwardConf();
               memberRankConf.startRank = memberRankXml.@startRank;
               memberRankConf.endRank = memberRankXml.@endRank;
               memberRankConf.name = memberRankXml.@name;
               for each(propXml in memberRankXml.item)
               {
                  propConf = new AwardData();
                  propConf.AnalysisXML(propXml);
                  memberRankConf.awards.push(propConf);
               }
               itemsConf.memberRank.push(memberRankConf);
            }
            if(itemsXml.leader.length() > 0)
            {
               leaderXml = itemsXml.leader[0];
               for each(leaderPropXml in leaderXml.item)
               {
                  leaderPropConf = new AwardData();
                  leaderPropConf.AnalysisXML(leaderPropXml);
                  itemsConf.leaderAwards.push(leaderPropConf);
               }
            }
            awardsConf.keyDic[itemsConf.id] = itemsConf;
         }
         this.awardDic[awardsConf.id] = awardsConf;
      }
   }
}

