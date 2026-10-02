package com.aurora.ui.maogoutd.resource.defender.HorseYear.marbleSoda
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.HorseYear.marbleSoda.effect.MarbleSodaHitEffect;
   import com.aurora.ui.maogoutd.resource.defender.SnakeYear.FrostSnake.effect.FrostSnakeDeadEffect;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class MarbleSodaBounceShot extends a_4348
   {
      
      private static const HIT_RADIUS:Number = 400;
      
      private static const MIN_DIST:Number = 0.000001;
      
      private static const PAUSE_FRAMES:int = 4;
      
      private var m_targetIntruder:a_4206;
      
      private var m_hitIntruderKeys:Object = {};
      
      private var m_iBounceLeft:int = 3;
      
      private var m_numBounceScalarSpeed:Number = 20;
      
      private var m_iPauseFramesLeft:int = 0;
      
      public function MarbleSodaBounceShot()
      {
         super();
         a_1279 = -9;
         m_iYDisplayCenterPos = -4;
         a_1573 = 1;
         a_1275 = 0;
         a_1587 = 0;
         a_1588 = true;
      }
      
      public static function a_4344(index:int = 0) : a_4348
      {
         if(index == 1)
         {
            return PoolManager.getInstance().CheckOutOne(MarbleSodaBounceShot,MarbleSodaFirstBounceShotMovie) as a_4348;
         }
         if(index == 2)
         {
            return PoolManager.getInstance().CheckOutOne(MarbleSodaBounceShot,MarbleSodaSecondBounceShotMovie) as a_4348;
         }
         return PoolManager.getInstance().CheckOutOne(MarbleSodaBounceShot,MarbleSodaBaseBounceShotMovie) as a_4348;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier,iThreeRowShotType);
         m_isPenetrate = true;
         a_1577 = false;
         this.m_hitIntruderKeys = {};
         this.m_targetIntruder = null;
         this.m_iPauseFramesLeft = 0;
         a_1325 = 2;
         this.m_iBounceLeft = MarbleSodaDefense.BOUNCE_COUNT_BASE;
         return true;
      }
      
      public function StartBounceFrom(firstHitIntruder:a_4206, firstBounceTarget:a_4206) : Boolean
      {
         if(!firstHitIntruder || !firstBounceTarget)
         {
            return false;
         }
         this.m_hitIntruderKeys[MarbleSodaDefense.BuildIntruderKey(firstHitIntruder)] = true;
         return this.beginDashToTarget(firstBounceTarget,false);
      }
      
      private function setBounceVelocityToward(target:a_4206, speedMultiplier:Number = 1) : Boolean
      {
         var dy:Number = NaN;
         var inv:Number = NaN;
         if(!target)
         {
            return false;
         }
         var targetX:Number = target.x + target.stDisplayBitmap.x + target.width / 2;
         var targetY:Number = target.y + target.stDisplayBitmap.y + target.height / 2;
         var dx:Number = targetX - x;
         dy = targetY - y;
         var dist:Number = Math.sqrt(dx * dx + dy * dy);
         if(dist < MIN_DIST)
         {
            return false;
         }
         inv = this.m_numBounceScalarSpeed * speedMultiplier / dist;
         m_numXSpeed = dx * inv;
         m_numYSpeed = dy * inv;
         return true;
      }
      
      private function beginDashToTarget(target:a_4206, needPause:Boolean = true) : Boolean
      {
         this.m_targetIntruder = target;
         this.m_iPauseFramesLeft = needPause ? PAUSE_FRAMES : 2;
         return this.setBounceVelocityToward(target);
      }
      
      override protected function CalculationBoundary() : Boolean
      {
         if(x < 0 || x >= BattleFieldView.a_1013 + 10)
         {
            m_bActive.Value = false;
            this.a_3940();
            return true;
         }
         if(y < 0 || y >= BattleFieldView.a_1013)
         {
            m_bActive.Value = false;
            this.a_3940();
            return true;
         }
         return false;
      }
      
      override protected function a_4351() : void
      {
         var bounceRange:int = 0;
         var nextTarget:a_4206 = null;
         var effect:FrostSnakeDeadEffect = null;
         if(!m_bActive.Value)
         {
            this.a_3940();
            return;
         }
         if(!this.m_targetIntruder || !MarbleSodaDefense.canTargetIntruder(this.m_targetIntruder))
         {
            return;
         }
         if(this.m_iBounceLeft <= 0)
         {
            m_bActive.Value = false;
            this.a_3940();
            return;
         }
         if(!this.isInHitRadius())
         {
            return;
         }
         if(null != this.m_targetIntruder && Boolean(this.m_targetIntruder.m_stCurrentFieldGrid))
         {
            if(hitTestObject(this.m_targetIntruder))
            {
               this.PlayCollectEffect(this.m_targetIntruder);
               this.m_hitIntruderKeys[MarbleSodaDefense.BuildIntruderKey(this.m_targetIntruder)] = true;
               a_4352(this.m_targetIntruder);
               if(Boolean(this.m_targetIntruder) && Boolean(this.m_targetIntruder.iLifeValue > 0) && m_isSpecial > 0)
               {
                  this.m_targetIntruder.a_4208(b_182.a_433,20);
               }
               if(m_isSpecial == 2 && a_1584 != null && this.m_targetIntruder.iLifeValue <= 0 && !this.m_targetIntruder.IsBossIntruder && !this.m_targetIntruder.HasTag(5) && !this.m_targetIntruder.HasTag(40012))
               {
                  this.m_targetIntruder.a_3432();
                  effect = FrostSnakeDeadEffect.a_3926();
                  effect.a_1797(false);
                  a_1584.m_stCurrentBattbleFieldView.AddToBattleView(effect,BattleLayerDefine.EFFECTS_TOP_TYPE,a_1584);
                  effect.x = this.m_targetIntruder.x;
                  effect.y = this.m_targetIntruder.y;
               }
               --this.m_iBounceLeft;
               if(this.m_iBounceLeft <= 0)
               {
                  m_bActive.Value = false;
                  this.a_3940();
                  return;
               }
               bounceRange = m_isSpecial == 2 ? 2 : 1;
               nextTarget = MarbleSodaDefense.PickBounceTarget(this.m_targetIntruder,Number.NaN,Number.NaN,this.m_hitIntruderKeys,bounceRange);
               if(!nextTarget)
               {
                  this.m_targetIntruder = null;
                  m_bActive.Value = false;
                  this.a_3940();
                  return;
               }
               if(!this.beginDashToTarget(nextTarget,true))
               {
                  this.m_targetIntruder = null;
               }
            }
         }
         if(this.CalculationBoundary())
         {
            return;
         }
      }
      
      private function isInHitRadius() : Boolean
      {
         if(!this.m_targetIntruder)
         {
            return false;
         }
         var dx:Number = this.m_targetIntruder.x + this.m_targetIntruder.stDisplayBitmap.x + this.m_targetIntruder.width / 2 - x;
         var dy:Number = this.m_targetIntruder.y + this.m_targetIntruder.stDisplayBitmap.y + this.m_targetIntruder.height * 0.5 - y;
         return dx * dx + dy * dy <= HIT_RADIUS;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(m_isHited && !m_isPenetrate)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               m_bActive.Value = false;
               this.a_3940();
            }
            return;
         }
         if(a_1588)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
         }
         this.a_4351();
         if(!m_bActive.Value)
         {
            return;
         }
         if(this.m_iPauseFramesLeft > 0)
         {
            --this.m_iPauseFramesLeft;
            if(this.m_iPauseFramesLeft > 0)
            {
               return;
            }
            if(Boolean(this.m_targetIntruder) && MarbleSodaDefense.canTargetIntruder(this.m_targetIntruder))
            {
               this.setBounceVelocityToward(this.m_targetIntruder);
            }
         }
         x += m_numXSpeed;
         y += m_numYSpeed;
      }
      
      private function PlayCollectEffect(target:a_4206) : void
      {
         var buff:a_4108 = null;
         if(!target || !target.m_stCurrentFieldGrid || !target.m_stCurrentFieldGrid.m_stCurrentBattbleFieldView)
         {
            return;
         }
         buff = MarbleSodaHitEffect.a_3926(m_isSpecial);
         if(!buff)
         {
            return;
         }
         buff.a_1797(a_1283);
         buff.x = target.x + 0.5 * target.width + target.stDisplayBitmap.x;
         buff.y = target.y + 0.5 * target.height + target.stDisplayBitmap.y;
         target.m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(buff,BattleLayerDefine.EFFECTS_TOP_TYPE,target.m_stCurrentFieldGrid);
      }
      
      override protected function a_3940() : Boolean
      {
         this.m_targetIntruder = null;
         this.m_hitIntruderKeys = {};
         this.m_numBounceScalarSpeed = 10;
         this.m_iPauseFramesLeft = 0;
         super.a_3940();
         return true;
      }
   }
}

