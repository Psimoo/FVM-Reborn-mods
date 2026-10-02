package com.aurora.ui.maogoutd.resource.defender.TigerYear.WhirlTiger
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class WhirlTigerBaseShot extends a_4348
   {
      
      protected var a_1351:Array;
      
      private var moveSpeed:int;
      
      public var m_GoHeadArray:Array = new Array();
      
      public var m_GoBackArray:Array = new Array();
      
      public function WhirlTigerBaseShot()
      {
         super();
         this.a_1351 = [];
         a_1279 = 0;
         m_iYDisplayCenterPos = 40;
         a_1573 = 1;
         a_1575 = true;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 0;
         scaleX = scaleY = 0.9;
      }
      
      public static function a_4344() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(WhirlTigerBaseShot,WhirlTigerBaseShotMovie) as WhirlTigerBaseShot;
      }
      
      public static function GetFreeShot1() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(WhirlTigerBaseShot,WhirlTigerBaseShot1Movie) as WhirlTigerBaseShot;
      }
      
      public static function GetFreeShot2() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(WhirlTigerBaseShot,WhirlTigerBaseShot2Movie) as WhirlTigerBaseShot;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         m_isPenetrate = true;
         while(this.m_GoHeadArray.length > 0)
         {
            this.m_GoHeadArray.pop();
         }
         while(this.m_GoBackArray.length > 0)
         {
            this.m_GoBackArray.pop();
         }
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         this.a_1351 = [];
         super.a_3940();
         while(this.m_GoHeadArray.length > 0)
         {
            this.m_GoHeadArray.pop();
         }
         while(this.m_GoBackArray.length > 0)
         {
            this.m_GoBackArray.pop();
         }
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
         this.moveSpeed = m_numXSpeed < 0 ? int(2 * m_numXSpeed) : int(m_numXSpeed);
         x += this.moveSpeed;
      }
      
      override protected function a_4351() : void
      {
         var iXGridNo:int = 0;
         var arrMoveIntruder:Array = null;
         var iArrMoveIntruderLength:int = 0;
         var stMoveIntruder:a_4206 = null;
         var i:int = 0;
         if(x > BattleFieldView.a_1013 - 20 && m_numXSpeed > 0)
         {
            m_numXSpeed = -m_numXSpeed;
         }
         if(x < 0 || x > BattleFieldView.a_1013 + 10)
         {
            this.a_3940();
            return;
         }
         if(x <= a_3491.a_1080 * (a_1584.m_iXGridNo + 1) && m_numXSpeed < 0)
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
         var stFieldGrid:a_3491 = a_1583.a_3438(iXGridNo,iYGridNo);
         if(stFieldGrid == null)
         {
            m_bActive.Value = false;
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
                  if(m_numXSpeed < 0)
                  {
                     if(m_isPenetrate && this.m_GoBackArray.indexOf(stMoveIntruder) == -1)
                     {
                        if(Boolean(a_1583) && a_1583.isOwnBattleField)
                        {
                           BattleFieldView.a_1045.play();
                        }
                        this.m_GoBackArray.push(stMoveIntruder);
                        this.a_4352(stMoveIntruder);
                        return;
                     }
                  }
                  else if(m_isPenetrate && this.m_GoHeadArray.indexOf(stMoveIntruder) == -1)
                  {
                     if(Boolean(a_1583) && a_1583.isOwnBattleField)
                     {
                        BattleFieldView.a_1045.play();
                     }
                     this.m_GoHeadArray.push(stMoveIntruder);
                     this.a_4352(stMoveIntruder);
                     return;
                  }
               }
            }
         }
      }
      
      override public function a_4352(baseMoveIntruder:a_4206) : Boolean
      {
         if(m_numXSpeed < 0)
         {
            a_1325 = m_isSpecial == 3 ? 3 : 2;
         }
         else
         {
            a_1325 = 1;
         }
         if(!m_isPenetrate)
         {
            m_bActive.Value = false;
         }
         if(a_1576 || a_1575)
         {
            baseMoveIntruder.a_4209(GetFinalDamage());
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
         if(a_1325 > 5)
         {
            baseMoveIntruder.a_4208(b_182.a_433,0);
         }
         if(m_isShowColdSlow)
         {
            baseMoveIntruder.a_4208(b_182.a_433,150);
         }
         return true;
      }
   }
}

