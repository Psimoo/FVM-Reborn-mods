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
   
   public class MarbleSodaNormalShot extends a_4348
   {
      
      public function MarbleSodaNormalShot()
      {
         super();
         a_1279 = -20;
         m_iYDisplayCenterPos = -4;
         a_1573 = 1;
         a_1275 = 0;
         a_1587 = 0;
         a_1588 = true;
      }
      
      public static function a_4344(index:int) : a_4348
      {
         if(index == 1)
         {
            return PoolManager.getInstance().CheckOutOne(MarbleSodaNormalShot,MarbleSodaFirstShotMovie) as a_4348;
         }
         if(index == 2)
         {
            return PoolManager.getInstance().CheckOutOne(MarbleSodaNormalShot,MarbleSodaSecondShotMovie) as a_4348;
         }
         return PoolManager.getInstance().CheckOutOne(MarbleSodaNormalShot,MarbleSodaBaseShotMovie) as a_4348;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         return true;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier,iThreeRowShotType);
         m_isPenetrate = false;
         a_1577 = false;
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         super.a_4216(iCurrentTime);
      }
      
      override protected function checkCanHit(stMoveIntruder:a_4206) : Boolean
      {
         if(!MarbleSodaDefense.canTargetIntruder(stMoveIntruder))
         {
            return false;
         }
         return true;
      }
      
      override protected function onHitHandler(stFieldGrid:a_3491, stMoveIntruder:a_4206) : void
      {
         var bounceRange:int = 0;
         var firstBounceTarget:a_4206 = null;
         var bounceShot:MarbleSodaBounceShot = null;
         var effect:FrostSnakeDeadEffect = null;
         if(Boolean(stMoveIntruder) && Boolean(a_1583) && Boolean(a_1584))
         {
            bounceRange = m_isSpecial == 2 ? 2 : 1;
            firstBounceTarget = MarbleSodaDefense.PickBounceTarget(stMoveIntruder,Number.NaN,Number.NaN,null,bounceRange);
            if(firstBounceTarget)
            {
               bounceShot = MarbleSodaBounceShot.a_4344(m_isSpecial) as MarbleSodaBounceShot;
               if(bounceShot)
               {
                  bounceShot.m_isSpecial = m_isSpecial;
                  bounceShot.a_1797(0,Math.abs(m_numXSpeed) > 0 ? Math.abs(m_numXSpeed) : 10,iHurtPower2,x,y,a_1583,a_1584,false,a_1325);
                  if(bounceShot.StartBounceFrom(stMoveIntruder,firstBounceTarget))
                  {
                     a_1583.AddToBattleView(bounceShot,BattleLayerDefine.SHOT_TYPE,a_1584);
                  }
                  else
                  {
                     bounceShot.a_4350();
                  }
               }
            }
         }
         if(Boolean(a_1583) && a_1583.isOwnBattleField)
         {
            BattleFieldView.a_1045.play();
         }
         this.PlayCollectEffect(stMoveIntruder);
         a_4352(stMoveIntruder);
         SputterHurt(stFieldGrid,stMoveIntruder);
         ExecuteTriggers(stMoveIntruder);
         if(Boolean(stMoveIntruder) && Boolean(stMoveIntruder.iLifeValue > 0) && m_isSpecial > 0)
         {
            stMoveIntruder.a_4208(b_182.a_433,20);
         }
         if(m_isSpecial == 2 && a_1584 != null && stMoveIntruder.iLifeValue <= 0 && !stMoveIntruder.IsBossIntruder && !stMoveIntruder.HasTag(5) && !stMoveIntruder.HasTag(40012))
         {
            stMoveIntruder.a_3432();
            effect = FrostSnakeDeadEffect.a_3926();
            effect.a_1797(false);
            a_1584.m_stCurrentBattbleFieldView.AddToBattleView(effect,BattleLayerDefine.EFFECTS_TOP_TYPE,a_1584);
            effect.x = stMoveIntruder.x;
            effect.y = stMoveIntruder.y;
         }
         m_isHited = true;
         this.a_3940();
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
   }
}

