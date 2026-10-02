package com.aurora.ui.maogoutd.task
{
   import a_4731.AchievementsUpdateEvent;
   import a_4731.ComposeSystemEvent;
   import a_4731.FriendSystemEvent;
   import a_4731.GameResultEvent;
   import a_4731.LevelUpEvent;
   import a_4731.LobbyEventManager;
   import a_4731.LocalTaskEvents;
   import a_4731.PlayerConsumeEvent;
   import a_4731.SendDalabaEvent;
   import a_4731.TaskUpdateEvent;
   import a_4752.a_2033;
   import a_4752.a_2048;
   import a_4754.a_2161;
   import flash.utils.Dictionary;
   import flash.utils.setTimeout;
   
   public final class a_4514
   {
      
      private static var ms_Instance:a_4514;
      
      private static const Task_PlayGame:uint = 1048576;
      
      private static const Task_Friends:uint = 2097152;
      
      private static const Task_Compose:uint = 3145728;
      
      private static const Task_LevelUp:uint = 4194304;
      
      private static const Task_Achievement:uint = 5242880;
      
      private static const Task_Local:uint = 6291456;
      
      private static const Task_Shop:uint = 7340032;
      
      private static const Task_Dalaba:uint = 8388608;
      
      private static const TaskMaskBit:uint = 15728640;
      
      public static const a_704:uint = 1;
      
      public static const a_705:uint = 2;
      
      public static const a_706:uint = 3;
      
      public static const a_707:uint = 4;
      
      public static const a_708:uint = 5;
      
      public static const a_709:uint = 6;
      
      public static const a_710:uint = 7;
      
      public static const a_711:uint = 8;
      
      public static const a_1645:uint = 1;
      
      public static const a_1646:uint = 2;
      
      public static const TaskOperate_Armys:uint = 3;
      
      public static const TaskOperate_Gem_Strengthen:uint = 4;
      
      public static const TaskOperate_Home_Cook:uint = 5;
      
      public static const a_1647:uint = 1;
      
      public static const a_1648:uint = 2;
      
      public static const a_1649:uint = 3;
      
      public static const a_1650:uint = 4;
      
      public static const a_1651:uint = 5;
      
      public static const a_1652:uint = 6;
      
      public static const a_1661:uint = 1;
      
      public static const a_1662:uint = 2;
      
      private var a_1653:ITaskServer;
      
      private var m_vTasks:Vector.<a_4517>;
      
      private var m_kTaskRule:TaskRuleCenter;
      
      private var a_1663:Dictionary;
      
      private var a_1656:Boolean = false;
      
      private var m_bAddTask:Boolean = false;
      
      public function a_4514()
      {
         super();
         if(ms_Instance)
         {
            throw new Error("TaskHandle is a Singleton,call Get() to get the instance!");
         }
         ms_Instance = this;
         this.m_kTaskRule = new TaskRuleCenter();
         LobbyEventManager.Get().addEventListener(GameResultEvent.NAME,this.a_4493);
         LobbyEventManager.Get().addEventListener(FriendSystemEvent.NAME,this.a_4494);
         LobbyEventManager.Get().addEventListener(ComposeSystemEvent.NAME,this.a_4495);
         LobbyEventManager.Get().addEventListener(TaskUpdateEvent.NAME,this.a_4515);
         LobbyEventManager.Get().addEventListener(AchievementsUpdateEvent.NAME,this.a_4489);
         LobbyEventManager.Get().addEventListener(LevelUpEvent.NAME,this.a_4492);
         LobbyEventManager.Get().addEventListener(LocalTaskEvents.NAME,this.HandleLocalTask);
         LobbyEventManager.Get().addEventListener(PlayerConsumeEvent.NAME,this.a_4490);
         LobbyEventManager.Get().addEventListener(SendDalabaEvent.NAME,this.a_4491);
      }
      
      public static function Get() : a_4514
      {
         return ms_Instance || new a_4514();
      }
      
      protected function a_4489(e:AchievementsUpdateEvent) : void
      {
         var taskScprit:Array = null;
         if(null == this.m_vTasks)
         {
            this.m_vTasks = a_2161.e.GetTasks() as Vector.<a_4517>;
         }
         var uiResult:uint = TaskRuleCenter.Result_Ignore;
         for(var i:uint = 0; i < this.m_vTasks.length; i++)
         {
            if(Task_Achievement == (this.m_vTasks[i].m_iTaskID & TaskMaskBit) && (1 == this.m_vTasks[i].m_iTaskStatus || 2 == this.m_vTasks[i].m_iTaskStatus))
            {
               taskScprit = this.a_1663[this.m_vTasks[i].m_iTaskID].taskScript;
               if(null != taskScprit)
               {
                  uiResult = this.m_kTaskRule.HandleTaskTypeAchievements(this.m_vTasks[i],e.a_814,taskScprit);
                  if(TaskRuleCenter.Result_Finish == uiResult)
                  {
                     this.a_1653.a_4497(this.m_vTasks[i].m_iTaskID);
                  }
                  else if(TaskRuleCenter.Result_Save == uiResult)
                  {
                     this.a_1653.a_4498(this.m_vTasks[i]);
                  }
               }
            }
         }
      }
      
      protected function a_4515(e:TaskUpdateEvent) : void
      {
         this.m_vTasks = e.m_vTaskDatas;
         if(false == this.a_1656)
         {
            this.a_1656 = true;
            setTimeout(this.a_4516,1000);
         }
      }
      
      protected function a_4516() : void
      {
         this.a_1656 = false;
         var role:Object = a_2161.e.GetCurrentRole();
         var level:Object = a_2033.getInstance().getGameLevel(role.m_iGamePoint);
         var vsLevel:Object = a_2033.getInstance().getVsLevel(role.m_iVsExp);
         this.a_4492(new LevelUpEvent(Number(level.iLevel),Number(vsLevel.iLevel)));
      }
      
      public function a_3895(pServer:ITaskServer, tasks:Vector.<a_4517> = null) : void
      {
         this.a_1653 = pServer;
         this.m_vTasks = tasks;
         this.a_1663 = a_2048.getInstance().a_1663;
      }
      
      public function a_4487() : void
      {
         var result:Object = new Object();
         result.iTeamMateSex = 1;
         result.iMySex = 2;
         result.nDestroyOppBuildingCount = 4;
         result.byGameMode = 2;
         result.iMapID = 1;
         result.iWin = 1;
         var taskScprit:Array = this.a_1663[285212673].taskScript;
         var uiResult:uint = this.m_kTaskRule.HandleTaskType1(null,result,taskScprit);
      }
      
      public function a_4488(id:int) : void
      {
         this.a_1653.a_4497(id);
      }
      
      protected function a_4490(e:PlayerConsumeEvent) : void
      {
         var taskScprit:Array = null;
         if(null == this.m_vTasks)
         {
            this.m_vTasks = a_2161.e.GetTasks() as Vector.<a_4517>;
         }
         var uiResult:uint = TaskRuleCenter.Result_Ignore;
         for(var i:uint = 0; i < this.m_vTasks.length; i++)
         {
            if(Task_Shop == (this.m_vTasks[i].m_iTaskID & TaskMaskBit) && (1 == this.m_vTasks[i].m_iTaskStatus || 2 == this.m_vTasks[i].m_iTaskStatus))
            {
               taskScprit = this.a_1663[this.m_vTasks[i].m_iTaskID].taskScript;
               uiResult = this.m_kTaskRule.HandleConsumTask(this.m_vTasks[i],e.m_iCommodityCoinPrice,e.m_iCommodityCharmPrice,taskScprit);
               if(TaskRuleCenter.Result_Finish == uiResult)
               {
                  this.a_1653.a_4497(this.m_vTasks[i].m_iTaskID);
               }
               else if(TaskRuleCenter.Result_Save == uiResult)
               {
                  this.a_1653.a_4498(this.m_vTasks[i]);
               }
            }
         }
      }
      
      protected function a_4491(e:SendDalabaEvent) : void
      {
         var taskScprit:Array = null;
         if(null == this.m_vTasks)
         {
            this.m_vTasks = a_2161.e.GetTasks() as Vector.<a_4517>;
         }
         var uiResult:uint = TaskRuleCenter.Result_Ignore;
         for(var i:uint = 0; i < this.m_vTasks.length; i++)
         {
            if(Task_Dalaba == (this.m_vTasks[i].m_iTaskID & TaskMaskBit) && (1 == this.m_vTasks[i].m_iTaskStatus || 2 == this.m_vTasks[i].m_iTaskStatus))
            {
               taskScprit = this.a_1663[this.m_vTasks[i].m_iTaskID].taskScript;
               uiResult = this.m_kTaskRule.HandleDalabaTask(this.m_vTasks[i],e.m_nCount,taskScprit);
               if(TaskRuleCenter.Result_Finish == uiResult)
               {
                  this.a_1653.a_4497(this.m_vTasks[i].m_iTaskID);
               }
               else if(TaskRuleCenter.Result_Save == uiResult)
               {
                  this.a_1653.a_4498(this.m_vTasks[i]);
               }
            }
         }
      }
      
      private function AddKanGodTask() : void
      {
         var iTaskIdStart:int = 0;
         var iAddTask:int = 0;
         var currentRole:Object = a_2161.e.GetCurrentRole();
         var iGamePoint:Number = Number(currentRole.m_iGamePoint);
         var vc:Object = a_2033.getInstance().getGameLevel(iGamePoint);
         var iLevel:int = int(vc.iLevel);
         if(iLevel > 2 && iLevel < 10)
         {
            this.m_bAddTask = true;
            iTaskIdStart = 37748832;
            iAddTask = 37748832 + (iLevel - 3);
            this.a_1653.a_4497(iAddTask);
            this.a_1653.a_4497(iAddTask);
         }
      }
      
      protected function HandleLocalTask(e:LocalTaskEvents) : void
      {
         var taskScprit:Array = null;
         if(null == this.m_vTasks)
         {
            this.m_vTasks = a_2161.e.GetTasks() as Vector.<a_4517>;
         }
         if(!this.m_bAddTask)
         {
            this.AddKanGodTask();
         }
         var uiResult:uint = TaskRuleCenter.Result_Ignore;
         for(var i:uint = 0; i < this.m_vTasks.length; i++)
         {
            if(Task_Local == (this.m_vTasks[i].m_iTaskID & TaskMaskBit) && (1 == this.m_vTasks[i].m_iTaskStatus || 2 == this.m_vTasks[i].m_iTaskStatus))
            {
               taskScprit = this.a_1663[this.m_vTasks[i].m_iTaskID].taskScript;
               uiResult = this.m_kTaskRule.HandleLocalTask(this.m_vTasks[i],e.m_uiTaskType,e.m_iCradID,taskScprit,e.m_pExtraObject);
               if(TaskRuleCenter.Result_Finish == uiResult)
               {
                  this.a_1653.a_4497(this.m_vTasks[i].m_iTaskID);
               }
               else if(TaskRuleCenter.Result_Save == uiResult)
               {
                  this.a_1653.a_4498(this.m_vTasks[i]);
               }
            }
         }
      }
      
      protected function a_4492(e:LevelUpEvent) : void
      {
         var taskScprit:Array = null;
         if(null == this.m_vTasks)
         {
            this.m_vTasks = a_2161.e.GetTasks() as Vector.<a_4517>;
         }
         var uiResult:uint = TaskRuleCenter.Result_Ignore;
         for(var i:uint = 0; i < this.m_vTasks.length; i++)
         {
            if(Task_LevelUp == (this.m_vTasks[i].m_iTaskID & TaskMaskBit) && (1 == this.m_vTasks[i].m_iTaskStatus || 2 == this.m_vTasks[i].m_iTaskStatus))
            {
               taskScprit = this.a_1663[this.m_vTasks[i].m_iTaskID].taskScript;
               uiResult = this.m_kTaskRule.HandleTaskLevelUp(this.m_vTasks[i],e.m_nLevel,e.m_nVsLevel,taskScprit);
               if(TaskRuleCenter.Result_Finish == uiResult)
               {
                  this.a_1653.a_4497(this.m_vTasks[i].m_iTaskID);
               }
               else if(TaskRuleCenter.Result_Save == uiResult)
               {
                  this.a_1653.a_4498(this.m_vTasks[i]);
               }
            }
         }
      }
      
      protected function a_4493(e:GameResultEvent) : void
      {
         var taskScprit:Array = null;
         if(null == this.m_vTasks)
         {
            this.m_vTasks = a_2161.e.GetTasks() as Vector.<a_4517>;
         }
         var result:Object = e.m_objResult;
         var uiResult:uint = TaskRuleCenter.Result_Ignore;
         for(var i:uint = 0; i < this.m_vTasks.length; i++)
         {
            if(Task_PlayGame == (this.m_vTasks[i].m_iTaskID & TaskMaskBit) && (1 == this.m_vTasks[i].m_iTaskStatus || 2 == this.m_vTasks[i].m_iTaskStatus))
            {
               taskScprit = this.a_1663[this.m_vTasks[i].m_iTaskID].taskScript;
               uiResult = this.m_kTaskRule.HandleTaskType1(this.m_vTasks[i],result,taskScprit);
               if(TaskRuleCenter.Result_Finish == uiResult)
               {
                  this.a_1653.a_4497(this.m_vTasks[i].m_iTaskID);
               }
               else if(TaskRuleCenter.Result_Save == uiResult)
               {
                  this.a_1653.a_4498(this.m_vTasks[i]);
               }
            }
         }
      }
      
      protected function a_4494(e:FriendSystemEvent) : void
      {
         var taskScprit:Array = null;
         if(null == this.m_vTasks)
         {
            this.m_vTasks = a_2161.e.GetTasks() as Vector.<a_4517>;
         }
         var oprate:int = e.m_iOperate;
         var uiResult:uint = TaskRuleCenter.Result_Ignore;
         for(var i:uint = 0; i < this.m_vTasks.length; i++)
         {
            if(Task_Friends == (this.m_vTasks[i].m_iTaskID & TaskMaskBit) && (1 == this.m_vTasks[i].m_iTaskStatus || 2 == this.m_vTasks[i].m_iTaskStatus))
            {
               taskScprit = this.a_1663[this.m_vTasks[i].m_iTaskID].taskScript;
               uiResult = this.m_kTaskRule.HandleTaskType2(this.m_vTasks[i],oprate,e.m_iAddition,e.m_pExtraObject,taskScprit);
               if(TaskRuleCenter.Result_Finish == uiResult)
               {
                  this.a_1653.a_4497(this.m_vTasks[i].m_iTaskID);
               }
               else if(TaskRuleCenter.Result_Save == uiResult)
               {
                  this.a_1653.a_4498(this.m_vTasks[i]);
               }
            }
         }
      }
      
      protected function a_4495(e:ComposeSystemEvent) : void
      {
         var taskScprit:Array = null;
         if(null == this.m_vTasks)
         {
            this.m_vTasks = a_2161.e.GetTasks() as Vector.<a_4517>;
         }
         var oprate:uint = e.m_iOperate;
         var card:uint = e.m_iCardID;
         var param:uint = e.m_iOption;
         var uiResult:uint = TaskRuleCenter.Result_Ignore;
         for(var i:uint = 0; i < this.m_vTasks.length; i++)
         {
            if(Task_Compose == (this.m_vTasks[i].m_iTaskID & TaskMaskBit) && (1 == this.m_vTasks[i].m_iTaskStatus || 2 == this.m_vTasks[i].m_iTaskStatus))
            {
               taskScprit = this.a_1663[this.m_vTasks[i].m_iTaskID].taskScript;
               uiResult = this.m_kTaskRule.HandleTaskType3(this.m_vTasks[i],oprate,card,param,taskScprit);
               if(TaskRuleCenter.Result_Finish == uiResult)
               {
                  this.a_1653.a_4497(this.m_vTasks[i].m_iTaskID);
               }
               else if(TaskRuleCenter.Result_Save == uiResult)
               {
                  this.a_1653.a_4498(this.m_vTasks[i]);
               }
            }
         }
      }
   }
}

