package com.aurora.ui.maogoutd.diy.myEditor.data
{
   public class MapStepData
   {
      
      public static const MAX_LINES_CONTENT_LENGTH:int = 20;
      
      public var iDelayTime:int;
      
      public var iThreshold:int;
      
      public var iSize:int;
      
      public var szMapEnmey:Vector.<EnemyStepData>;
      
      public var nCountDown:int;
      
      public var iTombHole:int;
      
      public var nNumStepBoss:int;
      
      public var stStepBoss:Vector.<BossStepData>;
      
      public var iStepBossEnemyLoopTime:int;
      
      public var cIgnoreType:int;
      
      public var m_stMouseLines:MouseLinesData;
      
      public function MapStepData()
      {
         super();
         this.szMapEnmey = new Vector.<EnemyStepData>();
         this.stStepBoss = new Vector.<BossStepData>();
         this.m_stMouseLines = new MouseLinesData();
      }
   }
}

