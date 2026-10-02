package com.aurora.ui.maogoutd.starpieceshop
{
   import com.aurora.protocol.hallserver.CResponseStarPieceShopBuy;
   import com.aurora.ui.maogoutd.choujiang.ExchangeInfoStruct;
   import flash.events.Event;
   
   public class StarPieceShopEvent extends Event
   {
      
      public var a_862:ExchangeInfoStruct;
      
      public var m_stResponseBuy:CResponseStarPieceShopBuy;
      
      public function StarPieceShopEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
      {
         super(type,bubbles,cancelable);
      }
   }
}

