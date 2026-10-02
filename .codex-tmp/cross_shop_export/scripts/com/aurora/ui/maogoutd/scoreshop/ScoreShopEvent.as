package com.aurora.ui.maogoutd.scoreshop
{
   import com.aurora.protocol.hallserver.CResponseScoreShop;
   import com.aurora.protocol.hallserver.CResponseScoreShopInfo;
   import flash.events.Event;
   
   public class ScoreShopEvent extends Event
   {
      
      public var m_stItemInfo:ScoreShopStruct;
      
      public var m_stRspScoreShopInfo:CResponseScoreShopInfo;
      
      public var m_stRepScoreShop:CResponseScoreShop;
      
      public function ScoreShopEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
      {
         super(type,bubbles,cancelable);
      }
   }
}

