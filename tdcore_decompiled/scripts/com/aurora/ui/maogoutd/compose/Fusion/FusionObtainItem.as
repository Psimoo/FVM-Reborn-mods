package com.aurora.ui.maogoutd.compose.Fusion
{
   public class FusionObtainItem
   {
      
      public var m_iObtainID:int;
      
      public var m_iName:String;
      
      public var m_iDesc:String;
      
      public var m_iType:int;
      
      public var m_iFusionType:int;
      
      public var m_iOriginalCard:Array;
      
      public var m_isGold:Boolean = false;
      
      public function FusionObtainItem()
      {
         super();
         this.m_iOriginalCard = new Array();
      }
   }
}

