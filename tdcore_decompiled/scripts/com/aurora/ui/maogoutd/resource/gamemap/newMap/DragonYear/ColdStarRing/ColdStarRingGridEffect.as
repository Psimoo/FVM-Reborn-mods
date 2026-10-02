package com.aurora.ui.maogoutd.resource.gamemap.newMap.DragonYear.ColdStarRing
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.BaseGameMoveMap;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockMap;
   import flash.display.FrameLabel;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class ColdStarRingGridEffect extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      private var m_iStartTime:int;
      
      public var m_iRecycleState:int;
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      private var m_stBlockMap:MoveBlockMap;
      
      private var m_stMap:IColdStarRingMap;
      
      private var m_stEntity:a_3962;
      
      private var m_iGridState:int = 1;
      
      private var m_iSleepTime:int;
      
      public function ColdStarRingGridEffect()
      {
         super();
         a_1279 = 0;
         m_iYDisplayCenterPos = 0;
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : ColdStarRingGridEffect
      {
         return PoolManager.getInstance().CheckOutOne(ColdStarRingGridEffect) as ColdStarRingGridEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return ColdStarRingGridEffectMovie;
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
         this.SetFrameIndex(0);
         this.m_iRecycleState = 1;
         return true;
      }
      
      public function InitData(blockMap:MoveBlockMap, map:IColdStarRingMap, stCurrentBattleFieldView:BattleFieldView) : void
      {
         this.m_stBlockMap = blockMap;
         this.m_stMap = map;
         this.m_iGridState = 1;
         this.m_stEntity = null;
         this.m_stCurrentBattleFieldView = stCurrentBattleFieldView;
         this.m_stBlockMap.getMoveBlockFieldGrid();
      }
      
      private function CheckGrid() : void
      {
         var entity:a_3962 = null;
         if(this.m_stBlockMap == null)
         {
            return;
         }
         var iNoX:int = this.m_stBlockMap.getMoveBlockFieldGrid().m_iXGridNo;
         var iNoY:int = this.m_stBlockMap.getMoveBlockFieldGrid().m_iYGridNo;
         var m_stTargetGrid:a_3491 = this.m_stCurrentBattleFieldView.a_3438(iNoX,iNoY);
         if(this.m_iGridState == 1)
         {
            entity = null;
            if(m_stTargetGrid.m_stAttackFighter != null)
            {
               entity = m_stTargetGrid.m_stAttackFighter;
            }
            else if(m_stTargetGrid.m_stProtector != null)
            {
               entity = m_stTargetGrid.m_stProtector;
            }
            else if(m_stTargetGrid.m_stFlowerDefense != null)
            {
               entity = m_stTargetGrid.m_stFlowerDefense;
            }
            else if(m_stTargetGrid.m_stBaseAuxiliaryFighter != null)
            {
               entity = m_stTargetGrid.m_stBaseAuxiliaryFighter;
            }
            else if(m_stTargetGrid.m_stTrayDefense != null)
            {
               entity = m_stTargetGrid.m_stTrayDefense;
            }
            else if(m_stTargetGrid.m_stBoomDefense != null)
            {
               entity = m_stTargetGrid.m_stBoomDefense;
            }
            if(this.m_stEntity != null && entity == null)
            {
               if(this.m_stEntity.m_iDieType == 1 || this.m_stEntity.m_iDieType == 3)
               {
                  this.ClearSelf();
                  this.BackGrid();
                  return;
               }
            }
            this.m_stEntity = entity;
         }
      }
      
      public function get a_3958() : int
      {
         return this.m_iSleepTime;
      }
      
      public function set a_3958(iSleepTime:int) : void
      {
         this.m_iSleepTime = iSleepTime;
      }
      
      private function BackGrid() : void
      {
         var moveMap:BaseGameMoveMap = null;
         if(this.m_stMap != null && this.m_stBlockMap != null)
         {
            moveMap = this.m_stCurrentBattleFieldView.GetGameMoveMap();
            if(moveMap != null)
            {
               moveMap.RemoveMoveDisplayObject(this);
            }
            this.m_stMap.RemoveTargetgrid(this.m_stBlockMap);
            this.m_stMap = null;
            this.m_stBlockMap = null;
         }
      }
      
      public function a_3940() : Boolean
      {
         this.BackGrid();
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
         this.m_iGridState = 3;
         this.SetFrameIndex(1);
         this.m_iRecycleState = 2;
         this.m_stEntity = null;
      }
      
      private function a_4003(a_4730:Event) : void
      {
         this.CheckGrid();
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

