package com.aurora.ui.maogoutd.resource.shot
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class AvatarMoonlitMeteorShot extends a_4348
   {
      
      public var m_numSputteringRate:Number = 0;
      
      public var a_1598:a_3491;
      
      public var a_1607:a_4206;
      
      private var m_MouseArr:Array = new Array(8388649,8392745,8389221);
      
      public function AvatarMoonlitMeteorShot()
      {
         super();
         a_1279 = -width * 0.5;
         m_iYDisplayCenterPos = -320;
         a_1574 = 0;
         a_1573 = 1;
         a_1578 = true;
         m_isShotHighSkySpace = true;
         a_1576 = false;
         a_1577 = false;
      }
      
      public static function a_4344() : AvatarMoonlitMeteorShot
      {
         return PoolManager.getInstance().CheckOutOne(AvatarMoonlitMeteorShot,AvatarMoonlitMeteorShotMovie) as AvatarMoonlitMeteorShot;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         if(null == this.a_1607)
         {
            this.a_3940();
            return false;
         }
         var pox:int = this.a_1607.x;
         var poy:int = this.a_1607.y + 0.5 * this.a_1607.height + 14;
         this.a_1598 = this.a_1607.m_stCurrentFieldGrid;
         if(this.a_1598 == null)
         {
            this.a_3940();
            return false;
         }
         super.a_1797(iGlobalID,numSpeed,iHurtPower,pox,poy,stCurrentBattleView,this.a_1598,isBothWayShot,numHotMultiplier);
         a_1447 = 0;
         m_numXSpeed *= -1;
         a_1275 = 0;
         a_1587 = 0;
         a_1574 = 0;
         gotoAndStop(1);
         a_1578 = false;
         m_isShotHighSkySpace = true;
         a_1576 = false;
         a_1577 = false;
         a_1573 = 1;
         m_isHited = true;
         stStartFieldGrid.m_stCurrentBattbleFieldView.a_3431();
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         var arrMouveIntruder:Array = null;
         var stMouseIntruder:a_4206 = null;
         if(m_isHited)
         {
            if(iCurrentTime % 2 == 0)
            {
               nextFrame();
               if(a_1273 == a_1274 || a_1278 != null)
               {
                  m_bActive.Value = false;
                  arrMouveIntruder = this.a_1598.a_1511.slice();
                  for each(stMouseIntruder in arrMouveIntruder)
                  {
                     if(!stMouseIntruder.isCannotSeeByFighter && (0 == stMouseIntruder.iSpaceState || 2 == stMouseIntruder.iSpaceState))
                     {
                        stMouseIntruder.a_4209(int(a_1579));
                     }
                  }
                  this.a_4360(this.a_1598);
                  this.a_3940();
               }
            }
            return;
         }
         if(a_1588)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               m_bActive.Value = false;
               this.a_3940();
            }
         }
         if(0 == a_1447)
         {
            a_1447 = iCurrentTime;
         }
      }
      
      private function a_4360(stHitenFieldGrid:a_3491) : void
      {
         var stFieldGrid:a_3491 = null;
         var j:int = 0;
         var arrMouveIntruder:Array = null;
         var stMouseIntruder:a_4206 = null;
         for(var i:int = stHitenFieldGrid.m_iXGridNo - 1; i <= stHitenFieldGrid.m_iXGridNo + 1; i++)
         {
            for(j = stHitenFieldGrid.m_iYGridNo - 1; j <= stHitenFieldGrid.m_iYGridNo + 1; j++)
            {
               stFieldGrid = a_1583.a_3438(i,j);
               if(null != stFieldGrid)
               {
                  arrMouveIntruder = stFieldGrid.a_1511.slice();
                  for each(stMouseIntruder in arrMouveIntruder)
                  {
                     if(!stMouseIntruder.isCannotSeeByFighter && (0 == stMouseIntruder.iSpaceState || 2 == stMouseIntruder.iSpaceState))
                     {
                        stMouseIntruder.a_4209(int(a_1579 * this.m_numSputteringRate));
                     }
                     if(Math.random() * 100 <= 10)
                     {
                        if(this.m_MouseArr.indexOf(stMouseIntruder.m_stMoveIntruderTypeID) == -1)
                        {
                           stMouseIntruder.a_4208(b_182.a_435,30);
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

