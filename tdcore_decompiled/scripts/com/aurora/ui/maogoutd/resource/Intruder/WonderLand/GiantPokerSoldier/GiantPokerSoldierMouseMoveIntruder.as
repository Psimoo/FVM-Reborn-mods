package com.aurora.ui.maogoutd.resource.Intruder.WonderLand.GiantPokerSoldier
{
   import a_4718.b_181;
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class GiantPokerSoldierMouseMoveIntruder extends a_4206
   {
      
      private const FULL_HP:int = 10000;
      
      private const HURT_HP:int = 5000;
      
      private const DEAD_HP:int = 0;
      
      private var m_bIsUsedSkill:Boolean;
      
      private var m_iShoutting:Boolean;
      
      private var m_ShowShield:Boolean;
      
      private var m_EatValue:int = 900;
      
      private var m_MouseArr:Array = new Array(8389418,8389419,8389424,8389423);
      
      public function GiantPokerSoldierMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(GiantPokerSoldierMouseMoveIntruder) as GiantPokerSoldierMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return GiantPokerSoldierMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 130;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = this.FULL_HP;
         a_1279 = -width * 0.3 - 30;
         a_1467 = 0;
         a_1377 = 0;
         a_1476 = 60;
         a_1477 = 0;
         BoomIsReduceLife = true;
         this.m_bIsUsedSkill = false;
         this.m_iShoutting = false;
         this.m_ShowShield = false;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this.m_ShowShield = false;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > this.HURT_HP)
         {
            if(this.m_iShoutting)
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
         }
         else if(a_1339 > 0)
         {
            if(this.m_iShoutting)
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
         }
         else if(a_1339 <= 0 && a_1275 != 4)
         {
            a_1275 = 4;
            gotoAndStop((a_1276[4] as FrameLabel).frame);
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
         a_3419();
         return true;
      }
      
      override protected function EattingJudge() : void
      {
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
      
      override public function a_4140(iCurrentTime:int) : void
      {
         super.a_4140(iCurrentTime);
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var num:int = 0;
         var i:int = 0;
         var numOrigXPos:Number = x;
         trace("m_iCurrentFrame::" + a_1273);
         if(!a_1460)
         {
            a_1460 = true;
            this.m_ShowShield = false;
         }
         if(!this.m_iShoutting)
         {
            super.a_4216(iCurrentTime);
         }
         if(!this.m_bIsUsedSkill && !this.m_iShoutting)
         {
            if(m_stCurrentFieldGrid.m_iXGridNo == BattleFieldView.a_1011 - 3)
            {
               if(x <= m_stCurrentFieldGrid.m_iXGridNo * a_3491.a_1080 + a_3491.a_1080 / 2 - 23)
               {
                  this.m_iShoutting = true;
                  this.ResetMovieStatus();
               }
            }
         }
         if(iCurrentTime % 2 == 0)
         {
            if(a_1273 == 70 || a_1273 == 98)
            {
               if(a_1475 && null == m_stCurrentFieldGrid.m_stProtector && null == m_stCurrentFieldGrid.m_stAttackFighter && null == m_stCurrentFieldGrid.m_stFlowerDefense && null == m_stCurrentFieldGrid.m_stHoneyTrapBaseDefense && null == m_stCurrentFieldGrid.m_stOceanGoddessToolDefense && null == m_stCurrentFieldGrid.m_stBaseAuxiliaryFighter && null == m_stCurrentFieldGrid.m_stTrayDefense && null == m_stCurrentFieldGrid.m_stBoomDefense)
               {
                  a_1475 = false;
                  this.ResetMovieStatus();
               }
            }
            else if(a_1273 == 144 || a_1273 == 174)
            {
               num = this.getExistMouseNum(m_stCurrentFieldGrid);
               num = num >= 10 ? 10 : num;
               for(i = 0; i < num; i++)
               {
                  a_1339 += 1000;
               }
               if(num > 0)
               {
                  if(this.iLifeValue > 1000)
                  {
                     this.m_ShowShield = true;
                  }
               }
            }
            else if(a_1273 == 149 || a_1273 == 178)
            {
               this.m_bIsUsedSkill = true;
               this.m_iShoutting = false;
               this.ResetMovieStatus();
            }
         }
         if(this.m_ShowShield)
         {
            if(!this.m_iShoutting && this.m_bIsUsedSkill)
            {
               if(this.iLifeValue <= 1000)
               {
                  this.m_ShowShield = false;
               }
            }
         }
         if(a_1473 <= 0 && a_1474 <= 0 && iCurrentTime == a_1477 + 34)
         {
            this.EatFieldGridDefense(m_stCurrentFieldGrid);
         }
         if(a_1457 == b_181.a_424 && (x > a_3491.a_1080 * 4 && a_1283 || x < a_3491.a_1080 * 5 && !a_1283))
         {
            y += Math.tan(15 * Math.PI / 180) * Math.abs(numOrigXPos - x);
         }
         return true;
      }
      
      protected function EatFieldGridDefense(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         if(null != stFieldGrid.m_stProtector && IsCanEat(stFieldGrid.m_stProtector))
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(this.m_EatValue);
         }
         else if(null != stFieldGrid.m_stAttackFighter && IsCanEat(stFieldGrid.m_stAttackFighter))
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(this.m_EatValue);
         }
         else if(null != stFieldGrid.m_stBoomDefense && stFieldGrid.m_stBoomDefense.isCanBeEaten && IsCanEat(stFieldGrid.m_stBoomDefense))
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(this.m_EatValue);
         }
         else if(null != stFieldGrid.m_stFlowerDefense && IsCanEat(stFieldGrid.m_stFlowerDefense))
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(this.m_EatValue);
         }
         else if(null != stFieldGrid.m_stBaseAuxiliaryFighter && IsCanEat(stFieldGrid.m_stBaseAuxiliaryFighter))
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(this.m_EatValue);
         }
         else if(null != stFieldGrid.m_stOceanGoddessToolDefense && IsCanEat(stFieldGrid.m_stOceanGoddessToolDefense))
         {
            stFieldGrid.m_stOceanGoddessToolDefense.m_iDieType = 1;
            stFieldGrid.m_stOceanGoddessToolDefense.a_3969(this.m_EatValue);
         }
         else if(null != stFieldGrid.m_stHoneyTrapBaseDefense && IsCanEat(stFieldGrid.m_stHoneyTrapBaseDefense))
         {
            stFieldGrid.m_stHoneyTrapBaseDefense.m_iDieType = 1;
            stFieldGrid.m_stHoneyTrapBaseDefense.a_3969(this.m_EatValue);
         }
         else if(null != stFieldGrid.m_stTrayDefense && IsCanEat(stFieldGrid.m_stTrayDefense))
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(this.m_EatValue);
         }
         return true;
      }
      
      private function getExistMouseNum(stFieldGrid:a_3491) : int
      {
         var stTargetFieldGrid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var iIntruderIndex:int = 0;
         var iTotalIntruderNum:int = 0;
         var i:int = 0;
         if(stFieldGrid)
         {
            for(i = 0; i < BattleFieldView.a_1011; i++)
            {
               stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,stFieldGrid.m_iYGridNo);
               arrMoveIntruder = stTargetFieldGrid.a_1511.slice();
               for(iIntruderIndex = 0; iIntruderIndex < arrMoveIntruder.length; iIntruderIndex++)
               {
                  stMoveIntruder = arrMoveIntruder[iIntruderIndex];
                  if(this.m_MouseArr.indexOf(stMoveIntruder.m_stMoveIntruderTypeID) != -1)
                  {
                     iTotalIntruderNum++;
                  }
               }
            }
         }
         return iTotalIntruderNum;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(iEffectType != b_182.a_434 && iEffectType != b_182.enm_shotEffectFreezeStop && iEffectType != b_182.a_433)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
   }
}

