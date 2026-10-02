package com.aurora.ui.maogoutd.resource.gamemap.newMap.CattleYear.ThundCity.Effect
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class HoTrafficShot extends a_4348
   {
      
      private static var ms_stTrafficShotVector:Array = new Array();
      
      private var appearedTimes:int = -10;
      
      private var lastFieldGrid:a_3491;
      
      public function HoTrafficShot()
      {
         super();
         a_1279 = -width * 0.5 - 56;
         m_iYDisplayCenterPos = -150 + 67;
         a_1573 = 1;
         a_1574 = 0;
         a_1576 = true;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 0;
      }
      
      public static function a_4344() : a_4348
      {
         var stTrafficShot:HoTrafficShot = ms_stTrafficShotVector.pop();
         if(null == stTrafficShot)
         {
            stTrafficShot = new HoTrafficShot();
         }
         return stTrafficShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return HoTrafficShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier,iThreeRowShotType);
         this.lastFieldGrid = null;
         m_numXSpeed = numSpeed;
         switch(a_1580)
         {
            case 1:
               m_numYSpeed = 0;
               m_numXSpeed = -1 * Math.abs(m_numXSpeed);
               a_1275 = 0;
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
               break;
            case 2:
               m_numYSpeed = 0;
               m_numXSpeed = -1 * Math.abs(m_numXSpeed);
               a_1275 = 1;
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
               break;
            case 3:
               m_numYSpeed = 1 * Math.abs(m_numXSpeed);
               m_numXSpeed = 0;
               a_1275 = 0;
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
               break;
            case 4:
               m_numYSpeed = 1 * Math.abs(m_numXSpeed);
               m_numXSpeed = 0;
               a_1275 = 1;
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(this.appearedTimes == -10)
         {
            this.appearedTimes = iCurrentTime;
         }
         if(m_isHited)
         {
            if(a_1273 == a_1274)
            {
               this.a_3940();
            }
            nextFrame();
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
         if(iCurrentTime != this.appearedTimes && (iCurrentTime - this.appearedTimes) % (0.1 * 20) == 0)
         {
            this.a_4351();
         }
         x += m_numXSpeed;
         y += m_numYSpeed;
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
         var iYGridNo:int = int(y / a_3491.a_1081);
         if(y <= -20 || y >= BattleFieldView.a_1014 + 20)
         {
            m_bActive.Value = false;
            this.a_3940();
            return;
         }
         if(x < -112 || x >= BattleFieldView.a_1013 + 100)
         {
            m_bActive.Value = false;
            this.a_3940();
            return;
         }
         var stFieldGrid:a_3491 = a_1583.a_3438(iXGridNo,iYGridNo);
         if(stFieldGrid != null && stFieldGrid != this.lastFieldGrid)
         {
            this.lastFieldGrid = stFieldGrid;
            this.a_3502(this.lastFieldGrid);
         }
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(!stFieldGrid.m_isCanBrokeByWind == true)
         {
            return false;
         }
         if(null != stFieldGrid.m_stProtector && !stFieldGrid.m_stProtector.m_isShowFrozen)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(stFieldGrid.m_stProtector.iLifeValue);
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924) && !stFieldGrid.m_stAttackFighter.m_isShowFrozen)
         {
            if(stFieldGrid.m_stAttackFighter.a_3512() != 286396512 && stFieldGrid.m_stAttackFighter.a_3512() != 286396526)
            {
               stFieldGrid.m_stAttackFighter.m_iDieType = 1;
               stFieldGrid.m_stAttackFighter.a_3969(stFieldGrid.m_stAttackFighter.iLifeValue);
            }
         }
         if(null != stFieldGrid.m_stBoomDefense && !stFieldGrid.m_stBoomDefense.m_isShowFrozen)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(stFieldGrid.m_stBoomDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stFlowerDefense && !stFieldGrid.m_stFlowerDefense.m_isShowFrozen)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(stFieldGrid.m_stFlowerDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter && !stFieldGrid.m_stBaseAuxiliaryFighter.m_isShowFrozen)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
         }
         stFieldGrid.DamageNewSlot(true,2,true,0,1);
         if(null != stFieldGrid.m_stTrayDefense && !stFieldGrid.m_stTrayDefense.m_isShowFrozen)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue);
         }
         return true;
      }
      
      private function a_4374(stBaseDefense:a_3962) : Boolean
      {
         var iHurtPower:int = 0;
         stBaseDefense.m_iDieType = 1;
         if(stBaseDefense is a_3924)
         {
            iHurtPower = stBaseDefense.iLifeValue - 10 > a_1579 ? a_1579 : int(stBaseDefense.iLifeValue - 10);
            stBaseDefense.a_3969(iHurtPower);
         }
         else
         {
            stBaseDefense.a_3969(a_1579);
         }
         stBaseDefense.m_iDieType = 0;
         stBaseDefense.a_3940();
         if(Boolean(a_1583) && a_1583.isOwnBattleField)
         {
            BattleFieldView.a_1015.play();
         }
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this.lastFieldGrid = null;
         if(-1 == ms_stTrafficShotVector.indexOf(this))
         {
            ms_stTrafficShotVector.push(this);
         }
         return true;
      }
   }
}

