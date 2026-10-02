package com.aurora.ui.maogoutd.resource.defender.fusionCard.termiThreeShotGun
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.ShotTrigger.BaseShotTrigger;
   import com.aurora.ui.maogoutd.resource.shot.ShotTrigger.ShotTriggerManager;
   import com.aurora.ui.maogoutd.resource.shot.ShotTrigger.ShotTriggerType;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class TermiThreeShotGunSoulShot extends a_4348
   {
      
      public function TermiThreeShotGunSoulShot()
      {
         super();
         a_1279 = -13;
         m_iYDisplayCenterPos = -8;
         a_1573 = 2;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 1;
      }
      
      public static function a_4344() : a_4348
      {
         BattleFieldView.a_1018.play();
         return PoolManager.getInstance().CheckOutOne(TermiThreeShotGunSoulShot) as TermiThreeShotGunSoulShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return TermiThreeShotGunSoulShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier,iThreeRowShotType);
         m_isPenetrate = true;
         if(-1 == m_iShotGroupIndex)
         {
            m_numYSpeed = -2 * Math.abs(m_numXSpeed);
         }
         else if(1 == m_iShotGroupIndex)
         {
            m_numYSpeed = 2 * Math.abs(m_numXSpeed);
         }
         var trigger:BaseShotTrigger = ShotTriggerManager.Instance.CreateTrigger(ShotTriggerType.BURNBUFFTRIGGER,30,m_iGlobalID,21,m_isSpecial);
         AddTrigger(trigger);
         var trigger1:BaseShotTrigger = ShotTriggerManager.Instance.CreateTrigger(ShotTriggerType.PENETRATECOUNTTRIGGER,100,-1,0,m_iSuperShotType);
         AddTrigger(trigger1);
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
         x += m_numXSpeed;
         if(-1 == m_iShotGroupIndex && y > a_1586 - a_3491.a_1081 * 0.9)
         {
            y += m_numYSpeed;
         }
         else if(1 == m_iShotGroupIndex && y < a_1586 + 20 + a_3491.a_1081 * 0.9)
         {
            y += m_numYSpeed;
         }
      }
      
      override protected function onHitHandler(stFieldGrid:a_3491, stMoveIntruder:a_4206) : void
      {
         if(Boolean(a_1583) && a_1583.isOwnBattleField)
         {
            BattleFieldView.a_1045.play();
         }
         a_4352(stMoveIntruder);
         SputterHurt(stFieldGrid,stMoveIntruder);
         m_isHited = true;
         if(a_1276.length > 0)
         {
            gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
         }
         ExecuteTriggers(stMoveIntruder);
      }
      
      override protected function ReboundHandler() : void
      {
         rotationY = rotationY == -180 ? 0 : -180;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         rotationY = 0;
         return true;
      }
   }
}

