package com.aurora.ui.maogoutd.MeishiMatch.Data
{
   import a_4723.a_1767;
   import com.aurora.ui.maogoutd.PayAward.AwardData;
   import com.aurora.ui.maogoutd.consortiatask.data.ConsortiaTaskInfo;
   import com.aurora.ui.maogoutd.consortiatask.xml.ConsortiaTargetConfig;
   import flash.utils.Dictionary;
   
   public class AnalysisMeiShiMatchXml
   {
      
      private static var m_stAnalysisMeiShiMatchXml:AnalysisMeiShiMatchXml;
      
      public var m_vMatchTask:Dictionary;
      
      public var m_CookerAwardic:Dictionary;
      
      public var m_CookerGodAwardic:Dictionary;
      
      public var m_CookerStartTime:Number;
      
      public var m_CookerEndTime:Number;
      
      public var m_CookerGodStartTime:Number;
      
      public var m_CookerGodEndTime:Number;
      
      public var m_CookerGodPrice:int;
      
      public var m_BuyDic:Dictionary;
      
      public var m_showList:Array;
      
      public var m_MaxLevel:int;
      
      public var m_classifyTask6:Vector.<ClassifyVO>;
      
      public var m_classifyTask7:Vector.<ClassifyVO>;
      
      private var m_dictImage:Dictionary;
      
      public var m_SilenceStartTime:int;
      
      public var m_SilenceEndTime:int;
      
      public var m_SuspendStartTime:int;
      
      public var m_SuspendEndTime:int;
      
      public var m_RobotVerifyStartTime:int;
      
      public var m_RobotVerifyEndTime:int;
      
      public function AnalysisMeiShiMatchXml()
      {
         super();
         if(m_stAnalysisMeiShiMatchXml)
         {
            throw Error("RechargeActivityConfig 是单例模式 不能重复实例化！！！");
         }
      }
      
      public static function GetInstance() : AnalysisMeiShiMatchXml
      {
         if(null == m_stAnalysisMeiShiMatchXml)
         {
            m_stAnalysisMeiShiMatchXml = new AnalysisMeiShiMatchXml();
         }
         return m_stAnalysisMeiShiMatchXml;
      }
      
      public function get dictImage() : Dictionary
      {
         if(this.m_dictImage == null)
         {
            this.m_dictImage = new Dictionary();
         }
         return this.m_dictImage;
      }
      
      public function AnalysisTaskListXML(stXML:XML) : void
      {
         var classifyVO:ClassifyVO = null;
         var tasklevel:int = 0;
         var task:XML = null;
         var m_vTaskTargets:ConsortiaTargetConfig = null;
         var perAwards:Vector.<Object> = null;
         var m_vTaskAwards:Object = null;
         this.m_vMatchTask = new Dictionary();
         var data:XML = null;
         var perdata:XML = null;
         var eachAward:XML = null;
         var classify:XML = null;
         var temp:ConsortiaTaskInfo = null;
         this.m_classifyTask6 = new Vector.<ClassifyVO>();
         this.m_classifyTask7 = new Vector.<ClassifyVO>();
         for each(data in stXML.FoodContest.tasklevel)
         {
            tasklevel = int(data.@level);
            for each(classify in data.classify)
            {
               classifyVO = new ClassifyVO();
               classifyVO.m_iID = classify.childIndex() + 1;
               classifyVO.m_tasklevel = tasklevel;
               classifyVO.m_iStartTime = classify.@startTime;
               classifyVO.m_iEndTime = classify.@endTime;
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
                  temp.m_land = task.@land;
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
                  }
                  this.m_vMatchTask[temp.m_iConfigID] = temp;
                  classifyVO.m_TaskListVec.push(temp);
               }
               if(tasklevel == 6)
               {
                  this.m_classifyTask6.push(classifyVO);
                  this.m_classifyTask6.sort(this.OnSortToken);
               }
               else if(tasklevel == 7)
               {
                  this.m_classifyTask7.push(classifyVO);
               }
            }
         }
         this.m_classifyTask6.sort(this.OnSortToken);
         this.m_classifyTask7.sort(this.OnSortToken);
      }
      
      public function AnalysisTaskAwardXML(stXML:XML) : void
      {
         var stAwardData:AwardData = null;
         var vo:MatchAwardVO = null;
         var item:XML = null;
         var eachAward:XML = null;
         var eachAwardGod:XML = null;
         var obj:Object = null;
         this.m_CookerAwardic = new Dictionary();
         this.m_CookerGodAwardic = new Dictionary();
         var data:XML = null;
         for each(data in stXML.cooker.level)
         {
            vo = new MatchAwardVO();
            vo.m_iID = data.@id;
            vo.m_iExp = data.@exp;
            vo.m_iAwardData = new Vector.<AwardData>();
            for each(eachAward in data.item)
            {
               stAwardData = new AwardData();
               stAwardData.AnalysisXML(eachAward);
               vo.m_iAwardData.push(stAwardData);
            }
            this.m_CookerAwardic[vo.m_iID] = vo;
         }
         for each(data in stXML.cookerGod.level)
         {
            vo = new MatchAwardVO();
            vo.m_iID = data.@id;
            vo.m_iExp = data.@exp;
            vo.m_iAwardData = new Vector.<AwardData>();
            for each(eachAwardGod in data.item)
            {
               stAwardData = new AwardData();
               stAwardData.AnalysisXML(eachAwardGod);
               vo.m_iAwardData.push(stAwardData);
            }
            this.m_CookerGodAwardic[vo.m_iID] = vo;
         }
         for each(data in stXML.cookerGodPrice)
         {
            this.m_CookerGodPrice = data.@price;
         }
         this.m_BuyDic = new Dictionary();
         for each(data in stXML.buyExp.item)
         {
            obj = new Object();
            obj.curLevel = int(data.@curLevel);
            obj.targetLevel = int(data.@targetLevel);
            obj.addExp = int(data.@addExp);
            obj.price = int(data.@price);
            this.m_BuyDic[obj.curLevel] = obj;
         }
         for each(data in stXML.buyExp)
         {
            this.m_MaxLevel = int(data.@maxLevel);
         }
         this.m_showList = new Array();
         for each(data in stXML.showList.item)
         {
            stAwardData = new AwardData();
            stAwardData.AnalysisXML(data);
            this.m_showList.push(stAwardData);
         }
      }
      
      private function OnSortToken(a:ClassifyVO, b:ClassifyVO) : int
      {
         if(a.m_iStartTime < b.m_iStartTime)
         {
            return -1;
         }
         if(a.m_iStartTime > b.m_iStartTime)
         {
            return 1;
         }
         return 0;
      }
      
      public function getEndTimesByClassifyID(classifyID:int) : int
      {
         var CurrStartTime:int = 0;
         var vo:ClassifyVO = null;
         var systemTime:int = 0;
         for(var i:int = 0; i < this.m_classifyTask6.length; i++)
         {
            vo = this.m_classifyTask6[i];
            if(vo.m_iID == classifyID)
            {
               CurrStartTime = vo.m_iStartTime;
            }
         }
         for(var j:int = 0; j < this.m_classifyTask6.length; j++)
         {
            vo = this.m_classifyTask6[j];
            if(vo.m_iStartTime > CurrStartTime)
            {
               systemTime = a_1767.getInstance().SystemTime;
               return vo.m_iStartTime - systemTime;
            }
         }
         return -1;
      }
      
      public function AnalysisTalkXML(stXML:XML) : void
      {
         var data:XML = null;
         for each(data in stXML.Silence)
         {
            this.m_SilenceStartTime = data.@startTime;
            this.m_SilenceEndTime = data.@endTime;
         }
         for each(data in stXML.Suspend)
         {
            this.m_SuspendStartTime = data.@startTime;
            this.m_SuspendEndTime = data.@endTime;
         }
         for each(data in stXML.RobotVerify)
         {
            this.m_RobotVerifyStartTime = data.@startTime;
            this.m_RobotVerifyEndTime = data.@endTime;
         }
      }
   }
}

