package com.aurora.ui.maogoutd.resource.Intruder.BaseCamp.TireRat
{
   import a_4718.b_181;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class TireRatMouseMoveIntruder extends a_4206
   {
      
      private var m_skilled:int;
      
      private var m_throwSkilled:Boolean;
      
      protected var a_1311:int = 90;
      
      protected var a_1312:int = -a_3491.a_1080 / (0.5 * 20);
      
      private const FULL_HP:int = 1200;
      
      private const HURT_HP:int = 600;
      
      private const DEAD_HP:int = 0;
      
      private var BoomDefense:Array = new Array(286458144,294846544,286457950,286457983,286394688,286394702,286394703);
      
      public function TireRatMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(TireRatMouseMoveIntruder) as TireRatMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return TireRatMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (2 * 20);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = this.FULL_HP;
         a_1279 = -12 - 30;
         a_1272 = 0;
         this.m_skilled = -1;
         this.m_throwSkilled = false;
         a_1464 = true;
         BoomIsReduceLife = false;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > this.HURT_HP)
         {
            if(a_1475)
            {
               if(a_1275 != 5)
               {
                  a_1275 = 5;
                  gotoAndStop((a_1276[5] as FrameLabel).frame);
               }
            }
            else if(this.m_skilled == 1)
            {
               if(a_1275 != 2)
               {
                  a_1275 = 2;
                  gotoAndStop((a_1276[2] as FrameLabel).frame);
               }
            }
            else if(this.m_skilled == 2)
            {
               if(a_1275 != 3)
               {
                  a_1275 = 3;
                  gotoAndStop((a_1276[3] as FrameLabel).frame);
               }
            }
            else if(this.m_skilled == 3)
            {
               if(a_1275 != 4)
               {
                  a_1275 = 4;
                  gotoAndStop((a_1276[4] as FrameLabel).frame);
               }
            }
            else if(this.m_skilled == 4)
            {
               if(a_1275 != 1)
               {
                  a_1275 = 1;
                  gotoAndStop((a_1276[1] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 0)
            {
               a_1275 = 0;
               gotoAndStop((a_1276[0] as FrameLabel).frame);
            }
         }
         else if(a_1339 > 0)
         {
            if(a_1475)
            {
               if(a_1275 != 11)
               {
                  a_1275 = 11;
                  gotoAndStop((a_1276[11] as FrameLabel).frame);
               }
            }
            else if(this.m_skilled == 1)
            {
               if(a_1275 != 8)
               {
                  a_1275 = 8;
                  gotoAndStop((a_1276[8] as FrameLabel).frame);
               }
            }
            else if(this.m_skilled == 2)
            {
               if(a_1275 != 9)
               {
                  a_1275 = 9;
                  gotoAndStop((a_1276[9] as FrameLabel).frame);
               }
            }
            else if(this.m_skilled == 3)
            {
               if(a_1275 != 10)
               {
                  a_1275 = 10;
                  gotoAndStop((a_1276[10] as FrameLabel).frame);
               }
            }
            else if(this.m_skilled == 4)
            {
               if(a_1275 != 7)
               {
                  a_1275 = 7;
                  gotoAndStop((a_1276[7] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 6)
            {
               a_1275 = 6;
               gotoAndStop((a_1276[6] as FrameLabel).frame);
            }
         }
         else if(a_1339 <= 0)
         {
            if(this.m_skilled == -1)
            {
               if(a_1275 != 13)
               {
                  a_1275 = 13;
                  gotoAndStop((a_1276[13] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 12)
            {
               a_1275 = 12;
               gotoAndStop((a_1276[12] as FrameLabel).frame);
            }
            a_3419();
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            this.play();
         }
         a_3419();
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         super.a_4209(iRduceLifeValue);
         this.ResetMovieStatus();
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         if(m_stCurrentFieldGrid)
         {
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         }
         super.a_4210();
         return true;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var numOrigXPos:Number = x;
         if(this.m_skilled == -1)
         {
            if(m_stCurrentFieldGrid != null && null != m_stCurrentFieldGrid.m_stBoomDefense && this.BoomDefense.indexOf(m_stCurrentFieldGrid.m_stBoomDefense.a_3512()) != -1)
            {
               this.m_skilled = 1;
               this.ResetMovieStatus();
               a_1350 = a_3491.a_1080 / (6 * 20);
               if(!a_1283)
               {
                  a_1350 *= -1;
               }
            }
            else if(m_stCurrentFieldGrid.m_iXGridNo == 5)
            {
               this.m_skilled = 2;
               this.ResetMovieStatus();
               a_1350 = a_3491.a_1080 / (6 * 20);
               if(!a_1283)
               {
                  a_1350 *= -1;
               }
            }
         }
         if(m_stCurrentFieldGrid != null && m_stCurrentFieldGrid.a_3492() && this.m_skilled == -1)
         {
            this.a_3502(m_stCurrentFieldGrid);
         }
         if(this.m_skilled != 1 && this.m_skilled != 2)
         {
            super.a_4216(iCurrentTime);
         }
         if(iCurrentTime % 2 == 0)
         {
            if(a_1273 == 28 || a_1273 == 76)
            {
               this.addTireRatShot();
            }
            else if(a_1273 == 23 || a_1273 == 34 || a_1273 == 72 || a_1273 == 82)
            {
               this.m_skilled = 3;
               a_1464 = false;
               this.ResetMovieStatus();
            }
         }
         if(m_stCurrentFieldGrid != null && (m_stCurrentFieldGrid.m_iFieldGridType == 1 || m_stCurrentFieldGrid.m_iFieldGridType == 4))
         {
            if(m_stCurrentFieldGrid.ClimbIsEmpty())
            {
               m_stCurrentFieldGrid.InitClimb();
            }
         }
         if(a_1457 == b_181.a_424 && (x > a_3491.a_1080 * 4 && a_1283 || x < a_3491.a_1080 * 5 && !a_1283))
         {
            y += Math.tan(15 * Math.PI / 180) * Math.abs(numOrigXPos - x);
         }
         return true;
      }
      
      private function addTireRatShot() : void
      {
         var stStartFieldGrid:a_3491 = null;
         var stLastWaitShot:a_4348 = null;
         if(this.m_throwSkilled)
         {
            return;
         }
         stStartFieldGrid = m_stCurrentFieldGrid;
         if(stStartFieldGrid)
         {
            stLastWaitShot = TireRatShot.a_4344();
            stLastWaitShot.m_isSpecial = a_1339 > this.HURT_HP ? 0 : 1;
            stLastWaitShot.a_1797(0,this.a_1312,this.a_1311,x - 10,y + 95,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,stStartFieldGrid);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE);
            this.m_throwSkilled = true;
         }
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption(false,false);
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(this.m_skilled != 1 && this.m_skilled != 2 && this.m_skilled != 4)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      override public function play() : void
      {
         super.play();
      }
   }
}

