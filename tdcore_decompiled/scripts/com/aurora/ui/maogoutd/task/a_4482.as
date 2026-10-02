package com.aurora.ui.maogoutd.task
{
   import a_4720.a_1756;
   import a_4731.AchievementsUpdateEvent;
   import a_4731.ComposeSystemEvent;
   import a_4731.FriendSystemEvent;
   import a_4731.GameResultEvent;
   import a_4731.LevelUpEvent;
   import a_4731.LobbyEventManager;
   import a_4731.LocalTaskEvents;
   import a_4731.PlayerConsumeEvent;
   import a_4731.SendDalabaEvent;
   import a_4731.a_1790;
   import a_4752.a_2033;
   import a_4754.a_2161;
   import com.aurora.ui.maogoutd.achievement.a_3168;
   import flash.utils.Dictionary;
   import flash.utils.setTimeout;
   
   public final class a_4482
   {
      
      private static var ms_Instance:a_4482;
      
      private static const Task_PlayGame:uint = 65536;
      
      public static const Achevement_MoTa_Game_Rank:uint = 1;
      
      private static const Task_Friends:uint = 131072;
      
      private static const Task_Compose:uint = 196608;
      
      private static const Task_LevelUp:uint = 262144;
      
      private static const Task_Achievement:uint = 327680;
      
      private static const Task_Local:uint = 393216;
      
      public static const Achevement_MoTa_Local_Card:uint = 1;
      
      private static const Task_Shop:uint = 458752;
      
      private static const Task_Dalaba:uint = 524288;
      
      private static const Task_Finish_Achieve:uint = 655360;
      
      private static const TaskMaskBit:uint = 983040;
      
      public static const a_704:uint = 1;
      
      public static const a_1645:uint = 1;
      
      public static const a_1646:uint = 2;
      
      public static const TaskOperate_Armys:uint = 48;
      
      public static const TaskCard_Armys_Slot:uint = 0;
      
      public static const TaskCard_Armys_Set:uint = 1;
      
      public static const TaskOperate_Gem_Strengthen:uint = 64;
      
      public static const TaskOperate_Gem_Decompose:uint = 80;
      
      public static const a_1647:uint = 1;
      
      public static const a_1648:uint = 2;
      
      public static const a_1649:uint = 3;
      
      public static const a_1650:uint = 4;
      
      public static const a_1651:uint = 5;
      
      public static const a_1652:uint = 6;
      
      private var a_1653:ITaskServer;
      
      private var a_1654:Dictionary;
      
      private var m_kTaskRule:TaskRuleCenter;
      
      private var a_1655:Boolean = false;
      
      private var a_1656:Boolean = false;
      
      private var a_1657:Boolean = false;
      
      public function a_4482()
      {
         super();
         if(ms_Instance)
         {
            throw new Error("AchievementHandler is a Singleton,call Get() to get the instance!");
         }
         ms_Instance = this;
         this.m_kTaskRule = new TaskRuleCenter();
         LobbyEventManager.Get().addEventListener(AchievementsUpdateEvent.NAME,this.a_4489);
         LobbyEventManager.Get().addEventListener(GameResultEvent.NAME,this.a_4493);
         LobbyEventManager.Get().addEventListener(FriendSystemEvent.NAME,this.a_4494);
         LobbyEventManager.Get().addEventListener(ComposeSystemEvent.NAME,this.a_4495);
         LobbyEventManager.Get().addEventListener(a_1790.NAME,this.a_4483);
         LobbyEventManager.Get().addEventListener(LevelUpEvent.NAME,this.a_4492);
         LobbyEventManager.Get().addEventListener(LocalTaskEvents.NAME,this.HandleLocalTask);
         LobbyEventManager.Get().addEventListener(PlayerConsumeEvent.NAME,this.a_4490);
         LobbyEventManager.Get().addEventListener(SendDalabaEvent.NAME,this.a_4491);
      }
      
      public static function Get() : a_4482
      {
         return ms_Instance || new a_4482();
      }
      
      protected function a_4483(e:a_1790) : void
      {
         if(false == this.a_1657)
         {
            this.a_1657 = true;
            setTimeout(this.DelayUpdateAchievements,1000);
         }
      }
      
      protected function DelayUpdateAchievements() : void
      {
         this.a_1657 = false;
         this.a_1654 = a_3168.getInstance().dictAchieves;
         var role:Object = a_2161.e.GetCurrentRole();
         var level:Object = a_2033.getInstance().getGameLevel(role.m_iGamePoint);
         var vsLevel:Object = a_2033.getInstance().getVsLevel(role.m_iVsExp);
         if(false == this.a_1656 && level != null)
         {
            this.a_1656 = true;
            this.a_4492(new LevelUpEvent(Number(level.iLevel),Number(vsLevel.iLevel)));
         }
         this.a_4496(null);
      }
      
      private function a_4485(item:Object, iTaskCount:int) : void
      {
         var taskInfo:a_4517 = new a_4517();
         if(a_1756.enm_TaskOverdateStatus != item.iTaskStatus && item.iUserDef1 < iTaskCount)
         {
            taskInfo.m_iTaskID = item.id;
            taskInfo.m_iAcceptDate = item.iAcceptDate;
            taskInfo.m_iAccomplishedDate = item.iAccomplishedDate;
            taskInfo.m_iTaskStatus = item.iTaskStatus;
            taskInfo.m_iUserDef1 = iTaskCount;
            this.a_1653.a_4500(taskInfo);
         }
      }
      
      private function a_4486(item:Object, nMyCount:int, requireCount:int) : void
      {
         if(a_1756.enm_TaskOverdateStatus != item.iTaskStatus && nMyCount >= requireCount)
         {
            this.a_1653.a_4499(item.id);
         }
      }
      
      public function a_3895(pServer:ITaskServer, tasks:Vector.<a_4517> = null) : void
      {
         this.a_1653 = pServer;
         this.a_1654 = a_3168.getInstance().dictAchieves;
         trace("Initilize AchievementsHandel! ");
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
      }
      
      public function a_4488(id:int) : void
      {
         this.a_1653.a_4499(id);
      }
      
      protected function a_4489(e:AchievementsUpdateEvent) : void
      {
         var taskScprit:Array = null;
         var item:Object = null;
         if(null == this.a_1654)
         {
            this.a_1654 = a_3168.getInstance().dictAchieves;
         }
         var uiResult:uint = TaskRuleCenter.Result_Ignore;
         var taskInfo:a_4517 = new a_4517();
         for each(item in this.a_1654)
         {
            if(Task_Achievement == (item.id & TaskMaskBit) && a_1756.enm_TaskOverdateStatus != item.iTaskStatus)
            {
               taskScprit = item.arrScript;
               if(null == taskScprit)
               {
                  trace("null == taskScprit,Achievement id = " + item.id);
               }
               else
               {
                  taskInfo.m_iTaskID = item.id;
                  taskInfo.m_iAcceptDate = item.iAcceptDate;
                  taskInfo.m_iAccomplishedDate = item.iAccomplishedDate;
                  taskInfo.m_iTaskStatus = item.iTaskStatus;
                  taskInfo.m_iUserDef1 = item.iUserDef1;
                  uiResult = this.m_kTaskRule.HandleTaskTypeAchievements(taskInfo,e.a_814,taskScprit);
                  item.iUserDef1 = taskInfo.m_iUserDef1;
                  if(TaskRuleCenter.Result_Finish == uiResult)
                  {
                     this.a_1653.a_4499(taskInfo.m_iTaskID);
                  }
                  else if(TaskRuleCenter.Result_Save == uiResult)
                  {
                     this.a_1653.a_4500(taskInfo);
                  }
               }
            }
         }
      }
      
      protected function a_4490(e:PlayerConsumeEvent) : void
      {
         var taskScprit:Array = null;
         var item:Object = null;
         if(null == this.a_1654)
         {
            this.a_1654 = a_3168.getInstance().dictAchieves;
         }
         var uiResult:uint = TaskRuleCenter.Result_Ignore;
         var taskInfo:a_4517 = new a_4517();
         for each(item in this.a_1654)
         {
            if(Task_Shop == (item.id & TaskMaskBit) && a_1756.enm_TaskOverdateStatus != item.iTaskStatus)
            {
               taskScprit = item.arrScript;
               if(null == taskScprit)
               {
                  trace("null == taskScprit,Achievement id = " + item.id);
               }
               else
               {
                  taskInfo.m_iTaskID = item.id;
                  taskInfo.m_iAcceptDate = item.iAcceptDate;
                  taskInfo.m_iAccomplishedDate = item.iAccomplishedDate;
                  taskInfo.m_iTaskStatus = item.iTaskStatus;
                  taskInfo.m_iUserDef1 = item.iUserDef1;
                  uiResult = this.m_kTaskRule.HandleConsumTask(taskInfo,e.m_iCommodityCoinPrice,e.m_iCommodityCharmPrice,taskScprit,e.m_bAsPresent);
                  item.iUserDef1 = taskInfo.m_iUserDef1;
                  if(TaskRuleCenter.Result_Finish == uiResult)
                  {
                     this.a_1653.a_4499(taskInfo.m_iTaskID);
                  }
                  else if(TaskRuleCenter.Result_Save == uiResult)
                  {
                     this.a_1653.a_4500(taskInfo);
                  }
               }
            }
         }
      }
      
      protected function a_4491(e:SendDalabaEvent) : void
      {
         var taskScprit:Array = null;
         var item:Object = null;
         if(null == this.a_1654)
         {
            this.a_1654 = a_3168.getInstance().dictAchieves;
         }
         var uiResult:uint = TaskRuleCenter.Result_Ignore;
         var taskInfo:a_4517 = new a_4517();
         for each(item in this.a_1654)
         {
            if(Task_Dalaba == (item.id & TaskMaskBit) && a_1756.enm_TaskOverdateStatus != item.iTaskStatus)
            {
               taskScprit = item.arrScript;
               if(null == taskScprit)
               {
                  trace("null == taskScprit,Achievement id = " + item.id);
               }
               else
               {
                  taskInfo.m_iTaskID = item.id;
                  taskInfo.m_iAcceptDate = item.iAcceptDate;
                  taskInfo.m_iAccomplishedDate = item.iAccomplishedDate;
                  taskInfo.m_iTaskStatus = item.iTaskStatus;
                  taskInfo.m_iUserDef1 = item.iUserDef1;
                  uiResult = this.m_kTaskRule.HandleDalabaTask(taskInfo,e.m_nCount,taskScprit);
                  item.iUserDef1 = taskInfo.m_iUserDef1;
                  if(TaskRuleCenter.Result_Finish == uiResult)
                  {
                     this.a_1653.a_4499(taskInfo.m_iTaskID);
                  }
                  else if(TaskRuleCenter.Result_Save == uiResult)
                  {
                     this.a_1653.a_4500(taskInfo);
                  }
               }
            }
         }
      }
      
      protected function HandleLocalTask(e:LocalTaskEvents) : void
      {
         var taskScprit:Array = null;
         var item:Object = null;
         if(null == this.a_1654)
         {
            this.a_1654 = a_3168.getInstance().dictAchieves;
         }
         var uiResult:uint = TaskRuleCenter.Result_Ignore;
         var taskInfo:a_4517 = new a_4517();
         for each(item in this.a_1654)
         {
            if(Task_Local == (item.id & TaskMaskBit) && a_1756.enm_TaskOverdateStatus != item.iTaskStatus)
            {
               taskScprit = item.arrScript;
               if(null == taskScprit)
               {
                  trace("null == taskScprit,Achievement id = " + item.id);
               }
               else
               {
                  taskInfo.m_iTaskID = item.id;
                  taskInfo.m_iAcceptDate = item.iAcceptDate;
                  taskInfo.m_iAccomplishedDate = item.iAccomplishedDate;
                  taskInfo.m_iTaskStatus = item.iTaskStatus;
                  taskInfo.m_iUserDef1 = item.iUserDef1;
                  uiResult = this.m_kTaskRule.HandleLocalTask(taskInfo,e.m_uiTaskType,e.m_iCradID,taskScprit,e.m_pExtraObject);
                  item.iUserDef1 = taskInfo.m_iUserDef1;
                  if(TaskRuleCenter.Result_Finish == uiResult)
                  {
                     this.a_1653.a_4499(taskInfo.m_iTaskID);
                  }
                  else if(TaskRuleCenter.Result_Save == uiResult)
                  {
                     this.a_1653.a_4500(taskInfo);
                  }
               }
            }
         }
      }
      
      protected function a_4492(e:LevelUpEvent) : void
      {
         var taskScprit:Array = null;
         var item:Object = null;
         if(null == this.a_1654)
         {
            this.a_1654 = a_3168.getInstance().dictAchieves;
         }
         var uiResult:uint = TaskRuleCenter.Result_Ignore;
         var taskInfo:a_4517 = new a_4517();
         for each(item in this.a_1654)
         {
            if(Task_LevelUp == (item.id & TaskMaskBit) && a_1756.enm_TaskOverdateStatus != item.iTaskStatus)
            {
               taskScprit = item.arrScript;
               if(null == taskScprit)
               {
                  trace("null == taskScprit,Achievement id = " + item.id);
               }
               else
               {
                  taskInfo.m_iTaskID = item.id;
                  taskInfo.m_iAcceptDate = item.iAcceptDate;
                  taskInfo.m_iAccomplishedDate = item.iAccomplishedDate;
                  taskInfo.m_iTaskStatus = item.iTaskStatus;
                  taskInfo.m_iUserDef1 = item.iUserDef1;
                  uiResult = this.m_kTaskRule.HandleTaskLevelUp(taskInfo,e.m_nLevel,e.m_nVsLevel,taskScprit);
                  item.iUserDef1 = taskInfo.m_iUserDef1;
                  if(TaskRuleCenter.Result_Finish == uiResult)
                  {
                     this.a_1653.a_4499(taskInfo.m_iTaskID);
                  }
                  else if(TaskRuleCenter.Result_Save == uiResult)
                  {
                     this.a_1653.a_4500(taskInfo);
                  }
               }
            }
         }
      }
      
      protected function a_4493(e:GameResultEvent) : void
      {
         var taskScprit:Array = null;
         var item:Object = null;
         if(null == this.a_1654)
         {
            this.a_1654 = a_3168.getInstance().dictAchieves;
         }
         var result:Object = e.m_objResult;
         var uiResult:uint = TaskRuleCenter.Result_Ignore;
         var taskInfo:a_4517 = new a_4517();
         if(result)
         {
            if(result.iMapID > 536870912)
            {
               return;
            }
         }
         for each(item in this.a_1654)
         {
            if(Task_PlayGame == (item.id & TaskMaskBit) && a_1756.enm_TaskOverdateStatus != item.iTaskStatus)
            {
               taskScprit = item.arrScript;
               if(null == taskScprit)
               {
                  trace("null == taskScprit,Achievement id = " + item.id);
               }
               else
               {
                  taskInfo.m_iTaskID = item.id;
                  taskInfo.m_iAcceptDate = item.iAcceptDate;
                  taskInfo.m_iAccomplishedDate = item.iAccomplishedDate;
                  taskInfo.m_iTaskStatus = item.iTaskStatus;
                  taskInfo.m_iUserDef1 = item.iUserDef1;
                  uiResult = this.m_kTaskRule.HandleTaskType1(taskInfo,result,taskScprit);
                  item.iUserDef1 = taskInfo.m_iUserDef1;
                  if(TaskRuleCenter.Result_Finish == uiResult)
                  {
                     this.a_1653.a_4499(taskInfo.m_iTaskID);
                  }
                  else if(TaskRuleCenter.Result_Save == uiResult)
                  {
                     this.a_1653.a_4500(taskInfo);
                  }
               }
            }
         }
      }
      
      protected function a_4494(e:FriendSystemEvent) : void
      {
         var taskScprit:Array = null;
         var item:Object = null;
         if(null == this.a_1654)
         {
            this.a_1654 = a_3168.getInstance().dictAchieves;
         }
         var oprate:int = e.m_iOperate;
         var uiResult:uint = TaskRuleCenter.Result_Ignore;
         var taskInfo:a_4517 = new a_4517();
         for each(item in this.a_1654)
         {
            if(Task_Friends == (item.id & TaskMaskBit) && a_1756.enm_TaskOverdateStatus != item.iTaskStatus)
            {
               taskScprit = item.arrScript;
               if(null == taskScprit)
               {
                  trace("null == taskScprit,Achievement id = " + item.id);
               }
               else
               {
                  taskInfo.m_iTaskID = item.id;
                  taskInfo.m_iAcceptDate = item.iAcceptDate;
                  taskInfo.m_iAccomplishedDate = item.iAccomplishedDate;
                  taskInfo.m_iTaskStatus = item.iTaskStatus;
                  taskInfo.m_iUserDef1 = item.iUserDef1;
                  uiResult = this.m_kTaskRule.HandleTaskType2(taskInfo,oprate,e.m_iAddition,e.m_pExtraObject,taskScprit);
                  item.iUserDef1 = taskInfo.m_iUserDef1;
                  if(TaskRuleCenter.Result_Finish == uiResult)
                  {
                     this.a_1653.a_4499(taskInfo.m_iTaskID);
                  }
                  else if(TaskRuleCenter.Result_Save == uiResult)
                  {
                     this.a_1653.a_4500(taskInfo);
                  }
               }
            }
         }
      }
      
      protected function a_4495(e:ComposeSystemEvent) : void
      {
         var taskScprit:Array = null;
         var item:Object = null;
         if(null == this.a_1654)
         {
            this.a_1654 = a_3168.getInstance().dictAchieves;
         }
         var oprate:uint = e.m_iOperate;
         var card:uint = e.m_iCardID;
         var param:uint = e.m_iOption;
         var uiResult:uint = TaskRuleCenter.Result_Ignore;
         var taskInfo:a_4517 = new a_4517();
         for each(item in this.a_1654)
         {
            if(Task_Compose == (item.id & TaskMaskBit) && a_1756.enm_TaskOverdateStatus != item.iTaskStatus)
            {
               taskScprit = item.arrScript;
               if(null == taskScprit)
               {
                  trace("null == taskScprit,Achievement id = " + item.id);
               }
               else
               {
                  taskInfo.m_iTaskID = item.id;
                  taskInfo.m_iAcceptDate = item.iAcceptDate;
                  taskInfo.m_iAccomplishedDate = item.iAccomplishedDate;
                  taskInfo.m_iTaskStatus = item.iTaskStatus;
                  taskInfo.m_iUserDef1 = item.iUserDef1;
                  uiResult = this.m_kTaskRule.HandleTaskType3(taskInfo,oprate,card,param,taskScprit);
                  item.iUserDef1 = taskInfo.m_iUserDef1;
                  if(TaskRuleCenter.Result_Finish == uiResult)
                  {
                     this.a_1653.a_4499(taskInfo.m_iTaskID);
                  }
                  else if(TaskRuleCenter.Result_Save == uiResult)
                  {
                     this.a_1653.a_4500(taskInfo);
                  }
               }
            }
         }
      }
      
      protected function a_4496(e:a_1790) : void
      {
         var taskScprit:Array = null;
         var item:Object = null;
         if(null == this.a_1654)
         {
            this.a_1654 = a_3168.getInstance().dictAchieves;
         }
         var uiResult:uint = TaskRuleCenter.Result_Ignore;
         var taskInfo:a_4517 = new a_4517();
         for each(item in this.a_1654)
         {
            if(Task_Finish_Achieve == (item.id & TaskMaskBit) && a_1756.enm_TaskOverdateStatus != item.iTaskStatus)
            {
               taskScprit = item.arrScript;
               if(null == taskScprit)
               {
                  trace("null == taskScprit,Achievement id = " + item.id);
               }
               else
               {
                  taskInfo.m_iTaskID = item.id;
                  taskInfo.m_iAcceptDate = item.iAcceptDate;
                  taskInfo.m_iAccomplishedDate = item.iAccomplishedDate;
                  taskInfo.m_iTaskStatus = item.iTaskStatus;
                  taskInfo.m_iUserDef1 = item.iUserDef1;
                  uiResult = this.m_kTaskRule.HandleTaskAchievement(taskInfo,this.a_1654,taskScprit);
                  item.iUserDef1 = taskInfo.m_iUserDef1;
                  if(TaskRuleCenter.Result_Finish == uiResult)
                  {
                     this.a_1653.a_4499(taskInfo.m_iTaskID);
                  }
                  else if(TaskRuleCenter.Result_Save == uiResult)
                  {
                     this.a_1653.a_4500(taskInfo);
                  }
               }
            }
         }
      }
   }
}

