package com.aurora.ui.maogoutd.resource.defender.PigYear.IceCreamPitcher
{
   import a_4718.b_182;
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import com.aurora.ui.maogoutd.resource.shot.a_4388;
   import flash.display.FrameLabel;
   
   public class IceCreamPitcherSnowShot extends a_4348
   {
      
      private var a_1595:a_4206;
      
      private var a_1596:int;
      
      private var m_arrPos:Array = [[-1,0],[1,0],[0,0],[0,-1],[0,1]];
      
      public function IceCreamPitcherSnowShot()
      {
         super();
         a_1573 = 1;
         a_1576 = true;
         a_1588 = true;
         a_1275 = 1;
         a_1587 = 2;
      }
      
      public static function a_4344() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(IceCreamPitcherSnowShot,IceCreamPitcherSnowShotMovie) as IceCreamPitcherSnowShot;
      }
      
      public static function GetFreeShot1() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(IceCreamPitcherSnowShot,IceCreamPitcherSnowShot1Movie) as IceCreamPitcherSnowShot;
      }
      
      public static function GetFreeShot2() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(IceCreamPitcherSnowShot,IceCreamPitcherSnowShot2Movie) as IceCreamPitcherSnowShot;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         if(a_1580 == 1)
         {
            a_1279 = -20;
         }
         else
         {
            a_1279 = -70;
         }
         return true;
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
         if(x < 0 || x >= BattleFieldView.a_1013 || a_1576 && y > a_3491.a_1081 * (m_iYGridNo + 1))
         {
            m_bActive.Value = false;
            this.a_3940();
            return;
         }
         stFieldGrid = a_1583.a_3438(iXGridNo,iYGridNo);
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
                  stLastWaitShot = JudgePassFireTower(stFieldGrid,numHotMultiplier);
                  if(this.addFireShot(stLastWaitShot,stFieldGrid))
                  {
                     return;
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
               JudgeAddPowerByAuxiliaryFighter(stFieldGrid);
            }
         }
         if(!a_1576 && !m_isShotHighSkySpace && (1 == stFieldGrid.m_iFieldGridType || 4 == stFieldGrid.m_iFieldGridType))
         {
            m_isHited = true;
            if(a_1276.length > 0)
            {
               gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
            }
            return;
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
                  if(Boolean(a_1583) && a_1583.isOwnBattleField)
                  {
                     BattleFieldView.a_1045.play();
                  }
                  stMoveIntruder.a_3969(a_1579);
                  this.a_4360(stFieldGrid);
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
      
      private function a_4360(stHitenFieldGrid:a_3491) : void
      {
         var stCurFieldGrid:a_3491 = null;
         var j:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var iReduceLife:int = 0;
         var lx:int = Math.max(stHitenFieldGrid.m_iXGridNo - 1,0);
         var rx:int = Math.min(stHitenFieldGrid.m_iXGridNo + 1,BattleFieldView.a_1011 - 1);
         var dy:int = Math.max(stHitenFieldGrid.m_iYGridNo - 1,0);
         var uy:int = Math.min(stHitenFieldGrid.m_iYGridNo + 1,BattleFieldView.a_1012 - 1);
         for(var i:int = lx; i <= rx; i++)
         {
            for(j = dy; j <= uy; j++)
            {
               stCurFieldGrid = stHitenFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,j);
               if(null != stCurFieldGrid)
               {
                  arrMoveIntruder = stCurFieldGrid.a_1511.slice();
                  for each(stMoveIntruder in arrMoveIntruder)
                  {
                     if(stMoveIntruder.iLifeValue > 0)
                     {
                        iReduceLife = a_1579 * 0.2;
                        stMoveIntruder.a_4209(iReduceLife);
                     }
                     if(Boolean(stHitenFieldGrid == stCurFieldGrid) && Boolean(stMoveIntruder) && stMoveIntruder.iLifeValue > 0)
                     {
                        stMoveIntruder.a_4208(b_182.enm_shotEffectFreezeStop,15);
                     }
                  }
               }
            }
         }
      }
      
      override protected function addFireShot(stLastWaitShot:a_4348, stFieldGrid:a_3491) : Boolean
      {
         var isBothWayShot:Boolean = false;
         if(null != stLastWaitShot)
         {
            isBothWayShot = false;
            if(a_1283 && m_numXSpeed > 0 || !a_1283 && m_numXSpeed < 0)
            {
               isBothWayShot = true;
            }
            stLastWaitShot.a_1797(0,15,a_1579,x,y,a_1583,stFieldGrid,isBothWayShot,a_1325);
            ApplyFireShotExtraProperty(stLastWaitShot);
            parent.addChild(stLastWaitShot);
            m_bActive.Value = false;
            this.a_3940();
            if(Boolean(a_1583) && a_1583.isOwnBattleField)
            {
               BattleFieldView.a_1029.play();
            }
            return true;
         }
         return false;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this.a_1595 = null;
         this.a_1596 = -1;
         return true;
      }
   }
}

