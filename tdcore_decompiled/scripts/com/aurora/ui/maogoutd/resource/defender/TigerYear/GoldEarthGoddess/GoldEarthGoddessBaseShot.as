package com.aurora.ui.maogoutd.resource.defender.TigerYear.GoldEarthGoddess
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   import flash.geom.Point;
   
   public class GoldEarthGoddessBaseShot extends a_4348
   {
      
      private var a_1607:a_4206;
      
      public var a_1598:a_3491;
      
      private var stTempPosition:Point;
      
      public function GoldEarthGoddessBaseShot()
      {
         super();
         a_1573 = 2;
         a_1576 = true;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 1;
      }
      
      public static function a_4344() : GoldEarthGoddessBaseShot
      {
         return PoolManager.getInstance().CheckOutOne(GoldEarthGoddessBaseShot,GoldEarthGoddessBaseShotMovie) as GoldEarthGoddessBaseShot;
      }
      
      public static function GetFreeShot1() : GoldEarthGoddessBaseShot
      {
         return PoolManager.getInstance().CheckOutOne(GoldEarthGoddessBaseShot,GoldEarthGoddessFirstShotMovie) as GoldEarthGoddessBaseShot;
      }
      
      public static function GetFreeShot2() : GoldEarthGoddessBaseShot
      {
         return PoolManager.getInstance().CheckOutOne(GoldEarthGoddessBaseShot,GoldEarthGoddessSecondShotMovie) as GoldEarthGoddessBaseShot;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         this.stTempPosition = new Point((stStartFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080,(stStartFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081);
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         a_1447 = 0;
         m_numXSpeed *= -1;
         gotoAndStop(1);
         return true;
      }
      
      override protected function a_4349() : Boolean
      {
         var stMoveIntruder:a_4206 = null;
         var tempMoveIntrude:a_4206 = null;
         var stRowIntruderArray:Array = new Array();
         for each(stMoveIntruder in a_1583.m_arrBaseMoveIntruderVector)
         {
            if(stMoveIntruder.iLifeValue > 0 && (stMoveIntruder.iSpaceState != 0 || !stMoveIntruder.isCannotSeeByFighter) && stMoveIntruder.m_stCurrentFieldGrid.m_iYGridNo == m_iYGridNo)
            {
               stRowIntruderArray.push(stMoveIntruder);
            }
         }
         stRowIntruderArray.sort(this.OnSortToken);
         if(stRowIntruderArray.length > 0)
         {
            tempMoveIntrude = stRowIntruderArray[0];
         }
         else
         {
            for each(stMoveIntruder in a_1583.m_arrBaseMoveIntruderVector)
            {
               if(stMoveIntruder.iLifeValue > 0 && (stMoveIntruder.iSpaceState != 0 || !stMoveIntruder.isCannotSeeByFighter) && (stMoveIntruder.m_stCurrentFieldGrid.m_iYGridNo == m_iYGridNo - 1 || stMoveIntruder.m_stCurrentFieldGrid.m_iYGridNo == m_iYGridNo + 1))
               {
                  stRowIntruderArray.push(stMoveIntruder);
               }
            }
            stRowIntruderArray.sort(this.OnSortToken);
            if(stRowIntruderArray.length > 0)
            {
               tempMoveIntrude = stRowIntruderArray[0];
            }
         }
         if(tempMoveIntrude)
         {
            this.a_1598 = a_1583.a_3438(tempMoveIntrude.m_stCurrentFieldGrid.m_iXGridNo,m_iYGridNo);
         }
         else
         {
            this.a_1598 = a_1583.a_3438(7,m_iYGridNo);
         }
         return true;
      }
      
      private function OnSortToken(a:a_4206, b:a_4206) : int
      {
         if(this.stTempPosition == null)
         {
            return 0;
         }
         var aMouseY:Number = a.y + a.stDisplayBitmap.y + a.height / 2;
         var aMouseX:Number = a.x + a.stDisplayBitmap.x + a.width / 2;
         var bMouseY:Number = b.y + b.stDisplayBitmap.y + b.height / 2;
         var bMouseX:Number = b.x + a.stDisplayBitmap.x + b.width / 2;
         var disa:Number = Point.distance(this.stTempPosition,new Point(aMouseX,aMouseY));
         var disb:Number = Point.distance(this.stTempPosition,new Point(bMouseX,bMouseY));
         if(Math.abs(disa) < Math.abs(disb))
         {
            return -1;
         }
         if(Math.abs(disa) > Math.abs(disb))
         {
            return 1;
         }
         return 0;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(m_isHited && !m_isPenetrate)
         {
            nextFrame();
            if(a_1273 == 7)
            {
               this.a_3961();
            }
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
         if(iCurrentTime - a_1447 < 40)
         {
            if(y > -110)
            {
               y -= 20;
            }
            else if(visible)
            {
               visible = false;
            }
         }
         else if(this.a_1598)
         {
            visible = true;
            if(!a_1283)
            {
               x = this.a_1598.m_iXGridNo * a_3491.a_1080 + 0.5 * (a_3491.a_1080 - width);
            }
            else
            {
               x = BattleFieldView.a_1013 - (this.a_1598.m_iXGridNo * a_3491.a_1080 + (a_3491.a_1080 - width) * 0.5);
            }
            y += 30;
            this.a_4373();
         }
         else
         {
            this.a_3940();
         }
      }
      
      private function a_4373() : void
      {
         if(y > this.a_1598.m_iYGridNo * a_3491.a_1081 - 100)
         {
            m_isHited = true;
            if(a_1276.length > 0)
            {
               gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
            }
            return;
         }
      }
      
      private function a_3961() : void
      {
         this.a_4360(this.a_1598);
      }
      
      private function a_4360(stHitenFieldGrid:a_3491) : void
      {
         var stFieldGrid:a_3491 = null;
         var j:int = 0;
         var arrMouveIntruder:Array = null;
         var stMouseIntruder:a_4206 = null;
         var power:int = 0;
         if(stHitenFieldGrid == null)
         {
            return;
         }
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
                     if(null != stMouseIntruder && (stMouseIntruder.iSpaceState != 0 || !stMouseIntruder.isCannotSeeByFighter))
                     {
                        stMouseIntruder.a_4210();
                        power = GetFinalDamage();
                        stMouseIntruder.PowerfulBombReduceLifeRate((power - 900) / 900);
                        if(m_isSpecial >= 1)
                        {
                           if(stMouseIntruder.iLifeValue > 0)
                           {
                              stMouseIntruder.a_4208(b_182.enm_shotEffectXuanYun,20);
                           }
                        }
                     }
                  }
               }
            }
         }
         BattleFieldView.ms_dadinvshen85.play();
      }
      
      override public function a_4352(baseMoveIntruder:a_4206) : Boolean
      {
         m_bActive.Value = false;
         if(a_1576 || a_1575)
         {
            if(ms_iCritFrameLable == 2)
            {
               baseMoveIntruder.a_4209(0.3 * GetFinalDamage());
            }
            else
            {
               baseMoveIntruder.a_4209(GetFinalDamage());
            }
         }
         else if(ms_iCritFrameLable == 2)
         {
            baseMoveIntruder.a_3969(0.3 * GetFinalDamage());
         }
         else
         {
            baseMoveIntruder.a_3969(GetFinalDamage());
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

