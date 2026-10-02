package a_4754
{
   import a_4739.a_1828;
   import com.aurora.ui.maogoutd.task.a_4517;
   import flash.utils.Dictionary;
   
   public class a_2169 extends a_1828
   {
      
      public static var e:a_2169 = new a_2169();
      
      public function a_2169()
      {
         super();
      }
      
      public function RequestPlayerAcceptTask(desc:Object) : void
      {
         notify("RequestPlayerAcceptTask",desc);
      }
      
      public function RequestPlayerAccomplishTask(taskID:int) : void
      {
         notify("RequestPlayerAccomplishTask",taskID);
      }
      
      public function RequestPlayerGetTaskAward(taskID:int, select:int) : void
      {
         notify("RequestPlayerGetTaskAward",taskID,select);
      }
      
      public function RequestPlayerSaveTask(taskInfo:a_4517) : void
      {
         notify("RequestPlayerSaveTask",taskInfo);
      }
      
      public function onGetTaskAwards(task:Object) : void
      {
         notify("onGetTaskAwards",task);
      }
      
      public function onNotifySetTaskItemStatus(iTaskID:int, iStatus:int) : void
      {
         notify("onNotifySetTaskItemStatus",iTaskID,iStatus);
      }
      
      public function onUpdateTaskInfo(vTasks:Vector.<a_4517>) : void
      {
         notify("onUpdateTaskInfo",vTasks);
      }
      
      public function onSetTaskDesc(dictTaskDesc:Dictionary) : void
      {
         notify("onSetTaskDesc",dictTaskDesc);
      }
   }
}

