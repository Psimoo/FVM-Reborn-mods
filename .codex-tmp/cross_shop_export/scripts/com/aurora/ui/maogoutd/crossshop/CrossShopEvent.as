package com.aurora.ui.maogoutd.crossshop
{
   import com.aurora.ui.maogoutd.crossshop.xml.ExchangeItemInfo;
   import flash.events.Event;
   
   public class CrossShopEvent extends Event
   {
      
      public var m_stInfoStruct:ExchangeItemInfo;
      
      public var m_iCrossCoin:int;
      
      public function CrossShopEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
      {
         super(type,bubbles,cancelable);
      }
   }
}

