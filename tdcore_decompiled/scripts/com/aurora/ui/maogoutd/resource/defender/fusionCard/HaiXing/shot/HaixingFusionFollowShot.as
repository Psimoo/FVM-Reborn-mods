package com.aurora.ui.maogoutd.resource.defender.fusionCard.HaiXing.shot
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.GameMovieClip;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class HaixingFusionFollowShot extends a_4348
   {
      
      private static const MIN_SPEED:Number = 15;
      
      private var m_iTransIndex:int = 0;
      
      private var m_stTargetMoveIntruder:a_4206;
      
      private var stTargetiXGridNo:int;
      
      private var stTargetiYGridNo:int;
      
      private var m_isHitTarget:Boolean;
      
      public function HaixingFusionFollowShot()
      {
         super();
         a_1573 = 1;
         a_1578 = true;
         a_1577 = false;
         a_1588 = true;
      }
      
      public static function a_4344(transIndex:int = 0) : HaixingFusionFollowShot
      {
         var bindMovie:Class = shotBindMovieForTrans(transIndex);
         var stShot:HaixingFusionFollowShot = PoolManager.getInstance().CheckOutOne(HaixingFusionFollowShot,bindMovie) as HaixingFusionFollowShot;
         stShot.m_iTransIndex = transIndex;
         return stShot;
      }
      
      private static function shotBindMovieForTrans(transIndex:int) : Class
      {
         switch(transIndex)
         {
            case 1:
               return HaixingFusionDeepShotMovie;
            case 2:
               return HaixingFusionSoulShotMovie;
            case 0:
         }
         return HaixingFusionPrimaryShotMovie;
      }
      
      public function set stTargetMoveIntruder(value:a_4206) : void
      {
         this.m_stTargetMoveIntruder = value;
         if(Boolean(this.m_stTargetMoveIntruder) && Boolean(this.m_stTargetMoveIntruder.m_stCurrentFieldGrid))
         {
            this.stTargetiXGridNo = this.m_stTargetMoveIntruder.m_stCurrentFieldGrid.m_iXGridNo;
            this.stTargetiYGridNo = this.m_stTargetMoveIntruder.m_stCurrentFieldGrid.m_iYGridNo;
         }
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         var m_stMoveClip:GameMovieClip = null;
         m_stMoveClip = a_3913() as GameMovieClip;
         if(m_stMoveClip)
         {
            a_1279 = m_stMoveClip.a_1279;
            m_iYDisplayCenterPos = m_stMoveClip.m_iYDisplayCenterPos;
         }
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         a_1275 = 1;
         gotoAndStop((a_1276[1] as FrameLabel).frame);
         m_numXSpeed = numSpeed;
         m_isChangeYGridNo = true;
         this.m_isHitTarget = false;
         return true;
      }
      
      private function updateFollowingSpeed() : Boolean
      {
         var numXDistance:Number = NaN;
         var numYDistance:Number = NaN;
         var numMaxDistance:Number = NaN;
         var iMaxConstTime:int = 0;
         var numXSpeed:Number = NaN;
         var numYSpeed:Number = NaN;
         var iModNum:int = 0;
         var speedLen:Number = NaN;
         var scale:Number = NaN;
         if(!this.m_isHitTarget && !this.isLinkInvalid())
         {
            this.stTargetiXGridNo = this.m_stTargetMoveIntruder.m_stCurrentFieldGrid.m_iXGridNo;
            this.stTargetiYGridNo = this.m_stTargetMoveIntruder.m_stCurrentFieldGrid.m_iYGridNo;
            numXDistance = this.m_stTargetMoveIntruder.x + this.m_stTargetMoveIntruder.stDisplayBitmap.x - x;
            numYDistance = this.m_stTargetMoveIntruder.y + this.m_stTargetMoveIntruder.stDisplayBitmap.y + this.m_stTargetMoveIntruder.height / 2 - y;
            numMaxDistance = Math.abs(numXDistance) > Math.abs(numYDistance) ? Math.abs(numXDistance) : Math.abs(numYDistance);
            if(numMaxDistance > BattleFieldView.a_1013 && numMaxDistance > BattleFieldView.a_1014)
            {
               this.a_3940();
               return false;
            }
            iMaxConstTime = numMaxDistance / MIN_SPEED;
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
         else
         {
            speedLen = Math.sqrt(m_numXSpeed * m_numXSpeed + m_numYSpeed * m_numYSpeed);
            if(speedLen < MIN_SPEED && speedLen > 0)
            {
               scale = MIN_SPEED / speedLen;
               m_numXSpeed *= scale;
               m_numYSpeed *= scale;
            }
         }
         return true;
      }
      
      override protected function FollowingShotHandle() : Boolean
      {
         if(!this.updateFollowingSpeed())
         {
            return false;
         }
         y += m_numYSpeed;
         return true;
      }
      
      override protected function checkCanHit(intruder:a_4206) : Boolean
      {
         if(this.m_stTargetMoveIntruder == intruder)
         {
            return false;
         }
         if(intruder.iSpaceState == 1 || intruder.iLifeValue <= 0 || !intruder.m_stCurrentFieldGrid)
         {
            return false;
         }
         if(intruder.isCannotSeeByFighter)
         {
            return false;
         }
         if(m_HitMouseArray.indexOf(intruder) != -1)
         {
            return false;
         }
         return true;
      }
      
      private function isLinkInvalid() : Boolean
      {
         return !this.m_stTargetMoveIntruder || this.m_stTargetMoveIntruder.iLifeValue <= 0 || !this.m_stTargetMoveIntruder.m_stCurrentFieldGrid || !this.m_stTargetMoveIntruder.visible;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
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
         if(!this.FollowingShotHandle())
         {
            return;
         }
         x += m_numXSpeed;
      }
      
      override protected function a_4351() : void
      {
         var iXGridNo:int = 0;
         if(!m_bActive.Value)
         {
            this.a_3940();
            return;
         }
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
         }
         else
         {
            iXGridNo = int(x / a_3491.a_1080);
         }
         var iYGridNo:int = m_isChangeYGridNo ? int(y / a_3491.a_1081) : m_iYGridNo;
         if(this.CalculationBoundary())
         {
            return;
         }
         var stFieldGrid:a_3491 = a_1583.a_3438(iXGridNo,iYGridNo);
         if(stFieldGrid == null)
         {
            m_bActive.Value = false;
            this.a_3940();
            return;
         }
         this.collectHurtOnGrid(stFieldGrid);
         if(this.m_isHitTarget)
         {
            return;
         }
         if(!this.isInHitRadius(iXGridNo,iYGridNo))
         {
            return;
         }
         if(Boolean(this.m_stTargetMoveIntruder) && Boolean(this.m_stTargetMoveIntruder.parent) && hitTestObject(this.m_stTargetMoveIntruder))
         {
            a_4352(this.m_stTargetMoveIntruder);
            this.m_isHitTarget = true;
            this.a_3940();
         }
      }
      
      private function isInHitRadius(iXGridNo:int, iYGridNo:int) : Boolean
      {
         if(!this.m_stTargetMoveIntruder)
         {
            return false;
         }
         if(this.stTargetiXGridNo == iXGridNo && this.stTargetiYGridNo == iYGridNo)
         {
            return true;
         }
         var dx:Number = this.m_stTargetMoveIntruder.x + this.m_stTargetMoveIntruder.stDisplayBitmap.x - x;
         var dy:Number = this.m_stTargetMoveIntruder.y + this.m_stTargetMoveIntruder.stDisplayBitmap.y + this.m_stTargetMoveIntruder.height * 0.5 - y;
         return dx * dx + dy * dy <= 400;
      }
      
      private function collectHurtOnGrid(gride:a_3491) : void
      {
         var stMoveIntruder:a_4206 = null;
         if(!gride)
         {
            return;
         }
         var arr:Array = gride.IntruderArray;
         for(var i:int = 0; i < arr.length; i++)
         {
            stMoveIntruder = arr[i];
            if(this.checkCanHit(stMoveIntruder))
            {
               if(hitTestObject(stMoveIntruder))
               {
                  m_HitMouseArray.push(stMoveIntruder);
                  a_4352(stMoveIntruder);
               }
            }
         }
      }
      
      override protected function CalculationBoundary() : Boolean
      {
         if(x < 0 || x >= BattleFieldView.a_1013)
         {
            m_bActive.Value = false;
            this.a_3940();
            return true;
         }
         return false;
      }
      
      override protected function a_3940() : Boolean
      {
         this.m_iTransIndex = 0;
         this.m_stTargetMoveIntruder = null;
         this.m_isHitTarget = false;
         return super.a_3940();
      }
   }
}

