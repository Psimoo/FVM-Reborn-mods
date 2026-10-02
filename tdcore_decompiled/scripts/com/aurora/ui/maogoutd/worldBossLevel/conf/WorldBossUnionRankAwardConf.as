package com.aurora.ui.maogoutd.worldBossLevel.conf
{
   import com.aurora.ui.maogoutd.PayAward.AwardData;
   
   public class WorldBossUnionRankAwardConf
   {
      
      public var id:int;
      
      public var startRank:int;
      
      public var endRank:int;
      
      public var name:String;
      
      public var memberRank:Vector.<WorldBossMemberInUnionRankAwardConf>;
      
      public var leaderAwards:Vector.<AwardData>;
      
      public function WorldBossUnionRankAwardConf()
      {
         super();
         this.memberRank = new Vector.<WorldBossMemberInUnionRankAwardConf>();
         this.leaderAwards = new Vector.<AwardData>();
      }
   }
}

