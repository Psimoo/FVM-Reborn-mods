package com.aurora.ui.maogoutd.resource.Intruder.DragonYear.BurgerKingBoss
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.effect.a_4143;
   import flash.display.FrameLabel;
   
   public class BurgerTankMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 50000;
      
      private static const MAX_INJURED_LIFE:int = 0;
      
      private static const ONE_GRID_SPEED:int = 1;
      
      protected var stNextFieldGrid:a_3491;
      
      protected var m_numTargetYPos:Number;
      
      protected var m_numTargetXPos:Number;
      
      public var m_iIndex:int = 1;
      
      public var m_iPathIndex:int = 0;
      
      protected var m_fMoveSpeedX:Number;
      
      protected var m_fMoveSpeedY:Number;
      
      protected var m_fOrginSpeed:Number;
      
      protected var a_1581:int;
      
      public function BurgerTankMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : BurgerTankMouseMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(BurgerTankMouseMoveIntruder) as BurgerTankMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return BurgerTankMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (20 * ONE_GRID_SPEED);
         this.m_fOrginSpeed = a_3491.a_1080 / (20 * ONE_GRID_SPEED);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = MAX_LIFE;
         a_1279 = -50;
         m_iYDisplayCenterPos = -65;
         a_1272 = 0;
         a_1463 = true;
         a_1481 = false;
         a_1465 = 3;
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      override public function a_4212() : Boolean
      {
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 0)
         {
            if(a_1275 != 0)
            {
               a_1275 = 0;
               gotoAndStop((a_1276[0] as FrameLabel).frame);
            }
         }
         else if(a_1339 <= 0 && a_1275 != 1)
         {
            a_1275 = 1;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
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
         var stSmallMouseBoomdie:a_4143 = null;
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
            a_3940();
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
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var distance:Number = 100;
         var count:int = 0;
         if(null == m_stCurrentFieldGrid)
         {
            return false;
         }
         if(!a_1460)
         {
            m_iXGridNo = int(BattleFieldView.m_stRandomSeed.nextInt(3));
            m_iYGridNo = int(BattleFieldView.m_stRandomSeed.nextInt(3));
            if(this.m_iIndex == 2)
            {
               m_iYGridNo += 4;
            }
            else if(this.m_iIndex == 3)
            {
               m_iXGridNo += 4;
               m_iYGridNo += 2;
            }
            this.stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
            this.m_numTargetYPos = (this.stNextFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081;
            this.m_numTargetXPos = (this.stNextFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
            this.a_1581 = this.setMoveToPosition(this.m_numTargetXPos,this.m_numTargetYPos);
            a_1460 = true;
            this.ResetMovieStatus();
            return true;
         }
         if(this.a_1581 > 0)
         {
            --this.a_1581;
            this.x += this.m_fMoveSpeedX;
            this.y += this.m_fMoveSpeedY;
            iXGridNo = this.getXGridNoByPosX();
            iYGridNo = this.getYGridNoByPosY();
            this.ChangeToFieldGrid(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo));
         }
         else if(this.a_1581 == 0)
         {
            iXGridNo = this.getXGridNoByPosX();
            iYGridNo = this.getYGridNoByPosY();
            this.ChangeToFieldGrid(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo));
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

