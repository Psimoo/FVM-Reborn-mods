package a_4752
{
   import com.aurora.ui.maogoutd.task.a_4501;
   import flash.utils.Dictionary;
   
   public class a_2048
   {
      
      private static var instance:a_2048;
      
      public var a_1663:Dictionary;
      
      public var isLegal:Boolean;
      
      public function a_2048()
      {
         super();
      }
      
      public static function getInstance() : a_2048
      {
         if(instance == null)
         {
            instance = new a_2048();
         }
         return instance;
      }
      
      public function a_2049(taskDescXML:XML) : void
      {
         var taskItem:XML = null;
         var taskID:int = 0;
         var taskDesc:a_4501 = null;
         if(taskDescXML != null)
         {
            this.a_1663 = new Dictionary();
            for each(taskItem in taskDescXML.TaskItem)
            {
               taskID = int(taskItem.@taskID);
               taskDesc = new a_4501();
               taskDesc.taskID = taskID;
               taskDesc.setTaskDesc(taskItem);
               this.a_1663[taskID] = taskDesc;
            }
         }
      }
   }
}

