package com.aurora.ui.maogoutd.birthdayActivity
{
   import com.aurora.ui.maogoutd.MeishiMatch.Data.ClassifyVO;
   import com.aurora.ui.maogoutd.PayAward.AwardData;
   import com.aurora.ui.maogoutd.birthdayActivity.conf.BirthdayActivityElementConf;
   import com.aurora.ui.maogoutd.consortiatask.data.ConsortiaTaskInfo;
   import com.aurora.ui.maogoutd.consortiatask.xml.ConsortiaTargetConfig;
   import flash.utils.Dictionary;
   
   public class AnalysisBirthdayActivityXml
   {
      
      private static var a_921:AnalysisBirthdayActivityXml;
      
      private var conf:BirthdayActivityElementConf;
      
      private var dailyTaskConfDict:Dictionary;
      
      public function AnalysisBirthdayActivityXml()
      {
         super();
      }
      
      public static function GetInstance() : AnalysisBirthdayActivityXml
      {
         if(null == a_921)
         {
            a_921 = new AnalysisBirthdayActivityXml();
         }
         return a_921;
      }
      
      public function parseXml(xml:XML) : void
      {
         this.conf = new BirthdayActivityElementConf();
         this.conf.parseXml(xml.element[0]);
      }
      
      public function parseTaskXml(stXML:XML) : void
      {
         var classifyVO:ClassifyVO = null;
         var tasklevel:int = 0;
         var task:XML = null;
         var m_vTaskTargets:ConsortiaTargetConfig = null;
         var perAwards:Vector.<Object> = null;
         var m_iAwardData:Vector.<AwardData> = null;
         var m_vTaskAwards:Object = null;
         var m_vTaskAwardItems:AwardData = null;
         this.dailyTaskConfDict = new Dictionary(true);
         var data:XML = null;
         var perdata:XML = null;
         var eachAward:XML = null;
         var classify:XML = null;
         var temp:ConsortiaTaskInfo = null;
         for each(data in stXML.Festivaltasklist.tasklevel)
         {
            tasklevel = int(data.@level);
            for each(classify in data.classify)
            {
               classifyVO = new ClassifyVO();
               classifyVO.m_iID = classify.childIndex() + 1;
               classifyVO.m_tasklevel = tasklevel;
               classifyVO.m_iStartTime = stXML.Festivaltasklist.@startTime;
               classifyVO.m_iEndTime = stXML.Festivaltasklist.@endTime;
               classifyVO.m_TaskListVec = new Vector.<ConsortiaTaskInfo>();
               for each(task in classify.task)
               {
                  temp = new ConsortiaTaskInfo();
                  temp.m_iTargets = new Vector.<ConsortiaTargetConfig>();
                  temp.m_iAwards = new Vector.<Object>();
                  temp.m_iConfigID = task.@id;
                  temp.m_iTime = task.@time;
                  temp.m_iDifficulty = task.@difficulty;
                  temp.m_iTargetType = task.@targettype;
                  temp.m_CanCompleteCount = task.@completecount;
                  temp.m_szTaskTitle = task.@title;
                  temp.m_iNeedNum = task.targets.@needcount;
                  temp.m_szDesc = task.targets.@desc;
                  temp.m_szTaskDes = task.@taskstory;
                  temp.m_iMapName = task.@mapname;
                  temp.m_iMapID = task.@mapid;
                  temp.m_land = classify.@type;
                  temp.m_Icon = task.@backdrop;
                  temp.m_iTaskType = tasklevel;
                  temp.m_Classify = classifyVO.m_iID;
                  temp.m_isLastChild = task.childIndex() == classify.task.length() - 1 ? true : false;
                  for each(perdata in task.targets.target)
                  {
                     m_vTaskTargets = new ConsortiaTargetConfig();
                     m_vTaskTargets.m_iType = perdata.@type;
                     m_vTaskTargets.m_iNeedValue = perdata.@value;
                     temp.m_iTargets.push(m_vTaskTargets);
                  }
                  for each(eachAward in task.award)
                  {
                     perAwards = new Vector.<Object>();
                     for each(perdata in eachAward.point)
                     {
                        m_vTaskAwards = new Object();
                        m_vTaskAwards.m_iType = perdata.@type;
                        m_vTaskAwards.m_iValue = perdata.@value;
                        perAwards.push(m_vTaskAwards);
                     }
                     temp.m_iAwards.push(perAwards);
                     m_iAwardData = new Vector.<AwardData>();
                     for each(perdata in eachAward.item)
                     {
                        m_vTaskAwardItems = new AwardData();
                        m_vTaskAwardItems.AnalysisXML(perdata);
                        m_iAwardData.push(m_vTaskAwardItems);
                     }
                     temp.m_iAwards.push(m_iAwardData);
                  }
                  this.dailyTaskConfDict[temp.m_iConfigID] = temp;
                  classifyVO.m_TaskListVec.push(temp);
               }
            }
         }
      }
      
      public function getConfig() : BirthdayActivityElementConf
      {
         return this.conf;
      }
      
      public function getDailyTaskConfig() : Dictionary
      {
         return this.dailyTaskConfDict;
      }
   }
}

