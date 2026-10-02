package com.aurora.ui.maogoutd.resource.defender.HorseYear.windrider
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import com.aurora.ui.maogoutd.resource.tools.a_4425;
   import flash.display.BitmapData;
   import flash.display.FrameLabel;
   
   public class WindRiderHorseSingleRowShot extends a_4348
   {
      
      public function WindRiderHorseSingleRowShot()
      {
         super();
         a_1279 = -34;
         m_iYDisplayCenterPos = -43;
         a_1573 = 1;
         a_1275 = 0;
         a_1587 = 0;
         a_1588 = true;
         m_isShotHighSkySpace = true;
      }
      
      public static function a_4344() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(WindRiderHorseSingleRowShot) as WindRiderHorseSingleRowShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return WindRiderHorseSingleRowShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier,iThreeRowShotType);
         m_isPenetrate = true;
         a_1577 = false;
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
         a_4351();
         if(a_1578)
         {
            if(!FollowingShotHandle())
            {
               return;
            }
         }
         x += m_numXSpeed;
         y += m_numYSpeed;
      }
      
      override protected function CalculationBoundary() : Boolean
      {
         if(x <= -20 || x >= BattleFieldView.a_1013 + 20)
         {
            m_bActive.Value = false;
            a_3940();
            return true;
         }
         return false;
      }
      
      override protected function checkCanHit(intruder:a_4206) : Boolean
      {
         if(intruder.iSpaceState == 1 || intruder.iSpaceState == 2)
         {
            return false;
         }
         if(intruder.isCannotSeeByFighter || intruder.iLifeValue <= 0 || !intruder.m_stCurrentFieldGrid || !intruder.parent)
         {
            return false;
         }
         return true;
      }
      
      override protected function onHitHandler(stFieldGrid:a_3491, stMoveIntruder:a_4206) : void
      {
         var offsetX:Number = NaN;
         var targetGrid:a_3491 = null;
         if(!stMoveIntruder)
         {
            return;
         }
         if(m_isSpecial == 2 && WindRiderHorseDefense.isAirMouse(stMoveIntruder.m_stMoveIntruderTypeID))
         {
            stMoveIntruder.a_4212();
         }
         else
         {
            a_4352(stMoveIntruder);
         }
         this.DropOutSkill(stMoveIntruder);
         if(stMoveIntruder.iLifeValue > 0)
         {
            offsetX = a_3491.a_1080 * 0.5;
            targetGrid = MouseScareHandler.getInstance().getTargetGrid(stMoveIntruder,offsetX,stMoveIntruder.m_stCurrentFieldGrid.m_iYGridNo);
            MouseScareHandler.getInstance().scareMouse(stMoveIntruder,offsetX,targetGrid,this.scareCallbackHandler,false,false);
         }
      }
      
      private function scareCallbackHandler(intruder:a_4206) : void
      {
         if(Boolean(intruder) && intruder.iLifeValue > 0)
         {
            intruder.a_4208(b_182.a_435,10);
         }
      }
      
      private function DropOutSkill(stMoveIntruder:a_4206) : void
      {
         var stTestBd:BitmapData = null;
         var stIntruderRemoteThrowEffect:a_4425 = null;
         if(m_isSpecial >= 1 && stMoveIntruder.iLifeValue <= 0 && 0 == stMoveIntruder.iSpaceState)
         {
            stTestBd = stMoveIntruder.stDisplayBitmap.bitmapData.clone();
            if(stTestBd)
            {
               stMoveIntruder.a_4212();
               stIntruderRemoteThrowEffect = a_4425.a_3926();
               stIntruderRemoteThrowEffect.a_1797(stTestBd,a_1283);
               stIntruderRemoteThrowEffect.x = stMoveIntruder.x;
               stIntruderRemoteThrowEffect.y = stMoveIntruder.y;
               parent.addChild(stIntruderRemoteThrowEffect);
            }
         }
      }
   }
}

