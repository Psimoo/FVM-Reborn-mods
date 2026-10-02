package com.aurora.ui.maogoutd.worldBossLevel.conf
{
   public class WorldBossConf
   {
      
      public var id:String;
      
      public var name:String;
      
      public var icon:String;
      
      public var buffs:Array;
      
      public var story:String;
      
      public var bossList:Array;
      
      public var previewOpen:Boolean;
      
      public var trainOpen:Boolean;
      
      public var trainSort:int;
      
      public function WorldBossConf()
      {
         super();
         this.buffs = [];
         this.bossList = [];
      }
   }
}

