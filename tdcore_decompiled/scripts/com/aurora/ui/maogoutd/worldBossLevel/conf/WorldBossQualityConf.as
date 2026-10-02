package com.aurora.ui.maogoutd.worldBossLevel.conf
{
   public class WorldBossQualityConf
   {
      
      public var level:int;
      
      public var name:String;
      
      public var startPoint:int;
      
      public var endPoint:int;
      
      public var cardMinLevel:int;
      
      public var cardMinLevelCnt:int;
      
      public var bossBloodAdd:int;
      
      public var bossBloodPer:int;
      
      public var normalMouseBloodAdd:int;
      
      public var normalMouseBloodPer:int;
      
      public var isMax:Boolean;
      
      public function WorldBossQualityConf()
      {
         super();
         this.isMax = false;
      }
   }
}

