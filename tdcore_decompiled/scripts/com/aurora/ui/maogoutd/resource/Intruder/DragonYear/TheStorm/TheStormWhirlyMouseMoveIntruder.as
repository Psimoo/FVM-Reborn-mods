package com.aurora.ui.maogoutd.resource.Intruder.DragonYear.TheStorm
{
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4255;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class TheStormWhirlyMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 100000;
      
      private static const MAX_INJURED_LIFE:int = 0;
      
      private static const ONE_GRID_SPEED:int = 2;
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var m_iCalTick:int = 0;
      
      private var m_bInvincible:Boolean = false;
      
      private var m_bIsSkillTwo:Boolean = false;
      
      protected var m_fMoveSpeedX:Number;
      
      protected var m_fMoveSpeedY:Number;
      
      protected var m_fOrginSpeed:Number;
      
      protected var a_1581:int;
      
      public function TheStormWhirlyMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : TheStormWhirlyMouseMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(TheStormWhirlyMouseMoveIntruder) as TheStormWhirlyMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return TheStormWhirlyMouseMoveIntruderMovie;
      }
      
      public function ChangeToInvincible() : void
      {
         this.m_bInvincible = true;
         a_1350 = -(a_3491.a_1080 / (20 * ONE_GRID_SPEED));
         this.m_fOrginSpeed = a_3491.a_1080 / (20 * ONE_GRID_SPEED);
         a_1463 = true;
         a_1481 = false;
         this.m_bInvincible = true;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = 0;
         this.m_fOrginSpeed = 0;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = MAX_LIFE;
         a_1279 = 10;
         m_iYDisplayCenterPos = 10;
         a_1272 = 0;
         a_1464 = true;
         this.SetAnimationOnce2Loop(0,1);
         this.m_iCalTick = 0;
         this.m_bInvincible = false;
         this.m_bIsSkillTwo = false;
         return true;
      }
      
      public function InitData(targetNoX:int, targetNoY:int) : void
      {
         this.m_bIsSkillTwo = true;
         this.a_1581 = this.setMoveToPosition((targetNoX + 0.5) * a_3491.a_1080,(targetNoY + 0.5) * a_3491.a_1081 - 30,a_3491.a_1080 / 20);
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
      }
      
      override protected function a_3940() : Boolean
      {
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var stFieldGrid:a_3491 = null;
         var stBaseMoveIntruder:a_4206 = null;
         var iCreateIdx:int = 0;
         if(!this.m_bIsSkillTwo && x > 0 && m_stCurrentFieldGrid != null)
         {
            iXGridNo = int(x / a_3491.a_1080);
            iYGridNo = int(y / a_3491.a_1081);
            stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
            iCreateIdx = this.m_stRandomSeed.nextInt(3) + 1;
            switch(iCreateIdx)
            {
               case 1:
                  stBaseMoveIntruder = a_4255.getInstance().a_4256(8389010);
                  break;
               case 2:
                  stBaseMoveIntruder = a_4255.getInstance().a_4256(8389016);
                  break;
               case 3:
                  stBaseMoveIntruder = a_4255.getInstance().a_4256(8389017);
            }
            if(stBaseMoveIntruder)
            {
               stBaseMoveIntruder.a_1797((1 << 16) + stFieldGrid.m_iYGridNo + 110,-1);
               stBaseMoveIntruder.m_stMoveIntruderTypeID = 8389008;
               stBaseMoveIntruder.x = stFieldGrid.m_iXGridNo * a_3491.a_1080 + 50;
               stBaseMoveIntruder.y = stFieldGrid.m_iYGridNo * a_3491.a_1081;
               stFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stFieldGrid,false);
            }
         }
         super.a_3940();
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
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 0)
         {
            this.SetAnimation(1);
         }
         else if(a_1339 <= 0 && a_1275 != 2)
         {
            a_1275 = 2;
            gotoAndStop((a_1276[2] as FrameLabel).frame);
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
         if(!this.m_bInvincible)
         {
            super.a_3969(iRduceLifeValue);
         }
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         if(this.m_bInvincible && !this.m_bIsSkillTwo)
         {
            super.a_4212();
         }
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         if(!this.m_bInvincible)
         {
            super.a_4210();
         }
         return true;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var stNextFieldGrid:a_3491 = null;
         if(!a_1460)
         {
            a_1460 = true;
            this.m_stRandomSeed.setSeed(globalMoveFighterID - m_stCurrentFieldGrid.m_iYGridNo,globalMoveFighterID + m_stCurrentFieldGrid.m_iYGridNo);
         }
         ++this.m_iCalTick;
         var iReadyTick:int = this.m_bIsSkillTwo ? 66 : 1;
         if(iReadyTick == this.m_iCalTick)
         {
            this.ChangeToInvincible();
         }
         else if(this.m_iCalTick < iReadyTick)
         {
            return true;
         }
         if(x < 0 || x >= BattleFieldView.a_1013 || y < 0 || y >= BattleFieldView.a_1014)
         {
            trace("x < 0 || x >= BattleFieldView.ms_iBattleFieldWidth, HitTest failed. x:" + x + ", BattleFieldView.ms_iBattleFieldWidth:" + BattleFieldView.a_1013);
            a_1339 = 0;
            this.ResetMovieStatus();
            return true;
         }
         iXGridNo = int(x / a_3491.a_1080);
         iYGridNo = int(y / a_3491.a_1081);
         var stFieldGrid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
         if(stFieldGrid)
         {
            if(Boolean(stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924) || stFieldGrid.m_stFlowerDefense || stFieldGrid.m_stBaseAuxiliaryFighter || stFieldGrid.m_stProtector) || Boolean(stFieldGrid.m_stTrayDefense) || Boolean(stFieldGrid.m_stBoomDefense))
            {
               this.a_3502(stFieldGrid);
               if(!this.m_bIsSkillTwo)
               {
                  a_1339 = 0;
                  this.ResetMovieStatus();
               }
               return true;
            }
         }
         if(this.m_bIsSkillTwo)
         {
            if(this.a_1581 <= 0)
            {
               a_1339 = 0;
               this.ResetMovieStatus();
               return true;
            }
            --this.a_1581;
            this.x += this.m_fMoveSpeedX;
            this.y += this.m_fMoveSpeedY;
            iXGridNo = this.getXGridNoByPosX();
            iYGridNo = this.getYGridNoByPosY();
            stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
            if(stNextFieldGrid != null)
            {
               this.ChangeToFieldGrid(stNextFieldGrid);
            }
         }
         else
         {
            super.a_4216(iCurrentTime);
         }
         return true;
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(this.m_bIsSkillTwo)
         {
            if(null != stFieldGrid.m_stProtector)
            {
               stFieldGrid.m_stProtector.m_iDieType = 1;
               stFieldGrid.m_stProtector.a_3969(stFieldGrid.m_stProtector.iLifeValue);
            }
            else if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
            {
               stFieldGrid.m_stAttackFighter.m_iDieType = 1;
               stFieldGrid.m_stAttackFighter.a_3969(stFieldGrid.m_stAttackFighter.iLifeValue);
            }
            else if(null != stFieldGrid.m_stBoomDefense)
            {
               stFieldGrid.m_stBoomDefense.m_iDieType = 1;
               stFieldGrid.m_stBoomDefense.a_3969(stFieldGrid.m_stBoomDefense.iLifeValue);
            }
            else if(null != stFieldGrid.m_stFlowerDefense)
            {
               stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
               stFieldGrid.m_stFlowerDefense.a_3969(stFieldGrid.m_stFlowerDefense.iLifeValue);
            }
            else if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
            {
               stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
               stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
            }
            else if(null != stFieldGrid.m_stOceanGoddessToolDefense)
            {
               stFieldGrid.m_stOceanGoddessToolDefense.m_iDieType = 1;
               stFieldGrid.m_stOceanGoddessToolDefense.a_3969(stFieldGrid.m_stOceanGoddessToolDefense.iLifeValue);
            }
            else if(null != stFieldGrid.m_stHoneyTrapBaseDefense)
            {
               stFieldGrid.m_stHoneyTrapBaseDefense.m_iDieType = 1;
               stFieldGrid.m_stHoneyTrapBaseDefense.a_3969(stFieldGrid.m_stHoneyTrapBaseDefense.iLifeValue);
            }
            else if(null != stFieldGrid.m_stTrayDefense)
            {
               stFieldGrid.m_stTrayDefense.m_iDieType = 1;
               stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue);
            }
         }
         else if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(100);
         }
         else if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(100);
         }
         else if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(100);
         }
         else if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(100);
         }
         else if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(100);
         }
         else if(stFieldGrid.HasNewSlot())
         {
            stFieldGrid.DamageNewSlot(false,0,false,100,1);
         }
         else if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(100);
         }
         return true;
      }
      
      override public function play() : void
      {
         super.play();
      }
      
      protected function setMoveToPosition(fPosX:Number, fPosY:Number, fMoveSpeed:Number = -0.1234) : int
      {
         if(-0.1234 == fMoveSpeed)
         {
            fMoveSpeed = Math.abs(this.m_fOrginSpeed);
         }
         var fDistanceX:Number = fPosX - this.x;
         var fDistanceY:Number = fPosY - this.y;
         var fDistance:Number = Math.max(Math.abs(fDistanceX),Math.abs(fDistanceY));
         var iMoveTick:int = fDistance / Math.abs(fMoveSpeed);
         if(iMoveTick > 0)
         {
            this.m_fMoveSpeedY = fDistanceY / iMoveTick;
            this.m_fMoveSpeedX = fDistanceX / iMoveTick;
         }
         return iMoveTick;
      }
      
      protected function getXGridNoByPosX(fPosX:Number = -0.1234) : int
      {
         if(-0.1234 == fPosX)
         {
            fPosX = this.x;
         }
         fPosX += 10000 * a_3491.a_1080;
         var iXGridNo:int = fPosX / a_3491.a_1080;
         return iXGridNo - 10000;
      }
      
      protected function getYGridNoByPosY(fPosY:Number = -0.1234) : int
      {
         if(-0.1234 == fPosY)
         {
            fPosY = this.y;
         }
         fPosY += 10000 * a_3491.a_1081;
         var iYGridNo:int = int(fPosY) / a_3491.a_1081;
         return iYGridNo - 10000;
      }
      
      protected function ChangeToFieldGrid(stNextFieldGrid:a_3491) : Boolean
      {
         if(null == stNextFieldGrid)
         {
            return false;
         }
         if(m_stCurrentFieldGrid.m_iInitialXGridNo == stNextFieldGrid.m_iInitialXGridNo && m_stCurrentFieldGrid.m_iInitialYGridNo == stNextFieldGrid.m_iInitialYGridNo)
         {
            return true;
         }
         ChangeFieldGrid(stNextFieldGrid);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.addChildAt(this,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3440(stNextFieldGrid.m_iYGridNo));
         return true;
      }
   }
}

