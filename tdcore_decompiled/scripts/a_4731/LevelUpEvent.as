package a_4731
{
   import flash.events.Event;
   
   public class LevelUpEvent extends Event
   {
      
      public static const NAME:String = "LevelUpEvent";
      
      public var m_nLevel:int;
      
      public var m_nVsLevel:int;
      
      public function LevelUpEvent(nLevel:int, nVsLevel:int)
      {
         this.m_nLevel = nLevel;
         this.m_nVsLevel = nVsLevel;
         super(NAME,false,false);
      }
   }
}

