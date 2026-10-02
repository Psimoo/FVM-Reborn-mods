package com.aurora.ui.maogoutd.resource.defender.HorseYear.HoneyTrap
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class HoneyTrapBeeShot extends a_4348
   {
      
      public var m_targetIntruder:a_4206;
      
      public var m_isBossDoubleDamage:Boolean = false;
      
      private var m_numTrackSpeed:Number = 15;
      
      private var m_isPendingLaunch:Boolean = false;
      
      public function HoneyTrapBeeShot()
      {
         super();
         a_1279 = -20;
         m_iYDisplayCenterPos = -20;
         a_1573 = 1;
         a_1587 = 2;
         a_1578 = true;
         a_1588 = true;
         m_isShotHighSkySpace = true;
      }
      
      public static function a_4344() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(HoneyTrapBeeShot) as a_4348;
      }
      
      override protected function getBindMovie() : Class
      {
         return HoneyTrapBeeShotMovie;
      }
      
      override protected function a_3940() : Boolean
      {
         if(Boolean(a_1583) && Boolean(a_1583.GetGameMoveMap()))
         {
            a_1583.GetGameMoveMap().RemoveMoveDisplayObject(this);
         }
         this.m_targetIntruder = null;
         this.m_isBossDoubleDamage = false;
         this.m_isPendingLaunch = false;
         return super.a_3940();
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier,iThreeRowShotType);
         this.m_numTrackSpeed = numSpeed;
         this.m_isPendingLaunch = false;
         m_isPenetrate = false;
         a_1577 = false;
         a_1578 = true;
         return true;
      }
      
      public function SetPendingLaunch(value:Boolean) : void
      {
         var stFieldGrid:a_3491 = null;
         this.m_isPendingLaunch = value;
         if(this.m_isPendingLaunch)
         {
            a_1578 = false;
            m_numXSpeed = 0;
            m_numYSpeed = 0;
            a_1275 = 0;
            stFieldGrid = iStartField();
            if(Boolean(stFieldGrid) && Boolean(stFieldGrid.m_stCurrentBattbleFieldView) && Boolean(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap()))
            {
               stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
            }
         }
      }
      
      public function LaunchToTarget(target:a_4206) : void
      {
         if(Boolean(a_1583) && Boolean(a_1583.GetGameMoveMap()))
         {
            a_1583.GetGameMoveMap().RemoveMoveDisplayObject(this);
         }
         this.m_targetIntruder = target;
         this.upDateSpeed();
         this.m_isPendingLaunch = false;
         a_1578 = true;
         a_1275 = 1;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(this.m_isPendingLaunch)
         {
            this.AdvanceLoopAnimation();
            return;
         }
         if(m_isHited && !m_isPenetrate)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               m_bActive.Value = false;
               this.a_3940();
            }
            return;
         }
         if(a_1588)
         {
            this.AdvanceLoopAnimation();
         }
         if(0 == a_1447)
         {
            a_1447 = iCurrentTime;
         }
         this.a_4351();
         if(a_1578)
         {
            if(!this.FollowingShotHandle())
            {
               return;
            }
         }
         x += m_numXSpeed;
      }
      
      private function AdvanceLoopAnimation() : void
      {
         nextFrame();
         if(a_1273 == a_1274 || a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
      }
      
      override protected function FollowingShotHandle() : Boolean
      {
         if(!m_bActive.Value || m_isHited)
         {
            return false;
         }
         if(!this.IsTargetValid(this.m_targetIntruder))
         {
            this.m_targetIntruder = HoneyTrapDefense.GetGlobalTarget(iStartField(),x,y);
            if(!this.m_targetIntruder)
            {
               y += m_numYSpeed;
               return true;
            }
         }
         if(this.IsTargetValid(this.m_targetIntruder))
         {
            this.upDateSpeed();
         }
         y += m_numYSpeed;
         return true;
      }
      
      private function upDateSpeed() : void
      {
         var targetXSpeed:Number = NaN;
         var targetYSpeed:Number = NaN;
         var iModNum:int = 0;
         var tx:Number = this.m_targetIntruder.x + (this.m_targetIntruder.stDisplayBitmap ? this.m_targetIntruder.stDisplayBitmap.x : 0) + (this.m_targetIntruder.width >> 1);
         var ty:Number = this.m_targetIntruder.y + (this.m_targetIntruder.stDisplayBitmap ? this.m_targetIntruder.stDisplayBitmap.y : 0) + (this.m_targetIntruder.height >> 1);
         var dx:Number = tx - x;
         var dy:Number = ty - y;
         var len:Number = Math.sqrt(dx * dx + dy * dy);
         if(len > 1)
         {
            targetXSpeed = dx / len * this.m_numTrackSpeed;
            targetYSpeed = dy / len * this.m_numTrackSpeed;
            if(m_numXSpeed != targetXSpeed)
            {
               iModNum = Math.abs(int(targetXSpeed - m_numXSpeed)) > 5 ? int(Math.abs(int(targetXSpeed - m_numXSpeed))) : 5;
               m_numXSpeed += (targetXSpeed - m_numXSpeed) % (iModNum + 1);
            }
            if(m_numYSpeed != targetYSpeed)
            {
               iModNum = Math.abs(int(targetYSpeed - m_numYSpeed)) > 5 ? int(Math.abs(int(targetYSpeed - m_numYSpeed))) : 5;
               m_numYSpeed += (targetYSpeed - m_numYSpeed) % (iModNum + 1);
            }
         }
      }
      
      private function IsTargetValid(target:a_4206) : Boolean
      {
         return target != null && target.iLifeValue > 0 && target.parent != null && target.m_stCurrentFieldGrid != null && !target.m_isRemovedFromBattaleField;
      }
      
      override protected function CalculationBoundary() : Boolean
      {
         if(x <= -50 || x >= BattleFieldView.a_1013 + 50 || y <= -50 || y >= BattleFieldView.a_1014 + 50)
         {
            m_bActive.Value = false;
            this.a_3940();
            return true;
         }
         return false;
      }
      
      override protected function a_4351() : void
      {
         if(this.CalculationBoundary())
         {
            return;
         }
         if(!m_bActive.Value)
         {
            this.a_3940();
            return;
         }
         if(!this.IsTargetValid(this.m_targetIntruder))
         {
            this.m_targetIntruder = HoneyTrapDefense.GetGlobalTarget(iStartField(),x,y);
            if(!this.m_targetIntruder)
            {
               return;
            }
         }
         var tx:Number = this.m_targetIntruder.x + (this.m_targetIntruder.stDisplayBitmap ? this.m_targetIntruder.stDisplayBitmap.x : 0) + (this.m_targetIntruder.width >> 1);
         var ty:Number = this.m_targetIntruder.y + (this.m_targetIntruder.stDisplayBitmap ? this.m_targetIntruder.stDisplayBitmap.y : 0) + (this.m_targetIntruder.height >> 1);
         var dist:Number = (x - tx) * (x - tx) + (y - ty) * (y - ty);
         if(dist > 30 * 30)
         {
            return;
         }
         a_4352(this.m_targetIntruder);
         if(this.m_isBossDoubleDamage && this.m_targetIntruder.IsBossIntruder)
         {
            a_4352(this.m_targetIntruder);
         }
         m_isHited = true;
         if(a_1276.length > 0)
         {
            gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
         }
         this.m_targetIntruder = null;
      }
   }
}

