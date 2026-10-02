package com.aurora.ui.maogoutd.resource.Intruder.BaseCamp.SUVCar
{
   import a_4718.b_181;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class SUVCarMoveIntruder extends a_4206
   {
      
      private var m_isJumping:Boolean = false;
      
      private var m_isReadmove:Boolean = false;
      
      private var m_isEndmove:Boolean = false;
      
      private var m_boomDie:Boolean = false;
      
      private const FULL_HP:int = 3600;
      
      private const HURT_HP:int = 1800;
      
      private const DEAD_HP:int = 0;
      
      private var m_MoveTotalTime:int = 20;
      
      private var BoomDefense:Array = new Array(286458144,294846544,286457950,286457983,286394688,286394702,286394703);
      
      public function SUVCarMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(SUVCarMoveIntruder) as SUVCarMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return SUVCarMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (5 * 20);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = this.FULL_HP;
         a_1279 = -width * 0.15;
         a_1272 = 0;
         this.m_isJumping = false;
         this.m_isReadmove = false;
         this.m_isEndmove = false;
         this.m_boomDie = false;
         BoomIsReduceLife = true;
         a_1464 = true;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > this.HURT_HP)
         {
            if(this.m_isReadmove)
            {
               if(a_1275 != 1)
               {
                  a_1275 = 1;
                  gotoAndStop((a_1276[1] as FrameLabel).frame);
               }
            }
            else if(this.m_isJumping)
            {
               if(a_1275 != 2)
               {
                  a_1275 = 2;
                  gotoAndStop((a_1276[2] as FrameLabel).frame);
               }
            }
            else if(this.m_isEndmove)
            {
               if(a_1275 != 3)
               {
                  a_1275 = 3;
                  gotoAndStop((a_1276[3] as FrameLabel).frame);
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
            if(this.m_isReadmove)
            {
               if(a_1275 != 5)
               {
                  a_1275 = 5;
                  gotoAndStop((a_1276[5] as FrameLabel).frame);
               }
            }
            else if(this.m_isJumping)
            {
               if(a_1275 != 6)
               {
                  a_1275 = 6;
                  gotoAndStop((a_1276[6] as FrameLabel).frame);
               }
            }
            else if(this.m_isEndmove)
            {
               if(a_1275 != 7)
               {
                  a_1275 = 7;
                  gotoAndStop((a_1276[7] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 4)
            {
               a_1275 = 4;
               gotoAndStop((a_1276[4] as FrameLabel).frame);
            }
         }
         else if(a_1339 <= 0)
         {
            if(!this.m_boomDie)
            {
               if(a_1275 != 9)
               {
                  a_1275 = 9;
                  gotoAndStop((a_1276[9] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 8)
            {
               a_1275 = 8;
               gotoAndStop((a_1276[8] as FrameLabel).frame);
            }
            a_3419();
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            this.play();
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(!this.m_isReadmove && !this.m_isJumping && !this.m_isEndmove)
         {
            super.a_3969(iRduceLifeValue);
         }
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         if(!this.m_isReadmove && !this.m_isJumping && !this.m_isEndmove)
         {
            super.a_4209(iRduceLifeValue);
         }
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         super.a_4210();
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         if(!this.m_isReadmove && !this.m_isJumping && !this.m_isEndmove)
         {
            super.a_4212();
         }
         return true;
      }
      
      override public function a_4213() : Boolean
      {
         if(!this.m_isReadmove && !this.m_isJumping && !this.m_isEndmove)
         {
            a_1339 = 0;
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            a_3940();
         }
         return true;
      }
      
      override protected function SetClarmLanderTime() : Boolean
      {
         return true;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var numOrigXPos:Number = NaN;
         numOrigXPos = x;
         a_1350 = this.m_isJumping ? 4 * a_3491.a_1080 / this.m_MoveTotalTime : a_3491.a_1080 / (5 * 20);
         if(!a_1283)
         {
            a_1350 *= -1;
         }
         if(m_stCurrentFieldGrid != null && null != m_stCurrentFieldGrid.m_stBoomDefense && this.BoomDefense.indexOf(m_stCurrentFieldGrid.m_stBoomDefense.a_3512()) != -1)
         {
            this.m_boomDie = true;
         }
         if(Boolean(!this.m_isReadmove && !this.m_isJumping && !this.m_isEndmove) && Boolean(m_stCurrentFieldGrid) && m_stCurrentFieldGrid.m_stBaseLander != null)
         {
            this.m_isReadmove = true;
            SetCannotSeeByFighter(true);
            this.ResetMovieStatus();
         }
         if(m_stCurrentFieldGrid != null && m_stCurrentFieldGrid.a_3492() && !this.m_isJumping && !this.m_isReadmove)
         {
            this.a_3502(m_stCurrentFieldGrid);
         }
         if(iCurrentTime % 2 == 0)
         {
            if(a_1273 == 20 || a_1273 == 56)
            {
               this.m_isReadmove = false;
               this.m_isJumping = true;
               a_1473 = this.m_MoveTotalTime;
               this.ResetMovieStatus();
            }
            else if(a_1273 == 36 || a_1273 == 72)
            {
               this.m_isEndmove = false;
               this.ResetMovieStatus();
               SetCannotSeeByFighter(false);
            }
         }
         if(a_1473 > 0 && this.m_isJumping && Boolean(m_stCurrentFieldGrid))
         {
            --a_1473;
            if(a_1473 <= 0)
            {
               this.m_isJumping = false;
               this.m_isEndmove = true;
               this.ResetMovieStatus();
            }
         }
         if(!(this.m_isEndmove || this.m_isReadmove))
         {
            super.a_4216(iCurrentTime);
         }
         if(a_1457 == b_181.a_424 && (x > a_3491.a_1080 * 4 && a_1283 || x < a_3491.a_1080 * 5 && !a_1283))
         {
            y += Math.tan(15 * Math.PI / 180) * Math.abs(numOrigXPos - x);
         }
         return true;
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return true;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption(false,false);
      }
      
      override public function play() : void
      {
         super.play();
      }
      
      override protected function ChangeFieldGrid(stNextFieldGrid:a_3491) : void
      {
         if(!this.m_isReadmove && !this.m_isEndmove)
         {
            super.ChangeFieldGrid(stNextFieldGrid);
         }
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(!this.m_isReadmove && !this.m_isJumping && !this.m_isEndmove)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      protected function a_3955() : Number
      {
         return -0.08 * width;
      }
      
      protected function a_3956() : Number
      {
         return -0.08 * height;
      }
   }
}

