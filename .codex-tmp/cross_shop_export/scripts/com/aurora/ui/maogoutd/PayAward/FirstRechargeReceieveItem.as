package com.aurora.ui.maogoutd.PayAward
{
   public class FirstRechargeReceieveItem extends RechargeReceieveItem
   {
      
      public var m_bIsCanExchange:Boolean;
      
      public function FirstRechargeReceieveItem()
      {
         super();
      }
      
      override public function AnalysisXML(stXML:XML) : void
      {
         var iValue:int = int(stXML.@isCanExchange);
         this.m_bIsCanExchange = 0 == iValue ? false : true;
         super.AnalysisXML(stXML);
      }
   }
}

