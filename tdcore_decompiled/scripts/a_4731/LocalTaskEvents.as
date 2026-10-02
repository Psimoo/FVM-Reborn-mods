package a_4731
{
   import flash.events.Event;
   
   public class LocalTaskEvents extends Event
   {
      
      public static const NAME:String = "LocalTaskEvents";
      
      public static const a_712:uint = 1;
      
      public static const a_713:uint = 2;
      
      public static const a_714:uint = 3;
      
      public static const a_715:uint = 4;
      
      public static const a_716:uint = 5;
      
      public static const a_717:uint = 6;
      
      public static const TASK_RANK:uint = 7;
      
      public static const a_718:uint = 8;
      
      public static const a_719:uint = 9;
      
      public static const a_720:uint = 10;
      
      public static const a_721:uint = 11;
      
      public static const a_722:uint = 12;
      
      public static const a_723:uint = 13;
      
      public static const TASK_PACKAGE_PROPS:uint = 14;
      
      public static const TASK_MOTA_RANK:uint = 16;
      
      public static const TASK_EVERY_DAY:uint = 17;
      
      public static const TASK_TRY_REGISTER:uint = 21;
      
      public static const TASK_VIP:uint = 22;
      
      public static const TASK_VISIT_BUILD:uint = 18;
      
      public static const TASK_USE_PROPS:uint = 19;
      
      public static const TASK_EASY_OPERATION:uint = 20;
      
      public var m_uiTaskType:uint;
      
      public var m_iCradID:int;
      
      public var m_pExtraObject:Object;
      
      public function LocalTaskEvents(taskType:uint, cardID:int = 0, bubbles:Boolean = false, cancelable:Boolean = false)
      {
         this.m_uiTaskType = taskType;
         this.m_iCradID = cardID;
         super(NAME,bubbles,cancelable);
      }
   }
}

