package com.aurora.ui.maogoutd.worldBossLevel.conf
{
   import com.aurora.ui.maogoutd.PayAward.AwardData;
   
   public class WorldBossUnionMemberAwardConf
   {
      
      public var unionStartRank:int;
      
      public var unionEndRank:int;
      
      public var unionRankName:String;
      
      public var seasonId:int;
      
      public var isLeaderAward:Boolean;
      
      public var memberStartRank:int;
      
      public var memberEndRank:int;
      
      public var memberRankName:String;
      
      public var awards:Vector.<AwardData>;
      
      public function WorldBossUnionMemberAwardConf()
      {
         super();
         this.awards = new Vector.<AwardData>();
         this.isLeaderAward = false;
      }
   }
}

