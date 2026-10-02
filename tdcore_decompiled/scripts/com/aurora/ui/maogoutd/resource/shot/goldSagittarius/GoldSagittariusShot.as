package com.aurora.ui.maogoutd.resource.shot.goldSagittarius
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class GoldSagittariusShot extends a_4348
   {
      
      public function GoldSagittariusShot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1304 = 65565;
         a_1587 = 1;
         a_1573 = 1;
         a_1576 = false;
      }
      
      public static function a_4344() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(GoldSagittariusShot,GoldSagittariusShotMovie) as GoldSagittariusShot;
      }
      
      public static function GetFreeShot1() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(GoldSagittariusShot,GoldSagittariusShot1Movie) as GoldSagittariusShot;
      }
      
      public static function GetFreeShot2() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(GoldSagittariusShot,GoldSagittariusShot2Movie) as GoldSagittariusShot;
      }
      
      override public function a_1797(param1:int, param2:Number, param3:int, param4:int, param5:int, param6:BattleFieldView, param7:a_3491, param8:Boolean = false, param9:Number = 1, param10:int = 0) : Boolean
      {
         super.a_1797(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
         return true;
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
         ms_iCritFrameLable = 0;
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         var numYMove:Number = NaN;
         if(m_isHited)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
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
         if(x < 0 || x > BattleFieldView.a_1013)
         {
            this.a_3940();
            return;
         }
         if(a_1578)
         {
            if(!FollowingShotHandle())
            {
               return;
            }
         }
         x += m_numXSpeed;
         if(2 == a_1582 && y > a_1586 - a_3491.a_1081 * 0.9)
         {
            y += m_numYSpeed;
            return;
         }
         if(3 == a_1582 && y < a_1586 + a_3491.a_1081 * 0.9)
         {
            y += m_numYSpeed;
            return;
         }
         if(5 == a_1582 || 6 == a_1582)
         {
            y += m_numYSpeed;
            return;
         }
         if(7 == a_1582 && y > a_1586 - a_3491.a_1081 * 1.9)
         {
            y += m_numYSpeed;
            return;
         }
         if(8 == a_1582 && y < a_1586 + a_3491.a_1081 * 1.9)
         {
            y += m_numYSpeed;
            return;
         }
         if(a_1582 > 1)
         {
            a_1577 = true;
         }
         if(a_1576)
         {
            numYMove = 2 * m_numYSpeed * (iCurrentTime - a_1447) / a_1581 - m_numYSpeed;
            y += numYMove > 30 ? 30 : numYMove;
         }
         this.a_4351();
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
         var numMoveSpeedMultiplier:Number = NaN;
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
         if(stFieldGrid == null)
         {
            return;
         }
         if(!a_1576 && a_1577 && a_1571 != iXGridNo && a_1584 != stFieldGrid && null != stFieldGrid.m_stBaseAuxiliaryFighter && !stFieldGrid.m_stBaseAuxiliaryFighter.m_isShowFrozen)
         {
            a_1571 = iXGridNo;
            numHotMultiplier = 0;
            if(stFieldGrid.m_stBaseAuxiliaryFighter)
            {
               numHotMultiplier = stFieldGrid.m_stBaseAuxiliaryFighter.numHotMultiplier;
            }
            if(numHotMultiplier > 1 && null != stFieldGrid.m_stBaseAuxiliaryFighter && !stFieldGrid.m_stBaseAuxiliaryFighter.m_isShowFrozen)
            {
               if(numHotMultiplier > a_1325)
               {
                  stLastWaitShot = JudgePassFireTower(stFieldGrid,numHotMultiplier);
                  if(this.addFireShot(stLastWaitShot,stFieldGrid))
                  {
                     return;
                  }
               }
            }
         }
         if(stFieldGrid.m_stBaseAuxiliaryFighter != null && !stFieldGrid.m_stBaseAuxiliaryFighter.m_isShowFrozen)
         {
            numMoveSpeedMultiplier = stFieldGrid.m_stBaseAuxiliaryFighter.numMoveSpeedMultiplier;
            if(numMoveSpeedMultiplier != 1 && m_numMoveSpeedMultiplier == 1)
            {
               m_numMoveSpeedMultiplier = numMoveSpeedMultiplier;
               m_numXSpeed *= m_numMoveSpeedMultiplier;
               m_numYSpeed *= m_numMoveSpeedMultiplier;
            }
         }
         if(!a_1576 && !m_isShotHighSkySpace && (1 == stFieldGrid.m_iFieldGridType || 4 == stFieldGrid.m_iFieldGridType))
         {
            m_isHited = true;
            this.a_3940();
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
                  if(ms_iCritFrameLable == 0)
                  {
                     a_4352(stMoveIntruder);
                  }
                  else
                  {
                     m_bActive.Value = false;
                     stMoveIntruder.a_3969(int(GetFinalDamage() * 0.5));
                  }
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
}

