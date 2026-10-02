package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.Adventure
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import flash.display.FrameLabel;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class LaserEffect extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      public var m_stMap:SeasonBaseGameMap;
      
      private var startPosition:Point;
      
      private var targetEffect:a_3909;
      
      private var ballList:Array = new Array();
      
      private var remainTick:int = -1;
      
      private var bEndRay:Boolean = false;
      
      private var m_stStartFieldGrid:a_3491;
      
      private var m_stEndFieldGrid:a_3491;
      
      public function LaserEffect()
      {
         super();
         a_1279 = -23;
         m_iYDisplayCenterPos = -23;
         this.m_stTiemr = new Timer(80);
      }
      
      public static function a_3926() : LaserEffect
      {
         return PoolManager.getInstance().CheckOutOne(LaserEffect) as LaserEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return LaserEffectMovie;
      }
      
      public function a_1797(stStartFieldGrid:a_3491, startBall:PhotosphereEffect, target:a_3909) : Boolean
      {
         var iXpos:int = 0;
         var iYpos:int = 0;
         visible = false;
         a_1283 = false;
         this.scaleX = 1;
         this.scaleY = 1;
         this.play();
         iXpos = 0;
         iYpos = 0;
         this.targetEffect = target;
         iXpos = stStartFieldGrid.m_iXGridNo * a_3491.a_1080 + 30;
         iYpos = stStartFieldGrid.m_iYGridNo * a_3491.a_1081 + 32;
         this.remainTick = -1;
         this.startPosition = new Point(iXpos,iYpos);
         this.ballList.length = 0;
         this.ballList.push(startBall);
         startBall.AddLaser(this);
         a_1271 = true;
         this.bEndRay = false;
         stStartFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_SKY_TYPE,stStartFieldGrid.m_stCurrentBattbleFieldView.a_3438(8,6));
         x = iXpos;
         y = iYpos;
         this.m_stStartFieldGrid = stStartFieldGrid;
         this.CaculateScale(this.targetEffect.x,this.targetEffect.y);
         visible = false;
         return true;
      }
      
      public function EndRay(endBall:PhotosphereEffect) : void
      {
         this.ballList.push(endBall);
         endBall.AddLaser(this);
         this.targetEffect = null;
         this.remainTick = 20 * 20;
         this.bEndRay = true;
         this.m_stEndFieldGrid = endBall.m_targetGrid;
         this.CaculateScale(this.m_stEndFieldGrid.m_iXGridNo * a_3491.a_1080 + 30,this.m_stEndFieldGrid.m_iYGridNo * a_3491.a_1081 + 32);
      }
      
      public function RunTick() : void
      {
         if(this.remainTick == -1)
         {
            return;
         }
         var i:* = 0;
         var j:* = 0;
         --this.remainTick;
         if(this.bEndRay == true && this.remainTick % 20 == 0)
         {
            i = this.m_stStartFieldGrid.m_iXGridNo;
            j = this.m_stStartFieldGrid.m_iYGridNo;
            while(i != this.m_stEndFieldGrid.m_iXGridNo || j != this.m_stEndFieldGrid.m_iYGridNo)
            {
               if(i < this.m_stEndFieldGrid.m_iXGridNo)
               {
                  i++;
               }
               else if(i > this.m_stEndFieldGrid.m_iXGridNo)
               {
                  i--;
               }
               if(j < this.m_stEndFieldGrid.m_iYGridNo)
               {
                  j++;
               }
               else if(j > this.m_stEndFieldGrid.m_iYGridNo)
               {
                  j--;
               }
               this.DamageGrid(i,j);
            }
            this.DamageGrid(this.m_stStartFieldGrid.m_iXGridNo,this.m_stStartFieldGrid.m_iYGridNo);
            this.DamageGrid(this.m_stEndFieldGrid.m_iXGridNo,this.m_stEndFieldGrid.m_iYGridNo);
         }
         if(this.remainTick == 0)
         {
            for(i = 0; i < this.ballList.length; i++)
            {
               this.ballList[i].RemoveLaser(this);
               this.m_stMap.RemoveRay(this);
               this.a_3940();
            }
         }
      }
      
      public function DamageGrid(iNoX:int, iNoY:int) : void
      {
         var stMoveIntruder:a_4206 = null;
         var grid:a_3491 = this.m_stStartFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         this.a_3502(grid);
         var arrMoveIntruder:Array = grid.a_1511.slice();
         for each(stMoveIntruder in arrMoveIntruder)
         {
            if(!stMoveIntruder.isCannotSeeByFighter)
            {
               stMoveIntruder.a_3969(1000);
               stMoveIntruder.a_4208(b_182.a_432,2);
            }
         }
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return true;
         }
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(10);
         }
         else if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(10);
         }
         else if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(10);
         }
         else if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(10);
         }
         else if(stFieldGrid.HasNewSlot())
         {
            stFieldGrid.DamageNewSlot(false,0,false,10,1);
         }
         else if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(10);
         }
         return true;
      }
      
      public function CaculateScale(MouseX:int, MouseY:int) : void
      {
         var dy:Number = NaN;
         var dx:Number = NaN;
         var ratation:Number = NaN;
         var dis:Number = NaN;
         if(this.startPosition != null)
         {
            dy = MouseY - this.startPosition.y;
            dx = MouseX - this.startPosition.x;
            ratation = Math.atan2(dy,dx);
            this.rotation = ratation * 180 / Math.PI;
            dis = Point.distance(this.startPosition,new Point(MouseX,MouseY));
            stOriginalMovieClip.bgMask.width = dis;
            stOriginalMovieClip.mc_end.x = dis;
            visible = true;
         }
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
         if(this.bEndRay == false)
         {
            this.CaculateScale(this.targetEffect.x,this.targetEffect.y);
         }
         nextFrame();
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
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

