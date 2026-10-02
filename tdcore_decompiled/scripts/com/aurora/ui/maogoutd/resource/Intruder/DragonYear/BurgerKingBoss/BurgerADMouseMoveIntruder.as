package com.aurora.ui.maogoutd.resource.Intruder.DragonYear.BurgerKingBoss
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class BurgerADMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 50000;
      
      private static const MAX_INJURED_LIFE:int = 0;
      
      private static const ONE_GRID_SPEED:Number = 1;
      
      protected var a_1598:a_3491;
      
      protected var m_iLastPosX:int = -1;
      
      protected var m_iLastPosY:int = -1;
      
      private var m_MouseState:int = 0;
      
      protected var stNextFieldGrid:a_3491;
      
      protected var m_numTargetYPos:Number;
      
      protected var m_numTargetXPos:Number;
      
      protected var m_fMoveSpeedX:Number;
      
      protected var m_fMoveSpeedY:Number;
      
      protected var m_fOrginSpeed:Number;
      
      protected var a_1581:int;
      
      public function BurgerADMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : BurgerADMouseMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(BurgerADMouseMoveIntruder) as BurgerADMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return BurgerADMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (20 * ONE_GRID_SPEED);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = MAX_LIFE;
         a_1279 = -35;
         m_iYDisplayCenterPos = -70;
         a_1481 = false;
         a_1272 = 0;
         this.m_fOrginSpeed = a_3491.a_1080 / (20 * ONE_GRID_SPEED);
         a_1465 = 3;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this.a_1598 = null;
         this.m_iLastPosX = -1;
         this.m_iLastPosY = -1;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 0)
         {
            if(this.m_MouseState == 1)
            {
               if(a_1275 != 1)
               {
                  a_1275 = 1;
                  gotoAndStop((a_1276[1] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 0)
            {
               a_1275 = 0;
               gotoAndStop((a_1276[0] as FrameLabel).frame);
            }
            a_3419();
         }
         else
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
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         if(m_stCurrentFieldGrid != null)
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
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var iXGridNo1:int = 0;
         var iYGridNo1:int = 0;
         var distance:Number = 100;
         var count:int = 0;
         if(null == m_stCurrentFieldGrid)
         {
            return false;
         }
         if(!a_1460)
         {
            distance = 100;
            if(this.a_1598 == null)
            {
               count = 0;
               do
               {
                  m_iXGridNo = BattleFieldView.m_stRandomSeed.nextInt(3) + 2;
                  m_iYGridNo = int(BattleFieldView.m_stRandomSeed.nextInt(7));
                  count++;
                  if(this.m_iLastPosX != -1 && this.m_iLastPosY != -1)
                  {
                     Math.abs(m_iXGridNo + m_iYGridNo - (this.m_iLastPosX + this.m_iLastPosY));
                  }
                  this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
               }
               while(this.a_1598 == null || this.m_iLastPosX == m_iXGridNo && this.m_iLastPosY == m_iYGridNo || distance <= 3 && count < 5);
               this.m_iLastPosX = m_iXGridNo;
               this.m_iLastPosY = m_iYGridNo;
            }
            this.stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
            this.m_numTargetYPos = (this.a_1598.m_iYGridNo + 0.5) * a_3491.a_1081;
            this.m_numTargetXPos = (this.a_1598.m_iXGridNo + 0.5) * a_3491.a_1080;
            this.a_1581 = this.setMoveToPosition(this.m_numTargetXPos,this.m_numTargetYPos);
            a_1460 = true;
            this.m_MouseState = 0;
            this.ResetMovieStatus();
            return true;
         }
         --this.a_1581;
         if(this.m_MouseState == 0)
         {
            if(this.a_1581 <= 0)
            {
               iXGridNo = this.getXGridNoByPosX();
               iYGridNo = this.getYGridNoByPosY();
               this.ChangeToFieldGrid(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo));
               this.a_1581 = 30;
               this.m_MouseState = 2;
               this.ResetMovieStatus();
            }
            else
            {
               this.x += this.m_fMoveSpeedX;
               this.y += this.m_fMoveSpeedY;
               iXGridNo = this.getXGridNoByPosX();
               iYGridNo = this.getYGridNoByPosY();
               this.stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
               this.ChangeToFieldGrid(this.stNextFieldGrid);
            }
         }
         else if(this.m_MouseState == 1)
         {
            iXGridNo1 = m_stCurrentFieldGrid.m_iXGridNo;
            iYGridNo1 = m_stCurrentFieldGrid.m_iYGridNo;
            if(this.a_1581 == 22)
            {
               this.HurtFieldGridDefense(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo1,iYGridNo1));
            }
            else if(this.a_1581 == 14)
            {
               this.HurtFieldGridDefense(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo1 - 1,iYGridNo1));
            }
            else if(this.a_1581 == 8)
            {
               this.HurtFieldGridDefense(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo1 - 2,iYGridNo1));
            }
            else if(this.a_1581 <= 0)
            {
               this.m_MouseState = 0;
               distance = 100;
               count = 0;
               do
               {
                  m_iXGridNo = BattleFieldView.m_stRandomSeed.nextInt(5) + 2;
                  m_iYGridNo = int(BattleFieldView.m_stRandomSeed.nextInt(7));
                  count++;
                  if(this.m_iLastPosX != -1 && this.m_iLastPosY != -1)
                  {
                     Math.abs(m_iXGridNo + m_iYGridNo - (this.m_iLastPosX + this.m_iLastPosY));
                  }
                  this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
               }
               while(this.a_1598 == null || this.m_iLastPosX == m_iXGridNo && this.m_iLastPosY == m_iYGridNo || distance <= 3 && count < 5);
               this.m_iLastPosX = m_iXGridNo;
               this.m_iLastPosY = m_iYGridNo;
               this.stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
               this.m_numTargetYPos = (this.a_1598.m_iYGridNo + 0.5) * a_3491.a_1081;
               this.m_numTargetXPos = (this.a_1598.m_iXGridNo + 0.5) * a_3491.a_1080;
               this.a_1581 = this.setMoveToPosition(this.m_numTargetXPos,this.m_numTargetYPos);
            }
            this.ResetMovieStatus();
         }
         else if(this.m_MouseState == 2)
         {
            if(this.a_1581 <= 0)
            {
               this.a_1581 = 26;
               this.m_MouseState = 1;
               this.ResetMovieStatus();
            }
         }
         return true;
      }
      
      protected function HurtFieldGridDefense(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(50);
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(50);
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(50);
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(50);
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(50);
         }
         stFieldGrid.DamageNewSlot(true,0,false,50,1);
         if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(50);
         }
         return true;
      }
      
      override public function play() : void
      {
         super.play();
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
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

