package com.aurora.ui.maogoutd.ClientLog
{
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class CheckIDHandler
   {
      
      private static var m_pInstance:CheckIDHandler = new CheckIDHandler();
      
      public var m_vCardMD5Info:Vector.<CardMD5Info>;
      
      private var m_stTimer:Timer;
      
      public function CheckIDHandler()
      {
         super();
         this.m_vCardMD5Info = new Vector.<CardMD5Info>();
         this.m_stTimer = new Timer(10000);
         this.m_stTimer.addEventListener(TimerEvent.TIMER,this.OnTimerHandler);
      }
      
      public static function Get() : CheckIDHandler
      {
         return m_pInstance;
      }
      
      private function OnTimerHandler(e:TimerEvent) : void
      {
         this.CheckMD5();
      }
      
      public function Push(id:int) : void
      {
         var stCardMD5Info:CardMD5Info = null;
         stCardMD5Info = new CardMD5Info(id);
         this.m_vCardMD5Info.push(stCardMD5Info);
      }
      
      public function CheckMD5() : Boolean
      {
         var stCardMD5Info:CardMD5Info = null;
         var bCheck:Boolean = false;
         for each(stCardMD5Info in this.m_vCardMD5Info)
         {
            if(!stCardMD5Info.SimpleCheckID())
            {
               bCheck = true;
               break;
            }
         }
         if(bCheck)
         {
         }
         return bCheck;
      }
      
      public function CheckStart() : void
      {
         this.m_stTimer.start();
      }
   }
}

