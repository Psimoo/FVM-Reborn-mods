package com.aurora.ui.maogoutd.resource.Intruder.BaseCamp.WaterCask
{
   import a_4718.b_181;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.tools.a_4448;
   import flash.display.FrameLabel;
   
   public class WaterCaskMouseMoveIntruder extends a_4206
   {
      
      private const FULL_HP:int = 1800;
      
      private const HURT_HP:int = 500;
      
      private const DEAD_HP:int = 0;
      
      private var m_isImmune:Boolean;
      
      protected var m_isBeginSwimming:Boolean = true;
      
      protected var a_1539:Boolean = true;
      
      private var a_1363:a_4448;
      
      public function WaterCaskMouseMoveIntruder()
      {
         a_1281 = true;
         a_1467 = -20;
         super();
         a_1461 = true;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(WaterCaskMouseMoveIntruder) as WaterCaskMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return WaterCaskMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (4 * 20);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         this.a_1539 = false;
         this.m_isBeginSwimming = false;
         a_1339 = 100;
         a_1279 = -width * 0.2;
         a_1272 = 0;
         BoomIsReduceLife = true;
         this.m_isImmune = false;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         if(this.a_1363)
         {
            this.a_1363.a_3940();
            this.a_1363 = null;
         }
         super.a_3940();
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > this.HURT_HP)
         {
            if(this.a_1539)
            {
               if(this.m_isImmune)
               {
                  if(a_1275 != 6)
                  {
                     a_1275 = 6;
                     gotoAndStop((a_1276[6] as FrameLabel).frame);
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
               else if(a_1275 != 3)
               {
                  a_1275 = 3;
                  gotoAndStop((a_1276[3] as FrameLabel).frame);
               }
            }
            else if(this.m_isBeginSwimming)
            {
               if(a_1275 != 2)
               {
                  a_1275 = 2;
                  gotoAndStop((a_1276[2] as FrameLabel).frame);
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
            if(this.a_1539)
            {
               if(this.m_isImmune)
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
               else if(a_1275 != 5)
               {
                  a_1275 = 5;
                  gotoAndStop((a_1276[5] as FrameLabel).frame);
               }
            }
            else if(this.m_isBeginSwimming)
            {
               if(a_1275 != 4)
               {
                  a_1275 = 4;
                  gotoAndStop((a_1276[4] as FrameLabel).frame);
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
            if(this.a_1539)
            {
               if(a_1275 != 11)
               {
                  a_1275 = 11;
                  gotoAndStop((a_1276[11] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 10)
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
            play();
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
         this.a_3940();
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         if(!this.m_isImmune && this.a_1539)
         {
            this.m_isImmune = true;
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
         trace("m_iCurrentFrame::" + a_1273);
         var numOrigXPos:Number = x;
         if(!this.m_isImmune)
         {
            super.a_4216(iCurrentTime);
         }
         if(!a_1283 && x < 0 || a_1283 && x > BattleFieldView.a_1013)
         {
            if(this.a_1539)
            {
               this.a_1539 = false;
               this.ResetMovieStatus();
            }
         }
         if(!this.a_1539 && (x > 0 && x < BattleFieldView.a_1013 - 30 || a_1283 && x > 30 && x < BattleFieldView.a_1013))
         {
            if(!this.m_isBeginSwimming)
            {
               BattleFieldView.a_1020.play();
               if(null == this.a_1363 && Boolean(parent))
               {
                  this.a_1363 = a_4448.a_3926();
                  this.a_1363.a_1797(a_1283);
                  if(a_1283)
                  {
                     this.a_1363.x = x - 0.5 * (stDisplayBitmap.width - this.a_1363.width) + 18;
                  }
                  else
                  {
                     this.a_1363.x = x + 0.5 * (stDisplayBitmap.width - this.a_1363.width) - 18;
                  }
                  this.a_1363.y = y + stDisplayBitmap.y + stDisplayBitmap.height - 0.7 * this.a_1363.height;
                  parent.addChildAt(this.a_1363,1);
               }
               this.m_isBeginSwimming = true;
               this.ResetMovieStatus();
            }
         }
         if(iCurrentTime % 2 == 0)
         {
            if(a_1273 == (a_1276[7] as FrameLabel).frame - 1 || a_1273 == (a_1276[8] as FrameLabel).frame - 1)
            {
               this.m_isImmune = false;
               this.ResetMovieStatus();
            }
            if(a_1273 == (a_1276[3] as FrameLabel).frame - 1 || a_1273 == (a_1276[5] as FrameLabel).frame - 1)
            {
               this.m_isBeginSwimming = false;
               this.a_1539 = true;
               this.ResetMovieStatus();
            }
         }
         if(this.a_1363)
         {
            this.a_1363.nextFrame();
            this.a_1363.x += x - numOrigXPos;
         }
         if(a_1457 == b_181.a_424 && (x > a_3491.a_1080 * 4 && a_1283 || x < a_3491.a_1080 * 5 && !a_1283))
         {
            y += Math.tan(15 * Math.PI / 180) * Math.abs(numOrigXPos - x);
         }
         return true;
      }
      
      override public function a_4207() : void
      {
         if(this.a_1363)
         {
            this.a_1363.gotoAndStop(1);
            this.a_1363.y = y + stDisplayBitmap.y + stDisplayBitmap.height - 0.7 * this.a_1363.height;
         }
      }
   }
}

