package com.aurora.ui.maogoutd.resource.defender
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class a_4077 extends a_3976
   {
      
      private var m_stTiemr:Timer;
      
      public function a_4077()
      {
         a_1271 = true;
         super();
         a_1337 = -10;
         a_1338 = -6;
         a_1095 = 75;
         m_iToolType = 1;
      }
      
      public static function a_3926() : a_4077
      {
         return PoolManager.getInstance().CheckOutOne(a_4077) as a_4077;
      }
      
      override protected function getBindMovie() : Class
      {
         return RatHoleStopperDefenseMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         this.m_stTiemr = new Timer(33.3);
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         this.visible = true;
         gotoAndStop(1);
         this.play();
         return super.a_1797(stFieldGrid);
      }
      
      override public function a_3940() : Boolean
      {
         if(this.m_stTiemr != null)
         {
            this.m_stTiemr.removeEventListener(TimerEvent.TIMER,this.a_4003);
            this.m_stTiemr.stop();
            this.m_stTiemr = null;
         }
         return super.a_3940();
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
         if(a_1273 == 3)
         {
            BattleFieldView.a_1035.play();
         }
         trace("m_iCurrentFrame>>>" + a_1273);
         if(a_1273 == a_1274 || a_1273 + 3 > a_1274)
         {
            if(a_1334)
            {
               a_1334.a_3503();
            }
            if(this.m_stTiemr != null)
            {
               this.m_stTiemr.stop();
            }
            a_3969(a_1339);
            return;
         }
      }
   }
}

