package com.aurora.ui.maogoutd.resource.Intruder.DragonYear.SummerLittleMouse
{
   import a_4718.b_181;
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.SpaceSignalBoomEffect;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.effect.a_4143;
   import flash.display.FrameLabel;
   
   public class RocketMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 900;
      
      private static const MAX_INJURED_LIFE:int = 400;
      
      private static const SPEED_ONE_GRID:int = 4;
      
      private var m_isFlying:Boolean = true;
      
      private var a_1496:int = 12;
      
      private var m_stTargetGrid:a_3491 = null;
      
      private var m_bAttacktarget:Boolean = false;
      
      private var m_iHideTick:int = -1;
      
      public function RocketMouseMoveIntruder()
      {
         a_1467 = -25;
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(RocketMouseMoveIntruder) as RocketMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return RocketMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (20 * SPEED_ONE_GRID);
         a_1465 = 3;
         this.m_isFlying = true;
         this.m_bAttacktarget = false;
         this.a_1496 = 12;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = MAX_LIFE;
         a_1279 = -width * 0.2;
         a_1272 = 0;
         a_1464 = true;
         a_1481 = true;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this.m_bAttacktarget = false;
         this.m_stTargetGrid = null;
         this.m_iHideTick = -1;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 <= 0 && a_1275 != 6)
         {
            a_1275 = 6;
            gotoAndStop((a_1276[6] as FrameLabel).frame);
            a_3419();
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            this.play();
         }
         else if(!(a_1275 == 2 || a_1275 == 3 || a_1275 == 4 || a_1275 == 5 || this.m_bAttacktarget == true))
         {
            this.visible = true;
            this.SetAnimation(0,1);
         }
         return true;
      }
      
      public function SetAnimation(animIdx:int, addIdx:int = 0) : void
      {
         if(a_1339 > 0 && a_1339 < MAX_INJURED_LIFE)
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
         if(a_1339 > 0 && a_1339 < MAX_INJURED_LIFE)
         {
            onceAnimIdx += addIdx;
            loopAnimIdx += addIdx;
         }
         a_1275 = loopAnimIdx;
         gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         a_3419();
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(!this.m_bAttacktarget)
         {
            super.a_3969(iRduceLifeValue);
         }
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         var stSmallMouseBoomdie:a_4143 = null;
         if(m_stCurrentFieldGrid != null && m_stCurrentFieldGrid.m_iHurtRate <= 0)
         {
            return true;
         }
         this.a_3969(900);
         if(a_1339 <= 0)
         {
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            stSmallMouseBoomdie = a_4143.a_3926();
            stSmallMouseBoomdie.a_1797(a_1283);
            stSmallMouseBoomdie.x = x;
            stSmallMouseBoomdie.y = y;
            parent.addChildAt(stSmallMouseBoomdie,parent.getChildIndex(this));
            this.a_3940();
         }
         return true;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         return true;
      }
      
      protected function getPosXByXGridNo(iXGridNo:int) : Number
      {
         var fPosX:Number = a_3491.a_1080 * iXGridNo;
         return fPosX + a_3491.a_1080 * 0.5;
      }
      
      protected function getPosYByYGridNo(iYGridNo:int) : Number
      {
         var fPosY:Number = a_3491.a_1081 * iYGridNo + (a_3491.a_1081 - this.height) + iYPosSkewing;
         return fPosY + a_3491.a_1081 * 0.5;
      }
      
      override public function a_4214() : Boolean
      {
         if(this.m_bAttacktarget == true)
         {
            a_4212();
         }
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(this.m_bAttacktarget == true && (b_182.a_435 == iEffectType || b_182.enm_shotEffectXuanYun == iEffectType || b_182.enm_shotEffectFreezeStop == iEffectType))
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var stFieldGrid:a_3491 = null;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var stSpaceSignalBoomEffect:SpaceSignalBoomEffect = null;
         var fPosY:Number = NaN;
         var yStart1:int = 0;
         var xStart1:int = 0;
         var yEnd1:int = 0;
         var xEnd1:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         var yIndex1:int = 0;
         var xIndex1:int = 0;
         var iXGridNo:int = 0;
         var numOrigXPos:Number = x;
         if(!a_1460)
         {
            a_1460 = true;
         }
         if((a_1273 == 34 || a_1273 == 67) && this.m_iHideTick < 0)
         {
            this.visible = false;
            this.m_iHideTick = 2 * 20;
         }
         if(this.m_iHideTick >= 0)
         {
            --this.m_iHideTick;
            if(this.m_iHideTick <= 0)
            {
               this.m_iHideTick = -1;
               this.visible = true;
               this.SetAnimation(3,2);
            }
         }
         if(this.m_bAttacktarget == false)
         {
            yIndex = m_stCurrentFieldGrid.m_iYGridNo;
            for(xIndex = 0; xIndex <= m_stCurrentFieldGrid.m_iXGridNo; xIndex++)
            {
               stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[yIndex][xIndex];
               if(stFieldGrid.m_stSpaceMarkEffect != null)
               {
                  this.m_stTargetGrid = stFieldGrid;
                  this.m_bAttacktarget = true;
                  this.SetAnimation(2,2);
                  SetCannotSeeByFighter(true);
                  a_1481 = false;
               }
            }
         }
         if(a_1273 == 35 || a_1273 == 68)
         {
            this.x = this.getPosXByXGridNo(this.m_stTargetGrid.m_iXGridNo);
            this.y = this.getPosYByYGridNo(this.m_stTargetGrid.m_iYGridNo) - 70;
            this.visible = true;
         }
         if(a_1273 == 37 || a_1273 == 70)
         {
            ChangeFieldGrid(this.m_stTargetGrid);
            stSpaceSignalBoomEffect = SpaceSignalBoomEffect.a_3926();
            stSpaceSignalBoomEffect.a_1797(false);
            stSpaceSignalBoomEffect.x = this.getPosXByXGridNo(this.m_stTargetGrid.m_iXGridNo) - 70;
            fPosY = a_3491.a_1081 * this.m_stTargetGrid.m_iYGridNo + (a_3491.a_1081 - this.height) + iYPosSkewing;
            stSpaceSignalBoomEffect.y = fPosY + a_3491.a_1081 * 0.5;
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stSpaceSignalBoomEffect,BattleLayerDefine.EFFECTS_TOP_TYPE);
            if(this.m_stTargetGrid.m_stSpaceMarkEffect != null)
            {
               this.m_stTargetGrid.m_stSpaceMarkEffect.a_3940();
               this.m_stTargetGrid.m_stSpaceMarkEffect = null;
            }
            yStart1 = this.m_stTargetGrid.m_iYGridNo - 1 < 0 ? 0 : int(this.m_stTargetGrid.m_iYGridNo - 1);
            xStart1 = this.m_stTargetGrid.m_iXGridNo - 1 < 0 ? 0 : int(this.m_stTargetGrid.m_iXGridNo - 1);
            yEnd1 = this.m_stTargetGrid.m_iYGridNo + 1 >= BattleFieldView.a_1012 ? int(BattleFieldView.a_1012 - 1) : int(this.m_stTargetGrid.m_iYGridNo + 1);
            xEnd1 = this.m_stTargetGrid.m_iXGridNo + 1 >= BattleFieldView.a_1011 ? int(BattleFieldView.a_1011 - 1) : int(this.m_stTargetGrid.m_iXGridNo + 1);
            for(yIndex1 = yStart1; yIndex1 <= yEnd1; yIndex1++)
            {
               for(xIndex1 = xStart1; xIndex1 <= xEnd1; xIndex1++)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex1,yIndex1);
                  this.a_3502(stTargetFieldGrid);
               }
            }
            a_1339 = 0;
            this.a_3940();
            return true;
         }
         if(a_1339 <= 0)
         {
            return true;
         }
         if(this.m_bAttacktarget == true)
         {
            return true;
         }
         if(iCurrentTime >= a_1472 + a_1471 && (this.m_isFlying || !this.m_isFlying && this.a_1496 <= 0 && !HasBlockingDefenseOnGrid()))
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
               ChangeFieldGrid(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,m_stCurrentFieldGrid.m_iYGridNo));
            }
            else if(iXGridNo < (a_1283 ? -1 : 0) || iXGridNo > BattleFieldView.a_1011)
            {
               if(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.isOwnBattleField)
               {
                  a_1088.a_2062(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.iTimeIntervalNum,m_stCurrentFieldGrid.m_iYGridNo);
               }
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_stRowBreakDownMoveIntruderBitmap.bitmapData = stDisplayBitmap.bitmapData;
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_stRowBreakDownMoveIntruderBitmap.x = x + stDisplayBitmap.x + (a_1283 ? 50 : -50);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_stRowBreakDownMoveIntruderBitmap.y = y + stDisplayBitmap.y;
               if(m_stCurrentFieldGrid)
               {
                  m_stCurrentFieldGrid.a_3457(this);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
               }
               this.a_3940();
               return true;
            }
         }
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
         }
         if(null != stFieldGrid.m_stAttackFighter)
         {
            if(stFieldGrid.m_stAttackFighter is a_3924)
            {
               stFieldGrid.m_stAttackFighter.a_3969(100);
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
      
      override public function play() : void
      {
         super.play();
      }
   }
}

