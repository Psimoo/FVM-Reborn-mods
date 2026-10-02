package com.aurora.ui.maogoutd.resource.defender.fusionCard.DeathCannon
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class DeathCannonSoulShot extends a_4348
   {
      
      private static const RISE_AND_TELEPORT_PHASE_TICKS:int = 40;
      
      private static const RISE_Y_STOP:Number = -40;
      
      private static const VERTICAL_STEP:int = 30;
      
      public var a_1598:a_3491;
      
      private var m_iXGridNo:int;
      
      public function DeathCannonSoulShot()
      {
         super();
         a_1279 = -25;
         m_iYDisplayCenterPos = -25;
         a_1573 = 1;
         m_isShotHighSkySpace = true;
         a_1275 = 0;
         a_1587 = 1;
      }
      
      public static function a_4344() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(DeathCannonSoulShot) as DeathCannonSoulShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return DeathCannonSoulShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         this.m_iXGridNo = BattleFieldView.a_1011 - 2;
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         a_1447 = 0;
         m_numXSpeed *= -1;
         a_1275 = 0;
         a_1587 = 1;
         gotoAndStop(1);
         return true;
      }
      
      override protected function a_4349() : Boolean
      {
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         this.a_1598 = null;
         return super.a_3940();
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
         if(a_1447 == 0)
         {
            a_1447 = iCurrentTime;
         }
         if(!this.a_1598)
         {
            this.a_3940();
            return;
         }
         var ticksSinceSpawn:int = iCurrentTime - a_1447;
         if(ticksSinceSpawn < RISE_AND_TELEPORT_PHASE_TICKS)
         {
            this.tickRiseAndTeleportToTargetColumn();
         }
         else
         {
            this.tickFallThroughBattlefieldAndTrySplash();
         }
      }
      
      private function tickRiseAndTeleportToTargetColumn() : void
      {
         if(y > RISE_Y_STOP)
         {
            y -= VERTICAL_STEP;
            return;
         }
         if(!visible)
         {
            return;
         }
         visible = false;
         if(!a_1283)
         {
            x = (this.m_iXGridNo + 0.5) * a_3491.a_1080;
         }
         else
         {
            x = BattleFieldView.a_1013 - (this.m_iXGridNo + 0.5) * a_3491.a_1080;
         }
         a_1275 = 0;
         gotoAndStop((a_1276[0] as FrameLabel).frame);
      }
      
      private function tickFallThroughBattlefieldAndTrySplash() : void
      {
         visible = true;
         if(y >= BattleFieldView.a_1014)
         {
            this.a_3940();
            return;
         }
         y += VERTICAL_STEP;
         this.a_4373();
      }
      
      private function a_4373() : void
      {
         var stFieldGrid:a_3491 = null;
         if(x < 0 || x >= BattleFieldView.a_1013 || y > a_3491.a_1081 * (a_1584.m_iYGridNo + 1))
         {
            this.a_3940();
            return;
         }
         stFieldGrid = a_1583.a_3438(this.m_iXGridNo,a_1584.m_iYGridNo);
         if(!stFieldGrid)
         {
            this.a_3940();
            return;
         }
         if(y <= stFieldGrid.m_iYGridNo * a_3491.a_1081)
         {
            return;
         }
         this.a_4360(stFieldGrid);
         m_isHited = true;
         if(a_1276.length > 0)
         {
            gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
         }
         if(!a_1283)
         {
            x = (stFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
         }
         else
         {
            x = BattleFieldView.a_1013 - (stFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
         }
         y = stFieldGrid.m_iYGridNo * a_3491.a_1081 + 20;
      }
      
      private function a_4360(stHitenFieldGrid:a_3491) : void
      {
         var gy:int = 0;
         var stFieldGrid:a_3491 = null;
         var arrIntruder:Array = null;
         var intruder:a_4206 = null;
         for(var gx:int = stHitenFieldGrid.m_iXGridNo - 1; gx <= stHitenFieldGrid.m_iXGridNo + 1; gx++)
         {
            for(gy = stHitenFieldGrid.m_iYGridNo - 2; gy <= stHitenFieldGrid.m_iYGridNo + 2; gy++)
            {
               stFieldGrid = a_1583.a_3438(gx,gy);
               if(stFieldGrid != null)
               {
                  arrIntruder = stFieldGrid.IntruderArray;
                  for each(intruder in arrIntruder)
                  {
                     if(intruder)
                     {
                        intruder.a_4213();
                        if(intruder.iLifeValue > 0 && Boolean(intruder.m_stCurrentFieldGrid))
                        {
                           intruder.a_4209(GetFinalDamage() - 900);
                           if(intruder.iLifeValue <= 0 && !intruder.IsBossIntruder)
                           {
                              intruder.a_3432();
                           }
                        }
                     }
                  }
               }
            }
         }
      }
   }
}

