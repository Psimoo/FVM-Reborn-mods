package com.aurora.ui.maogoutd.resource.defender.DragonYear.BubbleDragon
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   import flash.geom.Point;
   
   public class BubbleDragonSpecialShot extends a_4348
   {
      
      public var a_1598:a_3491;
      
      private var startPosition:Point;
      
      public function BubbleDragonSpecialShot()
      {
         super();
         a_1587 = 1;
         a_1279 = -42.5;
         m_iYDisplayCenterPos = -42.5;
         scaleX = scaleY = 0.5;
         m_isShotHighSkySpace = true;
         a_1588 = true;
      }
      
      public static function a_4344() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(BubbleDragonSpecialShot) as BubbleDragonSpecialShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return BubbleDragonSpecialShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         this.startPosition = new Point((stStartFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080,(stStartFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081);
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         this.setMoveToPosition(numSpeed);
         return true;
      }
      
      private function setMoveToPosition(fMoveSpeed:int) : void
      {
         var fPosY:Number = NaN;
         var fPosX:Number = NaN;
         var fDistanceX:Number = NaN;
         var fDistanceY:Number = NaN;
         var fDistance:Number = NaN;
         var iMoveTick:int = 0;
         if(this.a_1598)
         {
            fPosY = (this.a_1598.m_iYGridNo + 0.5) * a_3491.a_1081;
            fPosX = (this.a_1598.m_iXGridNo + 0.5) * a_3491.a_1080;
            fDistanceX = fPosX - this.startPosition.x;
            fDistanceY = fPosY - this.startPosition.y;
            fDistance = Math.max(Math.abs(fDistanceX),Math.abs(fDistanceY));
            iMoveTick = fDistance / Math.abs(fMoveSpeed);
            if(iMoveTick > 0)
            {
               m_numXSpeed = fDistanceY / iMoveTick;
               m_numYSpeed = fDistanceX / iMoveTick;
            }
            a_1581 = iMoveTick;
         }
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
         if(a_1581 > 0)
         {
            x += m_numXSpeed;
            y += m_numYSpeed;
            --a_1581;
         }
      }
      
      override protected function a_4351() : void
      {
      }
   }
}

