package com.aurora.ui.maogoutd.resource.shot.StarStaff
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   
   public class AvatarStarStaffSecondShot extends a_4348
   {
      
      private static var ms_arrShot:Array = new Array();
      
      public var m_numSputteringRate:Number = 0;
      
      public var m_range:int = 0;
      
      public var m_GemFlag:Boolean;
      
      public var a_1598:a_3491;
      
      private var a_1607:a_4206;
      
      private var m_MouseArr:Array = new Array(8388649,8392745,8389221);
      
      public function AvatarStarStaffSecondShot()
      {
         super();
         a_1279 = -14.5;
         m_iYDisplayCenterPos = -246;
         a_1574 = 0;
         a_1573 = 1;
         a_1578 = true;
         m_isShotHighSkySpace = true;
         m_isHited = true;
      }
      
      public static function a_4344() : AvatarStarStaffSecondShot
      {
         var stShot:AvatarStarStaffSecondShot = ms_arrShot.pop();
         if(null == stShot)
         {
            stShot = new AvatarStarStaffSecondShot();
         }
         return stShot;
      }
      
      public function get stTargetMouseMoveIntruder() : a_4206
      {
         return this.a_1607;
      }
      
      public function set stTargetMouseMoveIntruder(value:a_4206) : void
      {
         this.a_1607 = value;
         this.a_1598 = this.a_1607.m_stCurrentFieldGrid;
      }
      
      override protected function getBindMovie() : Class
      {
         return AvatarStarStaffSecondShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         var pox:int = 0;
         var poy:int = 0;
         if(null != this.a_1607 && this.a_1607.iLifeValue > 0)
         {
            pox = this.a_1607.x + this.a_1607.stDisplayBitmap.x + this.a_1607.width / 2;
            poy = this.a_1607.y + this.a_1607.stDisplayBitmap.y + this.a_1607.height - 15;
         }
         else
         {
            if(this.a_1598 == null)
            {
               this.a_3940();
               return false;
            }
            pox = this.a_1598.m_iXGridNo * a_3491.a_1080 + 30;
            poy = this.a_1598.m_iYGridNo * a_3491.a_1081 + 34;
         }
         super.a_1797(iGlobalID,numSpeed,iHurtPower,pox,poy,stCurrentBattleView,this.a_1598,isBothWayShot,numHotMultiplier);
         m_isHited = true;
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(m_isHited && !m_isPenetrate)
         {
            if(iCurrentTime % 1 == 0)
            {
               nextFrame();
               if(a_1273 == 5)
               {
                  this.a_4360(this.a_1598);
               }
               else if(a_1273 == a_1274)
               {
                  m_bActive.Value = false;
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
         var randomNum:int = 0;
         var HurtPower:int = 0;
         for(var i:int = stHitenFieldGrid.m_iXGridNo - this.m_range; i <= stHitenFieldGrid.m_iXGridNo + this.m_range; i++)
         {
            for(j = stHitenFieldGrid.m_iYGridNo - this.m_range; j <= stHitenFieldGrid.m_iYGridNo + this.m_range; j++)
            {
               stFieldGrid = a_1583.a_3438(i,j);
               if(null != stFieldGrid)
               {
                  arrMouveIntruder = stFieldGrid.a_1511.slice();
                  for each(stMouseIntruder in arrMouveIntruder)
                  {
                     if(stMouseIntruder == this.a_1607 || !stMouseIntruder.isCannotSeeByFighter)
                     {
                        HurtPower = stMouseIntruder == this.a_1607 ? a_1579 : int(a_1579 * this.m_numSputteringRate);
                        if(stMouseIntruder.iLifeValue - HurtPower <= 0 && this.m_GemFlag)
                        {
                           stMouseIntruder.PowerfulBombReduceLifeRate3(HurtPower / 900,true,[102]);
                        }
                        else
                        {
                           stMouseIntruder.ReduceLifeIgnoreArmor2(int(HurtPower),[102]);
                        }
                     }
                     randomNum = BattleFieldView.m_stRandomSeed.nextInt(100) + 1;
                     if(randomNum <= 5)
                     {
                        if(Boolean(stMouseIntruder) && Boolean(stMouseIntruder.parent) && stMouseIntruder.iLifeValue > 0)
                        {
                           stMouseIntruder.a_4208(b_182.a_435,15);
                           stMouseIntruder.a_4208(b_182.enm_shotEffectXuanYun,15);
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
               baseMoveIntruder.ReduceLifeIgnoreArmor2(0.3 * GetFinalDamage(),[102]);
            }
            else
            {
               baseMoveIntruder.ReduceLifeIgnoreArmor2(GetFinalDamage(),[102]);
            }
         }
         else if(ms_iCritFrameLable == 2)
         {
            baseMoveIntruder.ReduceLife2(0.3 * GetFinalDamage(),[102]);
         }
         else
         {
            baseMoveIntruder.ReduceLife2(GetFinalDamage(),[102]);
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

