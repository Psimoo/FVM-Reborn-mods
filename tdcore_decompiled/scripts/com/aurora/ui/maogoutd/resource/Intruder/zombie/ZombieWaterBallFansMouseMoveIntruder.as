package com.aurora.ui.maogoutd.resource.Intruder.zombie
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.zombie.handEffect.CommonHandEffect;
   import com.aurora.ui.maogoutd.resource.tools.a_4448;
   import flash.display.FrameLabel;
   
   public class ZombieWaterBallFansMouseMoveIntruder extends BaseZombieMoveIntruder
   {
      
      private const FULL_HP:int = 100;
      
      private const HURT_HP:int = 50;
      
      private const DEAD_HP:int = 0;
      
      private const ARMOR_FULL_HP:int = 350;
      
      private const ARMOR_HURT_HP:int = 200;
      
      private const ARMOR_DEAD_HP:int = 0;
      
      private var a_1363:a_4448;
      
      private var isInWater:Boolean;
      
      private var isAppearing:Boolean;
      
      private var isProtected:Boolean;
      
      private var isArmorFallingDown:Boolean;
      
      private var isResetPosition:Boolean;
      
      private var tempIntruderMoveDirection:int;
      
      public function ZombieWaterBallFansMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(ZombieWaterBallFansMouseMoveIntruder) as ZombieWaterBallFansMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return ZombieWaterBallFansMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (5 * 20);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         this.tempIntruderMoveDirection = iIntruderMoveDirection;
         a_1339 = 280;
         a_1466 = 0;
         a_1279 = -width * 0.2;
         a_1272 = 0;
         this.isInWater = true;
         this.isAppearing = true;
         this.isProtected = true;
         this.isArmorFallingDown = false;
         this.isResetPosition = false;
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
         var isNeededToReset:Boolean = false;
         if(a_1339 <= this.DEAD_HP)
         {
            if(a_1275 != 11)
            {
               a_1275 = 11;
               if(m_stCurrentFieldGrid)
               {
                  m_stCurrentFieldGrid.a_3457(this);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
               }
               isNeededToReset = true;
            }
         }
         else if(this.isAppearing)
         {
            if(a_1275 != 0)
            {
               a_1275 = 0;
               isNeededToReset = true;
            }
         }
         else if(this.isArmorFallingDown)
         {
            if(a_1275 != 3 || a_1275 != 8)
            {
               if(a_1475)
               {
                  a_1275 = 8;
               }
               else
               {
                  a_1275 = 3;
               }
               isNeededToReset = true;
            }
         }
         else if(a_1475)
         {
            if(this.isInWater)
            {
               if(this.isProtected)
               {
                  isNeededToReset = this.ResetStateByLifeValue(6,7,true);
               }
               else
               {
                  isNeededToReset = this.ResetStateByLifeValue(9,10,false);
               }
            }
         }
         else if(this.isInWater)
         {
            if(this.isProtected)
            {
               isNeededToReset = this.ResetStateByLifeValue(1,2,true);
            }
            else
            {
               isNeededToReset = this.ResetStateByLifeValue(4,5,false);
            }
         }
         else if(this.isProtected)
         {
            isNeededToReset = this.ResetStateByLifeValue(12,13,true);
         }
         else
         {
            isNeededToReset = this.ResetStateByLifeValue(14,15,false);
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
            OnZombify(CommonHandEffect.a_3926());
            b = a_1466 - iRduceLifeValue <= this.ARMOR_DEAD_HP;
         }
         if(b)
         {
            this.isArmorFallingDown = true;
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
         if(!this.isResetPosition)
         {
            this.isResetPosition = true;
            this.initIntruderMovePosition(this.tempIntruderMoveDirection);
            return true;
         }
         var numOrigXPos:Number = x;
         super.a_4216(iCurrentTime);
         if(this.a_1363)
         {
            if(this.a_1363.parent == null && parent != null)
            {
               parent.addChildAt(this.a_1363,1);
            }
            this.a_1363.nextFrame();
            this.a_1363.x += x - numOrigXPos;
         }
         if(Boolean(m_stCurrentFieldGrid) && this.isInWater != m_stCurrentFieldGrid.m_isNeedTray)
         {
            this.isInWater = m_stCurrentFieldGrid.m_isNeedTray;
            if(!this.isInWater)
            {
               this.removeWaterWave();
            }
            else
            {
               this.addWaterWave();
            }
            this.ResetMovieStatus();
         }
         if(a_1275 == 3 || a_1275 == 8)
         {
            if(a_1273 == (a_1276[a_1275 + 1] as FrameLabel).frame - 1)
            {
               this.isArmorFallingDown = false;
               this.isProtected = false;
               this.ResetMovieStatus();
            }
         }
         if(a_1275 == 0)
         {
            if(a_1273 == (a_1276[a_1275 + 1] as FrameLabel).frame - 1)
            {
               this.isAppearing = false;
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
      
      private function ResetStateByLifeValue(healthyFrameIndex:int, hurtFrameIndex:int, isArmorLife:Boolean) : Boolean
      {
         var isHealthy:Boolean = false;
         var isNeededToReset:Boolean = false;
         if(isArmorLife)
         {
            isHealthy = a_1466 >= this.ARMOR_HURT_HP;
         }
         else
         {
            isHealthy = a_1339 >= this.HURT_HP;
         }
         if(isHealthy)
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
      
      private function initIntruderMovePosition(iIntruderMoveDirection:int) : void
      {
         var targetXGridNo:int = 0;
         var stFieldGrid:a_3491 = null;
         var tempGridNo:int = 3 - (globalMoveFighterID + m_stCurrentFieldGrid.m_iYGridNo) % 2;
         if(iIntruderMoveDirection < 0)
         {
            targetXGridNo = m_stCurrentFieldGrid.m_iXGridNo - tempGridNo;
            x = a_3491.a_1080 * (targetXGridNo + 1);
         }
         else
         {
            targetXGridNo = m_stCurrentFieldGrid.m_iXGridNo + tempGridNo;
            x = a_3491.a_1080 * targetXGridNo;
         }
         stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(targetXGridNo,m_stCurrentFieldGrid.m_iYGridNo);
         stFieldGrid.a_3459(this);
         y += -10;
         this.addWaterWave();
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

