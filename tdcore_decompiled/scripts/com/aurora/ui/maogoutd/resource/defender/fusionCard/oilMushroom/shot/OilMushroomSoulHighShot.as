package com.aurora.ui.maogoutd.resource.defender.fusionCard.oilMushroom.shot
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class OilMushroomSoulHighShot extends a_4348
   {
      
      private var originalSpeed:Number;
      
      public function OilMushroomSoulHighShot()
      {
         super();
         a_1587 = 1;
         a_1279 = -13;
         m_iYDisplayCenterPos = -12;
         a_1573 = 1;
         a_1577 = false;
         a_1578 = true;
         a_1588 = true;
      }
      
      public static function a_4344() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(OilMushroomSoulHighShot) as OilMushroomSoulHighShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return OilMushroomSoulHighShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         m_isShotHighSkySpace = true;
         a_1577 = false;
         m_iFollowingShotSpaceState = 3;
         this.originalSpeed = m_numXSpeed;
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
            if(!FollowingShotHandle())
            {
               return;
            }
         }
         var stBaseMoveIntruder:a_4206 = a_1583.a_3431(m_iFollowingShotSpaceState);
         if(!stBaseMoveIntruder)
         {
            x += this.originalSpeed;
         }
         else
         {
            x += m_numXSpeed;
         }
      }
      
      override protected function a_4351() : void
      {
         if(x < 0 || x > BattleFieldView.a_1013)
         {
            this.a_3940();
            return;
         }
         var stBaseMoveIntruder:a_4206 = a_1583.a_3431(m_iFollowingShotSpaceState);
         if(null != stBaseMoveIntruder && hitTestObject(stBaseMoveIntruder))
         {
            a_4352(stBaseMoveIntruder);
            m_isHited = true;
            gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
         }
      }
   }
}

