package com.aurora.ui.maogoutd.MeishiMatch.Data
{
   import com.aurora.ui.maogoutd.PayAward.AwardData;
   
   public class MatchAwardVO
   {
      
      public var m_iID:int;
      
      public var m_iExp:int;
      
      public var m_iAwardType:int;
      
      public var m_iAwardStatus:int;
      
      public var m_iItemID:int;
      
      public var m_iCount:int;
      
      public var m_iEndTime:int;
      
      public var m_iAwardData:Vector.<AwardData>;
      
      public function MatchAwardVO()
      {
         super();
      }
   }
}

