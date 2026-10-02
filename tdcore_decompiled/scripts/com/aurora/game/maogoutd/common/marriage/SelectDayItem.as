package com.aurora.game.maogoutd.common.marriage
{
   public class SelectDayItem
   {
      
      public var m_iDay:int;
      
      public var m_strShowDesc:String;
      
      public function SelectDayItem()
      {
         super();
      }
      
      public function AnalysisXML(stXML:XML) : void
      {
         this.m_iDay = stXML.@iDay;
         this.m_strShowDesc = stXML.@showDesc;
      }
   }
}

