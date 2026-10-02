package com.aurora.ui.maogoutd.SummerExploreCamp.Control
{
   import a_4723.a_1767;
   import com.aurora.ui.maogoutd.MeishiMatch.Data.ClassifyVO;
   import com.aurora.ui.maogoutd.PayAward.AwardData;
   import com.aurora.ui.maogoutd.consortiatask.data.ConsortiaTaskInfo;
   import com.aurora.ui.maogoutd.consortiatask.xml.ConsortiaTargetConfig;
   import flash.utils.Dictionary;
   
   public class AnalysisExplorelandXml
   {
      
      private static var m_stAnalysisExplorelandXml:AnalysisExplorelandXml;
      
      public var m_vMatchTask:Dictionary;
      
      public var m_advlist:Vector.<ClassifyVO>;
      
      public var m_Challengelist:Vector.<ClassifyVO>;
      
      private var m_dictImage:Dictionary;
      
      private var m_iCurrentCheckTime:int;
      
      public var m_CampKey:Array;
      
      public var m_LandOpen:Dictionary;
      
      public var m_ExporeTime:String;
      
      public var m_NextExporeTime:String;
      
      public function AnalysisExplorelandXml()
      {
         super();
         this.m_iCurrentCheckTime = 0;
         if(m_stAnalysisExplorelandXml)
         {
            throw Error("RechargeActivityConfig 是单例模式 不能重复实例化！！！");
         }
      }
      
      public static function GetInstance() : AnalysisExplorelandXml
      {
         if(null == m_stAnalysisExplorelandXml)
         {
            m_stAnalysisExplorelandXml = new AnalysisExplorelandXml();
         }
         return m_stAnalysisExplorelandXml;
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
         var m_iAwardData:Vector.<AwardData> = null;
         var m_vTaskAwards:Object = null;
         var m_vTaskAwardItems:AwardData = null;
         this.m_vMatchTask = new Dictionary();
         var data:XML = null;
         var perdata:XML = null;
         var eachAward:XML = null;
         var classify:XML = null;
         var temp:ConsortiaTaskInfo = null;
         this.m_advlist = new Vector.<ClassifyVO>();
         this.m_Challengelist = new Vector.<ClassifyVO>();
         for each(data in stXML.advcamptasklist.tasklist)
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
                  this.m_vMatchTask[temp.m_iConfigID] = temp;
                  classifyVO.m_TaskListVec.push(temp);
               }
               if(tasklevel == 11)
               {
                  this.m_advlist.push(classifyVO);
                  this.m_advlist.sort(this.OnSortToken);
               }
               else if(tasklevel == 12)
               {
                  this.m_Challengelist.push(classifyVO);
               }
            }
         }
         this.m_advlist.sort(this.OnSortToken);
         this.m_Challengelist.sort(this.OnSortToken);
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
         for(var i:int = 0; i < this.m_advlist.length; i++)
         {
            vo = this.m_advlist[i];
            if(vo.m_iID == classifyID)
            {
               CurrStartTime = vo.m_iStartTime;
            }
         }
         for(var j:int = 0; j < this.m_advlist.length; j++)
         {
            vo = this.m_advlist[j];
            if(vo.m_iStartTime > CurrStartTime)
            {
               systemTime = a_1767.getInstance().SystemTime;
               return vo.m_iStartTime - systemTime;
            }
         }
         return -1;
      }
      
      public function AnalysisCampXML(stXML:XML) : void
      {
         var obj:Object = null;
         this.m_CampKey = new Array();
         this.m_LandOpen = new Dictionary();
         var data:XML = null;
         for each(data in stXML.spltime)
         {
            obj = new Object();
            obj.keyid = data.@keyid;
            obj.num = data.@num;
            obj.startTime = data.@startTime;
            obj.endTime = data.@endTime;
            this.m_CampKey.push(obj);
         }
         for each(data in stXML.island)
         {
            obj = new Object();
            obj.MapID = int(data.@id);
            obj.IandName = data.@name.toString();
            obj.startTime = int(data.@startTime);
            obj.endTime = int(data.@endTime);
            obj.closeDesc = data.@closeDesc;
            this.m_LandOpen[obj.MapID] = obj;
         }
         for each(data in stXML.tasktip)
         {
            this.m_ExporeTime = data.@Desc1.toString();
            this.m_NextExporeTime = data.@Desc2.toString();
         }
      }
      
      public function get CurrentCampKey() : Object
      {
         var systemTime:int = a_1767.getInstance().SystemTime;
         for(var i:int = 0; i < this.m_CampKey.length; i++)
         {
            if(this.m_CampKey[i].startTime <= systemTime && systemTime <= this.m_CampKey[i].endTime)
            {
               return this.m_CampKey[i];
            }
         }
         return this.m_CampKey[0];
      }
      
      public function LandDesc(type:int) : String
      {
         return this.m_LandOpen[type].closeDesc;
      }
      
      public function isLandOpen(type:int) : Boolean
      {
         var systemTime:int = a_1767.getInstance().SystemTime;
         if(this.m_LandOpen[type].startTime <= systemTime && systemTime <= this.m_LandOpen[type].endTime)
         {
            return true;
         }
         return false;
      }
      
      public function isOpenRoomPop() : Boolean
      {
         var item:Object = null;
         var systemTime:int = a_1767.getInstance().SystemTime;
         for each(item in this.m_LandOpen)
         {
            if(item.startTime <= systemTime && systemTime <= item.endTime)
            {
               return true;
            }
         }
         return false;
      }
   }
}

