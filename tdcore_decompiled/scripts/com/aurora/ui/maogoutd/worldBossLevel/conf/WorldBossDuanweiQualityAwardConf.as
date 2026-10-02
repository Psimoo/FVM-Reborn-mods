package com.aurora.ui.maogoutd.worldBossLevel.conf
{
   import com.aurora.ui.maogoutd.PayAward.AwardData;
   
   public class WorldBossDuanweiQualityAwardConf
   {
      
      public var seasonId:int;
      
      public var duanweiLevel:int;
      
      public var duanweiName:String;
      
      public var qualityLevel:int;
      
      public var qualityName:String;
      
      public var limitScrore:int;
      
      public var awards:Vector.<AwardData>;
      
      public function WorldBossDuanweiQualityAwardConf()
      {
         super();
         this.awards = new Vector.<AwardData>();
      }
   }
}

