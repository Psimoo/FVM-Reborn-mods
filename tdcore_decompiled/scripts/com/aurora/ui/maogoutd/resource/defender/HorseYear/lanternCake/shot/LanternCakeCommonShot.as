package com.aurora.ui.maogoutd.resource.defender.HorseYear.lanternCake.shot
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.GameMovieClip;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class LanternCakeCommonShot extends a_4348
   {
      
      private var m_iStep:int = 0;
      
      private var m_iRemainTick:int = 0;
      
      private var m_iSpeed:Number = 15;
      
      private var m_arrMovePath:Array = [0];
      
      public function LanternCakeCommonShot()
      {
         super();
         a_1588 = true;
         a_1573 = 2;
         a_1587 = 0;
         a_1275 = 0;
         m_isShotHighSkySpace = true;
      }
      
      public static function a_4344(transIndex:int = 0) : LanternCakeCommonShot
      {
         var bindMovie:Class = shotBindMovieForTrans(transIndex);
         return PoolManager.getInstance().CheckOutOne(LanternCakeCommonShot,bindMovie) as LanternCakeCommonShot;
      }
      
      private static function shotBindMovieForTrans(transIndex:int) : Class
      {
         switch(transIndex)
         {
            case 1:
               return LanternCakeFirstShotMovie;
            case 2:
               return LanternCakeSecondShotMovie;
            default:
               return LanternCakeBaseShotMovie;
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
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier,iThreeRowShotType);
         m_isPenetrate = true;
         return true;
      }
      
      public function InitData(arr:Array) : void
      {
         this.m_arrMovePath = arr;
         this.SetMoveByStep(0);
      }
      
      private function SetMoveByStep(iStep:int) : void
      {
         var offsetY:Number = NaN;
         var targetP:int = 0;
         var iRate:Number = NaN;
         this.m_iStep = iStep;
         var iPath:int = int(this.m_arrMovePath[iStep]);
         var offsetX:Number = 0;
         offsetY = 0;
         if(iPath == 0)
         {
            targetP = BattleFieldView.a_1013;
            if(a_1283)
            {
               targetP = BattleFieldView.a_1013 - targetP;
            }
            offsetX = targetP - x;
            offsetY = 0;
         }
         else if(iPath == 1)
         {
            targetP = 0;
            if(a_1283)
            {
               targetP = BattleFieldView.a_1013 - targetP;
            }
            offsetX = targetP - x;
            offsetY = 0;
         }
         else if(iPath == 3)
         {
            targetP = BattleFieldView.a_1014;
            offsetX = 0;
            offsetY = targetP - y;
         }
         if(offsetX == 0 && offsetY == 0)
         {
            return;
         }
         iRate = Math.sqrt(offsetX * offsetX + offsetY * offsetY) / this.m_iSpeed;
         m_numXSpeed = offsetX / iRate;
         m_numYSpeed = offsetY / iRate;
         this.m_iRemainTick = Math.ceil(iRate);
         this.updateShotRotation();
      }
      
      private function updateShotRotation() : void
      {
         if(m_numXSpeed == 0 && m_numYSpeed == 0)
         {
            rotation = 0;
            scaleY = 1;
            return;
         }
         var numAngle:Number = Math.atan2(m_numYSpeed,m_numXSpeed) * 180 / Math.PI;
         rotation = numAngle;
         scaleY = numAngle > 90 || numAngle < -90 ? -1 : 1;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         --this.m_iRemainTick;
         if(this.m_iRemainTick <= 0)
         {
            ++this.m_iStep;
            if(this.m_iStep == this.m_arrMovePath.length)
            {
               a_3940();
               return;
            }
            this.SetMoveByStep(this.m_iStep);
         }
         if(a_1588)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
         }
         this.a_4351();
         x += m_numXSpeed;
         y += m_numYSpeed;
      }
      
      override protected function a_4351() : void
      {
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         if(!m_bActive.Value)
         {
            a_3940();
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
         if(m_isSpecial == 0)
         {
            this.hitTestOneGrid(iXGridNo,m_iYGridNo);
            this.hitTestOneGrid(iXGridNo,m_iYGridNo - 1);
         }
         else if(m_isSpecial == 1)
         {
            this.hitTestOneGrid(iXGridNo,m_iYGridNo);
            this.hitTestOneGrid(iXGridNo,m_iYGridNo + 1);
         }
         else if(m_isSpecial == 3)
         {
            iYGridNo = int(y / a_3491.a_1081);
            this.hitTestOneGrid(a_1584.m_iXGridNo,iYGridNo);
            this.hitTestOneGrid(a_1584.m_iXGridNo - 1,iYGridNo);
         }
      }
      
      private function hitTestOneGrid(iXGridNo:int, iYGridNo:int) : void
      {
         var stMoveIntruder:a_4206 = null;
         var stFieldGrid:a_3491 = a_1583.a_3438(iXGridNo,iYGridNo);
         if(!stFieldGrid || !stFieldGrid.m_isOccupy)
         {
            return;
         }
         var arrMoveIntruder:Array = stFieldGrid.IntruderArray;
         for(var i:int = 0; i < arrMoveIntruder.length; i++)
         {
            stMoveIntruder = arrMoveIntruder[i];
            this.CaclueHitMouse(stFieldGrid,stMoveIntruder);
         }
      }
      
      override protected function CaclueHitMouse(stFieldGrid:a_3491, stMoveIntruder:a_4206) : Boolean
      {
         if(stMoveIntruder == null || stMoveIntruder.iLifeValue <= 0 || stMoveIntruder.isCannotSeeByFighter)
         {
            return false;
         }
         if(stMoveIntruder.iSpaceState == 3 || stMoveIntruder.iSpaceState == 1 || m_HitMouseArray.indexOf(stMoveIntruder) != -1)
         {
            return false;
         }
         if(Boolean(a_1583) && a_1583.isOwnBattleField)
         {
            BattleFieldView.a_1045.play();
         }
         m_HitMouseArray.push(stMoveIntruder);
         if(stMoveIntruder.HasTag(40011))
         {
            HitMoveIntruder2(stMoveIntruder,[50003]);
         }
         else
         {
            a_4352(stMoveIntruder);
         }
         return true;
      }
   }
}

