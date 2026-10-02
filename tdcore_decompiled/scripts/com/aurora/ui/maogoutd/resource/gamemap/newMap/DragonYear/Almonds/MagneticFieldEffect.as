package com.aurora.ui.maogoutd.resource.gamemap.newMap.DragonYear.Almonds
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
   
   public class MagneticFieldEffect extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      private var m_iStartTime:int;
      
      public var m_stTargetGrid:a_3491;
      
      public var m_iRecycleState:int;
      
      private var m_iSleepTime:int;
      
      public function MagneticFieldEffect()
      {
         super();
         a_1279 = 0;
         m_iYDisplayCenterPos = 0;
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : MagneticFieldEffect
      {
         return PoolManager.getInstance().CheckOutOne(MagneticFieldEffect) as MagneticFieldEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return MagneticFieldEffectMovie;
      }
      
      public function a_1797(isReseaved:Boolean) : Boolean
      {
         a_1283 = isReseaved;
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         a_1275 = 0;
         this.visible = true;
         gotoAndStop(1);
         this.play();
         this.m_iStartTime = 0;
         this.SetFrameIndex2(0,1);
         this.m_iRecycleState = 1;
         return true;
      }
      
      public function InitFiledGrid(battleView:BattleFieldView, gridX:int, gridY:int) : void
      {
         var stTargetGrid:a_3491 = null;
         stTargetGrid = battleView.a_3438(gridX,gridY);
         battleView.AddToBattleView(this,BattleLayerDefine.EFFECTS_TOP_TYPE,stTargetGrid);
         this.x = gridX * a_3491.a_1080 - 9;
         this.y = gridY * a_3491.a_1081 + 2;
         this.m_stTargetGrid = stTargetGrid;
         stTargetGrid.m_isSilent = true;
         this.m_stTargetGrid.m_iHurtRate = 0;
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
         if(this.m_stTargetGrid != null)
         {
            this.m_stTargetGrid.m_isSilent = false;
            this.m_stTargetGrid.m_iHurtRate = 1;
         }
         gotoAndStop(1);
         this.m_stTiemr.removeEventListener(TimerEvent.TIMER,this.a_4003);
         this.m_stTiemr.stop();
         PoolManager.getInstance().CheckInOne(this);
         this.m_iRecycleState = 0;
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
      
      public function ReleaseSelf() : void
      {
         if(this.m_iRecycleState != 1)
         {
            return;
         }
         this.a_3940();
      }
      
      public function ClearSelf() : void
      {
         if(this.m_iRecycleState != 1)
         {
            return;
         }
         this.SetFrameIndex(2);
         this.m_iRecycleState = 2;
      }
      
      private function a_4003(a_4730:Event) : void
      {
         nextFrame();
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

