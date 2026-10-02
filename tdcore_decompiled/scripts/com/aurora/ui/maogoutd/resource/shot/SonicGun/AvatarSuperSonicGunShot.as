package com.aurora.ui.maogoutd.resource.shot.SonicGun
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class AvatarSuperSonicGunShot extends a_4348
   {
      
      private static var ms_stAvatarSuperSonicGunShotVector:Array = new Array();
      
      public var stStartField:a_3491;
      
      public function AvatarSuperSonicGunShot()
      {
         super();
         a_1279 = -172 + 50;
         m_iYDisplayCenterPos = 23;
         scaleX = scaleY = 0.5;
         a_1573 = 1;
      }
      
      public static function a_4344() : a_4348
      {
         var stAvatarSuperSonicGunShot:AvatarSuperSonicGunShot = ms_stAvatarSuperSonicGunShotVector.pop();
         if(null == stAvatarSuperSonicGunShot)
         {
            stAvatarSuperSonicGunShot = new AvatarSuperSonicGunShot();
         }
         return stAvatarSuperSonicGunShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return AvatarSuperSonicGunShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         if(this.stStartField != null)
         {
            iXpos = a_3491.a_1080 * 0 - 24;
            iYpos = a_3491.a_1081 * stStartFieldGrid.m_iYGridNo;
         }
         this.visible = false;
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier,iThreeRowShotType);
         rotationY = numSpeed < 0 ? -180 : 0;
         a_1587 = 0;
         a_1275 = 0;
         m_isPenetrate = true;
         m_numYSpeed = 0;
         a_1588 = true;
         a_1577 = false;
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         var numYMove:Number = NaN;
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
         a_4351();
         if(a_1578)
         {
            if(!FollowingShotHandle())
            {
               return;
            }
         }
         x += 10;
         if(2 == a_1582 && y > a_1586 - a_3491.a_1081 * 0.9)
         {
            y += m_numYSpeed;
         }
         else if(3 == a_1582 && y < a_1586 + a_3491.a_1081 * 0.9)
         {
            y += m_numYSpeed;
         }
         else if(5 == a_1582 || 6 == a_1582)
         {
            y += m_numYSpeed;
         }
         if(7 == a_1582 && y > a_1586 - a_3491.a_1081 * 1.9)
         {
            y += m_numYSpeed;
         }
         else if(8 == a_1582 && y < a_1586 + a_3491.a_1081 * 1.9)
         {
            y += m_numYSpeed;
         }
         if(a_1576)
         {
            numYMove = 2 * m_numYSpeed * (iCurrentTime - a_1447) / a_1581 - m_numYSpeed;
            y += numYMove > 30 ? 30 : numYMove;
         }
      }
      
      override protected function CalculationBoundary() : Boolean
      {
         if(x < -65 || x >= BattleFieldView.a_1013 + 50 || a_1576 && y > a_3491.a_1081 * (m_iYGridNo + 1))
         {
            m_bActive.Value = false;
            this.a_3940();
            return true;
         }
         return false;
      }
      
      override protected function ReboundHandler() : void
      {
         rotationY = rotationY == -180 ? 0 : -180;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == ms_stAvatarSuperSonicGunShotVector.indexOf(this))
         {
            ms_stAvatarSuperSonicGunShotVector.push(this);
         }
         return true;
      }
   }
}

