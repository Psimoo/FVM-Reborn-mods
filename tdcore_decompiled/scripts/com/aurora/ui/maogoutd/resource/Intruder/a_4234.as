package com.aurora.ui.maogoutd.resource.Intruder
{
   import a_4718.b_181;
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class a_4234 extends a_4206
   {
      
      public function a_4234()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(a_4234) as a_4234;
      }
      
      override protected function getBindMovie() : Class
      {
         return GarbageTruckMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 70;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = 640;
         a_1279 = -width * 0.15;
         a_1272 = 0;
         a_1464 = true;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 240)
         {
            if(a_1275 != 0)
            {
               a_1275 = 0;
               gotoAndStop((a_1276[0] as FrameLabel).frame);
            }
         }
         else if(a_1339 > 0)
         {
            if(a_1275 != 1)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
         }
         else if(a_1339 <= 0)
         {
            if(a_1275 != 2)
            {
               a_1275 = 2;
               gotoAndStop((a_1276[2] as FrameLabel).frame);
            }
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
         if(240 == a_1339)
         {
            if(a_1275 != 1)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
         }
         else if(a_1339 <= 0)
         {
            if(a_1275 != 2)
            {
               a_1275 = 2;
               gotoAndStop((a_1276[2] as FrameLabel).frame);
            }
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
      
      override public function a_4210() : Boolean
      {
         if(m_stCurrentFieldGrid)
         {
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         }
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
         if(Boolean(m_stCurrentFieldGrid) && Boolean(m_stCurrentFieldGrid.a_3492()) && !HasTag(40009))
         {
            if(Boolean(m_stCurrentFieldGrid) && null != m_stCurrentFieldGrid.m_stProtector)
            {
               m_stCurrentFieldGrid.m_stProtector.m_iDieType = 1;
               m_stCurrentFieldGrid.m_stProtector.a_3969(m_stCurrentFieldGrid.m_stProtector.iLifeValue);
            }
            if(Boolean(m_stCurrentFieldGrid) && null != m_stCurrentFieldGrid.m_stAttackFighter)
            {
               m_stCurrentFieldGrid.m_stAttackFighter.m_iDieType = 1;
               m_stCurrentFieldGrid.m_stAttackFighter.a_3969(m_stCurrentFieldGrid.m_stAttackFighter.iLifeValue);
            }
            if(Boolean(m_stCurrentFieldGrid) && null != m_stCurrentFieldGrid.m_stBoomDefense)
            {
            }
            if(Boolean(m_stCurrentFieldGrid) && null != m_stCurrentFieldGrid.m_stFlowerDefense)
            {
               m_stCurrentFieldGrid.m_stFlowerDefense.m_iDieType = 1;
               m_stCurrentFieldGrid.m_stFlowerDefense.a_3969(m_stCurrentFieldGrid.m_stFlowerDefense.iLifeValue);
            }
            if(Boolean(m_stCurrentFieldGrid) && null != m_stCurrentFieldGrid.m_stBaseAuxiliaryFighter)
            {
               m_stCurrentFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
               m_stCurrentFieldGrid.m_stBaseAuxiliaryFighter.a_3969(m_stCurrentFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
            }
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.DamageNewSlot(true,0,true,0,1);
            }
            if(Boolean(m_stCurrentFieldGrid) && null != m_stCurrentFieldGrid.m_stTrayDefense)
            {
               m_stCurrentFieldGrid.m_stTrayDefense.m_iDieType = 1;
               m_stCurrentFieldGrid.m_stTrayDefense.a_3969(m_stCurrentFieldGrid.m_stTrayDefense.iLifeValue);
            }
         }
         super.a_4216(iCurrentTime);
         if(a_1457 == b_181.a_424 && (x > a_3491.a_1080 * 4 && a_1283 || x < a_3491.a_1080 * 5 && !a_1283))
         {
            y += Math.tan(15 * Math.PI / 180) * Math.abs(numOrigXPos - x);
         }
         return true;
      }
      
      override public function play() : void
      {
         super.play();
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_433 != iEffectType && b_182.a_434 != iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      protected function a_3955() : Number
      {
         return -0.08 * width;
      }
      
      protected function a_3956() : Number
      {
         return -0.08 * height;
      }
   }
}

