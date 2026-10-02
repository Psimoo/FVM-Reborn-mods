package com.aurora.ui.maogoutd.weddingRoom.avatar
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.display.FrameLabel;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class BaseWeddingAvatar extends a_3909
   {
      
      private var a_1109:Timer;
      
      private var m_iTick:int;
      
      private var m_iCurKeyFrameID:int;
      
      private var m_iLoopCnt:int;
      
      private var m_funcCallBack:Function;
      
      public function BaseWeddingAvatar(iTick:int = 120)
      {
         super();
         this.m_iTick = iTick;
         this.a_1109 = new Timer(this.m_iTick);
         gotoAndStop(1);
      }
      
      public function get CurKeyFrameID() : int
      {
         return this.m_iCurKeyFrameID;
      }
      
      public function get NextKeyFrameID() : int
      {
         var iNextKeyFrame:int = this.m_iCurKeyFrameID + 1;
         if(iNextKeyFrame > this.TotalKeyFrameNum)
         {
            iNextKeyFrame = 1;
         }
         return iNextKeyFrame;
      }
      
      public function get TotalKeyFrameNum() : int
      {
         return a_1276.length;
      }
      
      public function GotoAndStopFrame(iKeyFrame:uint) : void
      {
         this.m_iCurKeyFrameID = iKeyFrame;
         var iFrameLabelStartIndex:int = (a_1276[this.m_iCurKeyFrameID - 1] as FrameLabel).frame;
         gotoAndStop(iFrameLabelStartIndex);
         a_3419();
      }
      
      public function a_3940() : Boolean
      {
         this.stop();
         PoolManager.getInstance().CheckInOne(this);
         gotoAndStop(1);
         this.m_funcCallBack = null;
         return true;
      }
      
      public function play(funcCallBack:Function = null, iLoopCnt:int = 1) : void
      {
         this.m_iLoopCnt = iLoopCnt;
         this.m_funcCallBack = funcCallBack;
         this.a_1109.addEventListener(TimerEvent.TIMER,this.a_4109);
         this.a_1109.start();
      }
      
      public function stop() : void
      {
         this.m_funcCallBack = null;
         this.a_1109.removeEventListener(TimerEvent.TIMER,this.a_4109);
         this.a_1109.stop();
      }
      
      protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(null != a_1278 || a_1274 == a_1273)
         {
            --this.m_iLoopCnt;
            if(this.m_iLoopCnt <= 0 && null != this.m_funcCallBack)
            {
               this.m_funcCallBack();
            }
            else
            {
               this.GotoAndStopFrame(this.m_iCurKeyFrameID);
            }
         }
      }
   }
}

