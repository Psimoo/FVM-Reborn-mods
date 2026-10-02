package com.aurora.ui.maogoutd.resource.defender.PigYear.NinthExhaustFan
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class NinthExhaustFanSmallShot extends a_4348
   {
      
      public var m_target:a_4206 = null;
      
      public function NinthExhaustFanSmallShot()
      {
         super();
         a_1279 = -15;
         m_iYDisplayCenterPos = -15;
         a_1573 = 1;
         a_1578 = true;
         a_1588 = true;
         m_isShotHighSkySpace = true;
         a_1587 = 0;
      }
      
      public static function a_4344() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(NinthExhaustFanSmallShot) as NinthExhaustFanSmallShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return NinthExhaustFanSmallShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier,iThreeRowShotType);
         return true;
      }
      
      override protected function FollowingShotHandle() : Boolean
      {
         var numXDistance:Number = NaN;
         var numYDistance:Number = NaN;
         var numMaxDistance:Number = NaN;
         var iMaxConstTime:int = 0;
         var numXSpeed:Number = NaN;
         var numYSpeed:Number = NaN;
         var iModNum:int = 0;
         if(this.m_target == null || this.m_target.iLifeValue <= 0)
         {
            this.m_target = a_1583.a_3431(m_iFollowingShotSpaceState);
         }
         if(this.m_target != null && this.m_target.iLifeValue > 0)
         {
            numXDistance = this.m_target.x + this.m_target.stDisplayBitmap.x + this.m_target.width / 2 - x;
            numYDistance = this.m_target.y + this.m_target.stDisplayBitmap.y + this.m_target.height / 2 - y;
            numMaxDistance = Math.abs(numXDistance) > Math.abs(numYDistance) ? Math.abs(numXDistance) : Math.abs(numYDistance);
            if(numMaxDistance > BattleFieldView.a_1013 && numMaxDistance > BattleFieldView.a_1014)
            {
               a_3940();
               return false;
            }
            iMaxConstTime = numMaxDistance / 10;
            if(iMaxConstTime < 1)
            {
               iMaxConstTime = 1;
            }
            numXSpeed = numXDistance / iMaxConstTime;
            numYSpeed = numYDistance / iMaxConstTime;
            if(m_numXSpeed != numXSpeed)
            {
               iModNum = Math.abs(int(numXSpeed - m_numXSpeed)) > 5 ? int(Math.abs(int(numXSpeed - m_numXSpeed))) : 5;
               m_numXSpeed += (numXSpeed - m_numXSpeed) % (iModNum + 1);
            }
            if(m_numYSpeed != numYSpeed)
            {
               iModNum = Math.abs(int(numYSpeed - m_numYSpeed)) > 5 ? int(Math.abs(int(numYSpeed - m_numYSpeed))) : 5;
               m_numYSpeed += (numYSpeed - m_numYSpeed) % (iModNum + 1);
            }
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(m_isHited && !m_isPenetrate)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               m_bActive.Value = false;
               a_3940();
            }
            return;
         }
         if(a_1588)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
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
         y += m_numYSpeed;
      }
      
      override protected function a_4351() : void
      {
         if(x < -20 || x > BattleFieldView.a_1013 + 40)
         {
            this.a_3940();
            return;
         }
         if(Boolean(this.m_target) && Boolean(this.m_target.visible) && this.m_target.iLifeValue > 0)
         {
            if(hitTestObject(this.m_target) && this.isHitCenter(this.m_target))
            {
               a_4352(this.m_target);
               a_3940();
            }
         }
      }
      
      private function isHitCenter(a:a_4206) : Boolean
      {
         var aMouseX:Number = a.x + a.stDisplayBitmap.x + a.width / 2;
         var hitRange:Number = 30;
         return Math.abs(aMouseX - x) <= hitRange;
      }
   }
}

