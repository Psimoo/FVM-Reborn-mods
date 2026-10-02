package com.aurora.ui.maogoutd.worldBossLevel.conf
{
   import com.aurora.ui.maogoutd.PayAward.AwardData;
   
   public class WorldBossMemberInUnionRankAwardConf
   {
      
      public var startRank:int;
      
      public var endRank:int;
      
      public var name:String;
      
      public var awards:Vector.<AwardData>;
      
      public function WorldBossMemberInUnionRankAwardConf()
      {
         super();
         this.awards = new Vector.<AwardData>();
      }
   }
}

