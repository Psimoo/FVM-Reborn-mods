package com.aurora.ui.maogoutd.resource.Intruder.WonderLand.GluttonousMouse
{
   import a_4718.b_181;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.AddBloodEffect;
   import flash.display.FrameLabel;
   
   public class GluttonousMouseMoveIntruder extends a_4206
   {
      
      private const FULL_HP:int = 1000;
      
      private const HURT_HP:int = 500;
      
      private var m_Big_State:Boolean;
      
      private var m_ChangeStateToBig:Boolean;
      
      private var m_PlayEatting:Boolean;
      
      public function GluttonousMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(GluttonousMouseMoveIntruder) as GluttonousMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return GluttonousMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (3 * 20);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = this.FULL_HP;
         a_1377 = 0;
         a_1476 = 50;
         a_1279 = -width * 0.2;
         this.m_Big_State = false;
         this.m_ChangeStateToBig = false;
         this.m_PlayEatting = false;
         BoomIsReduceLife = true;
         a_1272 = 0;
         return true;
      }
      
      override public function a_4140(iCurrentTime:int) : void
      {
         super.a_4140(iCurrentTime);
         if(a_1273 == a_1274)
         {
            a_3940();
            return;
         }
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         var LabelIndex:int = 0;
         if(this.m_PlayEatting && a_1339 > 0)
         {
            return false;
         }
         if(a_1339 > this.HURT_HP)
         {
            if(this.m_ChangeStateToBig)
            {
               if(a_1275 != 5)
               {
                  a_1275 = 5;
                  gotoAndStop((a_1276[5] as FrameLabel).frame);
               }
            }
            else if(a_1475)
            {
               LabelIndex = this.m_Big_State ? 9 : 2;
               if(a_1275 != LabelIndex)
               {
                  a_1275 = LabelIndex;
                  gotoAndStop((a_1276[LabelIndex] as FrameLabel).frame);
                  this.m_PlayEatting = true;
               }
            }
            else
            {
               LabelIndex = this.m_Big_State ? 7 : 0;
               if(a_1275 != LabelIndex)
               {
                  a_1275 = LabelIndex;
                  gotoAndStop((a_1276[LabelIndex] as FrameLabel).frame);
               }
            }
            a_3419();
         }
         else if(a_1339 > 0)
         {
            if(this.m_ChangeStateToBig)
            {
               if(a_1275 != 6)
               {
                  a_1275 = 6;
                  gotoAndStop((a_1276[6] as FrameLabel).frame);
               }
            }
            else if(a_1475)
            {
               LabelIndex = this.m_Big_State ? 10 : 3;
               if(a_1275 != LabelIndex)
               {
                  a_1275 = LabelIndex;
                  gotoAndStop((a_1276[LabelIndex] as FrameLabel).frame);
                  this.m_PlayEatting = true;
               }
            }
            else
            {
               LabelIndex = this.m_Big_State ? 8 : 1;
               if(a_1275 != LabelIndex)
               {
                  a_1275 = LabelIndex;
                  gotoAndStop((a_1276[LabelIndex] as FrameLabel).frame);
               }
            }
            a_3419();
         }
         else if(a_1339 <= 0 && a_1275 != 11 && a_1275 != 4)
         {
            LabelIndex = this.m_Big_State ? 11 : 4;
            a_1275 = LabelIndex;
            gotoAndStop((a_1276[LabelIndex] as FrameLabel).frame);
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
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_4210() : Boolean
      {
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
         var m_hasDie:Boolean = false;
         var numOrigXPos:Number = x;
         if(iCurrentTime % 2 == 0 && a_1339 > 0)
         {
            if(a_1273 == 57 || a_1273 == 77)
            {
               this.m_ChangeStateToBig = false;
               a_1475 = false;
               this.m_Big_State = true;
               this.ResetMovieStatus();
            }
            if(a_1273 == 20 || a_1273 == 24 || a_1273 == 130 || a_1273 == 144)
            {
               this.m_PlayEatting = false;
               this.ResetMovieStatus();
            }
         }
         if(!this.m_ChangeStateToBig && !this.m_PlayEatting)
         {
            super.a_4216(iCurrentTime);
         }
         if(!this.m_ChangeStateToBig && !this.m_Big_State && !a_1475)
         {
            if(m_stCurrentFieldGrid.m_iXGridNo == 6)
            {
               this.m_ChangeStateToBig = true;
               this.ResetMovieStatus();
            }
         }
         var eatPower:int = 50;
         var eatTimes:int = this.m_Big_State ? 10 : 6;
         if(a_1473 <= 0 && a_1474 <= 0 && iCurrentTime == a_1477 + eatTimes && !HasTag(40009))
         {
            if(this.m_Big_State)
            {
               this.a_3502(m_stCurrentFieldGrid);
            }
            else
            {
               m_hasDie = false;
               if(null != m_stCurrentFieldGrid.m_stProtector)
               {
                  if(m_stCurrentFieldGrid.m_stProtector.iLifeValue - eatPower <= 0)
                  {
                     m_hasDie = true;
                  }
                  m_stCurrentFieldGrid.m_stProtector.m_iDieType = 1;
                  m_stCurrentFieldGrid.m_stProtector.a_3969(eatPower);
               }
               if(null != m_stCurrentFieldGrid.m_stAttackFighter)
               {
                  if(m_stCurrentFieldGrid.m_stAttackFighter.iLifeValue - eatPower <= 0)
                  {
                     m_hasDie = true;
                  }
                  m_stCurrentFieldGrid.m_stAttackFighter.m_iDieType = 1;
                  m_stCurrentFieldGrid.m_stAttackFighter.a_3969(eatPower);
               }
               if(null != m_stCurrentFieldGrid.m_stBoomDefense)
               {
                  if(m_stCurrentFieldGrid.m_stBoomDefense.iLifeValue - eatPower <= 0)
                  {
                     m_hasDie = true;
                  }
                  m_stCurrentFieldGrid.m_stBoomDefense.m_iDieType = 1;
                  m_stCurrentFieldGrid.m_stBoomDefense.a_3969(eatPower);
               }
               if(null != m_stCurrentFieldGrid.m_stFlowerDefense)
               {
                  if(m_stCurrentFieldGrid.m_stFlowerDefense.iLifeValue - eatPower <= 0)
                  {
                     m_hasDie = true;
                  }
                  m_stCurrentFieldGrid.m_stFlowerDefense.m_iDieType = 1;
                  m_stCurrentFieldGrid.m_stFlowerDefense.a_3969(eatPower);
               }
               if(null != m_stCurrentFieldGrid.m_stHoneyTrapBaseDefense)
               {
                  if(m_stCurrentFieldGrid.m_stHoneyTrapBaseDefense.iLifeValue - eatPower <= 0)
                  {
                     m_hasDie = true;
                  }
                  m_stCurrentFieldGrid.m_stHoneyTrapBaseDefense.m_iDieType = 1;
                  m_stCurrentFieldGrid.m_stHoneyTrapBaseDefense.a_3969(eatPower);
               }
               if(null != m_stCurrentFieldGrid.m_stOceanGoddessToolDefense)
               {
                  if(m_stCurrentFieldGrid.m_stOceanGoddessToolDefense.iLifeValue - eatPower <= 0)
                  {
                     m_hasDie = true;
                  }
                  m_stCurrentFieldGrid.m_stOceanGoddessToolDefense.m_iDieType = 1;
                  m_stCurrentFieldGrid.m_stOceanGoddessToolDefense.a_3969(eatPower);
               }
               if(null != m_stCurrentFieldGrid.m_stBaseAuxiliaryFighter)
               {
                  if(m_stCurrentFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue - eatPower <= 0)
                  {
                     m_hasDie = true;
                  }
                  m_stCurrentFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
                  m_stCurrentFieldGrid.m_stBaseAuxiliaryFighter.a_3969(eatPower);
               }
               if(null != m_stCurrentFieldGrid.m_stTrayDefense)
               {
                  if(m_stCurrentFieldGrid.m_stTrayDefense.iLifeValue - eatPower <= 0)
                  {
                     m_hasDie = true;
                  }
                  m_stCurrentFieldGrid.m_stTrayDefense.m_iDieType = 1;
                  m_stCurrentFieldGrid.m_stTrayDefense.a_3969(eatPower);
               }
               if(m_hasDie)
               {
                  this.m_ChangeStateToBig = true;
                  this.ResetMovieStatus();
               }
            }
         }
         a_1476 = this.m_Big_State ? 28 : 8;
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
            return false;
         }
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(stFieldGrid.m_stProtector.iLifeValue);
            if(a_1339 < 20000)
            {
               a_1339 += 1000;
               this.addlife();
            }
         }
         if(null != stFieldGrid.m_stAttackFighter)
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(stFieldGrid.m_stAttackFighter.iLifeValue);
            if(a_1339 < 20000)
            {
               a_1339 += 1000;
               this.addlife();
            }
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(stFieldGrid.m_stBoomDefense.iLifeValue);
            if(a_1339 < 20000)
            {
               a_1339 += 1000;
               this.addlife();
            }
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(stFieldGrid.m_stFlowerDefense.iLifeValue);
            if(a_1339 < 20000)
            {
               a_1339 += 1000;
               this.addlife();
            }
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
            if(a_1339 < 20000)
            {
               a_1339 += 1000;
               this.addlife();
            }
         }
         if(null != stFieldGrid.m_stHoneyTrapBaseDefense)
         {
            stFieldGrid.m_stHoneyTrapBaseDefense.m_iDieType = 1;
            stFieldGrid.m_stHoneyTrapBaseDefense.a_3969(stFieldGrid.m_stHoneyTrapBaseDefense.iLifeValue);
            if(a_1339 < 20000)
            {
               a_1339 += 1000;
               this.addlife();
            }
         }
         if(null != stFieldGrid.m_stOceanGoddessToolDefense)
         {
            stFieldGrid.m_stOceanGoddessToolDefense.m_iDieType = 1;
            stFieldGrid.m_stOceanGoddessToolDefense.a_3969(stFieldGrid.m_stOceanGoddessToolDefense.iLifeValue);
            if(a_1339 < 20000)
            {
               a_1339 += 1000;
               this.addlife();
            }
         }
         if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue);
            if(a_1339 < 20000)
            {
               a_1339 += 1000;
               this.addlife();
            }
         }
         return true;
      }
      
      public function addlife() : void
      {
         var stAddBloodEffect:AddBloodEffect = null;
         stAddBloodEffect = AddBloodEffect.a_3926();
         stAddBloodEffect.a_1797(false);
         stAddBloodEffect.x = x;
         stAddBloodEffect.y = y;
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stAddBloodEffect,BattleLayerDefine.EFFECTS_TOP_TYPE);
      }
      
      override public function play() : void
      {
         super.play();
      }
   }
}

