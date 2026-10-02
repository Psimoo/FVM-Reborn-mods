package com.aurora.ui.maogoutd.mota
{
   public class MiBaoKuInfo
   {
      
      public var m_iType:int;
      
      public var m_iGrade:uint;
      
      public var m_iRestart:int;
      
      public var m_aryTreasureCardInfo:Array;
      
      public var m_aryItemInfo:Array;
      
      public var m_isNextGrade:Boolean = false;
      
      public function MiBaoKuInfo()
      {
         super();
         this.m_aryTreasureCardInfo = [];
         this.m_aryItemInfo = [];
      }
   }
}

