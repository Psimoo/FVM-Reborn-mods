package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.laborDay
{
   import a_4752.a_2036;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.display.FrameLabel;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class LaborBottleBulletEffect extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      private var m_stStartFieldGrid:a_3491;
      
      private var a_1598:a_3491;
      
      private var m_iTargetY:int;
      
      private var m_iLevel:int;
      
      private var m_iState:int = 0;
      
      private var m_iRunTick:int = 0;
      
      private var m_iHasRunTick:int = 0;
      
      public function LaborBottleBulletEffect()
      {
         super();
         this.m_stTiemr = new Timer(50);
      }
      
      public static function a_3926() : LaborBottleBulletEffect
      {
         return PoolManager.getInstance().CheckOutOne(LaborBottleBulletEffect) as LaborBottleBulletEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return LaborBottleBulletEffectMovie;
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
      
      public function InitData(fieldGrid:a_3491, level:int) : void
      {
         this.m_iLevel = level;
         this.m_stStartFieldGrid = fieldGrid;
         this.m_iRunTick = 0;
         this.m_iState = 0;
         visible = true;
         this.x = this.m_stStartFieldGrid.m_iXGridNo * a_3491.a_1080 + 7;
         this.y = this.m_stStartFieldGrid.m_iYGridNo * a_3491.a_1081 - 60;
         this.m_iTargetY = this.y - 450;
         this.m_iHasRunTick = 0;
      }
      
      private function GetTargetGrid() : void
      {
         var stMoveIntruder:a_4206 = null;
         var tempMoveIntrude:a_4206 = null;
         var battleView:BattleFieldView = this.m_stStartFieldGrid.m_stCurrentBattbleFieldView;
         var mouseArray:Array = battleView.m_arrBaseMoveIntruderVector;
         var m_iYGridNo:int = this.m_stStartFieldGrid.m_iYGridNo;
         var stRowIntruderArray:Array = new Array();
         for each(stMoveIntruder in mouseArray)
         {
            if(stMoveIntruder.iLifeValue > 0 && stMoveIntruder.iSpaceState != 1 && !stMoveIntruder.isCannotSeeByFighter && (stMoveIntruder.m_stCurrentFieldGrid.m_iYGridNo == m_iYGridNo || stMoveIntruder.m_stCurrentFieldGrid.m_iYGridNo == m_iYGridNo - 1 || stMoveIntruder.m_stCurrentFieldGrid.m_iYGridNo == m_iYGridNo + 1))
            {
               stRowIntruderArray.push(stMoveIntruder);
            }
         }
         stRowIntruderArray.sort(this.OnSortToken);
         if(stRowIntruderArray.length > 0)
         {
            tempMoveIntrude = stRowIntruderArray[0];
         }
         if(tempMoveIntrude)
         {
            if(this.m_iLevel == 1)
            {
               this.a_1598 = tempMoveIntrude.m_stCurrentFieldGrid;
            }
            else
            {
               this.a_1598 = battleView.a_3438(tempMoveIntrude.m_stCurrentFieldGrid.m_iXGridNo,m_iYGridNo);
            }
         }
         else
         {
            this.a_1598 = battleView.a_3438(7,m_iYGridNo);
         }
      }
      
      private function OnSortToken(a:a_4206, b:a_4206) : int
      {
         var aMouseX:Number = a.x + a.stDisplayBitmap.x + a.width / 2;
         var bMouseX:Number = b.x + a.stDisplayBitmap.x + b.width / 2;
         if(aMouseX < bMouseX)
         {
            return -1;
         }
         return 1;
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
      
      private function a_4003(a_4730:Event) : void
      {
         if(!a_2036.getInstance().m_bInBattleView)
         {
            this.a_3940();
            return;
         }
         if(this.m_iState == 0)
         {
            this.y -= 65;
            if(this.y <= this.m_iTargetY)
            {
               this.m_iState = 1;
               this.m_iRunTick = 1;
               visible = false;
            }
         }
         else if(this.m_iState == 1)
         {
            --this.m_iRunTick;
            if(this.m_iRunTick == 0)
            {
               this.m_iState = 2;
               visible = true;
               this.GetTargetGrid();
               this.x = this.a_1598.m_iXGridNo * a_3491.a_1080 + 7;
               this.m_iTargetY = this.a_1598.m_iYGridNo * a_3491.a_1081;
               this.y = this.m_iTargetY - 450;
            }
         }
         else if(this.m_iState == 2)
         {
            this.y += 65;
            if(this.y >= this.m_iTargetY)
            {
               this.m_iState = 3;
               this.m_iTargetY = -1;
               if(this.m_iLevel == 1)
               {
                  this.HitOne();
                  this.a_3940();
                  return;
               }
               if(this.m_iLevel == 2)
               {
                  this.SetAnimation(1);
               }
               else if(this.m_iLevel == 3)
               {
                  this.SetAnimation(2);
               }
               else if(this.m_iLevel == 4)
               {
                  this.SetAnimation(3);
               }
            }
         }
         ++this.m_iHasRunTick;
         if(this.m_iHasRunTick % 2 == 0)
         {
            return;
         }
         nextFrame();
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(a_1273 == 4 || a_1273 == 9 || a_1273 == 13)
         {
            this.a_4360();
         }
         if(a_1273 == 6 || a_1273 == 11 || a_1273 == a_1274)
         {
            this.a_3940();
         }
      }
      
      private function HitOne() : void
      {
         var arrMouveIntruder:Array = null;
         var stMouseIntruder:a_4206 = null;
         if(null != this.a_1598)
         {
            arrMouveIntruder = this.a_1598.a_1511.slice();
            for each(stMouseIntruder in arrMouveIntruder)
            {
               if(null != stMouseIntruder)
               {
                  if(stMouseIntruder.IsBossIntruder)
                  {
                     stMouseIntruder.a_4209(2500);
                  }
                  else
                  {
                     stMouseIntruder.a_4209(500);
                  }
                  break;
               }
            }
         }
      }
      
      private function a_4360() : void
      {
         var stFieldGrid:a_3491 = null;
         var j:int = 0;
         var arrMouveIntruder:Array = null;
         var stMouseIntruder:a_4206 = null;
         var damageRate:int = 0;
         var damage:int = 0;
         if(this.a_1598 == null)
         {
            return;
         }
         var lx:int = this.a_1598.m_iXGridNo - 1;
         var rx:int = this.a_1598.m_iXGridNo + 1;
         var dy:int = this.a_1598.m_iYGridNo - 1;
         var uy:int = this.a_1598.m_iYGridNo + 1;
         for(var i:int = lx; i <= rx; i++)
         {
            for(j = dy; j <= uy; j++)
            {
               stFieldGrid = this.a_1598.m_stCurrentBattbleFieldView.a_3438(i,j);
               if(null != stFieldGrid)
               {
                  arrMouveIntruder = stFieldGrid.a_1511.slice();
                  for each(stMouseIntruder in arrMouveIntruder)
                  {
                     if(null != stMouseIntruder)
                     {
                        damageRate = 1;
                        damage = 1000;
                        if(stMouseIntruder.IsBossIntruder)
                        {
                           damageRate = 5;
                        }
                        if(this.m_iLevel == 2)
                        {
                           damage = 1000;
                        }
                        else if(this.m_iLevel == 2)
                        {
                           damage = 3000;
                        }
                        else
                        {
                           damage = 8000;
                        }
                        stMouseIntruder.a_4209(damage * damageRate);
                     }
                  }
               }
            }
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

