package com.aurora.ui.maogoutd.handbook.model
{
   public class HandbookProgressLevelItemData
   {
      
      public var level:int;
      
      public var minVal:int;
      
      public var maxVal:int;
      
      public var awardIcon:String;
      
      public var topBGIcon:String;
      
      public var awards:Array;
      
      public var sexTmpAwards:Array;
      
      public function HandbookProgressLevelItemData()
      {
         super();
         this.awards = [];
         this.sexTmpAwards = [];
      }
   }
}

