package com.aurora.ui.maogoutd.resource.Intruder.DragonYear.VoidShip
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class VoidShipPortalMouseMoveIntruder extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      private var m_stNextFieldGrid:a_3491;
      
      public function VoidShipPortalMouseMoveIntruder()
      {
         super();
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : VoidShipPortalMouseMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(VoidShipPortalMouseMoveIntruder) as VoidShipPortalMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return VoidShipPortalMouseMoveIntruderMovie;
      }
      
      public function a_1797(stNextFieldGrid:a_3491) : Boolean
      {
         this.m_stNextFieldGrid = stNextFieldGrid;
         this.a_3502(stNextFieldGrid);
         stNextFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.EFFECTS_BASE_TYPE,stNextFieldGrid);
         this.x = stNextFieldGrid.m_iXGridNo * a_3491.a_1080 + 15;
         this.y = stNextFieldGrid.m_iYGridNo * a_3491.a_1081 + 5;
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         a_1283 = false;
         this.visible = true;
         gotoAndStop(1);
         this.SetFrameIndex2(0,1);
         this.play();
         if(stNextFieldGrid != null && 0 == stNextFieldGrid.m_iFieldGridType)
         {
            stNextFieldGrid.m_iFieldGridType = 1;
         }
         return true;
      }
      
      protected function a_3940() : Boolean
      {
         if(this.m_stNextFieldGrid != null && 1 == this.m_stNextFieldGrid.m_iFieldGridType)
         {
            this.m_stNextFieldGrid.m_iFieldGridType = 0;
         }
         this.visible = false;
         gotoAndStop(1);
         this.m_stTiemr.removeEventListener(TimerEvent.TIMER,this.a_4003);
         this.m_stTiemr.stop();
         PoolManager.getInstance().CheckInOne(this);
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
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
         if(a_1275 != loop)
         {
            a_1275 = loop;
            gotoAndStop((a_1276[once] as FrameLabel).frame);
         }
      }
      
      public function ClearSelf() : void
      {
         this.SetFrameIndex(2);
      }
      
      private function a_4003(a_4730:Event) : void
      {
         var stBaseShot:a_4348 = null;
         nextFrame();
         var localX:int = this.m_stNextFieldGrid.m_iXGridNo * a_3491.a_1080 + 30;
         for each(stBaseShot in this.m_stNextFieldGrid.m_stCurrentBattbleFieldView.m_stBaseShotVector[this.m_stNextFieldGrid.m_iYGridNo].slice())
         {
            if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && (stBaseShot.x > localX - 40 && stBaseShot.x < localX + 20))
            {
               stBaseShot.a_4350();
            }
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

