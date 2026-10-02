package com.aurora.ui.maogoutd.MeishiMatch.Data
{
   import com.aurora.ui.maogoutd.consortiatask.data.ConsortiaTaskInfo;
   
   public class ClassifyVO
   {
      
      public var m_iID:int;
      
      public var m_tasklevel:int;
      
      public var m_iStartTime:int;
      
      public var m_iEndTime:int;
      
      public var m_TaskListVec:Vector.<ConsortiaTaskInfo>;
      
      public function ClassifyVO()
      {
         super();
      }
   }
}

