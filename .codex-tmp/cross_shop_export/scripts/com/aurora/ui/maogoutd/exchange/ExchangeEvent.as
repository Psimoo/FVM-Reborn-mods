package com.aurora.ui.maogoutd.exchange
{
   import com.aurora.protocol.hallserver.CResponseDecompose;
   import com.aurora.protocol.hallserver.CResponseExchange;
   import com.aurora.protocol.hallserver.CResponseExchangeInfo;
   import com.aurora.protocol.hallserver.CResponseFortune;
   import com.aurora.ui.maogoutd.choujiang.ExchangeInfoStruct;
   import flash.events.Event;
   
   public class ExchangeEvent extends Event
   {
      
      public var m_stResponseExchangeInfo:CResponseExchangeInfo;
      
      public var m_stResponseExchange:CResponseExchange;
      
      public var m_stInfoStruct:ExchangeInfoStruct;
      
      public var m_stResponseFortune:CResponseFortune;
      
      public var m_stResponseDecompose:CResponseDecompose;
      
      public function ExchangeEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
      {
         super(type,bubbles,cancelable);
      }
   }
}

