package com.aurora.ui.maogoutd.worldBossLevel.vo
{
   public class WorldBossSummaryVO
   {
      
      public var seasonId:int;
      
      public var seasonName:String;
      
      public var hasData:Boolean;
      
      public var totalCnt:int;
      
      public var killBossTm:int;
      
      public var killBlood:int;
      
      public var allServerRank:int;
      
      public var localServerRank:int;
      
      public var inUnionRank:int;
      
      public var duanweiLevel:int;
      
      public var qualityLevel:int;
      
      public var duanweiLevelChange:int;
      
      public var eventList:Array;
      
      public function WorldBossSummaryVO()
      {
         super();
         this.eventList = [];
      }
   }
}

