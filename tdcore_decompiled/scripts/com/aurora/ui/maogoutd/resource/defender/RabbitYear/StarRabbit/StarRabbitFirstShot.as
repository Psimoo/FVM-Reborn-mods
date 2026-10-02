package com.aurora.ui.maogoutd.resource.defender.RabbitYear.StarRabbit
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import com.aurora.ui.maogoutd.resource.shot.a_4388;
   import flash.display.FrameLabel;
   
   public class StarRabbitFirstShot extends a_4348
   {
      
      private static var ms_stStarRabbitFirstShotVector:Array = new Array();
      
      private var moveSpeed:int;
      
      public function StarRabbitFirstShot()
      {
         super();
         a_1279 = -74;
         m_iYDisplayCenterPos = -20;
         a_1573 = 1;
         a_1587 = 1;
         scaleX = scaleY = 0.75;
      }
      
      public static function a_4344() : a_4348
      {
         var stStarRabbitFirstShot:StarRabbitFirstShot = ms_stStarRabbitFirstShotVector.pop();
         if(null == stStarRabbitFirstShot)
         {
            stStarRabbitFirstShot = new StarRabbitFirstShot();
         }
         return stStarRabbitFirstShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return StarRabbitFirstShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier,iThreeRowShotType);
         this.moveSpeed = Math.abs(numSpeed);
         rotationY = 0;
         a_1577 = true;
         switch(m_isSpecial)
         {
            case 1:
               m_numYSpeed = 0;
               m_numXSpeed = 1 * Math.abs(this.moveSpeed);
               rotation = 0;
               break;
            case 2:
               m_numXSpeed = Math.cos(22.5 * Math.PI / 180) * Math.abs(this.moveSpeed);
               m_numYSpeed = -Math.sin(22.5 * Math.PI / 180) * Math.abs(this.moveSpeed);
               rotation = -22.5;
               break;
            case 3:
               m_numXSpeed = Math.cos(22.5 * Math.PI / 180) * Math.abs(this.moveSpeed);
               m_numYSpeed = Math.sin(22.5 * Math.PI / 180) * Math.abs(this.moveSpeed);
               rotation = 22.5;
               break;
            case 4:
               m_numXSpeed = Math.cos(45 * Math.PI / 180) * Math.abs(this.moveSpeed);
               m_numYSpeed = -Math.sin(45 * Math.PI / 180) * Math.abs(this.moveSpeed);
               rotation = -45;
               break;
            case 5:
               m_numXSpeed = Math.cos(45 * Math.PI / 180) * Math.abs(this.moveSpeed);
               m_numYSpeed = Math.sin(45 * Math.PI / 180) * Math.abs(this.moveSpeed);
               rotation = 45;
         }
         return true;
      }
      
      override public function GetCanCrossFireAuxiliary() : Boolean
      {
         return m_isCanCrossFireAuxiliary && m_isSpecial == 1;
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
      }
      
      override protected function a_4351() : void
      {
         var iXGridNo:int = 0;
         var stFieldGrid:a_3491 = null;
         var stLastWaitShot:a_4348 = null;
         var arrMoveIntruder:Array = null;
         var iArrMoveIntruderLength:int = 0;
         var stMoveIntruder:a_4206 = null;
         var numHotMultiplier:Number = NaN;
         var numColdSlowMultiplier:Number = NaN;
         var numMoveSpeedMultiplier:Number = NaN;
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
         var iYGridNo:int = int(y / a_3491.a_1081);
         if(y <= -10 || y >= BattleFieldView.a_1014 + 10)
         {
            m_bActive.Value = false;
            this.a_3940();
            return;
         }
         if(x < -10 || x >= BattleFieldView.a_1013 + 10 || a_1576 && y > a_3491.a_1081 * (m_iYGridNo + 1))
         {
            m_bActive.Value = false;
            this.a_3940();
            return;
         }
         stFieldGrid = a_1583.a_3438(iXGridNo,iYGridNo);
         if(stFieldGrid == null)
         {
            m_bActive.Value = false;
            this.a_3940();
            return;
         }
         if(!a_1576 && a_1577 && a_1571 != iXGridNo && a_1584 != stFieldGrid && null != stFieldGrid.m_stBaseAuxiliaryFighter)
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
               else if(numHotMultiplier > a_1325 && m_isSpecial == 1)
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
               this.ReboundHandler();
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
                  if(!stMoveIntruder.m_stMoveIntruderTypeID)
                  {
                  }
                  a_4352(stMoveIntruder);
                  this.a_4360(stFieldGrid,stMoveIntruder);
                  m_isHited = true;
                  if(a_1276.length > 0)
                  {
                     gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
                  }
                  return;
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
                  if(Boolean(a_1583) && a_1583.isOwnBattleField)
                  {
                     BattleFieldView.a_1045.play();
                  }
                  a_4352(stMoveIntruder);
                  this.a_4360(stFieldGrid,stMoveIntruder);
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
      
      private function a_4360(stHitenFieldGrid:a_3491, stHitenMouseIntruder:a_4206) : void
      {
         var stFieldGrid:a_3491 = null;
         var j:int = 0;
         var arrMouveIntruder:Array = null;
         var stMouseIntruder:a_4206 = null;
         if(stHitenFieldGrid == null || stHitenMouseIntruder == null)
         {
            return;
         }
         for(var i:int = stHitenFieldGrid.m_iXGridNo - 0; i <= stHitenFieldGrid.m_iXGridNo + 0; i++)
         {
            for(j = stHitenFieldGrid.m_iYGridNo - 0; j <= stHitenFieldGrid.m_iYGridNo + 0; j++)
            {
               stFieldGrid = a_1583.a_3438(i,j);
               if(null != stFieldGrid)
               {
                  arrMouveIntruder = stFieldGrid.a_1511.slice();
                  for each(stMouseIntruder in arrMouveIntruder)
                  {
                     if(stMouseIntruder != stHitenMouseIntruder && !stMouseIntruder.isCannotSeeByFighter && (0 == stMouseIntruder.iSpaceState || 2 == stMouseIntruder.iSpaceState))
                     {
                        stMouseIntruder.a_4209(int(a_1579 * 0.3));
                     }
                  }
               }
            }
         }
      }
      
      override protected function ReboundHandler() : void
      {
         switch(m_isSpecial)
         {
            case 1:
               rotation = 0 + 180;
               break;
            case 2:
               rotation = -22.5 + 180;
               break;
            case 3:
               rotation = 22.5 + 180;
               break;
            case 4:
               rotation = -45 + 180;
               break;
            case 5:
               rotation = 45 + 180;
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
         if(-1 == ms_stStarRabbitFirstShotVector.indexOf(this))
         {
            ms_stStarRabbitFirstShotVector.push(this);
         }
         return true;
      }
   }
}

