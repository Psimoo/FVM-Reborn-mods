package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.Adventure
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import flash.display.FrameLabel;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class PhotosphereEffect extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      public var m_targetGrid:a_3491;
      
      private var m_stMap:SeasonBaseGameMap;
      
      private var m_iTick:int = 0;
      
      private var m_iState:int = 0;
      
      private var m_bHasBornFlower:Boolean = false;
      
      private var _laserArray:Array = new Array();
      
      public function PhotosphereEffect()
      {
         super();
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : PhotosphereEffect
      {
         return PoolManager.getInstance().CheckOutOne(PhotosphereEffect) as PhotosphereEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return PhotosphereEffectMovie;
      }
      
      public function a_1797(isReseaved:Boolean) : Boolean
      {
         a_1283 = isReseaved;
         m_iYDisplayCenterPos = 0;
         a_1279 = 0;
         this.scaleX = 1;
         this.scaleY = 1;
         this.play();
         this.m_iTick = 0;
         this.m_iState = 0;
         this.m_bHasBornFlower = false;
         return true;
      }
      
      public function RunTick() : void
      {
         ++this.m_iTick;
         if(this.m_iState == 0)
         {
            if(this.m_iTick == 64)
            {
               this.SetAnimationOnce2Loop(2,3);
               this.a_3502(this.m_targetGrid,true);
               this.m_iState = 1;
            }
         }
      }
      
      public function ReleaseBall() : void
      {
         this.m_iState = 10;
         this.SetAnimation(5);
         this.m_stMap.RealeaseBall(this);
      }
      
      public function ActiveBall() : void
      {
         this.m_iState = 2;
         this.SetAnimation(4);
      }
      
      public function BoomBall() : void
      {
         this.m_iState = 10;
         this.SetAnimation(6);
         this.m_stMap.RealeaseBall(this);
      }
      
      public function InitData(grid:a_3491, map:SeasonBaseGameMap) : void
      {
         this.m_targetGrid = grid;
         this.m_stMap = map;
         this.SetAnimationOnce2Loop(0,1);
      }
      
      private function CheckHasFlower() : Boolean
      {
         if(this.m_targetGrid == null)
         {
            return false;
         }
         if(this.m_targetGrid.m_stFlowerDefense != null && (this.m_targetGrid.m_stFlowerDefense.iEnergyTypeID == 1 || this.m_targetGrid.m_stFlowerDefense.iEnergyTypeID == 3))
         {
            return true;
         }
         return false;
      }
      
      public function a_3940() : Boolean
      {
         this.stop();
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      public function play() : void
      {
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         this.m_stTiemr.start();
         gotoAndStop(1);
      }
      
      public function stop() : void
      {
         this.m_stTiemr.removeEventListener(TimerEvent.TIMER,this.a_4003);
         this.m_stTiemr.stop();
         gotoAndStop(1);
      }
      
      private function a_4003(a_4730:Event) : void
      {
         nextFrame();
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(a_1273 == 55 && this.m_iState == 10)
         {
            this.m_iState = 11;
            this.ClearFieldGrid();
         }
         if(a_1273 == a_1274 || a_1273 == 51)
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
      
      private function ClearFieldGrid() : void
      {
         var j:int = 0;
         for(var i:int = this.m_targetGrid.m_iXGridNo - 1; i <= this.m_targetGrid.m_iXGridNo + 1; i++)
         {
            for(j = this.m_targetGrid.m_iYGridNo - 1; j <= this.m_targetGrid.m_iYGridNo + 1; j++)
            {
               this.a_3502(this.m_targetGrid.m_stCurrentBattbleFieldView.a_3438(i,j));
            }
         }
      }
      
      protected function a_3502(stFieldGrid:a_3491, isCleanTray:Boolean = false) : Boolean
      {
         if(stFieldGrid == null)
         {
            return true;
         }
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(500);
         }
         else if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(500);
         }
         else if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(500);
         }
         else if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(500);
         }
         else if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(500);
         }
         else if(stFieldGrid.HasNewSlot())
         {
            stFieldGrid.DamageNewSlot(false,0,false,500,1);
         }
         else if(isCleanTray && null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(500);
         }
         return true;
      }
      
      public function AddLaser(laser:LaserEffect) : void
      {
         if(this._laserArray.indexOf(laser) == -1)
         {
            this._laserArray.push(laser);
         }
      }
      
      public function RemoveLaser(laser:LaserEffect) : void
      {
         var index:int = this._laserArray.indexOf(laser);
         if(index != -1)
         {
            this._laserArray.splice(index);
         }
         if(this._laserArray.length == 0)
         {
            this.ReleaseBall();
         }
      }
   }
}

