package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.AdventureMouse
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class AthleteMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 18000;
      
      private static const MAX_INJURED_LIFE:int = 8000;
      
      private static const ONE_GRID_SPEED:Number = 1.5;
      
      private var bRealDamage:Boolean = false;
      
      private var bInVisible:Boolean = true;
      
      private var xOffset:Number = 0;
      
      private var iWaitTick:int = -1;
      
      private var m_bCanBreak:Boolean = false;
      
      private var m_iVisible:Boolean = false;
      
      public function AthleteMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(AthleteMouseMoveIntruder) as AthleteMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return AthleteMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1339 = MAX_LIFE;
         a_1279 = -width * 0.2;
         a_1272 = 0;
         this.bRealDamage = false;
         a_1481 = false;
         a_1465 = 0;
         BoomIsReduceLife = true;
         this.bInVisible = true;
         this.SetSpeed(ONE_GRID_SPEED);
         this.xOffset = 0;
         this.iWaitTick = -1;
         a_1464 = true;
         this.m_iVisible = false;
         return true;
      }
      
      private function SetSpeed(speed:Number) : void
      {
         a_1350 = a_3491.a_1080 / (20 * speed);
         if(!a_1283)
         {
            a_1350 *= -1;
         }
      }
      
      override protected function GetiNoX() : int
      {
         var iXGridNo:int = int((x + 30) / a_3491.a_1080);
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - iXGridNo;
         }
         return iXGridNo;
      }
      
      override public function a_4210() : Boolean
      {
         if(BoomIsReduceLife)
         {
            this.bRealDamage = true;
            this.a_3969(BOOM_INJURE_LIFE);
            this.bRealDamage = false;
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
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_433 == iEffectType || b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(this.bInVisible)
         {
            return true;
         }
         if(this.bRealDamage == true || a_1465 == 0 && !this.m_iVisible)
         {
            super.a_3969(iRduceLifeValue);
         }
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         if(this.bInVisible)
         {
            return true;
         }
         if(this.bRealDamage == true || a_1465 == 0 && !this.m_iVisible)
         {
            super.a_4209(iRduceLifeValue);
         }
         return true;
      }
      
      override public function a_4213() : Boolean
      {
         a_1339 = 0;
         if(m_stCurrentFieldGrid)
         {
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         }
         a_3940();
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         if(m_stCurrentFieldGrid != null && (a_1465 == 0 || m_stCurrentFieldGrid.m_iXGridNo == 0 && a_1465 == 2))
         {
            super.a_4212();
         }
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 0)
         {
            if(a_1475)
            {
               this.SetAnimation(2,7);
            }
            else if(this.m_bCanBreak)
            {
               this.SetAnimation(1,6);
            }
         }
         else
         {
            this.SetAnimation(11);
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
         return true;
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption();
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         BattleFieldView.ms_kenShi29.play();
         stBaseDefense.m_iDieType = 1;
         if(stBaseDefense is a_3924)
         {
            stBaseDefense.a_3969(10);
         }
         else
         {
            stBaseDefense.a_3969(50);
         }
         return true;
      }
      
      private function IsDropDown() : Boolean
      {
         return a_1273 >= 37 && iCurrentFrame <= 50 || a_1273 >= 82 && iCurrentFrame <= 95;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var arrBaseMoveIntruderVector:Array = null;
         var grid:a_3491 = null;
         var numOrigXPos:Number = x;
         if(!a_1460)
         {
            a_1460 = true;
            if(m_stCurrentFieldGrid != null)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
               arrBaseMoveIntruderVector = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_arrBaseMoveIntruderVector;
               if(-1 != arrBaseMoveIntruderVector.indexOf(this))
               {
                  arrBaseMoveIntruderVector.splice(arrBaseMoveIntruderVector.indexOf(this),1);
               }
               grid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(8,m_stCurrentFieldGrid.m_iYGridNo);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(this,grid,false,BattleLayerDefine.INTRUDER_LAND_TYPE);
               this.a_3502(grid);
               this.x = a_3491.a_1080 * 8;
               this.SetAnimation(0,0);
            }
         }
         super.a_4216(iCurrentTime);
         if(a_1273 == 20)
         {
            this.bInVisible = false;
            this.SetAnimationOnce2Loop(3,4,8,9);
            this.iWaitTick = 0;
            a_1464 = false;
         }
         SetGameMapModePicnicPosition(numOrigXPos);
         if(a_1273 == 51 || a_1273 == 96)
         {
            this.iWaitTick = -1;
         }
         if(this.iWaitTick != -1 && this.bInVisible == false && a_1465 == 0)
         {
            ++this.iWaitTick;
            if(this.iWaitTick >= 70 && !this.IsDropDown() && !a_1475)
            {
               this.SetAnimationOnce2Loop(3,4,8,9);
            }
         }
         this.m_iVisible = a_1273 >= 60 && iCurrentFrame <= 65 || a_1273 >= 105 && iCurrentFrame <= 110;
         this.m_bCanBreak = false;
         if(a_1273 >= 21 && iCurrentFrame <= 30 || a_1273 >= 66 && iCurrentFrame <= 75)
         {
            a_1465 = 0;
            a_1464 = false;
            this.SetSpeed(0);
            this.m_bCanBreak = true;
         }
         else if(a_1273 >= 31 && iCurrentFrame <= 36 || a_1273 >= 76 && iCurrentFrame <= 81)
         {
            a_1465 = 0;
            a_1464 = false;
            this.SetSpeed(0);
            this.m_bCanBreak = true;
         }
         else if(this.IsDropDown())
         {
            a_1465 = 0;
            a_1464 = false;
            this.SetSpeed(0);
            this.m_bCanBreak = false;
         }
         else
         {
            if(a_1273 >= 54 && iCurrentFrame <= 59 || a_1273 >= 99 && iCurrentFrame <= 104)
            {
               this.xOffset += Math.abs(x - numOrigXPos);
               if(this.xOffset >= 180)
               {
                  this.SetSpeed(0);
                  this.SetAnimationOnce2Loop(5,1,10,6);
                  this.a_3502(m_stCurrentFieldGrid);
                  this.xOffset = 0;
                  this.iWaitTick = 0;
               }
               else
               {
                  this.SetSpeed(ONE_GRID_SPEED);
               }
            }
            else
            {
               this.SetSpeed(0);
            }
            a_1465 = 2;
            a_1464 = true;
            a_1475 = false;
         }
         return true;
      }
      
      public function InDamage() : Boolean
      {
         return a_1339 > 0 && a_1339 < MAX_INJURED_LIFE;
      }
      
      public function SetAnimation(animIdx:int, damageIdx:int = 0) : void
      {
         var idx:int = 0;
         idx = this.InDamage() ? damageIdx : animIdx;
         if(a_1275 != idx)
         {
            a_1275 = idx;
            gotoAndStop((a_1276[idx] as FrameLabel).frame);
            a_3419();
         }
      }
      
      public function SetAnimationOnce2Loop(onceAnimIdx:int, loopAnimIdx:int, onceDamageIdx:int, loopDamageIdx:int) : void
      {
         var bInDamage:Boolean = false;
         bInDamage = this.InDamage();
         a_1275 = bInDamage ? loopDamageIdx : loopAnimIdx;
         gotoAndStop((a_1276[bInDamage ? onceDamageIdx : onceAnimIdx] as FrameLabel).frame);
         a_3419();
      }
   }
}

