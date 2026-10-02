package com.aurora.ui.maogoutd.resource.Intruder.DragonYear.SummerLittleMouse
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.display.FrameLabel;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class SpaceRecyclingTargetBrand extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      private var m_stNextFieldGrid:a_3491;
      
      private var m_iLeaveTick:int = 0;
      
      public function SpaceRecyclingTargetBrand()
      {
         super();
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : SpaceRecyclingTargetBrand
      {
         return PoolManager.getInstance().CheckOutOne(SpaceRecyclingTargetBrand) as SpaceRecyclingTargetBrand;
      }
      
      override protected function getBindMovie() : Class
      {
         return SpaceRecyclingTargetBrandMovie;
      }
      
      public function a_1797(stNextFieldGrid:a_3491) : Boolean
      {
         this.m_stNextFieldGrid = stNextFieldGrid;
         stNextFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.EFFECTS_TOP_TYPE,stNextFieldGrid);
         this.x = stNextFieldGrid.m_iXGridNo * a_3491.a_1080 + 15;
         this.y = stNextFieldGrid.m_iYGridNo * a_3491.a_1081 + 15;
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         a_1283 = false;
         this.visible = true;
         gotoAndStop(1);
         this.SetFrameIndex2(0,1);
         this.play();
         this.m_iLeaveTick = 12;
         return true;
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
      
      public function SetFrameIndex2(once:int, loop:int) : void
      {
         a_1275 = loop;
         gotoAndStop((a_1276[once] as FrameLabel).frame);
      }
      
      private function a_4003(a_4730:Event) : void
      {
         nextFrame();
         if(--this.m_iLeaveTick == 0)
         {
            this.SetFrameIndex(2);
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
   }
}

