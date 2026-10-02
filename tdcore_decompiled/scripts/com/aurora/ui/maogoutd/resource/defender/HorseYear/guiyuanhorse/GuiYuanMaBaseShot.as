package com.aurora.ui.maogoutd.resource.defender.HorseYear.guiyuanhorse
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.HorseYear.windrider.MouseScareHandler;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class GuiYuanMaBaseShot extends a_4348
   {
      
      private static const HIT_RADIUS_SQ:Number = 400;
      
      public var m_targetIntruder:a_4206;
      
      private var m_isNearHit:Boolean = false;
      
      public function GuiYuanMaBaseShot()
      {
         super();
         a_1279 = -16;
         m_iYDisplayCenterPos = -12;
         a_1573 = 1;
         a_1275 = 0;
         a_1587 = 1;
         a_1588 = false;
      }
      
      public static function a_4344() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(GuiYuanMaBaseShot) as a_4348;
      }
      
      override protected function getBindMovie() : Class
      {
         return GuiYuanMaBaseShotMovie;
      }
      
      override protected function a_3940() : Boolean
      {
         this.m_targetIntruder = null;
         this.m_isNearHit = false;
         return super.a_3940();
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
         if(m_isHited)
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
         if(this.isTargetAlive)
         {
            this.updateTrajectory();
         }
         else
         {
            this.m_isNearHit = false;
         }
         this.a_4351();
         x += m_numXSpeed;
         y += m_numYSpeed;
      }
      
      private function get isTargetAlive() : Boolean
      {
         return this.m_targetIntruder && this.m_targetIntruder.iLifeValue > 0 && Boolean(this.m_targetIntruder.m_stCurrentFieldGrid) && this.m_targetIntruder.visible;
      }
      
      private function updateTrajectory() : void
      {
         var bmpX:Number = NaN;
         var bmpY:Number = NaN;
         var numXDistance:Number = NaN;
         var numYDistance:Number = NaN;
         var len:Number = NaN;
         if(Boolean(this.m_targetIntruder) && Boolean(this.m_targetIntruder.m_stCurrentFieldGrid) && this.m_targetIntruder.iLifeValue > 0)
         {
            bmpX = this.m_targetIntruder.stDisplayBitmap ? this.m_targetIntruder.stDisplayBitmap.x : 0;
            bmpY = this.m_targetIntruder.stDisplayBitmap ? this.m_targetIntruder.stDisplayBitmap.y : 0;
            numXDistance = this.m_targetIntruder.x + bmpX - x;
            numYDistance = this.m_targetIntruder.y + bmpY + this.m_targetIntruder.height / 2 - y;
            this.m_isNearHit = numXDistance * numXDistance + numYDistance * numYDistance <= HIT_RADIUS_SQ;
            len = Math.sqrt(numXDistance * numXDistance + numYDistance * numYDistance);
            if(len > 1)
            {
               m_numXSpeed = numXDistance / len * 10;
               m_numYSpeed = numYDistance / len * 10;
            }
         }
      }
      
      override protected function a_4351() : void
      {
         var iXGridNo:int = 0;
         var intruder:a_4206 = null;
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
         var stFieldGrid:a_3491 = a_1583.a_3438(iXGridNo,iYGridNo);
         if(!stFieldGrid)
         {
            m_bActive.Value = false;
            this.a_3940();
            return;
         }
         if(this.CalculationBoundary())
         {
            return;
         }
         if(this.isTargetAlive)
         {
            if(hitTestObject(this.m_targetIntruder) || this.m_isNearHit)
            {
               m_isHited = true;
               if(a_1276.length > 0)
               {
                  gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
               }
               this.applySkill(this.m_targetIntruder);
               return;
            }
         }
         for each(intruder in stFieldGrid.a_1511)
         {
            if(!(!intruder || intruder.iLifeValue <= 0 || !intruder.m_stCurrentFieldGrid || !intruder.parent || intruder.iSpaceState == 1))
            {
               if(hitTestObject(intruder))
               {
                  m_isHited = true;
                  if(a_1276.length > 0)
                  {
                     gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
                  }
                  this.applySkill(intruder);
                  return;
               }
            }
         }
      }
      
      override protected function CalculationBoundary() : Boolean
      {
         if(x <= -20 || x >= BattleFieldView.a_1013 + 20)
         {
            m_bActive.Value = false;
            this.a_3940();
            return true;
         }
         return false;
      }
      
      private function applySkill(stMoveIntruder:a_4206) : void
      {
         if(!stMoveIntruder)
         {
            return;
         }
         if(stMoveIntruder.IsBossIntruder || stMoveIntruder is GuiYuanMaSmallMouse || !stMoveIntruder.isFearCatHead || stMoveIntruder.HasTag(40003))
         {
            a_4352(stMoveIntruder);
            return;
         }
         var initArmor:int = stMoveIntruder.iInitArmorLifeValue;
         if(initArmor < 0)
         {
            initArmor = 0;
         }
         var currArmor:int = stMoveIntruder.iArmorLifeValue;
         if(currArmor < 0)
         {
            currArmor = 0;
         }
         var initialTotal:int = stMoveIntruder.iInitialLifeValue + initArmor;
         var currentTotal:int = stMoveIntruder.iLifeValue + currArmor;
         var executeThreshold:int = int(initialTotal * (100 - m_isSpecial) / 100);
         if(currentTotal <= executeThreshold)
         {
            stMoveIntruder.a_3969(stMoveIntruder.iLifeValue);
            return;
         }
         var offsetX:Number = BattleFieldView.a_1013 - stMoveIntruder.x - 1;
         var targetGrid:a_3491 = MouseScareHandler.getInstance().getTargetGrid(stMoveIntruder,offsetX,stMoveIntruder.m_stCurrentFieldGrid.m_iYGridNo);
         MouseScareHandler.getInstance().scareMouse(stMoveIntruder,offsetX,targetGrid,this.scareCallbackHandler,false,false);
      }
      
      private function scareCallbackHandler(intruder:a_4206) : void
      {
         if(!intruder)
         {
            return;
         }
         var initArmor:int = intruder.iInitArmorLifeValue;
         if(initArmor < 0)
         {
            initArmor = 0;
         }
         var currArmor:int = intruder.iArmorLifeValue;
         if(currArmor < 0)
         {
            currArmor = 0;
         }
         var initialTotal:int = intruder.iInitialLifeValue + initArmor;
         var newLife:int = int(initialTotal * m_isSpecial / 100);
         if(newLife < 1)
         {
            newLife = 1;
         }
         if(intruder.m_stCurrentFieldGrid)
         {
            this.addSmallMouse(intruder.m_stCurrentFieldGrid,newLife);
            intruder.iDIYLife = 0;
            intruder.a_3432();
         }
      }
      
      private function addSmallMouse(stFieldGrid:a_3491, ilife:int) : Boolean
      {
         var stBaseMoveIntruder:GuiYuanMaSmallMouse = null;
         var iGlobalID:int = 0;
         if(!stFieldGrid)
         {
            return false;
         }
         stBaseMoveIntruder = GuiYuanMaSmallMouse.a_3926(stFieldGrid.m_isNeedTray) as GuiYuanMaSmallMouse;
         if(stBaseMoveIntruder)
         {
            stBaseMoveIntruder.Max_HP = ilife;
            stBaseMoveIntruder.m_stMoveIntruderTypeID = 134217728;
            iGlobalID = stFieldGrid.m_stCurrentBattbleFieldView.GetClientIntruderID();
            stBaseMoveIntruder.a_1797(iGlobalID,a_1283 ? 1 : -1);
            stBaseMoveIntruder.x = a_1283 ? 0 : BattleFieldView.a_1013;
            stBaseMoveIntruder.y = stFieldGrid.m_iYGridNo * a_3491.a_1081;
            stFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stFieldGrid,true);
         }
         return true;
      }
   }
}

