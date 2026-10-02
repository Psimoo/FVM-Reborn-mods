package com.aurora.ui.maogoutd.worldBossLevel.vo
{
   import com.aurora.ui.maogoutd.component.scrollBar.VirtualList.VirtualRowData;
   
   public class WorldBossRecordVO
   {
      
      public var userAllServerMaxRank:int;
      
      public var userLocalServerMaxRank:int;
      
      public var unionAllServerMaxRank:int;
      
      public var unionLocalServerMaxRank:int;
      
      public var unionId:int;
      
      public var unionName:String;
      
      public var joinSeasonCnt:int;
      
      public var fightCnt:int;
      
      public var winCnt:int;
      
      public var loseCnt:int;
      
      public var killBossId:int;
      
      public var killBossHp:int;
      
      public var maxDuanweiLevel:int;
      
      public var duanweiUseCntVects:Vector.<VirtualRowData>;
      
      public function WorldBossRecordVO()
      {
         super();
         this.duanweiUseCntVects = new Vector.<VirtualRowData>();
      }
   }
}

