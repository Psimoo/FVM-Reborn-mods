package com.aurora.ui.maogoutd.resource.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.BaseGameMoveMap;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class SpaceMarkEffect extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      private var m_iStartTime:int;
      
      private var a_1334:a_3491;
      
      private var m_iSleepTime:int;
      
      public function SpaceMarkEffect()
      {
         super();
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : SpaceMarkEffect
      {
         return PoolManager.getInstance().CheckOutOne(SpaceMarkEffect) as SpaceMarkEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return SpaceMarkEffectMovie;
      }
      
      public function a_1797(isReseaved:Boolean, grid:a_3491) : Boolean
      {
         a_1283 = isReseaved;
         this.a_1334 = grid;
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         this.visible = true;
         gotoAndStop(1);
         this.play();
         this.m_iStartTime = 0;
         x = this.a_1334.m_iXGridNo * a_3491.a_1080 + 4;
         y = this.a_1334.m_iYGridNo * a_3491.a_1081 + 12;
         this.a_1334.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.EFFECT_LAYER_TRAY_BOTTOM_TYPE,this.a_1334);
         var map:BaseGameMoveMap = this.a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap();
         if(map != null)
         {
            map.AddMoveDisplayObject(this,this.a_1334.m_iXGridNo,this.a_1334.m_iYGridNo);
         }
         this.a_1334.m_stSpaceMarkEffect = this;
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
         var map:BaseGameMoveMap = this.a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap();
         if(map != null)
         {
            map.RemoveMoveDisplayObject(this);
         }
         this.a_1334 = null;
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
      }
   }
}

