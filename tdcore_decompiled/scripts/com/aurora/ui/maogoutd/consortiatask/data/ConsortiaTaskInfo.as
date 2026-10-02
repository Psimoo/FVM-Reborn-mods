package com.aurora.ui.maogoutd.consortiatask.data
{
   import com.aurora.ui.maogoutd.consortiatask.xml.ConsortiaTargetConfig;
   
   public class ConsortiaTaskInfo
   {
      
      public var m_iTaskID:int;
      
      public var m_iTaskType:int;
      
      public var m_iConfigID:int;
      
      public var m_iTime:int;
      
      public var m_iTargetType:int;
      
      public var m_iDifficulty:int;
      
      public var m_CanCompleteCount:int;
      
      public var m_HaveCompleteCount:int;
      
      public var m_szTaskTitle:String;
      
      public var m_szTaskDes:String;
      
      public var m_iMapName:String;
      
      public var m_iMapID:int;
      
      public var m_iState:int;
      
      public var m_iNeedNum:int;
      
      public var m_iHaveNum:int;
      
      public var m_szDesc:String;
      
      public var m_iTargets:Vector.<ConsortiaTargetConfig>;
      
      public var m_iAwardID:int;
      
      public var m_iAwards:Vector.<Object>;
      
      public var m_land:int;
      
      public var m_Icon:int;
      
      public var m_Classify:int;
      
      public var m_isLastChild:Boolean;
      
      public function ConsortiaTaskInfo()
      {
         super();
      }
   }
}

