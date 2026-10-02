package a_4731
{
   import flash.events.Event;
   
   public final class AchievementsUpdateEvent extends Event
   {
      
      public static const NAME:String = "AchievementsUpdateEvent";
      
      public var a_814:Array;
      
      public function AchievementsUpdateEvent(arr:Array, bubbles:Boolean = false, cancelable:Boolean = false)
      {
         this.a_814 = arr;
         super(NAME,bubbles,cancelable);
      }
   }
}

