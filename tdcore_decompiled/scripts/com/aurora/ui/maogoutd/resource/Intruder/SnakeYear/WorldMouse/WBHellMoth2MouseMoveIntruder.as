package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.WorldMouse
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   
   public class WBHellMoth2MouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 3000;
      
      private static const MAX_INJURED_LIFE:int = 1500;
      
      private static const ONE_GRID_SPEED:int = 4;
      
      private var timeID:int;
      
      private var m_HurtValue:int = 600;
      
      private var stTargetDefense:a_3962;
      
      private var m_TargetXGridNo:int;
      
      private var m_isSprint:Boolean;
      
      private var m_isBoomDie:Boolean;
      
      private var m_iSkilled:Boolean;
      
      private var bForceDamage:Boolean = false;
      
      public function WBHellMoth2MouseMoveIntruder()
      {
         super();
         m_iYDisplayCenterPos = -10;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(WBHellMoth2MouseMoveIntruder) as WBHellMoth2MouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBHellMoth2MouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (20 * ONE_GRID_SPEED);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = MAX_LIFE;
         a_1279 = -width * 0.2;
         a_1272 = 0;
         CanCharm = false;
         a_1465 = 3;
         this.m_isSprint = false;
         this.m_isBoomDie = false;
         this.m_iSkilled = false;
         this.bForceDamage = false;
         if(a_1283)
         {
            a_1463 = true;
         }
         else
         {
            a_1463 = false;
         }
         this.SetAnimation(0,3);
         return true;
      }
      
      override public function a_2062() : void
      {
         if(a_1283)
         {
            return;
         }
         a_1088.a_2062(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.iTimeIntervalNum,m_stCurrentFieldGrid.m_iYGridNo);
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 0)
         {
            if(this.m_isSprint)
            {
               this.SetAnimation(2,3);
            }
            else if(a_1475)
            {
               this.SetAnimation(1,3);
            }
            else
            {
               this.SetAnimation(0,3);
            }
         }
         else
         {
            this.SetAnimation(6);
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
         return true;
      }
      
      override protected function GetiNoX() : int
      {
         return int((x + 30) / a_3491.a_1080);
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         if(!a_1460)
         {
            a_1460 = true;
            if(!this.m_iSkilled)
            {
               this.stTargetDefense = this.getBaseDefense(m_stCurrentFieldGrid);
               this.m_TargetXGridNo = 0;
               if(this.stTargetDefense)
               {
                  this.m_TargetXGridNo = this.stTargetDefense.stFieldGrid.m_iXGridNo;
                  this.m_isSprint = true;
                  a_1464 = true;
                  a_1350 = a_3491.a_1080 / (0.5 * 20);
                  if(!a_1283)
                  {
                     a_1350 *= -1;
                  }
                  this.ResetMovieStatus();
                  this.m_iSkilled = true;
               }
            }
         }
         if(this.m_TargetXGridNo == m_stCurrentFieldGrid.m_iXGridNo && this.m_isSprint)
         {
            this.m_isSprint = false;
            this.m_isBoomDie = true;
            a_1339 = 0;
            this.AddEffect(m_stCurrentFieldGrid);
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            if(!HasTag(40009))
            {
               this.timeID = setTimeout(this.a_3502,200,m_stCurrentFieldGrid);
            }
            a_3940();
         }
         if(!this.m_isBoomDie)
         {
            return super.a_4216(iCurrentTime);
         }
         return true;
      }
      
      private function AddEffect(stFieldGrid:a_3491) : void
      {
         var stEffect:WBHellMothBoomEffect = null;
         if(stFieldGrid != null)
         {
            stEffect = WBHellMothBoomEffect.a_3926();
            stEffect.a_1797(false);
            stEffect.x = stFieldGrid.m_iXGridNo * a_3491.a_1080 - 32;
            stEffect.y = stFieldGrid.m_iYGridNo * a_3491.a_1081 - 35;
            stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,stFieldGrid);
         }
      }
      
      override protected function IsReveredGrid() : Boolean
      {
         return false;
      }
      
      public function InDamage() : Boolean
      {
         return a_1339 > 0 && a_1339 < MAX_INJURED_LIFE;
      }
      
      public function SetAnimation(animIdx:int, addIdx:int = 0) : void
      {
         if(this.InDamage())
         {
            animIdx += addIdx;
         }
         if(a_1275 != animIdx)
         {
            a_1275 = animIdx;
            gotoAndStop((a_1276[animIdx] as FrameLabel).frame);
            a_3419();
         }
      }
      
      public function SetAnimationOnce2Loop(onceAnimIdx:int, loopAnimIdx:int, addIdx:int = 0) : void
      {
         if(this.InDamage())
         {
            onceAnimIdx += addIdx;
            loopAnimIdx += addIdx;
         }
         a_1275 = loopAnimIdx;
         gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         a_3419();
      }
      
      public function SetAnimationOnce2Loop2(onceAnimIdx:int, loopAnimIdx:int) : void
      {
         a_1275 = loopAnimIdx;
         gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         a_3419();
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(!this.m_isSprint || this.bForceDamage)
         {
            super.a_3969(iRduceLifeValue);
         }
         return true;
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         clearTimeout(this.timeID);
         if(stFieldGrid == null)
         {
            return false;
         }
         if(null != stFieldGrid.m_stFlowerDefense && (stFieldGrid.m_stFlowerDefense.a_3512() == 286394160 || stFieldGrid.m_stFlowerDefense.a_3512() == 286394174 || stFieldGrid.m_stFlowerDefense.a_3512() == 286394175 || stFieldGrid.m_stFlowerDefense.a_3512() == 286401568 || stFieldGrid.m_stFlowerDefense.a_3512() == 286401582 || stFieldGrid.m_stFlowerDefense.a_3512() == 286401583))
         {
            return false;
         }
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(this.m_HurtValue);
         }
         else if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(this.m_HurtValue);
         }
         else if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(this.m_HurtValue);
         }
         else if(stFieldGrid.HasNewSlot())
         {
            stFieldGrid.DamageNewSlot(false,0,false,this.m_HurtValue,1);
         }
         else if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(this.m_HurtValue);
         }
         else if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(this.m_HurtValue);
         }
         else if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(this.m_HurtValue);
         }
         return true;
      }
      
      private function getBaseDefense(stFieldGrid:a_3491) : a_3962
      {
         var stTargetFieldGrid:a_3491 = null;
         var i:* = 0;
         if(stFieldGrid == null)
         {
            return null;
         }
         if(!a_1283)
         {
            for(i = stFieldGrid.m_iXGridNo; i >= 0; i--)
            {
               stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,stFieldGrid.m_iYGridNo);
               if(Boolean(stTargetFieldGrid.m_stFlowerDefense) && (stTargetFieldGrid.m_stFlowerDefense.a_3512() == 286394160 || stTargetFieldGrid.m_stFlowerDefense.a_3512() == 286394174 || stTargetFieldGrid.m_stFlowerDefense.a_3512() == 286394175 || stTargetFieldGrid.m_stFlowerDefense.a_3512() == 286401568 || stTargetFieldGrid.m_stFlowerDefense.a_3512() == 286401582 || stTargetFieldGrid.m_stFlowerDefense.a_3512() == 286401583))
               {
                  return stTargetFieldGrid.m_stFlowerDefense;
               }
            }
            for(i = stFieldGrid.m_iXGridNo; i >= 0; i--)
            {
               stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,stFieldGrid.m_iYGridNo);
               if(Boolean(stTargetFieldGrid.m_stFlowerDefense) && stTargetFieldGrid.m_stFlowerDefense.iEnergyTypeID == 1)
               {
                  return stTargetFieldGrid.m_stFlowerDefense;
               }
               if(Boolean(stTargetFieldGrid.m_stFlowerDefense) && stTargetFieldGrid.m_stFlowerDefense.iEnergyTypeID == 3)
               {
                  return stTargetFieldGrid.m_stFlowerDefense;
               }
            }
            for(i = stFieldGrid.m_iXGridNo; i >= 0; i--)
            {
               stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,stFieldGrid.m_iYGridNo);
               if(stTargetFieldGrid.m_stFlowerDefense)
               {
                  return stTargetFieldGrid.m_stFlowerDefense;
               }
            }
            i = stFieldGrid.m_iXGridNo;
            while(true)
            {
               if(i >= 0)
               {
                  stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,stFieldGrid.m_iYGridNo);
                  if(stTargetFieldGrid.m_stBaseAuxiliaryFighter)
                  {
                     break;
                  }
                  i--;
                  continue;
               }
            }
            return stTargetFieldGrid.m_stBaseAuxiliaryFighter;
         }
         for(i = stFieldGrid.m_iXGridNo; i < BattleFieldView.a_1011; i++)
         {
            stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,stFieldGrid.m_iYGridNo);
            if(Boolean(stTargetFieldGrid.m_stFlowerDefense) && (stTargetFieldGrid.m_stFlowerDefense.a_3512() == 286394160 || stTargetFieldGrid.m_stFlowerDefense.a_3512() == 286394174 || stTargetFieldGrid.m_stFlowerDefense.a_3512() == 286394175 || stTargetFieldGrid.m_stFlowerDefense.a_3512() == 286401568 || stTargetFieldGrid.m_stFlowerDefense.a_3512() == 286401582 || stTargetFieldGrid.m_stFlowerDefense.a_3512() == 286401583))
            {
               return stTargetFieldGrid.m_stFlowerDefense;
            }
         }
         for(i = stFieldGrid.m_iXGridNo; i < BattleFieldView.a_1011; i++)
         {
            stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,stFieldGrid.m_iYGridNo);
            if(Boolean(stTargetFieldGrid.m_stFlowerDefense) && stTargetFieldGrid.m_stFlowerDefense.iEnergyTypeID == 1)
            {
               return stTargetFieldGrid.m_stFlowerDefense;
            }
            if(Boolean(stTargetFieldGrid.m_stFlowerDefense) && stTargetFieldGrid.m_stFlowerDefense.iEnergyTypeID == 3)
            {
               return stTargetFieldGrid.m_stFlowerDefense;
            }
         }
         for(i = stFieldGrid.m_iXGridNo; i < BattleFieldView.a_1011; i++)
         {
            stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,stFieldGrid.m_iYGridNo);
            if(stTargetFieldGrid.m_stFlowerDefense)
            {
               return stTargetFieldGrid.m_stFlowerDefense;
            }
         }
         for(i = stFieldGrid.m_iXGridNo; i < BattleFieldView.a_1011; i++)
         {
            stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,stFieldGrid.m_iYGridNo);
            if(stTargetFieldGrid.m_stBaseAuxiliaryFighter)
            {
               return stTargetFieldGrid.m_stBaseAuxiliaryFighter;
            }
         }
         return null;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(!this.m_isSprint)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      override public function a_4210() : Boolean
      {
         if(!this.m_isSprint)
         {
            this.bForceDamage = true;
            this.a_3969(BOOM_INJURE_LIFE);
            this.bForceDamage = false;
         }
         else
         {
            a_1339 = 0;
         }
         ShowBoomDieEffect();
         if(a_1339 <= 0)
         {
            a_3940();
         }
         return true;
      }
      
      override public function a_4213() : Boolean
      {
         a_1339 = 0;
         a_3940();
         return true;
      }
   }
}

