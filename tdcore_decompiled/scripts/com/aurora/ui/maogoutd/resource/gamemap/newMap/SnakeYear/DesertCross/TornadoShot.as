package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.DesertCross
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class TornadoShot extends a_4348
   {
      
      private static var ms_stTornadoShotVector:Array = new Array();
      
      private var lastFieldGrid:a_3491;
      
      public function TornadoShot()
      {
         super();
         a_1279 = -width * 0.5 - 86;
         m_iYDisplayCenterPos = -130;
         a_1573 = 1;
         a_1574 = 0;
         a_1576 = true;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 0;
         scaleX = scaleY = 0.9;
      }
      
      public static function a_4344() : a_4348
      {
         var stTornadoShot:TornadoShot = ms_stTornadoShotVector.pop();
         if(null == stTornadoShot)
         {
            stTornadoShot = new TornadoShot();
         }
         return stTornadoShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return TornadoShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier,iThreeRowShotType);
         this.lastFieldGrid = null;
         m_numXSpeed = numSpeed;
         switch(a_1580)
         {
            case 0:
               m_numYSpeed = 0;
               m_numXSpeed = -1 * Math.abs(m_numXSpeed);
               break;
            case 1:
               m_numXSpeed = -1 * Math.abs(m_numXSpeed);
               m_numYSpeed = -1 * Math.abs(m_numXSpeed) * (352 / 370);
               break;
            case 2:
               m_numXSpeed = -1 * Math.abs(m_numXSpeed);
               m_numYSpeed = 1 * Math.abs(m_numXSpeed) * (352 / 370);
               break;
            case 3:
               m_numXSpeed = Math.abs(m_numXSpeed);
               m_numYSpeed = -1 * Math.abs(m_numXSpeed) * (352 / 370);
               break;
            case 4:
               m_numXSpeed = Math.abs(m_numXSpeed);
               m_numYSpeed = 1 * Math.abs(m_numXSpeed) * (352 / 370);
               break;
            case 5:
               m_numYSpeed = 0;
               m_numXSpeed = 1 * Math.abs(m_numXSpeed);
               break;
            case 6:
               m_numYSpeed = -1 * Math.abs(m_numXSpeed);
               m_numXSpeed = 0;
               break;
            case 7:
               m_numYSpeed = 1 * Math.abs(m_numXSpeed);
               m_numXSpeed = 0;
               break;
            case 8:
               m_numYSpeed = 1 * Math.abs(m_numXSpeed);
               m_numXSpeed = 0;
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
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
         this.a_4351();
         x += m_numXSpeed;
         y += m_numYSpeed;
         if(a_1580 == 8 && y > 6.5 * a_3491.a_1081)
         {
            a_1580 = 5;
            m_numXSpeed = -1 * Math.abs(m_numYSpeed);
            m_numYSpeed = 0;
            y = 6.5 * a_3491.a_1081;
         }
      }
      
      override protected function a_4351() : void
      {
         var iXGridNo:int = 0;
         var suppFieldGrid:a_3491 = null;
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
         if(y <= 0 || y >= BattleFieldView.a_1014)
         {
            m_bActive.Value = false;
            this.a_3940();
            return;
         }
         if(x < 0 || x >= BattleFieldView.a_1013)
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
            if(m_numXSpeed != 0 && m_numYSpeed == 0)
            {
               suppFieldGrid = a_1583.a_3438(iXGridNo,iYGridNo - 1);
            }
            else if(m_numXSpeed == 0 && m_numYSpeed != 0)
            {
               suppFieldGrid = a_1583.a_3438(iXGridNo - 1,iYGridNo);
            }
            if(suppFieldGrid != null)
            {
               this.a_3502(suppFieldGrid);
            }
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
            if(a_1583.m_CatDragonWindBrokeArray.indexOf(stFieldGrid.m_stTrayDefense.a_3512()) == -1)
            {
               stFieldGrid.m_stTrayDefense.m_iDieType = 1;
               stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue);
            }
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
         if(-1 == ms_stTornadoShotVector.indexOf(this))
         {
            ms_stTornadoShotVector.push(this);
         }
         return true;
      }
   }
}

