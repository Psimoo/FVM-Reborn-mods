package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear
{
   import a_4718.b_180;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import com.aurora.ui.maogoutd.resource.energy.a_4157;
   import com.aurora.ui.maogoutd.resource.energy.a_4162;
   import flash.display.FrameLabel;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.setTimeout;
   
   public class TroubleCleanUpObstacleEffect extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      private var m_stMap:TroubleCleanUpBaseGameMap;
      
      private var m_stGrid:a_3491;
      
      private var m_OutArray:Array = new Array([-35,-78],[11,-80],[-18,-110]);
      
      public function TroubleCleanUpObstacleEffect()
      {
         super();
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : TroubleCleanUpObstacleEffect
      {
         return PoolManager.getInstance().CheckOutOne(TroubleCleanUpObstacleEffect) as TroubleCleanUpObstacleEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return TroubleCleanUpObstacleEffectMovie;
      }
      
      public function a_1797(isReseaved:Boolean) : Boolean
      {
         a_1283 = isReseaved;
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         a_1279 = 2;
         m_iYDisplayCenterPos = 5;
         this.visible = true;
         gotoAndStop(1);
         this.play();
         this.SetAnimation(0);
         return true;
      }
      
      public function InitData(map:TroubleCleanUpBaseGameMap, fieldGrid:a_3491) : void
      {
         this.m_stMap = map;
         this.m_stGrid = fieldGrid;
         fieldGrid.m_iFieldGridType = 4;
      }
      
      public function OpenBox() : void
      {
         this.SetAnimation(1);
      }
      
      public function a_3940() : Boolean
      {
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
      
      private function ProdudeEnergy(pIndex:int, max:int) : void
      {
         var offect:int = 0;
         var stFreeEnergy:a_4157 = null;
         for(var iIndex:int = 0; iIndex < max; iIndex++)
         {
            offect = iIndex == 1 ? 1 : -1;
            stFreeEnergy = a_4162.getInstance().a_4163(b_180.a_420);
            if(null != stFreeEnergy)
            {
               stFreeEnergy.m_stCurrentBattleField = this.m_stGrid.m_stCurrentBattbleFieldView;
               stFreeEnergy.a_1797(0,100,x + this.m_OutArray[pIndex][0] + offect * 10,y + this.m_OutArray[pIndex][1]);
               this.m_stGrid.m_stCurrentBattbleFieldView.AddToBattleView(stFreeEnergy,BattleLayerDefine.EFFECTS_TOP_TYPE);
               setTimeout(this.onDispathEvent,500,stFreeEnergy);
            }
         }
      }
      
      private function onDispathEvent(stFreeEnergy:a_4157) : void
      {
         stFreeEnergy.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_OVER));
      }
      
      private function a_4003(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == 14)
         {
            this.ProdudeEnergy(0,2);
         }
         if(a_1273 == 18)
         {
            this.ProdudeEnergy(0,2);
         }
         if(a_1273 == 22)
         {
            this.ProdudeEnergy(2,1);
            if(this.m_stGrid != null)
            {
               this.m_stGrid.m_iFieldGridType = 0;
            }
            this.m_stGrid = null;
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
      
      public function SetAnimation(frame:int) : void
      {
         if(a_1275 != frame)
         {
            a_1275 = frame;
            gotoAndStop((a_1276[frame] as FrameLabel).frame);
         }
      }
      
      public function SetAnimationOnce2Loop(once:int, loop:int) : void
      {
         a_1275 = loop;
         gotoAndStop((a_1276[once] as FrameLabel).frame);
      }
   }
}

