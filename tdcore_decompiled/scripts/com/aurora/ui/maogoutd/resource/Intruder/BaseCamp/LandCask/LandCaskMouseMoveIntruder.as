package com.aurora.ui.maogoutd.resource.Intruder.BaseCamp.LandCask
{
   import a_4718.b_181;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import flash.display.FrameLabel;
   
   public class LandCaskMouseMoveIntruder extends a_4206
   {
      
      private const FULL_HP:int = 2700;
      
      private const HURT_HP:int = 500;
      
      private const DEAD_HP:int = 0;
      
      private var m_isImmune:Boolean;
      
      private var m_isHideCask:Boolean;
      
      private var m_isOutCask:Boolean;
      
      public function LandCaskMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(LandCaskMouseMoveIntruder) as LandCaskMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return LandCaskMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (4 * 20);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = this.FULL_HP;
         a_1279 = -width * 0.2;
         a_1272 = 0;
         BoomIsReduceLife = true;
         this.m_isImmune = false;
         this.m_isHideCask = false;
         this.m_isOutCask = false;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > this.HURT_HP)
         {
            if(this.m_isHideCask)
            {
               if(a_1275 != 3)
               {
                  a_1275 = 3;
                  gotoAndStop((a_1276[2] as FrameLabel).frame);
               }
            }
            else if(this.m_isOutCask)
            {
               if(a_1275 != 4)
               {
                  a_1275 = 4;
                  gotoAndStop((a_1276[4] as FrameLabel).frame);
               }
            }
            else if(a_1475)
            {
               if(a_1275 != 8)
               {
                  a_1275 = 8;
                  gotoAndStop((a_1276[8] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 0)
            {
               a_1275 = 0;
               gotoAndStop((a_1276[0] as FrameLabel).frame);
            }
            a_3419();
         }
         else if(a_1339 > 0)
         {
            if(this.m_isHideCask)
            {
               if(a_1275 != 6)
               {
                  a_1275 = 6;
                  gotoAndStop((a_1276[5] as FrameLabel).frame);
               }
            }
            else if(this.m_isOutCask)
            {
               if(a_1275 != 7)
               {
                  a_1275 = 7;
                  gotoAndStop((a_1276[7] as FrameLabel).frame);
               }
            }
            else if(a_1475)
            {
               if(a_1275 != 9)
               {
                  a_1275 = 9;
                  gotoAndStop((a_1276[9] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 1)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
            a_3419();
         }
         else if(a_1339 <= 0)
         {
            if(a_1275 != 10)
            {
               a_1275 = 10;
               gotoAndStop((a_1276[10] as FrameLabel).frame);
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
         if(!this.m_isImmune)
         {
            super.a_3969(iRduceLifeValue);
         }
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         if(!this.m_isImmune)
         {
            super.a_4209(iRduceLifeValue);
         }
         return true;
      }
      
      override public function a_4213() : Boolean
      {
         a_1339 = 0;
         if(m_stCurrentFieldGrid)
         {
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         }
         a_3940();
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         if(!this.m_isImmune)
         {
            return super.a_4212();
         }
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         if(!this.m_isImmune)
         {
            this.m_isImmune = true;
            this.m_isHideCask = true;
            this.ResetMovieStatus();
         }
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
         trace("m_iCurrentFrame::" + a_1273);
         if(!this.m_isImmune)
         {
            super.a_4216(iCurrentTime);
         }
         if(iCurrentTime % 2 == 0)
         {
            if(a_1273 == (a_1276[4] as FrameLabel).frame - 1 || a_1273 == (a_1276[7] as FrameLabel).frame - 1)
            {
               this.m_isHideCask = false;
               this.m_isOutCask = true;
               this.ResetMovieStatus();
            }
            if(a_1273 == (a_1276[5] as FrameLabel).frame - 1 || a_1273 == (a_1276[8] as FrameLabel).frame - 1)
            {
               this.m_isOutCask = false;
               this.m_isImmune = false;
               this.ResetMovieStatus();
            }
         }
         if(a_1457 == b_181.a_424 && (x > a_3491.a_1080 * 4 && a_1283 || x < a_3491.a_1080 * 5 && !a_1283))
         {
            y += Math.tan(15 * Math.PI / 180) * Math.abs(numOrigXPos - x);
         }
         return true;
      }
      
      override public function play() : void
      {
         super.play();
      }
   }
}

