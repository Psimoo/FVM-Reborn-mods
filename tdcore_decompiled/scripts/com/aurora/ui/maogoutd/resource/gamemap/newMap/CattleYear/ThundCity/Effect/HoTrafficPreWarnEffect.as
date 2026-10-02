package com.aurora.ui.maogoutd.resource.gamemap.newMap.CattleYear.ThundCity.Effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class HoTrafficPreWarnEffect extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      public var stStartFieldGrid:a_3491 = null;
      
      private var m_iStartTime:int;
      
      public var m_BattleType:int;
      
      private var m_iWaitTime:int;
      
      public function HoTrafficPreWarnEffect()
      {
         super();
         a_1279 = -0.5 * 544 - 211;
         m_iYDisplayCenterPos = -0.5 * 58 + 36;
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : HoTrafficPreWarnEffect
      {
         return PoolManager.getInstance().CheckOutOne(HoTrafficPreWarnEffect) as HoTrafficPreWarnEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return HoTrafficPreWarnEffectMovie;
      }
      
      public function a_1797(isReseaved:Boolean) : Boolean
      {
         a_1283 = isReseaved;
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         this.visible = true;
         gotoAndStop(1);
         this.play();
         this.m_iStartTime = 0;
         return true;
      }
      
      public function get WaitTime() : int
      {
         return this.m_iWaitTime;
      }
      
      public function set WaitTime(iWaitTime:int) : void
      {
         this.m_iWaitTime = iWaitTime;
      }
      
      public function a_3940() : Boolean
      {
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
            gotoAndStop(1);
         }
         ++this.m_iStartTime;
         if(this.m_iStartTime > this.WaitTime * 10)
         {
            this.a_3940();
            this.addTrafficShot();
         }
      }
      
      private function addTrafficShot() : void
      {
         var stLastWaitShot:a_4348 = null;
         var move_speed:int = a_3491.a_1080 / (0.2 * 20);
         if(this.stStartFieldGrid)
         {
            stLastWaitShot = HoTrafficShot.a_4344();
            stLastWaitShot.iShotSequenceNum = this.m_BattleType == 0 ? 2 : 1;
            stLastWaitShot.a_1797(1000,move_speed,1000000,this.stStartFieldGrid.m_iXGridNo * a_3491.a_1080 + 20 + 98,this.stStartFieldGrid.m_iYGridNo * a_3491.a_1081 + 62,this.stStartFieldGrid.m_stCurrentBattbleFieldView,this.stStartFieldGrid);
            this.stStartFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE);
         }
      }
   }
}

