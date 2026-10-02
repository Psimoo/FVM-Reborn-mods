package com.aurora.ui.maogoutd.resource.gamemap.newMap.DragonYear
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.tools.a_4425;
   import flash.display.BitmapData;
   import flash.display.FrameLabel;
   
   public class BigCoconutMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_ATTACK_RANGE:int = 3;
      
      public static var ms_EatCard:Array = new Array(286851568,286851584,286851472);
      
      private var m_iAppearedTime:int;
      
      public var FULL_HP:int = 20000;
      
      private var HURT_HP:int = 2000;
      
      private var DEAD_HP:int = 0;
      
      protected var a_1351:Array = [];
      
      private var m_HurtPower:int;
      
      private var m_BossSate:int = 0;
      
      public function BigCoconutMouseMoveIntruder()
      {
         super();
         a_1279 = -62;
         a_1467 = 11 + 8;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(BigCoconutMouseMoveIntruder) as BigCoconutMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return BigCoconutMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1339 = this.FULL_HP;
         a_1464 = true;
         a_1463 = false;
         SetCannotSeeByFighter(true);
         BoomIsReduceLife = true;
         this.a_1351 = [];
         this.m_HurtPower = 0;
         a_1481 = true;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this.m_HurtPower = 0;
         this.a_1351 = [];
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var stBackFieldGrid:a_3491 = null;
         if(!a_1460)
         {
            a_1465 = 0;
            a_1460 = true;
            this.m_iAppearedTime = iCurrentTime;
            this.m_BossSate = 0;
            a_1275 = 0;
            gotoAndStop((a_1276[0] as FrameLabel).frame);
         }
         if(this.m_BossSate != 0)
         {
            super.a_4216(iCurrentTime);
         }
         if(m_stCurrentFieldGrid == null)
         {
            return false;
         }
         if(m_stCurrentFieldGrid != null && m_stCurrentFieldGrid.m_iFieldGridType == 6 && this.m_BossSate == 1)
         {
            if(x <= m_stCurrentFieldGrid.m_iXGridNo * a_3491.a_1080 + 30)
            {
               this.m_BossSate = 3;
               a_1350 = 0;
               SetCannotSeeByFighter(false);
               this.ResetMovieStatus();
            }
         }
         if(iCurrentTime % 2 == 0)
         {
            if(a_1273 == 8)
            {
               this.m_BossSate = 1;
               a_1350 = a_3491.a_1080 / (4 * 20);
               if(!a_1283)
               {
                  a_1350 *= -1;
               }
               SetCannotSeeByFighter(false);
               this.ResetMovieStatus();
            }
            else if(a_1273 == 4)
            {
               this.a_3502(m_stCurrentFieldGrid);
            }
         }
         if(this.m_BossSate == 2)
         {
            this.HitMouse(m_stCurrentFieldGrid);
            stBackFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 1,m_stCurrentFieldGrid.m_iYGridNo);
            this.HitMouse(stBackFieldGrid);
         }
         return true;
      }
      
      override protected function ChangeFieldGrid(stNextFieldGrid:a_3491) : void
      {
         super.ChangeFieldGrid(stNextFieldGrid);
         if(this.m_BossSate == 1)
         {
            this.a_3502(m_stCurrentFieldGrid);
         }
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > this.HURT_HP)
         {
            if(this.m_BossSate == 1)
            {
               if(a_1275 != 1)
               {
                  a_1275 = 1;
                  gotoAndStop((a_1276[1] as FrameLabel).frame);
               }
            }
            else if(this.m_BossSate == 2)
            {
               if(a_1275 != 3)
               {
                  a_1275 = 3;
                  gotoAndStop((a_1276[3] as FrameLabel).frame);
               }
            }
            else if(this.m_BossSate == 3)
            {
               if(a_1275 != 2)
               {
                  a_1275 = 2;
                  gotoAndStop((a_1276[2] as FrameLabel).frame);
               }
            }
            a_3419();
         }
         else if(a_1339 > 0)
         {
            if(this.m_BossSate == 1)
            {
               if(a_1275 != 4)
               {
                  a_1275 = 4;
                  gotoAndStop((a_1276[4] as FrameLabel).frame);
               }
            }
            else if(this.m_BossSate == 2)
            {
               if(a_1275 != 6)
               {
                  a_1275 = 6;
                  gotoAndStop((a_1276[6] as FrameLabel).frame);
               }
            }
            else if(this.m_BossSate == 3)
            {
               if(a_1275 != 5)
               {
                  a_1275 = 5;
                  gotoAndStop((a_1276[5] as FrameLabel).frame);
               }
            }
            a_3419();
         }
         else if(a_1339 <= 0)
         {
            if(a_1275 != 7)
            {
               this.m_BossSate = 4;
               a_1275 = 7;
               gotoAndStop((a_1276[7] as FrameLabel).frame);
            }
            a_3419();
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
         }
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(this.m_BossSate != 0 && this.m_BossSate != 2 && this.m_BossSate != 4)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
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
         }
         if(null != stFieldGrid.m_stAttackFighter)
         {
            if(ms_EatCard.indexOf(stFieldGrid.m_stAttackFighter.a_3512()) != -1)
            {
               stFieldGrid.m_stAttackFighter.m_iDieType = 1;
               stFieldGrid.m_stAttackFighter.a_3969(10);
            }
            else
            {
               stFieldGrid.m_stAttackFighter.m_iDieType = 1;
               stFieldGrid.m_stAttackFighter.a_3969(stFieldGrid.m_stAttackFighter.iLifeValue);
            }
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(stFieldGrid.m_stBoomDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(stFieldGrid.m_stFlowerDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
         }
         stFieldGrid.DamageNewSlot(true,0,true,0,1);
         if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue);
         }
         return true;
      }
      
      public function HitMouse(stFieldGrid:a_3491) : void
      {
         var stMoveIntruder:a_4206 = null;
         var stIntruderRemoteThrowEffect:a_4425 = null;
         var stTestBd:BitmapData = null;
         if(stFieldGrid == null)
         {
            return;
         }
         var arrMoveIntruder:Array = stFieldGrid.a_1511.slice();
         for each(stMoveIntruder in arrMoveIntruder)
         {
            if(stMoveIntruder.visible && hitTestObject(stMoveIntruder) && -1 == this.a_1351.indexOf(stMoveIntruder))
            {
               if(0 == stMoveIntruder.iSpaceState)
               {
                  stTestBd = stMoveIntruder.stDisplayBitmap.bitmapData.clone();
               }
               stMoveIntruder.a_4212();
               if(!stMoveIntruder.visible && stMoveIntruder.iLifeValue <= 0 && stTestBd != null)
               {
                  stIntruderRemoteThrowEffect = a_4425.a_3926();
                  stIntruderRemoteThrowEffect.a_1797(stTestBd,a_1283);
                  stIntruderRemoteThrowEffect.x = stMoveIntruder.x;
                  stIntruderRemoteThrowEffect.y = stMoveIntruder.y;
                  parent.addChild(stIntruderRemoteThrowEffect);
               }
               this.a_1351.push(stMoveIntruder);
               if(stMoveIntruder.iLifeValue > 0 && stMoveIntruder.visible)
               {
                  stMoveIntruder.a_3969(this.m_HurtPower - BOOM_INJURE_LIFE);
               }
            }
         }
      }
      
      override public function a_4213() : Boolean
      {
         if(m_stCurrentFieldGrid != null && (this.m_BossSate == 1 || this.m_BossSate == 3))
         {
            this.m_HurtPower = BruisAttackID == 286523968 ? 100000 : 50000;
            this.m_BossSate = 2;
            a_1481 = false;
            a_1350 = -a_3491.a_1080 / (0.1 * 20);
            if(!a_1283)
            {
               a_1350 *= -1;
            }
            a_1463 = true;
            SetCannotSeeByFighter(true);
            ResetEffect();
            this.ResetMovieStatus();
         }
         return false;
      }
      
      override public function a_4212() : Boolean
      {
         if(this.m_BossSate != 0 && this.m_BossSate != 2 && this.m_BossSate != 4)
         {
            super.a_4212();
         }
         return false;
      }
      
      override public function a_4210() : Boolean
      {
         if(this.m_BossSate != 0 && this.m_BossSate != 2 && this.m_BossSate != 4)
         {
            super.a_4210();
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(this.m_BossSate != 0 && this.m_BossSate != 2 && this.m_BossSate != 4)
         {
            super.a_3969(iRduceLifeValue);
         }
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         if(this.m_BossSate != 0 && this.m_BossSate != 2 && this.m_BossSate != 4)
         {
            super.a_4209(iRduceLifeValue);
         }
         return true;
      }
   }
}

