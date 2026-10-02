package com.aurora.ui.maogoutd.worldBossLevel.conf
{
   public class WorldBossDuanweiAwardConf
   {
      
      public var id:int;
      
      public var name:String;
      
      public var qualityConf:Vector.<WorldBossQualityAwardConf>;
      
      public function WorldBossDuanweiAwardConf()
      {
         super();
         this.qualityConf = new Vector.<WorldBossQualityAwardConf>();
      }
   }
}

