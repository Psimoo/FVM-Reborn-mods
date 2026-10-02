package com.aurora.ui.maogoutd.game.Base
{
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.GameMovieClip;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import flash.display.FrameLabel;
   
   public class BaseGameMoveIntruder extends a_4206
   {
      
      protected var MAX_LIFE:int = 0;
      
      protected var INJURED_LIFE:int = 0;
      
      protected var ONE_GRID_SPEED:Number = 0;
      
      protected var m_fMoveSpeedX:Number;
      
      protected var m_fMoveSpeedY:Number;
      
      protected var a_1581:int;
      
      protected var m_iTargetPosX:Number = -1;
      
      protected var m_iTargetPosY:Number = -1;
      
      public function BaseGameMoveIntruder()
      {
         super();
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         var m_stMoveClip:GameMovieClip = null;
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         m_stMoveClip = a_3913() as GameMovieClip;
         a_1279 = m_stMoveClip.a_1279;
         m_iYDisplayCenterPos = m_stMoveClip.m_iYDisplayCenterPos;
         scaleX = m_stMoveClip.m_iScaleX;
         scaleY = m_stMoveClip.m_iScaleY;
         this.SetSpeed(this.ONE_GRID_SPEED);
         iDIYLife = this.MAX_LIFE;
         a_1275 = -1;
         this.SetAnimation(0,0);
         this.m_fMoveSpeedX = 0;
         this.m_fMoveSpeedY = 0;
         this.a_1581 = 0;
         return true;
      }
      
      protected function SetDeadAnim(deadAnim:int) : void
      {
         this.SetAnimation(deadAnim,deadAnim);
         if(m_stCurrentFieldGrid)
         {
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         }
         play();
      }
      
      protected function SetSpeed(moveSpeed:Number) : void
      {
         if(moveSpeed == 0)
         {
            a_1350 = 0;
         }
         else
         {
            a_1350 = a_3491.a_1080 / (20 * moveSpeed);
            if(!a_1283)
            {
               a_1350 *= -1;
            }
         }
      }
      
      public function InDamage() : Boolean
      {
         return a_1339 > 0 && a_1339 < this.INJURED_LIFE;
      }
      
      public function SetAnimation(animIdx1:int, animIdx2:int) : void
      {
         if(this.InDamage())
         {
            animIdx1 = animIdx2;
         }
         if(a_1275 != animIdx1)
         {
            a_1275 = animIdx1;
            gotoAndStop((a_1276[animIdx1] as FrameLabel).frame);
            a_3419();
         }
      }
      
      public function SetAnimationOnce2Loop(onceAnim1:int, loopAnim1:int, onceAnim2:int, loopAnim2:int) : void
      {
         if(this.InDamage())
         {
            onceAnim1 = onceAnim2;
            loopAnim1 = loopAnim2;
         }
         a_1275 = loopAnim1;
         gotoAndStop((a_1276[onceAnim1] as FrameLabel).frame);
         a_3419();
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         super.a_4216(iCurrentTime);
         this.MoveUpdate();
         return true;
      }
      
      protected function MoveUpdate() : void
      {
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         if(m_stCurrentFieldGrid == null)
         {
            return;
         }
         if(this.a_1581 > 0)
         {
            --this.a_1581;
            this.x += this.m_fMoveSpeedX;
            this.y += this.m_fMoveSpeedY;
            iXGridNo = this.getXGridNoByPosX();
            iYGridNo = this.getYGridNoByPosY();
            if(this.a_1581 == 0)
            {
               this.m_fMoveSpeedX = 0;
               this.m_fMoveSpeedY = 0;
               this.SetPosition(this.m_iTargetPosX,this.m_iTargetPosY);
            }
            else
            {
               this.ChangeToFieldGrid(this.getXGridNoByPosX(),this.getYGridNoByPosY());
            }
         }
      }
      
      protected function SetMoveToPosition(iNoX:int, iNoY:int, moveSpeed:Number = 0) : void
      {
         this.SetMoveToPosition2(iNoX + 0.5,iNoY + 0.5,moveSpeed);
      }
      
      protected function SetMoveToPosition2(iNoX:Number, iNoY:Number, moveSpeed:Number = 0) : void
      {
         this.SetSpeed(0);
         if(moveSpeed == 0)
         {
            moveSpeed = this.ONE_GRID_SPEED;
         }
         var fPosX:Number = iNoX * a_3491.a_1080;
         var fPosY:Number = iNoY * a_3491.a_1081;
         var fDistanceX:Number = fPosX - this.x;
         var fDistanceY:Number = fPosY - this.y;
         var fDistance:Number = Math.max(Math.abs(fDistanceX),Math.abs(fDistanceY));
         this.a_1581 = fDistance / Math.abs(3 / moveSpeed);
         if(this.a_1581 > 0)
         {
            this.m_fMoveSpeedY = fDistanceY / this.a_1581;
            this.m_fMoveSpeedX = fDistanceX / this.a_1581;
         }
         this.m_iTargetPosX = iNoX;
         this.m_iTargetPosY = iNoY;
      }
      
      protected function SetPosition(iNoX:int, iNoY:int) : void
      {
         this.SetPosition2(iNoX + 0.5,iNoY + 0.5);
      }
      
      protected function SetPosition2(iNoX:Number, iNoY:Number) : void
      {
         this.ChangeToFieldGrid(iNoX,iNoY);
         x = iNoX * a_3491.a_1080;
         y = iNoY * a_3491.a_1081;
      }
      
      protected function getXGridNoByPosX(fPosX:Number = -0.1234) : int
      {
         if(-0.1234 == fPosX)
         {
            fPosX = this.x;
         }
         fPosX += 10000 * a_3491.a_1080;
         var iXGridNo:int = fPosX / a_3491.a_1080 - 10000;
         return Math.max(iXGridNo,0);
      }
      
      protected function getYGridNoByPosY(fPosY:Number = -0.1234) : int
      {
         if(-0.1234 == fPosY)
         {
            fPosY = this.y;
         }
         fPosY += 10000 * a_3491.a_1081;
         var iYGridNo:int = int(fPosY) / a_3491.a_1081 - 10000;
         return Math.max(iYGridNo,0);
      }
      
      protected function ChangeToFieldGrid(iNoX:int, iNoY:int) : Boolean
      {
         var stNextFieldGrid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         if(null == stNextFieldGrid)
         {
            return false;
         }
         if(m_stCurrentFieldGrid.m_iInitialXGridNo == stNextFieldGrid.m_iInitialXGridNo && m_stCurrentFieldGrid.m_iInitialYGridNo == stNextFieldGrid.m_iInitialYGridNo)
         {
            return true;
         }
         ChangeFieldGrid(stNextFieldGrid);
         trace("改变格子::" + stNextFieldGrid.m_iXGridNo + "--" + stNextFieldGrid.m_iYGridNo);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.addChildAt(this,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3440(stNextFieldGrid.m_iYGridNo));
         return true;
      }
   }
}

