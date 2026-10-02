package com.aurora.ui.maogoutd.resource.Intruder.zombie
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.tools.a_4448;
   import flash.display.FrameLabel;
   
   public class ZombieWaterRentalPoMouseMoveIntruder extends BaseZombieMoveIntruder
   {
      
      private const FULL_HP:int = 1200;
      
      private const HURT_HP:int = 340;
      
      private const DEAD_HP:int = 0;
      
      private const ARMOR_FULL_HP:int = 1600;
      
      private const ARMOR_HURT_HP:int = 800;
      
      private const ARMOR_DEAD_HP:int = 0;
      
      private var a_1363:a_4448;
      
      private var m_isInited:Boolean;
      
      private var m_isInWater:Boolean;
      
      private var a_1550:Boolean;
      
      private var a_1551:Boolean;
      
      private var a_1552:Boolean;
      
      private var a_1553:Boolean;
      
      public function ZombieWaterRentalPoMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(ZombieWaterRentalPoMouseMoveIntruder) as ZombieWaterRentalPoMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return ZombieWaterRentalPoMouseMoveIntruderMovie;
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
         a_1466 = this.ARMOR_FULL_HP;
         a_1279 = -width * 0.2;
         a_1272 = 0;
         this.a_1550 = true;
         this.a_1551 = false;
         this.a_1553 = false;
         this.m_isInited = false;
         this.m_isInWater = false;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         this.removeWaterWave();
         super.a_3940();
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         var isNeededToReset:Boolean = false;
         if(a_1339 <= this.DEAD_HP)
         {
            if(!this.a_1550 && !this.a_1551)
            {
               if(this.m_isInWater)
               {
                  if(a_1275 != 27)
                  {
                     a_1275 = 27;
                     isNeededToReset = true;
                  }
               }
               else if(a_1275 != 25)
               {
                  a_1275 = 25;
                  isNeededToReset = true;
               }
            }
            else if(this.m_isInWater)
            {
               if(a_1275 != 28)
               {
                  a_1275 = 28;
                  isNeededToReset = true;
               }
            }
            else if(a_1275 != 26)
            {
               a_1275 = 26;
               isNeededToReset = true;
            }
            if(isNeededToReset)
            {
               if(m_stCurrentFieldGrid)
               {
                  m_stCurrentFieldGrid.a_3457(this);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
               }
            }
         }
         else if(this.a_1552)
         {
            if(this.a_1550)
            {
               if(a_1275 != 7)
               {
                  a_1275 = 7;
                  isNeededToReset = true;
               }
            }
            else if(this.a_1551)
            {
               isNeededToReset = this.ResetStateByLifeValue(9,12);
            }
            else
            {
               isNeededToReset = this.ResetStateByLifeValue(15,17);
            }
         }
         else if(this.a_1553)
         {
            if(this.m_isInWater)
            {
               isNeededToReset = this.ResetStateByLifeValue(11,14);
            }
            else
            {
               isNeededToReset = this.ResetStateByLifeValue(3,4);
            }
         }
         else if(a_1475)
         {
            if(this.a_1550)
            {
               isNeededToReset = this.ResetStateByLifeValue(19,21);
            }
            else if(this.a_1551)
            {
               isNeededToReset = this.ResetStateByLifeValue(20,22);
            }
            else
            {
               isNeededToReset = this.ResetStateByLifeValue(23,24);
            }
         }
         else if(this.m_isInWater)
         {
            if(this.a_1550)
            {
               if(a_1275 != 8)
               {
                  a_1275 = 8;
                  isNeededToReset = true;
               }
            }
            else if(this.a_1551)
            {
               isNeededToReset = this.ResetStateByLifeValue(10,13);
            }
            else
            {
               isNeededToReset = this.ResetStateByLifeValue(16,18);
            }
         }
         else if(this.a_1550)
         {
            if(a_1275 != 0)
            {
               a_1275 = 0;
               isNeededToReset = true;
            }
         }
         else if(this.a_1551)
         {
            isNeededToReset = this.ResetStateByLifeValue(1,2);
         }
         else
         {
            isNeededToReset = this.ResetStateByLifeValue(5,6);
         }
         if(isNeededToReset)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            a_3419();
            play();
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         var b:Boolean = a_1466 > this.ARMOR_DEAD_HP;
         if(b)
         {
            b = a_1466 - iRduceLifeValue <= this.ARMOR_DEAD_HP;
         }
         if(b)
         {
            this.a_1553 = true;
         }
         b = a_1466 > this.ARMOR_HURT_HP;
         if(b)
         {
            b = a_1466 - iRduceLifeValue <= this.ARMOR_HURT_HP;
         }
         if(b)
         {
            this.a_1551 = true;
            this.a_1550 = false;
         }
         if(a_1466 > 0)
         {
            a_1466 -= iRduceLifeValue;
         }
         else
         {
            a_1339 -= iRduceLifeValue;
         }
         if(a_1466 < 0)
         {
            a_1339 += a_1466;
            a_1466 = 0;
         }
         if(a_1339 <= 0)
         {
            a_1469 = 0;
            a_1468 = 0;
            if(Boolean(m_stFreezeUpEffect) && m_stFreezeUpEffect.visible)
            {
               m_stFreezeUpEffect.a_3940();
               m_stFreezeUpEffect = null;
            }
         }
         if(Math.abs(iRduceLifeValue) > 1)
         {
            this.ResetMovieStatus();
         }
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         this.a_4213();
         return true;
      }
      
      override public function a_4211(iCutLifeValue:int) : Boolean
      {
         if(iCutLifeValue > 200)
         {
            iCutLifeValue = 200;
         }
         this.a_3969(iCutLifeValue);
         if(a_1339 <= 0)
         {
            a_4212();
         }
         return true;
      }
      
      override public function a_4213() : Boolean
      {
         this.a_3969(900);
         if(a_1339 <= 0)
         {
            a_4212();
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var numOrigXPos:Number = x;
         super.a_4216(iCurrentTime);
         if(!this.m_isInited)
         {
            this.m_isInited = true;
            this.y -= 20;
         }
         if(this.a_1363 != null)
         {
            if(this.a_1363.parent == null)
            {
               if(parent != null)
               {
                  parent.addChildAt(this.a_1363,1);
               }
            }
            this.a_1363.nextFrame();
            this.a_1363.x += x - numOrigXPos;
         }
         if(!a_1283 && x < 0 || a_1283 && x > BattleFieldView.a_1013)
         {
            if(this.m_isInWater)
            {
               this.a_1552 = this.m_isInWater = false;
               this.removeWaterWave();
               this.ResetMovieStatus();
            }
         }
         if(!this.m_isInWater && (x > 0 && x < BattleFieldView.a_1013 - 30 || a_1283 && x > 30 && x < BattleFieldView.a_1013))
         {
            this.a_1552 = this.m_isInWater = true;
            BattleFieldView.a_1020.play();
            this.addWaterWave();
            this.ResetMovieStatus();
         }
         if(a_1275 == 3 || a_1275 == 4 || a_1275 == 11 || a_1275 == 14)
         {
            if(a_1273 == (a_1276[a_1275 + 1] as FrameLabel).frame - 1)
            {
               this.a_1551 = false;
               this.a_1553 = false;
               this.ResetMovieStatus();
            }
         }
         if(a_1275 == 7 || a_1275 == 9 || a_1275 == 12 || a_1275 == 15 || a_1275 == 17)
         {
            if(a_1273 == (a_1276[a_1275 + 1] as FrameLabel).frame - 1)
            {
               this.a_1552 = false;
               this.ResetMovieStatus();
            }
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
      
      private function ResetStateByLifeValue(healthyFrameIndex:int, hurtFrameIndex:int) : Boolean
      {
         var isNeededToReset:Boolean = false;
         if(a_1339 > this.HURT_HP)
         {
            if(a_1275 != healthyFrameIndex)
            {
               a_1275 = healthyFrameIndex;
               isNeededToReset = true;
            }
         }
         else if(a_1275 != hurtFrameIndex)
         {
            a_1275 = hurtFrameIndex;
            isNeededToReset = true;
         }
         return isNeededToReset;
      }
      
      private function addWaterWave() : void
      {
         if(null == this.a_1363)
         {
            this.a_1363 = a_4448.a_3926();
            this.a_1363.a_1797(a_1283);
            if(a_1283)
            {
               this.a_1363.x = x - 0.5 * (stDisplayBitmap.width - this.a_1363.width) + 25;
            }
            else
            {
               this.a_1363.x = x + 0.5 * (stDisplayBitmap.width - this.a_1363.width) - 25;
            }
            this.a_1363.y = y + stDisplayBitmap.y + stDisplayBitmap.height - 0.7 * this.a_1363.height;
         }
         if(parent != null)
         {
            parent.addChildAt(this.a_1363,1);
         }
      }
      
      private function removeWaterWave() : void
      {
         if(this.a_1363 != null)
         {
            if(this.a_1363.parent != null)
            {
               this.a_1363.parent.removeChild(this.a_1363);
            }
            this.a_1363.a_3940();
            this.a_1363 = null;
         }
      }
   }
}

