package com.aurora.ui.maogoutd.consortiatask.xml
{
   import com.aurora.ui.maogoutd.PayAward.AwardData;
   import com.aurora.ui.maogoutd.ServiceOpenCarnival.Data.WelfareData;
   import com.aurora.ui.maogoutd.consortiatask.data.ConsortiaTaskInfo;
   import com.aurora.ui.maogoutd.monopoly.model.MonopolyGoalData;
   
   public class ConsortiaTaskConfig
   {
      
      private static var m_pInstance:ConsortiaTaskConfig;
      
      public var m_vTaskConfigs:Vector.<ConsortiaTaskInfo>;
      
      public var m_vRand:Vector.<int>;
      
      public var m_vActivityAdd:int;
      
      public var m_vNeedSweet:int;
      
      public var m_vLevelAdd:Vector.<Object>;
      
      public var m_vLevelAward:Vector.<Object>;
      
      public var m_iStartTime:int;
      
      public var m_iEndTime:int;
      
      public var m_iNianMapID:Array;
      
      public var m_vCarnivalTask:Vector.<WelfareData>;
      
      public var m_vMonopolyTask:Vector.<MonopolyGoalData>;
      
      public var m_pointAwardst:Number;
      
      public var m_pointAwardet:Number;
      
      public function ConsortiaTaskConfig()
      {
         super();
      }
      
      public static function Get() : ConsortiaTaskConfig
      {
         if(!m_pInstance)
         {
            m_pInstance = new ConsortiaTaskConfig();
         }
         return m_pInstance;
      }
      
      public function GetNianMapID(iType:int) : int
      {
         if(iType >= 1 && iType <= this.m_iNianMapID.length)
         {
            return this.m_iNianMapID[iType - 1];
         }
         return 0;
      }
      
      public function a_2040(xml:XML) : void
      {
         var m_vTaskTargets:ConsortiaTargetConfig = null;
         var perAwards:Vector.<ConsortiaAwardConfig> = null;
         var m_vTaskAwards:ConsortiaAwardConfig = null;
         var stWelfare:WelfareData = null;
         var item:XML = null;
         var stAwardData:AwardData = null;
         var stMonopolyTask:MonopolyGoalData = null;
         var iRand:int = 0;
         var obj:Object = null;
         var arr:Array = null;
         if(xml == null)
         {
            return;
         }
         var data:XML = null;
         var perdata:XML = null;
         var eachAward:XML = null;
         var temp:ConsortiaTaskInfo = null;
         this.m_vTaskConfigs = new Vector.<ConsortiaTaskInfo>();
         for each(data in xml..tasklevel.classify.task)
         {
            temp = new ConsortiaTaskInfo();
            temp.m_iTargets = new Vector.<ConsortiaTargetConfig>();
            temp.m_iAwards = new Vector.<Object>();
            temp.m_iConfigID = data.@id;
            temp.m_iTime = data.@time;
            temp.m_iDifficulty = data.@difficulty;
            temp.m_iTargetType = data.@targettype;
            temp.m_CanCompleteCount = data.@completecount;
            temp.m_szTaskTitle = data.@title;
            temp.m_iNeedNum = data.targets.@needcount;
            temp.m_szDesc = data.targets.@desc;
            temp.m_szTaskDes = data.@taskstory;
            temp.m_iMapName = data.@mapname;
            temp.m_iMapID = data.@mapid;
            for each(perdata in data.targets.target)
            {
               m_vTaskTargets = new ConsortiaTargetConfig();
               m_vTaskTargets.m_iType = perdata.@type;
               m_vTaskTargets.m_iNeedValue = perdata.@value;
               temp.m_iTargets.push(m_vTaskTargets);
            }
            for each(eachAward in data.award)
            {
               perAwards = new Vector.<ConsortiaAwardConfig>();
               for each(perdata in eachAward.item)
               {
                  m_vTaskAwards = new ConsortiaAwardConfig();
                  m_vTaskAwards.m_iItemID = perdata.@itemid;
                  m_vTaskAwards.m_iNum = perdata.@num;
                  m_vTaskAwards.m_iLevel = perdata.@level;
                  m_vTaskAwards.m_iTime = perdata.@time;
                  m_vTaskAwards.m_iIsBind = perdata.@isBind;
                  m_vTaskAwards.m_iSex = perdata.@sex;
                  m_vTaskAwards.m_iStartTime = perdata.@startTime;
                  m_vTaskAwards.m_iEndTime = perdata.@endTime;
                  perAwards.push(m_vTaskAwards);
               }
               for each(perdata in eachAward.point)
               {
                  m_vTaskAwards = new ConsortiaAwardConfig();
                  m_vTaskAwards.m_iType = perdata.@type;
                  m_vTaskAwards.m_iValue = perdata.@value;
                  perAwards.push(m_vTaskAwards);
               }
               temp.m_iAwards.push(perAwards);
            }
            this.m_vTaskConfigs.push(temp);
         }
         this.m_vCarnivalTask = new Vector.<WelfareData>();
         for each(data in xml.NewSvrTask.task)
         {
            stWelfare = new WelfareData();
            stWelfare.m_iTaskID = data.@id;
            stWelfare.m_strDesc = data.targets.@desc;
            stWelfare.m_iTargetType = data.@targettype;
            stWelfare.m_iNeedCount = data.targets.@needcount;
            stWelfare.m_vAwardData = new Vector.<AwardData>();
            for each(item in data.award.item)
            {
               stAwardData = new AwardData();
               stAwardData.AnalysisXML(item);
               stWelfare.m_vAwardData.push(stAwardData);
            }
            this.m_vCarnivalTask.push(stWelfare);
         }
         this.m_vMonopolyTask = new Vector.<MonopolyGoalData>();
         for each(data in xml.MonopolyTask.task)
         {
            stMonopolyTask = new MonopolyGoalData();
            stMonopolyTask.iTaskID = data.@id;
            stMonopolyTask.sDesc = data.targets.@desc;
            stMonopolyTask.iNeedNum = data.targets.@needcount;
            stMonopolyTask.iCompleteCount = data.@completecount;
            this.m_vMonopolyTask.push(stMonopolyTask);
         }
         this.m_iStartTime = xml.NianMonsterTask.@startTime;
         this.m_iEndTime = xml.NianMonsterTask.@endTime;
         this.m_iNianMapID = [];
         for each(data in xml.NianMonsterTask.task)
         {
            temp = new ConsortiaTaskInfo();
            temp.m_iTargets = new Vector.<ConsortiaTargetConfig>();
            temp.m_iAwards = new Vector.<Object>();
            temp.m_iConfigID = data.@id;
            temp.m_iTime = data.@time;
            temp.m_iDifficulty = data.@difficulty;
            temp.m_iTargetType = data.@targettype;
            temp.m_CanCompleteCount = data.@completecount;
            temp.m_szTaskTitle = data.@title;
            temp.m_iNeedNum = data.targets.@needcount;
            temp.m_szDesc = data.targets.@desc;
            temp.m_szTaskDes = data.@taskstory;
            temp.m_iMapName = data.@mapname;
            temp.m_iMapID = data.@mapid;
            this.m_iNianMapID.push(temp.m_iMapID);
            for each(perdata in data.targets.target)
            {
               m_vTaskTargets = new ConsortiaTargetConfig();
               m_vTaskTargets.m_iType = perdata.@type;
               m_vTaskTargets.m_iNeedValue = perdata.@value;
               temp.m_iTargets.push(m_vTaskTargets);
            }
            for each(eachAward in data.award)
            {
               perAwards = new Vector.<ConsortiaAwardConfig>();
               for each(perdata in eachAward.item)
               {
                  m_vTaskAwards = new ConsortiaAwardConfig();
                  m_vTaskAwards.m_iItemID = perdata.@itemid;
                  m_vTaskAwards.m_iNum = perdata.@num;
                  m_vTaskAwards.m_iLevel = perdata.@level;
                  m_vTaskAwards.m_iTime = perdata.@time;
                  m_vTaskAwards.m_iIsBind = perdata.@isBind;
                  m_vTaskAwards.m_iSex = perdata.@sex;
                  perAwards.push(m_vTaskAwards);
               }
               for each(perdata in eachAward.point)
               {
                  m_vTaskAwards = new ConsortiaAwardConfig();
                  m_vTaskAwards.m_iType = perdata.@type;
                  m_vTaskAwards.m_iValue = perdata.@value;
                  perAwards.push(m_vTaskAwards);
               }
               temp.m_iAwards.push(perAwards);
            }
            this.m_vTaskConfigs.push(temp);
         }
         this.m_vRand = new Vector.<int>();
         for each(data in xml.rand.item)
         {
            iRand = int(data.@add);
            this.m_vRand.push(iRand);
         }
         this.m_vLevelAdd = new Vector.<Object>();
         this.m_vActivityAdd = xml.marriageAward.pointAward.@multiple;
         this.m_pointAwardst = xml.marriageAward.pointAward.@startTime;
         this.m_pointAwardet = xml.marriageAward.pointAward.@endTime;
         this.m_vNeedSweet = xml.marriageAward.levelAward.@levelSweet;
         for each(data in xml.marriageAward.pointAward.element)
         {
            obj = new Object();
            obj.needLevel = int(data.@needLevel);
            obj.addPercent = int(data.@addPercent);
            this.m_vLevelAdd.push(obj);
         }
         this.m_vLevelAward = new Vector.<Object>();
         for each(data in xml.marriageAward.levelAward.element)
         {
            arr = new Array();
            for each(perdata in data.item)
            {
               obj = new Object();
               obj.itemid = int(perdata.@itemid);
               obj.num = int(perdata.@num);
               obj.time = int(perdata.@time);
               obj.isbind = int(perdata.@isbind);
               obj.rate = int(perdata.@rate);
               arr.push(obj);
            }
            this.m_vLevelAward.push(arr);
         }
      }
   }
}

