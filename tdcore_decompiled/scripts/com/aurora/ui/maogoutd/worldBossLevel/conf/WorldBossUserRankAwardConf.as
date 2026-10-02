package com.aurora.ui.maogoutd.worldBossLevel.conf
{
   import com.aurora.ui.maogoutd.PayAward.AwardData;
   
   public class WorldBossUserRankAwardConf
   {
      
      public var id:int;
      
      public var seasonId:int;
      
      public var startRank:int;
      
      public var endRank:int;
      
      public var name:String;
      
      public var awards:Vector.<AwardData>;
      
      public function WorldBossUserRankAwardConf()
      {
         super();
         this.awards = new Vector.<AwardData>();
      }
   }
}

