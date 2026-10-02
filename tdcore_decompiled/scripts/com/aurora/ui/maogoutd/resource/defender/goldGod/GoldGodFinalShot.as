package com.aurora.ui.maogoutd.resource.defender.goldGod
{
   import a_4718.b_182;
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class GoldGodFinalShot extends a_4348
   {
      
      private static var ms_arrShot:Array = new Array();
      
      private var a_1607:a_4206;
      
      public function GoldGodFinalShot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1304 = b_183.enm_AthenaShot;
         a_1573 = 1;
         a_1578 = true;
         m_isShotHighSkySpace = true;
         a_1576 = false;
         a_1577 = false;
         alpha = 0.8;
      }
      
      public static function a_4344() : GoldGodFinalShot
      {
         var stShot:GoldGodFinalShot = ms_arrShot.pop();
         if(null == stShot)
         {
            stShot = new GoldGodFinalShot();
         }
         return stShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return GoldGodFinalShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         a_1447 = 0;
         m_numXSpeed *= -1;
         a_1275 = 0;
         a_1587 = 1;
         gotoAndStop(1);
         a_1578 = true;
         m_isShotHighSkySpace = true;
         a_1576 = false;
         a_1577 = false;
         a_1573 = 1;
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         var numYMove:Number = NaN;
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
         if(a_1578)
         {
            if(!this.FollowingShotHandle())
            {
               return;
            }
         }
         x += m_numXSpeed;
         if(2 == a_1582 && y > a_1586 - a_3491.a_1081 * 0.9)
         {
            y += m_numYSpeed;
         }
         else if(3 == a_1582 && y < a_1586 + a_3491.a_1081 * 0.9)
         {
            y += m_numYSpeed;
         }
         else if(5 == a_1582 || 6 == a_1582)
         {
            y += m_numYSpeed;
         }
         if(7 == a_1582 && y > a_1586 - a_3491.a_1081 * 1.9)
         {
            y += m_numYSpeed;
         }
         else if(8 == a_1582 && y < a_1586 + a_3491.a_1081 * 1.9)
         {
            y += m_numYSpeed;
         }
         else if(a_1582 > 1)
         {
            a_1577 = true;
         }
         if(a_1576)
         {
            numYMove = 2 * m_numYSpeed * (iCurrentTime - a_1447) / a_1581 - m_numYSpeed;
            y += numYMove > 30 ? 30 : numYMove;
         }
      }
      
      override protected function FollowingShotHandle() : Boolean
      {
         var numXDistance:Number = NaN;
         var numYDistance:Number = NaN;
         var numMaxDistance:Number = NaN;
         var iMaxConstTime:int = 0;
         var numXSpeed:Number = NaN;
         var numYSpeed:Number = NaN;
         var iModNum:int = 0;
         var stMoveIntruder:a_4206 = a_1583.GetAllNearestIntruder();
         if(null != stMoveIntruder)
         {
            numXDistance = stMoveIntruder.x - x;
            numYDistance = stMoveIntruder.y + 0.5 * stMoveIntruder.height - y;
            numMaxDistance = Math.abs(numXDistance) > Math.abs(numYDistance) ? Math.abs(numXDistance) : Math.abs(numYDistance);
            if(numMaxDistance > BattleFieldView.a_1013 && numMaxDistance > BattleFieldView.a_1014)
            {
               this.a_3940();
               return false;
            }
            iMaxConstTime = numMaxDistance / 10;
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
      
      override protected function a_4351() : void
      {
         var stMoveIntruder:a_4206 = null;
         if(x <= 0 || x > BattleFieldView.a_1013)
         {
            this.a_3940();
            return;
         }
         stMoveIntruder = a_1583.GetAllNearestIntruder();
         if(null != stMoveIntruder && hitTestObject(stMoveIntruder))
         {
            m_isHited = true;
            BattleFieldView.ms_tianshen83.play();
            if(a_1276.length > 0)
            {
               gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
            }
            if(a_1573 > 0)
            {
               stMoveIntruder.a_4208(b_182.a_432,a_1573);
            }
            this.a_4360(stMoveIntruder.m_stCurrentFieldGrid,stMoveIntruder);
         }
      }
      
      private function a_4360(stHitenFieldGrid:a_3491, stHitenMouseIntruder:a_4206) : void
      {
         var stFieldGrid:a_3491 = null;
         var j:int = 0;
         var arrMouveIntruder:Array = null;
         var stMouseIntruder:a_4206 = null;
         var HurtPower:int = 0;
         this.x = (0.5 + stHitenFieldGrid.m_iXGridNo) * a_3491.a_1080;
         this.y = (stHitenFieldGrid.m_iYGridNo - 0.5) * a_3491.a_1081 + 10;
         var lx:int = stHitenFieldGrid.m_iXGridNo - 2;
         var rx:int = stHitenFieldGrid.m_iXGridNo + 2;
         var dy:int = stHitenFieldGrid.m_iYGridNo - 2;
         var uy:int = stHitenFieldGrid.m_iYGridNo + 2;
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
                     if(null != stMouseIntruder && (!stMouseIntruder.isCannotSeeByFighter || stMouseIntruder.iSpaceState == 1))
                     {
                        HurtPower = GetFinalDamage();
                        if(stMouseIntruder.iLifeValue - HurtPower <= 0)
                        {
                           stMouseIntruder.PowerfulBombReduceLifeRate2(HurtPower / 900,[103]);
                        }
                        else
                        {
                           stMouseIntruder.ReduceLife2(int(HurtPower),[103]);
                        }
                        if(stMouseIntruder.iLifeValue > 0)
                        {
                           stMouseIntruder.a_4208(b_182.a_435,20);
                        }
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
         if(-1 == ms_arrShot.indexOf(this))
         {
            ms_arrShot.push(this);
         }
         super.a_3940();
         return true;
      }
   }
}

