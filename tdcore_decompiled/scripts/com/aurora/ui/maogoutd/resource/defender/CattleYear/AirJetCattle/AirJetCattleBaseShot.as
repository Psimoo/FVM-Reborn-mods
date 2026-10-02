package com.aurora.ui.maogoutd.resource.defender.CattleYear.AirJetCattle
{
   import a_4718.b_182;
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import com.aurora.ui.maogoutd.resource.shot.a_4388;
   import flash.display.FrameLabel;
   
   public class AirJetCattleBaseShot extends a_4348
   {
      
      private static var ms_arrSagittariusShotVector:Array = new Array();
      
      private var m_stLastFieldGrid:a_3491;
      
      public function AirJetCattleBaseShot()
      {
         super();
         a_1279 = -22.3;
         a_1587 = 2;
         a_1275 = 0;
         a_1573 = 1;
         a_1576 = false;
         a_1588 = true;
      }
      
      public static function a_4344() : a_4348
      {
         var stAirJetCattleBaseShot:AirJetCattleBaseShot = ms_arrSagittariusShotVector.pop();
         if(null == stAirJetCattleBaseShot)
         {
            stAirJetCattleBaseShot = new AirJetCattleBaseShot();
         }
         BattleFieldView.a_1017.play();
         return stAirJetCattleBaseShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return AirJetCattleBaseShotMovie;
      }
      
      override public function a_1797(param1:int, param2:Number, param3:int, param4:int, param5:int, param6:BattleFieldView, param7:a_3491, param8:Boolean = false, param9:Number = 1, param10:int = 0) : Boolean
      {
         super.a_1797(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
         m_HitMouseArray = new Array();
         a_1275 = 0;
         rotationY = param2 < 0 ? -180 : 0;
         m_isPenetrate = true;
         a_1577 = false;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         ms_iCritFrameLable = 0;
         m_HitMouseArray = new Array();
         if(-1 == ms_arrSagittariusShotVector.indexOf(this))
         {
            ms_arrSagittariusShotVector.push(this);
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(m_isHited && a_1275 == 2)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               m_isHited = false;
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
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
         x += m_numXSpeed;
      }
      
      override protected function CalculationBoundary() : Boolean
      {
         if(x < 0 + 23 || x >= BattleFieldView.a_1013 - 12 || a_1576 && y > a_3491.a_1081 * (m_iYGridNo + 1))
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
      
      override protected function a_4351() : void
      {
         var iXGridNo:int = 0;
         var stFieldGrid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var iArrMoveIntruderLength:int = 0;
         var stMoveIntruder:a_4206 = null;
         var numHotMultiplier:Number = NaN;
         var numColdSlowMultiplier:Number = NaN;
         var numMoveSpeedMultiplier:Number = NaN;
         var stLastWaitShot:a_4348 = null;
         var iNewShotXpos:int = 0;
         var i:int = 0;
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
         var iYGridNo:int = m_iYGridNo;
         if(5 == a_1582 || 6 == a_1582)
         {
            iYGridNo = int(y / a_3491.a_1081);
            if(y <= 0 || y >= BattleFieldView.a_1014)
            {
               m_bActive.Value = false;
               this.a_3940();
               return;
            }
         }
         if(this.CalculationBoundary())
         {
            return;
         }
         stFieldGrid = a_1583.a_3438(iXGridNo,iYGridNo);
         if(stFieldGrid == null)
         {
            m_bActive.Value = false;
            this.a_3940();
            return;
         }
         if(!a_1576 && a_1577 && a_1571 != iXGridNo && a_1584 != stFieldGrid && null != stFieldGrid.m_stBaseAuxiliaryFighter && !stFieldGrid.m_stBaseAuxiliaryFighter.m_isShowFrozen)
         {
            a_1571 = iXGridNo;
            numHotMultiplier = stFieldGrid.m_stBaseAuxiliaryFighter.numHotMultiplier;
            if(numHotMultiplier > 1)
            {
               if(a_1574 * a_1326 > 0)
               {
                  a_1326 = 0;
                  numHotMultiplier = 1;
                  stLastWaitShot = a_4388.getInstance().a_4389(b_183.b_184);
                  if(null != stLastWaitShot)
                  {
                     iNewShotXpos = x + (a_1283 ? -30 : 30);
                     stLastWaitShot.a_1797(0,15,a_1579,iNewShotXpos,y,a_1583,stFieldGrid,false,a_1325);
                     parent.addChild(stLastWaitShot);
                     m_bActive.Value = false;
                     this.a_3940();
                  }
               }
               else if(numHotMultiplier > a_1325)
               {
                  if(stFieldGrid.m_stBaseAuxiliaryFighter.a_3512() == 286392592 || stFieldGrid.m_stBaseAuxiliaryFighter.a_3512() == 286392606 || stFieldGrid.m_stBaseAuxiliaryFighter.a_3512() == 286392607 || stFieldGrid.m_stBaseAuxiliaryFighter.a_3512() == 286393376)
                  {
                     trace("猪猪加强器不过火盆");
                  }
                  else
                  {
                     a_1325 = numHotMultiplier;
                     if(m_isSpecial == 1 || m_isSpecial == 2)
                     {
                        a_1275 = 1;
                        gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
                     }
                     else
                     {
                        a_1275 = 0;
                        gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
                     }
                  }
               }
            }
            numColdSlowMultiplier = stFieldGrid.m_stBaseAuxiliaryFighter.numColdSlowMultiplier;
            if(numColdSlowMultiplier > 1)
            {
               if(a_1325 > 1)
               {
                  a_1326 = 0;
                  numHotMultiplier = 1;
               }
               else if(numColdSlowMultiplier >= a_1326)
               {
                  a_1326 = numColdSlowMultiplier;
               }
            }
            numMoveSpeedMultiplier = stFieldGrid.m_stBaseAuxiliaryFighter.numMoveSpeedMultiplier;
            if(numMoveSpeedMultiplier != 1 && m_numMoveSpeedMultiplier == 1)
            {
               m_numMoveSpeedMultiplier = numMoveSpeedMultiplier;
               m_numXSpeed *= m_numMoveSpeedMultiplier;
               m_numYSpeed *= m_numMoveSpeedMultiplier;
               this.ReboundHandler();
               JudgeAddPowerByAuxiliaryFighter(stFieldGrid);
            }
         }
         if(stFieldGrid.m_isOccupy)
         {
            arrMoveIntruder = stFieldGrid.a_1511.slice();
            if(stFieldGrid.m_stCurrentBattbleFieldView.iIntruderMoveDirection > 0)
            {
               arrMoveIntruder.sortOn("x",Array.DESCENDING | Array.NUMERIC);
            }
            else
            {
               arrMoveIntruder.sortOn("x",Array.NUMERIC);
            }
            iArrMoveIntruderLength = int(arrMoveIntruder.length);
            for(i = 0; i < iArrMoveIntruderLength; i++)
            {
               stMoveIntruder = arrMoveIntruder[i];
               if(!stMoveIntruder.isCannotSeeByFighter && (!m_isShotHighSkySpace && (0 == stMoveIntruder.iSpaceState || 2 == stMoveIntruder.iSpaceState && a_1576) || 3 == stMoveIntruder.iSpaceState && m_isShotHighSkySpace) && hitTestObject(stMoveIntruder))
               {
                  if(m_isPenetrate && m_HitMouseArray.indexOf(stMoveIntruder) == -1)
                  {
                     if(Boolean(a_1583) && a_1583.isOwnBattleField)
                     {
                        BattleFieldView.a_1045.play();
                     }
                     this.a_4352(stMoveIntruder);
                     m_HitMouseArray.push(stMoveIntruder);
                     m_isHited = true;
                     if(a_1276.length > 0 && a_1275 == 1)
                     {
                        gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
                     }
                     return;
                  }
                  if(!m_isPenetrate)
                  {
                     if(Boolean(a_1583) && a_1583.isOwnBattleField)
                     {
                        BattleFieldView.a_1045.play();
                     }
                     this.a_4352(stMoveIntruder);
                     m_isHited = true;
                     if(a_1276.length > 0 && a_1275 == 1)
                     {
                        gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
                     }
                     return;
                  }
               }
            }
         }
         if(a_1283)
         {
            stFieldGrid = a_1583.a_3438(iXGridNo + 1,iYGridNo);
         }
         else
         {
            stFieldGrid = a_1583.a_3438(iXGridNo - 1,iYGridNo);
         }
         if(null != stFieldGrid && stFieldGrid.m_isOccupy)
         {
            arrMoveIntruder = stFieldGrid.a_1511.slice();
            if(stFieldGrid.m_stCurrentBattbleFieldView.iIntruderMoveDirection > 0)
            {
               arrMoveIntruder.sortOn("x",Array.DESCENDING | Array.NUMERIC);
            }
            else
            {
               arrMoveIntruder.sortOn("x",Array.NUMERIC);
            }
            iArrMoveIntruderLength = int(arrMoveIntruder.length);
            for(i = 0; i < iArrMoveIntruderLength; i++)
            {
               stMoveIntruder = arrMoveIntruder[i];
               if(!stMoveIntruder.isCannotSeeByFighter && (!m_isShotHighSkySpace && (0 == stMoveIntruder.iSpaceState || 2 == stMoveIntruder.iSpaceState && a_1576) || 3 == stMoveIntruder.iSpaceState && m_isShotHighSkySpace) && hitTestObject(stMoveIntruder))
               {
                  if(m_isPenetrate && m_HitMouseArray.indexOf(stMoveIntruder) == -1)
                  {
                     if(Boolean(a_1583) && a_1583.isOwnBattleField)
                     {
                        BattleFieldView.a_1045.play();
                     }
                     this.a_4352(stMoveIntruder);
                     m_HitMouseArray.push(stMoveIntruder);
                     m_isHited = true;
                     if(a_1276.length > 0)
                     {
                        gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
                     }
                     return;
                  }
                  if(!m_isPenetrate)
                  {
                     if(Boolean(a_1583) && a_1583.isOwnBattleField)
                     {
                        BattleFieldView.a_1045.play();
                     }
                     this.a_4352(stMoveIntruder);
                     m_isHited = true;
                     if(a_1276.length > 0)
                     {
                        gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
                     }
                     return;
                  }
               }
            }
         }
      }
      
      override public function a_4352(baseMoveIntruder:a_4206) : Boolean
      {
         super.a_4352(baseMoveIntruder);
         if(Boolean(baseMoveIntruder) && baseMoveIntruder.iLifeValue > 0)
         {
            if(Math.random() * 100 <= 15)
            {
               baseMoveIntruder.a_4208(b_182.a_435,15);
            }
         }
         return true;
      }
   }
}

