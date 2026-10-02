package com.aurora.ui.maogoutd.handbook.model.vo
{
   public class HandbookCollectProgressVo
   {
      
      public var type:int;
      
      public var collectPt:int;
      
      public var collectAwardState:int;
      
      public function HandbookCollectProgressVo()
      {
         super();
      }
      
      public function isAwardCollected(level:int) : Boolean
      {
         return this.collectAwardState >= level;
      }
   }
}

