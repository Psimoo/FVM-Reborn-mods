package com.aurora.ui.maogoutd.resource.Intruder.DragonYear.MagicBrush
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.display.FrameLabel;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class CloudMistEffect extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      private var m_iStartTime:int;
      
      public var a_1598:a_3491;
      
      private var m_iSleepTime:int;
      
      public function CloudMistEffect()
      {
         super();
         this.m_stTiemr = new Timer(100);
         a_1279 = -43 + 12;
         m_iYDisplayCenterPos = -30;
      }
      
      public static function a_3926() : CloudMistEffect
      {
         return PoolManager.getInstance().CheckOutOne(CloudMistEffect) as CloudMistEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return CloudMistEffectMovie;
      }
      
      public function a_1797(isReseaved:Boolean) : Boolean
      {
         a_1283 = isReseaved;
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         this.addShield(this.a_1598);
         this.visible = true;
         a_1275 = 1;
         gotoAndStop((a_1276[0] as FrameLabel).frame);
         this.play();
         this.m_iStartTime = 0;
         return true;
      }
      
      public function get a_3958() : int
      {
         return this.m_iSleepTime;
      }
      
      public function set a_3958(iSleepTime:int) : void
      {
         this.m_iSleepTime = iSleepTime;
      }
      
      public function a_3940() : Boolean
      {
         this.ClearShield(this.a_1598);
         gotoAndStop(1);
         this.m_stTiemr.removeEventListener(TimerEvent.TIMER,this.a_4003);
         this.m_stTiemr.stop();
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      public function play() : void
      {
         this.m_stTiemr.start();
      }
      
      public function stop() : void
      {
         this.m_stTiemr.stop();
      }
      
      private function a_4003(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == a_1274)
         {
            this.a_3940();
            return;
         }
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         ++this.m_iStartTime;
         if(this.m_iStartTime > this.m_iSleepTime * 10)
         {
            if(a_1275 != 2)
            {
               a_1275 = 2;
               gotoAndStop((a_1276[2] as FrameLabel).frame);
            }
         }
      }
      
      protected function ClearShield(stFieldGrid:a_3491) : Boolean
      {
         var stVector:Array = null;
         if(stFieldGrid)
         {
            stFieldGrid.m_isSilent = false;
            stVector = stFieldGrid.m_stCurrentBattbleFieldView.m_arrEffectArray;
            if(-1 != stVector.indexOf(this))
            {
               stVector.splice(stVector.indexOf(this),1);
            }
            if(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().RemoveMoveDisplayObject(this);
            }
         }
         return true;
      }
      
      protected function addShield(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid != null)
         {
            stFieldGrid.m_isSilent = true;
            stFieldGrid.m_stCurrentBattbleFieldView.m_arrEffectArray.push(this);
            if(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
            }
         }
         return true;
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption();
      }
   }
}

