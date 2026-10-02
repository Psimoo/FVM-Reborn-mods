package com.aurora.ui.maogoutd.resource.Intruder.WonderLand.HeartPokerSoldier
{
   import a_4718.b_181;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4255;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import flash.display.FrameLabel;
   
   public class HeartPokerSoldierMouseMoveIntruder extends a_4206
   {
      
      private var m_bIsUsedSkill:Boolean;
      
      private var m_SeparationSkill:Boolean;
      
      private var m_iSkillTick:int;
      
      private const FULL_HP:int = 900;
      
      private const HURT_HP:int = 450;
      
      private const DEAD_HP:int = 0;
      
      private var m_EatValue:int = 30;
      
      public function HeartPokerSoldierMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(HeartPokerSoldierMouseMoveIntruder) as HeartPokerSoldierMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return HeartPokerSoldierMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (1 * 20);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = this.FULL_HP;
         a_1279 = -width * 0.4 - 10;
         a_1272 = 0;
         a_1377 = 0;
         a_1476 = 13 * 2;
         this.m_bIsUsedSkill = false;
         this.m_SeparationSkill = false;
         this.m_iSkillTick = 0;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > this.HURT_HP)
         {
            if(this.m_SeparationSkill)
            {
               if(a_1275 != 7)
               {
                  a_1275 = 7;
                  gotoAndStop((a_1276[7] as FrameLabel).frame);
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
            if(this.m_SeparationSkill)
            {
               if(a_1275 != 8)
               {
                  a_1275 = 8;
                  gotoAndStop((a_1276[8] as FrameLabel).frame);
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
         var numOrigXPos:Number = x;
         if(!a_1460)
         {
            a_1460 = true;
            a_1350 = m_stCurrentFieldGrid.m_iXGridNo < 6 ? a_3491.a_1080 / (3 * 20) : a_3491.a_1080 / (1 * 20);
            if(!a_1283)
            {
               a_1350 *= -1;
            }
         }
         if(!this.m_SeparationSkill && !this.m_bIsUsedSkill)
         {
            if(this.a_3492(m_stCurrentFieldGrid))
            {
               this.m_SeparationSkill = true;
               this.m_iSkillTick = 20 * 2;
               this.ResetMovieStatus();
            }
            else if(m_stCurrentFieldGrid.m_iXGridNo == BattleFieldView.a_1011 - 3)
            {
               if(x <= m_stCurrentFieldGrid.m_iXGridNo * a_3491.a_1080 + a_3491.a_1080 / 2 - 23)
               {
                  this.m_SeparationSkill = true;
                  this.m_iSkillTick = 20 * 2;
                  this.ResetMovieStatus();
               }
            }
         }
         if(this.m_SeparationSkill)
         {
            if(this.m_iSkillTick > 0)
            {
               --this.m_iSkillTick;
               if((20 - 14) * 2 == this.m_iSkillTick)
               {
                  this.RealeaseMouse();
               }
               if(0 == this.m_iSkillTick)
               {
                  this.m_SeparationSkill = false;
                  this.m_bIsUsedSkill = true;
                  a_1350 = a_3491.a_1080 / (3 * 20);
                  if(!a_1283)
                  {
                     a_1350 *= -1;
                  }
                  this.ResetMovieStatus();
               }
            }
         }
         if(!this.m_SeparationSkill)
         {
            super.a_4216(iCurrentTime);
         }
         this.m_EatValue = this.m_bIsUsedSkill ? 50 : 50;
         if(a_1473 <= 0 && a_1474 <= 0 && iCurrentTime == a_1477 + 14)
         {
            this.EatFieldGridDefense(m_stCurrentFieldGrid);
         }
         if(a_1457 == b_181.a_424 && (x > a_3491.a_1080 * 4 && a_1283 || x < a_3491.a_1080 * 5 && !a_1283))
         {
            y += Math.tan(15 * Math.PI / 180) * Math.abs(numOrigXPos - x);
         }
         return true;
      }
      
      private function RealeaseMouse() : void
      {
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var stBaseMoveIntruder:* = undefined;
         var stStartFieldGrid:a_3491 = null;
         if(null == m_stCurrentFieldGrid)
         {
            return;
         }
         for(var i:int = 1; i < BattleFieldView.a_1011; i++)
         {
            iXGridNo = m_stCurrentFieldGrid.m_iXGridNo;
            iYGridNo = m_stCurrentFieldGrid.m_iYGridNo - i;
            stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
            if(stStartFieldGrid != null)
            {
               stBaseMoveIntruder = a_4255.getInstance().a_4256(8389424);
               if(null == stBaseMoveIntruder)
               {
                  throw Error("前端map_mouse.xml配置 MouseID节点 缺少老鼠ID：" + (8389424).toString(16));
               }
               stBaseMoveIntruder.m_iSeparation = true;
               stBaseMoveIntruder.a_1797((globalMoveFighterID << 16) + iYGridNo,-1);
               stBaseMoveIntruder.m_stMoveIntruderTypeID = 8389424;
               stBaseMoveIntruder.x = stStartFieldGrid.m_iXGridNo * a_3491.a_1080;
               stBaseMoveIntruder.y = iYPosSkewing + stBaseMoveIntruder.iYPosSkewing + (stStartFieldGrid.m_iYGridNo + 1) * a_3491.a_1081 - stBaseMoveIntruder.height;
               stStartFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stStartFieldGrid,false);
            }
            iXGridNo = m_stCurrentFieldGrid.m_iXGridNo;
            iYGridNo = m_stCurrentFieldGrid.m_iYGridNo + i;
            stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
            if(stStartFieldGrid != null)
            {
               stBaseMoveIntruder = a_4255.getInstance().a_4256(8389424);
               if(null == stBaseMoveIntruder)
               {
                  throw Error("前端map_mouse.xml配置 MouseID节点 缺少老鼠ID：" + (8389424).toString(16));
               }
               stBaseMoveIntruder.m_iSeparation = true;
               stBaseMoveIntruder.a_1797((globalMoveFighterID << 16) + iYGridNo,-1);
               stBaseMoveIntruder.m_stMoveIntruderTypeID = 8389424;
               stBaseMoveIntruder.x = stStartFieldGrid.m_iXGridNo * a_3491.a_1080;
               stBaseMoveIntruder.y = iYPosSkewing + stBaseMoveIntruder.iYPosSkewing + (stStartFieldGrid.m_iYGridNo + 1) * a_3491.a_1081 - stBaseMoveIntruder.height;
               stStartFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stStartFieldGrid,false);
            }
         }
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
      
      private function a_3492(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         if(null != stFieldGrid.m_stProtector && IsCanEat(stFieldGrid.m_stProtector) && stFieldGrid.m_stProtector.iLifeValue > 50)
         {
            return true;
         }
         if(null != stFieldGrid.m_stAttackFighter && IsCanEat(stFieldGrid.m_stAttackFighter) && stFieldGrid.m_stAttackFighter.iLifeValue > 50)
         {
            return true;
         }
         if(null != stFieldGrid.m_stBoomDefense && stFieldGrid.m_stBoomDefense.isCanBeEaten && IsCanEat(stFieldGrid.m_stBoomDefense) && stFieldGrid.m_stBoomDefense.iLifeValue > 50)
         {
            return true;
         }
         if(null != stFieldGrid.m_stFlowerDefense && IsCanEat(stFieldGrid.m_stFlowerDefense) && stFieldGrid.m_stFlowerDefense.iLifeValue > 50)
         {
            return true;
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter && IsCanEat(stFieldGrid.m_stBaseAuxiliaryFighter) && stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue > 50)
         {
            return true;
         }
         if(null != stFieldGrid.m_stTrayDefense && IsCanEat(stFieldGrid.m_stTrayDefense) && stFieldGrid.m_stTrayDefense.iLifeValue > 50)
         {
            return true;
         }
         return false;
      }
      
      override public function a_4140(iCurrentTime:int) : void
      {
         super.a_4140(iCurrentTime);
      }
   }
}

