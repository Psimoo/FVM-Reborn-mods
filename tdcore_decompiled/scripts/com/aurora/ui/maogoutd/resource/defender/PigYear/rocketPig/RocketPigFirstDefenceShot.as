package com.aurora.ui.maogoutd.resource.defender.PigYear.rocketPig
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class RocketPigFirstDefenceShot extends a_4348
   {
      
      public var a_1607:a_4206;
      
      public function RocketPigFirstDefenceShot()
      {
         super();
         a_1279 = -20;
         m_iYDisplayCenterPos = -40;
         a_1574 = 0;
         a_1573 = 1;
         a_1578 = true;
         m_isShotHighSkySpace = true;
         a_1576 = false;
         a_1577 = false;
      }
      
      public static function a_4344() : RocketPigFirstDefenceShot
      {
         return PoolManager.getInstance().CheckOutOne(RocketPigFirstDefenceShot) as RocketPigFirstDefenceShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return RocketPigFirstDefenceShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         a_1447 = 0;
         m_numXSpeed *= -1;
         a_1275 = 0;
         a_1587 = 1;
         a_1574 = 0;
         gotoAndStop(1);
         a_1578 = true;
         m_isShotHighSkySpace = true;
         a_1576 = false;
         a_1577 = false;
         a_1573 = 1;
         return true;
      }
      
      override protected function FollowingShotHandle() : Boolean
      {
         var aMouseX:Number = NaN;
         var aMouseY:Number = NaN;
         var numXDistance:Number = NaN;
         var numYDistance:Number = NaN;
         var numMaxDistance:Number = NaN;
         var iMaxConstTime:int = 0;
         var numXSpeed:Number = NaN;
         var numYSpeed:Number = NaN;
         var iModNum:int = 0;
         var stMoveIntruder:a_4206 = a_1583.a_3431(m_iFollowingShotSpaceState);
         if(null != stMoveIntruder)
         {
            aMouseX = stMoveIntruder.x + stMoveIntruder.stDisplayBitmap.x + stMoveIntruder.width / 2;
            if(stMoveIntruder.IsReversed())
            {
               aMouseX = stMoveIntruder.x - stMoveIntruder.stDisplayBitmap.x - stMoveIntruder.width / 2;
            }
            aMouseY = stMoveIntruder.y + stMoveIntruder.stDisplayBitmap.y + stMoveIntruder.height / 2;
            numXDistance = aMouseX - x;
            numYDistance = aMouseY - y;
            numMaxDistance = Math.abs(numXDistance) > Math.abs(numYDistance) ? Math.abs(numXDistance) : Math.abs(numYDistance);
            iMaxConstTime = numMaxDistance / 100;
            if(iMaxConstTime < 1)
            {
               iMaxConstTime = 1;
            }
            numXSpeed = numXDistance / iMaxConstTime;
            numYSpeed = numYDistance / iMaxConstTime;
            if(m_numXSpeed != numXSpeed)
            {
               iModNum = Math.abs(int(numXSpeed - m_numXSpeed)) > 5 ? int(Math.abs(int(numXSpeed - m_numXSpeed))) : 5;
               m_numXSpeed += (numXSpeed - m_numXSpeed) % (iModNum + 1);
            }
            if(m_numYSpeed != numYSpeed)
            {
               iModNum = Math.abs(int(numYSpeed - m_numYSpeed)) > 5 ? int(Math.abs(int(numYSpeed - m_numYSpeed))) : 5;
               m_numYSpeed += (numYSpeed - m_numYSpeed) % (iModNum + 1);
            }
         }
         y += m_numYSpeed;
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
         this.a_4351();
         if(a_1578 && !m_isHited)
         {
            if(!this.FollowingShotHandle())
            {
               return;
            }
         }
         if(!m_isHited)
         {
            x += m_numXSpeed;
         }
      }
      
      override protected function a_4351() : void
      {
         var stMoveIntruder:a_4206 = null;
         var aMouseX:Number = NaN;
         var aMouseY:Number = NaN;
         if(x <= -100 || x > BattleFieldView.a_1013 + 100)
         {
            this.a_3940();
            return;
         }
         stMoveIntruder = a_1583.a_3431();
         if(null != stMoveIntruder && hitTestObject(stMoveIntruder))
         {
            m_isHited = true;
            BattleFieldView.ms_huojianzhu_88.play();
            aMouseX = stMoveIntruder.x + stMoveIntruder.stDisplayBitmap.x + stMoveIntruder.width / 2;
            aMouseY = stMoveIntruder.y + stMoveIntruder.stDisplayBitmap.y + stMoveIntruder.height / 2;
            this.x = aMouseX;
            this.y = aMouseY;
            if(a_1276.length > 0)
            {
               gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
            }
            this.a_4360(stMoveIntruder.m_stCurrentFieldGrid);
         }
      }
      
      private function a_4360(stHitenFieldGrid:a_3491) : void
      {
         var stFieldGrid:a_3491 = null;
         var j:int = 0;
         var arrMouveIntruder:Array = null;
         var stMouseIntruder:a_4206 = null;
         var lx:int = stHitenFieldGrid.m_iXGridNo - 1;
         var rx:int = stHitenFieldGrid.m_iXGridNo + 1;
         var dy:int = stHitenFieldGrid.m_iYGridNo - 1;
         var uy:int = stHitenFieldGrid.m_iYGridNo + 1;
         for(var i:int = lx; i <= rx; i++)
         {
            for(j = dy; j <= uy; j++)
            {
               stFieldGrid = a_1583.a_3438(i,j);
               if(null != stFieldGrid)
               {
                  arrMouveIntruder = stFieldGrid.a_1511.slice();
                  for each(stMouseIntruder in arrMouveIntruder)
                  {
                     if(null != stMouseIntruder && false == stMouseIntruder.isCannotSeeByFighter)
                     {
                        if(ms_iCritFrameLable > 0)
                        {
                           stMouseIntruder.a_4208(b_182.a_435,20);
                        }
                        this.a_4352(stMouseIntruder);
                     }
                  }
               }
            }
         }
      }
      
      override public function a_4352(baseMoveIntruder:a_4206) : Boolean
      {
         m_bActive.Value = false;
         if(a_1576 || a_1575)
         {
            if(ms_iCritFrameLable == 2)
            {
               baseMoveIntruder.ReduceLifeIgnoreArmor2(0.3 * GetFinalDamage(),[103]);
            }
            else
            {
               baseMoveIntruder.ReduceLifeIgnoreArmor2(GetFinalDamage(),[103]);
            }
         }
         else if(ms_iCritFrameLable == 2)
         {
            baseMoveIntruder.ReduceLife2(0.3 * GetFinalDamage(),[103]);
         }
         else
         {
            baseMoveIntruder.ReduceLife2(GetFinalDamage(),[103]);
         }
         if(Boolean(baseMoveIntruder) && baseMoveIntruder.iLifeValue > 0)
         {
            baseMoveIntruder.a_4208(b_182.a_435,20);
         }
         if(a_1573 > 0)
         {
            baseMoveIntruder.a_4208(b_182.a_432,a_1573);
         }
         if(a_1574 > 0)
         {
            if(baseMoveIntruder.iArmorLifeValue <= 0 || a_1576)
            {
               baseMoveIntruder.a_4208(b_182.a_433,a_1574 * a_1326);
            }
         }
         if(a_1325 > 1)
         {
            baseMoveIntruder.a_4208(b_182.a_433,0);
         }
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         this.a_1607 = null;
         ms_iCritFrameLable = 0;
         super.a_3940();
         return true;
      }
   }
}

