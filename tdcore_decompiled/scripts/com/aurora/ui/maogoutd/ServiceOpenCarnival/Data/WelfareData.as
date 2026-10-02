package com.aurora.ui.maogoutd.ServiceOpenCarnival.Data
{
   import com.aurora.ui.maogoutd.PayAward.AwardData;
   
   public class WelfareData
   {
      
      public static const RECHARGE_ACTIVITY_DISCOUNT:int = 0;
      
      public var m_iTaskID:int;
      
      public var m_strDesc:String;
      
      public var m_iTargetType:int;
      
      public var m_iUniqueID:int;
      
      public var m_iNeedCount:int;
      
      public var m_vAwardData:Vector.<AwardData>;
      
      public var m_iCompleteCount:int;
      
      public var m_iSchedule:int;
      
      public var m_iBtnType:int;
      
      public function WelfareData()
      {
         super();
      }
   }
}

