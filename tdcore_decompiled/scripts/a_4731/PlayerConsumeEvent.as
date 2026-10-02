package a_4731
{
   import flash.events.Event;
   
   public final class PlayerConsumeEvent extends Event
   {
      
      public static const NAME:String = "PlayerConsumeEvent";
      
      public var m_iCommodityCoinPrice:int;
      
      public var m_iCommodityCharmPrice:int;
      
      public var m_bAsPresent:Boolean;
      
      public function PlayerConsumeEvent(iCommodityCoinPrice:int, iCommodityCharmPrice:int, bAsPresent:Boolean = false, bubbles:Boolean = false, cancelable:Boolean = false)
      {
         this.m_bAsPresent = bAsPresent;
         this.m_iCommodityCoinPrice = iCommodityCoinPrice < 0 ? int(-iCommodityCoinPrice) : iCommodityCoinPrice;
         this.m_iCommodityCharmPrice = iCommodityCharmPrice < 0 ? int(-iCommodityCharmPrice) : iCommodityCharmPrice;
         super(NAME,bubbles,cancelable);
      }
   }
}

