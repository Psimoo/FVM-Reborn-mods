package com.aurora.ui.maogoutd.resource.Intruder.WonderLand.HeartPokerSoldier
{
   import a_4718.b_181;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import flash.display.FrameLabel;
   
   public class SeparationHeartPokerSoldierMouseMoveIntruder extends a_4206
   {
      
      private const FULL_HP:int = 900;
      
      private const HURT_HP:int = 450;
      
      private const DEAD_HP:int = 0;
      
      public var m_iSeparation:Boolean = false;
      
      private var stTargetFieldGrid:a_3491;
      
      private var m_EatValue:int = 50;
      
      public function SeparationHeartPokerSoldierMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(SeparationHeartPokerSoldierMouseMoveIntruder) as SeparationHeartPokerSoldierMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return SeparationHeartPokerSoldierMouseMoveIntruderMovie;
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
         a_1279 = -width * 0.4 - 10;
         a_1272 = 0;
         a_1377 = 0;
         a_1476 = 13 * 2;
         a_1275 = 0;
         if(this.m_iSeparation)
         {
            gotoAndStop((a_1276[5] as FrameLabel).frame);
         }
         else
         {
            gotoAndStop((a_1276[0] as FrameLabel).frame);
         }
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this.m_iSeparation = false;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > this.HURT_HP)
         {
            if(a_1475)
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
            if(a_1475)
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
         var numOrigXPos:Number = x;
         super.a_4216(iCurrentTime);
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
      
      override public function play() : void
      {
         super.play();
      }
   }
}

