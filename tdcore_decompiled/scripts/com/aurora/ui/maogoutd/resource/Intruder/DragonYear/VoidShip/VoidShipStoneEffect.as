package com.aurora.ui.maogoutd.resource.Intruder.DragonYear.VoidShip
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.display.FrameLabel;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class VoidShipStoneEffect extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      private var m_stNextFieldGrid:a_3491;
      
      private var m_iTargetY:int = 0;
      
      public function VoidShipStoneEffect()
      {
         super();
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : VoidShipStoneEffect
      {
         return PoolManager.getInstance().CheckOutOne(VoidShipStoneEffect) as VoidShipStoneEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return VoidShipStoneEffectMovie;
      }
      
      public function a_1797(stNextFieldGrid:a_3491) : Boolean
      {
         this.m_stNextFieldGrid = stNextFieldGrid;
         stNextFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.EFFECTS_TOP_TYPE);
         this.x = stNextFieldGrid.m_iXGridNo * a_3491.a_1080 - 20;
         this.y = -180 + BattleFieldView.m_stRandomSeed.nextInt(160);
         this.m_iTargetY = stNextFieldGrid.m_iYGridNo * a_3491.a_1081 - 40;
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         a_1283 = false;
         this.visible = true;
         gotoAndStop(1);
         this.SetFrameIndex(0);
         this.play();
         return true;
      }
      
      protected function a_3940() : Boolean
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
         this.a_3940();
      }
      
      public function SetFrameIndex(frame:int) : void
      {
         if(a_1275 != frame)
         {
            a_1275 = frame;
            gotoAndStop((a_1276[frame] as FrameLabel).frame);
         }
      }
      
      private function a_4003(a_4730:Event) : void
      {
         nextFrame();
         if(this.y < this.m_iTargetY)
         {
            this.y += 15;
         }
         else
         {
            this.a_3502(this.m_stNextFieldGrid);
            this.SetFrameIndex(1);
         }
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(a_1273 == a_1274)
         {
            this.a_3940();
         }
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

