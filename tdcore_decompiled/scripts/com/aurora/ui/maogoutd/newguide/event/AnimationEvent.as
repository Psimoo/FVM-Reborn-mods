package com.aurora.ui.maogoutd.newguide.event
{
   import flash.events.Event;
   
   public class AnimationEvent extends Event
   {
      
      public static const EVENT:String = "animationevent";
      
      public static const ANIMATION_COMPLETE:String = "animationcomplete";
      
      public var m_eData:Object;
      
      public function AnimationEvent(type:String, data:Object = null, bubbles:Boolean = false, cancelable:Boolean = false)
      {
         var key:String = null;
         super(type,bubbles,cancelable);
         if(data != null)
         {
            if(this.m_eData == null)
            {
               this.m_eData = {};
            }
            for(key in data)
            {
               this.m_eData[key] = data[key];
            }
         }
      }
      
      override public function clone() : Event
      {
         return new AnimationEvent(type,this.m_eData,bubbles,cancelable);
      }
   }
}

