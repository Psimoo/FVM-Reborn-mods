package com.aurora.ui.maogoutd.worldBossLevel.conf
{
   import com.aurora.ui.maogoutd.PayAward.AwardData;
   
   public class WorldBossQualityAwardConf
   {
      
      public var id:int;
      
      public var name:String;
      
      public var limitScrore:int;
      
      public var awards:Vector.<AwardData>;
      
      public function WorldBossQualityAwardConf()
      {
         super();
         this.awards = new Vector.<AwardData>();
      }
   }
}

