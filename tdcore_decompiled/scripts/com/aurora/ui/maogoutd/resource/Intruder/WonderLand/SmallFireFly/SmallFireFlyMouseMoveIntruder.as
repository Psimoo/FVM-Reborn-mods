package com.aurora.ui.maogoutd.resource.Intruder.WonderLand.SmallFireFly
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   
   public class SmallFireFlyMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 800;
      
      private static const HURT_HP:int = MAX_LIFE / 2;
      
      private var m_isSprint:Boolean;
      
      private var m_isBoomDie:Boolean;
      
      private var m_iSkilled:Boolean;
      
      private var stTargetDefense:a_3962;
      
      private var m_TargetXGridNo:int;
      
      private var timeID:int;
      
      private var m_HurtValue:int = 600;
      
      public function SmallFireFlyMouseMoveIntruder()
      {
         super();
         a_1272 = 0;
         a_1279 = -width * 0.3;
         a_1467 = -28;
      }
      
      public static function a_3926() : SmallFireFlyMouseMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(SmallFireFlyMouseMoveIntruder) as SmallFireFlyMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return SmallFireFlyMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (3 * 20);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1465 = 3;
         a_1339 = MAX_LIFE;
         this.m_isSprint = false;
         this.m_isBoomDie = false;
         this.m_iSkilled = false;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > HURT_HP)
         {
            if(this.m_isSprint)
            {
               if(a_1275 != 5)
               {
                  a_1275 = 5;
                  gotoAndStop((a_1276[5] as FrameLabel).frame);
               }
            }
            else if(a_1475)
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
            a_3419();
         }
         else if(a_1339 > 0)
         {
            if(this.m_isSprint)
            {
               if(a_1275 != 6)
               {
                  a_1275 = 6;
                  gotoAndStop((a_1276[6] as FrameLabel).frame);
               }
            }
            else if(a_1475)
            {
               if(a_1275 != 3)
               {
                  a_1275 = 3;
                  gotoAndStop((a_1276[3] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 1)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
            a_3419();
         }
         else if(a_1339 <= 0 && a_1275 != 4)
         {
            a_1275 = 4;
            gotoAndStop((a_1276[4] as FrameLabel).frame);
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
         if(!this.m_isSprint)
         {
            super.a_3969(iRduceLifeValue);
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         if(!a_1460)
         {
            a_1460 = true;
            if(x <= 7 * a_3491.a_1080 + a_3491.a_1080 / 2 + 32 && !this.m_iSkilled)
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
         if(x == 7 * a_3491.a_1080 + a_3491.a_1080 / 2 + 32 && !this.m_iSkilled)
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
         if(this.m_TargetXGridNo == m_stCurrentFieldGrid.m_iXGridNo && this.m_isSprint)
         {
            if(x <= m_stCurrentFieldGrid.m_iXGridNo * a_3491.a_1080 + a_3491.a_1080 / 2 + 32)
            {
               this.m_isSprint = false;
               this.m_isBoomDie = true;
               a_1339 = 0;
               a_1275 = 7;
               gotoAndStop((a_1276[7] as FrameLabel).frame);
               if(m_stCurrentFieldGrid)
               {
                  m_stCurrentFieldGrid.a_3457(this);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
               }
               this.timeID = setTimeout(this.a_3502,200,m_stCurrentFieldGrid);
            }
         }
         if(!this.m_isBoomDie)
         {
            return super.a_4216(iCurrentTime);
         }
         return true;
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         clearTimeout(this.timeID);
         if(stFieldGrid == null || HasTag(40009))
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
         else if(stFieldGrid.HasNewSlot())
         {
            stFieldGrid.DamageNewSlot(false,0,false,this.m_HurtValue,1);
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
         if(stFieldGrid)
         {
            for(i = stFieldGrid.m_iXGridNo; i >= 0; i--)
            {
               stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,stFieldGrid.m_iYGridNo);
               if(Boolean(stTargetFieldGrid.m_stFlowerDefense) && (stTargetFieldGrid.m_stFlowerDefense.a_3512() == 286394160 || stTargetFieldGrid.m_stFlowerDefense.a_3512() == 286401568 || stTargetFieldGrid.m_stFlowerDefense.a_3512() == 286401582 || stTargetFieldGrid.m_stFlowerDefense.a_3512() == 286401583))
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
            for(i = stFieldGrid.m_iXGridNo; i >= 0; i--)
            {
               stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,stFieldGrid.m_iYGridNo);
               if(stTargetFieldGrid.m_stBaseAuxiliaryFighter)
               {
                  return stTargetFieldGrid.m_stBaseAuxiliaryFighter;
               }
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
   }
}

