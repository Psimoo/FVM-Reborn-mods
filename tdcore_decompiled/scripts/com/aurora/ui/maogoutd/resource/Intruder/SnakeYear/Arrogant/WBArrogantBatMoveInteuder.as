package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.Arrogant
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class WBArrogantBatMoveInteuder extends a_4206
   {
      
      private static const ONE_GRID_SPEED:Number = 0.5;
      
      private var m_iStartTimeNum:int;
      
      private var _offsetX:int = 0;
      
      private var _offsetY:int = 0;
      
      private var duration:int = 40;
      
      private var createType:int = 0;
      
      private var killEntity:Boolean = false;
      
      private var iTargetNoX:int = 0;
      
      private var iTargetNoY:int = 0;
      
      protected var m_fMoveSpeedX:Number = 0;
      
      protected var m_fMoveSpeedY:Number = 0;
      
      private var remainMoveTick:int = 0;
      
      public function WBArrogantBatMoveInteuder()
      {
         super();
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(WBArrogantBatMoveInteuder,WBArrogantBatMoveInteuderMovie) as WBArrogantBatMoveInteuder;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 120;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = 30000;
         a_1279 = -5;
         m_iYDisplayCenterPos = -32;
         a_1272 = 0;
         a_1463 = true;
         a_1463 = true;
         this.m_iStartTimeNum = -1;
         this.m_fMoveSpeedX = 0;
         this.m_fMoveSpeedY = 0;
         a_1465 = 3;
         this.remainMoveTick = 0;
         this._offsetX = 0;
         this._offsetY = 0;
         this.duration = 40;
         this.createType = 0;
         return true;
      }
      
      public function SetSeanCreate() : void
      {
         if(a_4206.m_iViewBuffId == 320012432)
         {
            this.duration = 10;
            this.createType = 2;
         }
         else
         {
            this.createType = 1;
         }
      }
      
      public function SetMoveOffset(offsetX:int, offsetY:int) : void
      {
         this._offsetX = offsetX;
         this._offsetY = offsetY;
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
      
      override public function a_4210() : Boolean
      {
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var stNextFieldGrid:a_3491 = null;
         if(!a_1460)
         {
            a_1460 = true;
            this.SetAnimationOnce2Loop2(0,1);
            this.killEntity = false;
            AddTag(10);
         }
         x += this.m_fMoveSpeedX;
         y += this.m_fMoveSpeedY;
         var iXGridNo:int = GetiNoX();
         var iYGridNo:int = int(y / a_3491.a_1081);
         if(m_stCurrentFieldGrid.m_iXGridNo != iXGridNo || m_stCurrentFieldGrid.m_iYGridNo != iYGridNo)
         {
            stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
            ChangeFieldGrid(stNextFieldGrid);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_LAND_TYPE,stNextFieldGrid);
         }
         if(m_LastPositionX != x || m_LastPositionY != y)
         {
            m_LastPositionX = x;
            m_LastPositionY = y;
            UpdateFollowEffect();
         }
         if(iCurrentTime % 2 == 1)
         {
            if(a_1273 == 6)
            {
               if(this._offsetX != 0 && this._offsetY != 0)
               {
                  this.iTargetNoX = m_stCurrentFieldGrid.m_iXGridNo + this._offsetX;
                  this.iTargetNoY = m_stCurrentFieldGrid.m_iYGridNo + this._offsetY;
                  this.remainMoveTick = this.setMoveToPosition(this.iTargetNoX,this.iTargetNoY) + 1;
               }
               else
               {
                  this.m_iStartTimeNum = iCurrentTime;
               }
            }
         }
         if(this.remainMoveTick > 0)
         {
            --this.remainMoveTick;
            if(this.remainMoveTick == 0)
            {
               this.m_fMoveSpeedX = 0;
               this.m_fMoveSpeedY = 0;
               this.m_iStartTimeNum = iCurrentTime;
               this.SetPosition(this.iTargetNoX,this.iTargetNoY);
            }
         }
         if(this.m_iStartTimeNum == -1)
         {
            return true;
         }
         if(iCurrentTime - this.m_iStartTimeNum == this.duration + 10)
         {
            this.SetAnimationOnce2Loop2(2,3);
         }
         else if(iCurrentTime - this.m_iStartTimeNum == this.duration + 22)
         {
            this.killEntity = this.CanKillDefense(m_stCurrentFieldGrid);
         }
         else if(iCurrentTime - this.m_iStartTimeNum == this.duration + 28)
         {
            this.ClearFieldGridDefense2(m_stCurrentFieldGrid);
            RemoveTag(10);
            if(this.createType == 2)
            {
               this.RealDie();
            }
            else if(this.killEntity)
            {
               a_1339 = 3000000;
               a_1465 = 0;
            }
            else
            {
               this.RealDie();
            }
         }
         else if(iCurrentTime - this.m_iStartTimeNum == 708)
         {
            this.RealDie();
         }
         return true;
      }
      
      public function SetPosition(iNoX:int, iNoY:int) : void
      {
         x = this.getPosXByXGridNo(iNoX);
         y = this.getPosYByYGridNo(iNoY);
      }
      
      protected function CanKillDefense(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         if(null != stFieldGrid.m_stProtector)
         {
            return true;
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            return true;
         }
         if(null != stFieldGrid.m_stBoomDefense && stFieldGrid.m_stBoomDefense.isCanBeEaten)
         {
            return true;
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            return true;
         }
         if(null != stFieldGrid.m_stHoneyTrapBaseDefense)
         {
            return true;
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            return true;
         }
         if(null != stFieldGrid.m_stTrayDefense)
         {
            return true;
         }
         return false;
      }
      
      protected function ClearFieldGridDefense2(stFieldGrid:a_3491) : void
      {
         if(stFieldGrid == null)
         {
            return;
         }
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(stFieldGrid.m_stProtector.iLifeValue);
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(stFieldGrid.m_stAttackFighter.iLifeValue);
         }
         if(null != stFieldGrid.m_stBoomDefense && stFieldGrid.m_stBoomDefense.isCanBeEaten)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(stFieldGrid.m_stBoomDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(stFieldGrid.m_stFlowerDefense.iLifeValue);
         }
         stFieldGrid.DamageNewSlot(true,0,true,0,1);
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
         }
         if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue);
         }
      }
      
      public function RealDie() : Boolean
      {
         a_3969(iLifeValue);
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 <= 0)
         {
            this.SetAnimation2(4);
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
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      public function SetAnimation2(animIdx:int) : void
      {
         if(a_1275 != animIdx)
         {
            a_1275 = animIdx;
            gotoAndStop((a_1276[animIdx] as FrameLabel).frame);
            a_3419();
         }
      }
      
      public function SetAnimationOnce2Loop2(onceAnimIdx:int, loopAnimIdx:int) : void
      {
         a_1275 = loopAnimIdx;
         gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         a_3419();
      }
      
      protected function setMoveToPosition(iNoX:int, iNoY:int) : int
      {
         var fDistanceX:Number = this.getPosXByXGridNo(iNoX) - this.x;
         var fDistanceY:Number = this.getPosXByXGridNo(iNoY) - this.y;
         var fDistance:Number = Math.sqrt(fDistanceX * fDistanceX + fDistanceY * fDistanceY);
         var iMoveTick:int = fDistance / (60 / (20 * ONE_GRID_SPEED));
         if(iMoveTick > 0)
         {
            this.m_fMoveSpeedY = fDistanceY / iMoveTick;
            this.m_fMoveSpeedX = fDistanceX / iMoveTick;
         }
         else
         {
            this.m_fMoveSpeedY = 0;
            this.m_fMoveSpeedX = 0;
         }
         return iMoveTick;
      }
      
      protected function getPosXByXGridNo(iXGridNo:int) : Number
      {
         return a_3491.a_1080 * (iXGridNo + 0.5);
      }
      
      protected function getPosYByYGridNo(iYGridNo:int) : Number
      {
         return a_3491.a_1081 * (iYGridNo + 0.5);
      }
   }
}

