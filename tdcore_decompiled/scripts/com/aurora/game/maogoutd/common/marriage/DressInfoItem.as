package com.aurora.game.maogoutd.common.marriage
{
   public class DressInfoItem
   {
      
      public var m_iDressType:int;
      
      public var m_strDressName:String;
      
      public function DressInfoItem()
      {
         super();
      }
      
      public function AnalysisXML(stXML:XML) : void
      {
         this.m_iDressType = stXML.@dressType;
         this.m_strDressName = stXML.@dressName;
      }
   }
}

