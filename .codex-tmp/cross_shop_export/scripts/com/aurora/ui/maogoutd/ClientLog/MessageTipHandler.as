package com.aurora.ui.maogoutd.ClientLog
{
   import a_4752.GameStringManager;
   import a_4754.a_2155;
   import a_4754.a_2161;
   import com.aurora.ui.maogoutd.iface.ITDMessageTip;
   import flash.display.DisplayObject;
   import flash.display.Stage;
   import flash.events.TimerEvent;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class MessageTipHandler
   {
      
      private static var m_pInstance:MessageTipHandler;
      
      private var m_pStage:Stage;
      
      private var m_stTip:ITDMessageTip;
      
      private var m_strItemList:String;
      
      private var m_stTextLog:TextField;
      
      private var m_index:int;
      
      private var m_stTimer:Timer;
      
      private var m_fCheckOnStageTime:Number;
      
      private var m_fOnStageX:Number;
      
      public function MessageTipHandler()
      {
         super();
         this.m_stTimer = new Timer(10000);
         this.m_stTimer.addEventListener(TimerEvent.TIMER,this.OnTimerHandler);
         this.m_stTimer.start();
      }
      
      public static function Get() : MessageTipHandler
      {
         if(null == m_pInstance)
         {
            m_pInstance = new MessageTipHandler();
         }
         return m_pInstance;
      }
      
      protected function OnTimerHandler(e:TimerEvent) : void
      {
         if(null == this.m_stTip)
         {
            return;
         }
         var fOnStageX:Number = (this.m_stTip as DisplayObject).x;
         if((this.m_stTip as DisplayObject).visible && this.m_fOnStageX == fOnStageX && getTimer() - this.m_fCheckOnStageTime > 10000)
         {
            (this.m_stTip as DisplayObject).visible = false;
         }
      }
      
      public function RegisterStage(pStage:Stage) : void
      {
         if(!this.m_pStage)
         {
            this.m_pStage = pStage;
            this.m_stTip = a_2155.e.GetMessageTip() as ITDMessageTip;
         }
      }
      
      public function a_3146(strMsg:String) : void
      {
         if(!this.m_stTip)
         {
            return;
         }
         var stRect:Rectangle = new Rectangle();
         this.m_stTip.showTextTip(this.m_pStage,strMsg,new Rectangle());
         this.m_fCheckOnStageTime = getTimer();
         this.m_fOnStageX = (this.m_stTip as DisplayObject).x;
      }
      
      public function ShowServerError(id:*) : Boolean
      {
         var strID:String = int(100000 + id).toString().substr(1,5);
         id = int("0x9".concat(strID));
         var strMsg:String = GameStringManager.getInstance().GetServerCodeMessage(id);
         if(null == strMsg || strMsg.length == 0)
         {
            return false;
         }
         this.a_3146(strMsg);
         return true;
      }
      
      public function checkCoin(coin:int) : Boolean
      {
         var playerCommon:Object = a_2161.e.GetPlayerCommon();
         if(playerCommon != null)
         {
            if(playerCommon.m_lHappyBean < coin)
            {
               this.a_3146(GameStringManager.getInstance().getString(131339));
               return false;
            }
         }
         return true;
      }
      
      public function checkMoney(money:int) : Boolean
      {
         var playerCommon:Object = a_2161.e.GetPlayerCommon();
         if(playerCommon != null)
         {
            if(playerCommon.m_iMoney < money)
            {
               this.a_3146(GameStringManager.getInstance().getString(132402));
               return false;
            }
         }
         return true;
      }
   }
}

