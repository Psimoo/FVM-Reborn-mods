package com.aurora.ui.maogoutd.resource.shot.goldTower
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import com.aurora.ui.maogoutd.resource.shot.a_4388;
   import flash.display.FrameLabel;
   
   public class GoldFireTowerShot extends a_4348
   {
      
      private static var a_1592:Array = new Array();
      
      private var hitMouseArray:Array = new Array();
      
      private var m_arrPos:Array = [[0,1],[0,-1],[1,0]];
      
      public function GoldFireTowerShot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1588 = true;
         a_1304 = b_183.enm_HighFireShot;
         a_1573 = 1;
         a_1587 = 0;
      }
      
      public static function a_4344() : a_4348
      {
         var stFireTowerShot:GoldFireTowerShot = a_1592.pop();
         if(null == stFireTowerShot)
         {
            stFireTowerShot = new GoldFireTowerShot();
         }
         return stFireTowerShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return GoldFireTowerShotMovie;
      }
      
      override public function a_1797(param1:int, param2:Number, param3:int, param4:int, param5:int, param6:BattleFieldView, param7:a_3491, param8:Boolean = false, param9:Number = 1, param10:int = 0) : Boolean
      {
         super.a_1797(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
         a_1275 = 0;
         gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         a_1587 = 0;
         this.hitMouseArray = new Array();
         rotationY = m_numXSpeed < 0 ? -180 : 0;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == a_1592.indexOf(this))
         {
            a_1592.push(this);
         }
         this.hitMouseArray = new Array();
         return true;
      }
      
      override protected function a_4351() : void
      {
         var iXGridNo:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var iArrMoveIntruderLength:int = 0;
         var stFieldGrid:a_3491 = null;
         var stLastWaitShot:a_4348 = null;
         var numHotMultiplier:Number = NaN;
         var numColdSlowMultiplier:Number = NaN;
         var numMoveSpeedMultiplier:Number = NaN;
         var iNewShotXpos:int = 0;
         var i:int = 0;
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
         }
         else
         {
            iXGridNo = int(x / a_3491.a_1080);
         }
         var iYGridNo:int = m_iYGridNo;
         stFieldGrid = a_1583.a_3438(iXGridNo,iYGridNo);
         if(x < 0 || x >= BattleFieldView.a_1013)
         {
            this.a_3940();
            return;
         }
         if(stFieldGrid == null)
         {
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
                     this.a_3940();
                  }
               }
               else if(numHotMultiplier > a_1325)
               {
                  stLastWaitShot = JudgePassFireTower(stFieldGrid,numHotMultiplier);
                  if(addFireShot(stLastWaitShot,stFieldGrid))
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
               this.ReboundHandler();
               JudgeAddPowerByAuxiliaryFighter(stFieldGrid);
            }
         }
         if(!a_1576 && !m_isShotHighSkySpace && (1 == stFieldGrid.m_iFieldGridType || 4 == stFieldGrid.m_iFieldGridType) && !m_isPenetrate)
         {
            m_isHited = true;
            this.a_3940();
            return;
         }
         var arrMouveIntruder:Array = null;
         var stMouseIntruder:a_4206 = null;
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
               if(checkCanHit(stMoveIntruder) && hitTestObject(stMoveIntruder))
               {
                  if(m_isPenetrate && this.hitMouseArray.indexOf(stMoveIntruder) == -1)
                  {
                     if(Boolean(a_1583) && a_1583.isOwnBattleField)
                     {
                        BattleFieldView.a_1045.play();
                     }
                     this.hitMouseArray.push(stMoveIntruder);
                     HitMoveIntruder2(stMoveIntruder,[132]);
                     m_isHited = true;
                     if(a_1276.length > 0)
                     {
                        gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
                     }
                     ExecuteTriggers(stMoveIntruder);
                     return;
                  }
                  if(!m_isPenetrate)
                  {
                     if(Boolean(a_1583) && a_1583.isOwnBattleField)
                     {
                        BattleFieldView.a_1045.play();
                     }
                     HitMoveIntruder2(stMoveIntruder,[132]);
                     ExecuteTriggers(stMoveIntruder);
                     m_isHited = true;
                     if(a_1276.length > 0)
                     {
                        gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
                     }
                     if(a_1580 == 3)
                     {
                        this.SputteringShotOne(stFieldGrid,stMoveIntruder);
                     }
                     else if(a_1580 == 4)
                     {
                        this.SputteringShotOne(stFieldGrid,stMoveIntruder);
                        this.SputteringShotTwo(stFieldGrid);
                     }
                     return;
                  }
               }
            }
         }
      }
      
      private function SputteringShotOne(stHitenFieldGrid:a_3491, stHitenMouseIntruder:a_4206) : void
      {
         if(stHitenFieldGrid == null)
         {
            return;
         }
         var arrMouveIntruder:Array = null;
         var stMouseIntruder:a_4206 = null;
         arrMouveIntruder = stHitenFieldGrid.a_1511.slice();
         for each(stMouseIntruder in arrMouveIntruder)
         {
            if(stMouseIntruder != stHitenMouseIntruder && !stMouseIntruder.isCannotSeeByFighter)
            {
               stMouseIntruder.ReduceLifeIgnoreArmor2(GetFinalDamage(),[132]);
            }
         }
      }
      
      private function SputteringShotTwo(stHitenFieldGrid:a_3491) : void
      {
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var stCurFieldGrid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(stHitenFieldGrid == null)
         {
            return;
         }
         var iLen:int = int(this.m_arrPos.length);
         for(var i:int = 0; i < iLen; i++)
         {
            iXGridNo = stHitenFieldGrid.m_iXGridNo + this.m_arrPos[i][0];
            iYGridNo = stHitenFieldGrid.m_iYGridNo + this.m_arrPos[i][1];
            stCurFieldGrid = a_1583.a_3438(iXGridNo,iYGridNo);
            if(null != stCurFieldGrid)
            {
               arrMoveIntruder = stCurFieldGrid.a_1511.slice();
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  if(!stMoveIntruder.isCannotSeeByFighter)
                  {
                     stMoveIntruder.ReduceLifeIgnoreArmor2(int(GetFinalDamage() * 0.3),[132]);
                  }
               }
            }
         }
      }
      
      override protected function ReboundHandler() : void
      {
         rotationY = rotationY == -180 ? 0 : -180;
      }
   }
}

