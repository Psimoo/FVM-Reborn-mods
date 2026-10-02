package com.aurora.ui.maogoutd.resource.Intruder.WonderLand.HedgehogMouse
{
   import a_4718.b_181;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class HedgehogMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 1800;
      
      private static const MAX_INJURED_LIFE:int = MAX_LIFE / 2;
      
      protected var m_DrillOut:Boolean = false;
      
      protected var m_DrillOutTime:int;
      
      public function HedgehogMouseMoveIntruder()
      {
         a_1281 = true;
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(HedgehogMouseMoveIntruder) as HedgehogMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return HedgehogMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 40;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         this.m_DrillOut = false;
         this.m_DrillOutTime = -10;
         a_1462 = true;
         a_1465 = 1;
         a_1339 = MAX_LIFE;
         a_1279 = -55;
         a_1272 = 0;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > MAX_INJURED_LIFE)
         {
            if(a_1475)
            {
               if(a_1275 != 7)
               {
                  a_1275 = 7;
                  gotoAndStop((a_1276[7] as FrameLabel).frame);
               }
            }
            else if(this.m_DrillOutTime <= 0 && this.m_DrillOut)
            {
               if(a_1275 != 5)
               {
                  a_1275 = 5;
                  gotoAndStop((a_1276[5] as FrameLabel).frame);
               }
            }
            a_3419();
         }
         else if(a_1339 > 0)
         {
            if(a_1475)
            {
               if(a_1275 != 8)
               {
                  a_1275 = 8;
                  gotoAndStop((a_1276[8] as FrameLabel).frame);
               }
            }
            else if(this.m_DrillOutTime <= 0 && this.m_DrillOut)
            {
               if(a_1275 != 6)
               {
                  a_1275 = 6;
                  gotoAndStop((a_1276[6] as FrameLabel).frame);
               }
            }
            a_3419();
         }
         if(a_1339 <= 0 && a_1275 != 9)
         {
            a_1275 = 9;
            gotoAndStop((a_1276[9] as FrameLabel).frame);
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
         if(!this.m_DrillOut && iRduceLifeValue > 0)
         {
            this.m_DrillOut = true;
            this.m_DrillOutTime = 60;
            a_1275 = 4;
            gotoAndStop((a_1276[2] as FrameLabel).frame);
         }
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         if(!this.m_DrillOut && iRduceLifeValue > 0)
         {
            this.m_DrillOut = true;
            this.m_DrillOutTime = 60;
            a_1275 = 4;
            gotoAndStop((a_1276[2] as FrameLabel).frame);
         }
         super.a_4209(iRduceLifeValue);
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         a_3940();
         return true;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var numOrigXPos:Number = NaN;
         var iXGridNo:int = 0;
         var shotArray:Array = null;
         var stBaseShot:a_4348 = null;
         var numMoveSpeedMultiplier:Number = NaN;
         numOrigXPos = x;
         if(iCurrentTime >= a_1472 + a_1471 && (!this.m_DrillOut || this.m_DrillOut && this.m_DrillOutTime <= 0 && !HasBlockingDefenseOnGrid()))
         {
            a_1472 = iCurrentTime;
            this.play();
            x += a_1350 * a_1470;
            iXGridNo = int(x / a_3491.a_1080);
            if(a_1283)
            {
               iXGridNo = BattleFieldView.a_1011 - 1 - iXGridNo;
            }
            if(iXGridNo >= 0 && iXGridNo < BattleFieldView.a_1011 && m_stCurrentFieldGrid.m_iXGridNo != iXGridNo)
            {
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,m_stCurrentFieldGrid.m_iYGridNo).a_3459(this);
            }
            else if(iXGridNo < (a_1283 ? -1 : 0) || iXGridNo > BattleFieldView.a_1011)
            {
               if(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.isOwnBattleField)
               {
                  a_1088.a_2062(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.iTimeIntervalNum,m_stCurrentFieldGrid.m_iYGridNo);
               }
               trace("iXGridNo < -1 || iXGridNo > BattleFieldView.ms_iXGridNum  Realease the MoveIntruder");
               if(m_stCurrentFieldGrid)
               {
                  m_stCurrentFieldGrid.a_3457(this);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
               }
               a_3940();
               return true;
            }
            if(!this.m_DrillOut && this.m_DrillOutTime == -10)
            {
               if(m_stCurrentFieldGrid.m_iXGridNo == 1)
               {
                  if(x <= m_stCurrentFieldGrid.m_iXGridNo * a_3491.a_1080)
                  {
                     if(a_1275 != 2)
                     {
                        this.m_DrillOut = true;
                        this.m_DrillOutTime = 60;
                        a_1275 = 4;
                        gotoAndStop((a_1276[2] as FrameLabel).frame);
                     }
                  }
               }
            }
         }
         if(this.m_DrillOutTime <= 0 && this.m_DrillOut && iCurrentTime >= a_1477 + a_1476 * (1 / a_1470))
         {
            TryEatDefenseOnGridSimple(iCurrentTime);
         }
         if(this.m_DrillOutTime > 0 && this.m_DrillOut)
         {
            --this.m_DrillOutTime;
            if(40 == this.m_DrillOutTime)
            {
               a_1465 = 0;
               SetCannotSeeByFighter(false);
            }
            if(this.m_DrillOutTime <= 0)
            {
               a_1350 = a_3491.a_1080 / (4 * 20);
               if(!a_1283)
               {
                  a_1350 *= -1;
               }
               this.ResetMovieStatus();
            }
            this.play();
         }
         if(this.m_DrillOut && this.m_DrillOutTime <= 40)
         {
            shotArray = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_stBaseShotVector[m_stCurrentFieldGrid.m_iYGridNo];
            for each(stBaseShot in shotArray.slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && stBaseShot.getCanAddAuxiliary())
               {
                  if(stBaseShot.getNumXSpeed() < 0)
                  {
                     iXGridNo = int(x / a_3491.a_1080);
                     numMoveSpeedMultiplier = -1;
                     if(this.hitTestObject(stBaseShot) || stBaseShot.hitTestObject(this))
                     {
                        if(numMoveSpeedMultiplier != 1 && stBaseShot.getMoveSpeedMultiplier() == 1)
                        {
                           stBaseShot.setMoveSpeedMultiplier(numMoveSpeedMultiplier);
                           stBaseShot.setLastAuxiliaryFighterXGridNo(iXGridNo);
                           stBaseShot.setNumHotMultiplier(8);
                        }
                     }
                  }
               }
            }
         }
         if(a_1457 == b_181.a_424 && (x > a_3491.a_1080 * 4 && a_1283 || x < a_3491.a_1080 * 5 && !a_1283))
         {
            y += (this.m_DrillOut ? -1 : 1) * Math.tan(15 * Math.PI / 180) * Math.abs(numOrigXPos - x);
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
      
      override public function play() : void
      {
         super.play();
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(0 == a_1465)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
   }
}

