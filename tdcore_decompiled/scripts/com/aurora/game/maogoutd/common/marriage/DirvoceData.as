package com.aurora.game.maogoutd.common.marriage
{
   public class DirvoceData
   {
      
      public var m_iIgnoreNum:int;
      
      public var m_iNegotiatedContinueSecond:int;
      
      public var m_iForcedNeedMoney:int;
      
      public function DirvoceData()
      {
         super();
      }
      
      public function AnalysisXML(stXML:XML) : void
      {
         this.m_iIgnoreNum = stXML.@ignoreNum;
         this.m_iNegotiatedContinueSecond = stXML.@negotiatedContinueSecond;
         this.m_iForcedNeedMoney = stXML.@forcedNeedMoney;
      }
   }
}

