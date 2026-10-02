package a_4731
{
   import com.aurora.ui.maogoutd.task.a_4517;
   import flash.events.Event;
   
   public final class TaskUpdateEvent extends Event
   {
      
      public static const NAME:String = "TaskUpdateEvent";
      
      public var m_vTaskDatas:Vector.<a_4517>;
      
      public function TaskUpdateEvent(vTaskDatas:Vector.<a_4517>, bubbles:Boolean = false, cancelable:Boolean = false)
      {
         this.m_vTaskDatas = vTaskDatas;
         super(NAME,bubbles,cancelable);
      }
   }
}

