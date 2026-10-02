package com.aurora.ui.maogoutd.resource.shot
{
   import a_4718.b_180;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.energy.a_4157;
   import com.aurora.ui.maogoutd.resource.energy.a_4162;
   import flash.display.FrameLabel;
   
   public class AvatarSuperGrenadeShot extends a_4348
   {
      
      private static var ms_stAvatarSuperGrenadeShotVector:Array = new Array();
      
      public var a_1598:a_3491;
      
      public var m_iTransEnergyCount:int = 5;
      
      public function AvatarSuperGrenadeShot()
      {
         super();
         a_1279 = -width * 0.3;
         a_1573 = 1;
         a_1576 = true;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 1;
      }
      
      public static function a_4344() : a_4348
      {
         var stAvatarSuperGrenadeShot:AvatarSuperGrenadeShot = ms_stAvatarSuperGrenadeShotVector.pop();
         if(null == stAvatarSuperGrenadeShot)
         {
            stAvatarSuperGrenadeShot = new AvatarSuperGrenadeShot();
         }
         BattleFieldView.a_1017.play();
         return stAvatarSuperGrenadeShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return AvatarSuperGrenadeShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         a_1447 = 0;
         m_numXSpeed *= -1;
         a_1275 = 0;
         a_1587 = 1;
         gotoAndStop(1);
         return true;
      }
      
      override protected function a_4349() : Boolean
      {
         var iXGridNo:int = 0;
         var stFieldGrid:a_3491 = null;
         var iTargetPos:int = 0;
         var numDistance:Number = NaN;
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
         }
         else
         {
            iXGridNo = int(x / a_3491.a_1080);
         }
         if(this.a_1598)
         {
            iTargetPos = a_1283 ? int(BattleFieldView.a_1013 - a_3491.a_1080 * (this.a_1598.m_iXGridNo + 0.5)) : int(a_3491.a_1080 * (this.a_1598.m_iXGridNo + 0.5));
            numDistance = Math.abs(iTargetPos - x);
            a_1581 = Math.abs(int(numDistance / m_numXSpeed));
            if(numDistance < a_3491.a_1080)
            {
               if(a_1581 < 2)
               {
                  a_1581 = 2;
               }
               m_numYSpeed = 0.5 * numDistance / a_1581;
            }
            else
            {
               m_numYSpeed = 3 * a_3491.a_1081 / a_1581;
            }
         }
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == ms_stAvatarSuperGrenadeShotVector.indexOf(this))
         {
            ms_stAvatarSuperGrenadeShotVector.push(this);
         }
         this.m_iTransEnergyCount = 5;
         return true;
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
         if(iCurrentTime - a_1447 < 40)
         {
            if(y > -40)
            {
               y -= 30;
            }
            else if(visible)
            {
               visible = false;
               if(!a_1283)
               {
                  x = this.a_1598.m_iXGridNo * a_3491.a_1080 + 0.5 * (a_3491.a_1080 - width);
               }
               else
               {
                  x = BattleFieldView.a_1013 - (this.a_1598.m_iXGridNo * a_3491.a_1080 + (a_3491.a_1080 - width) * 0.5);
               }
               a_1275 = 0;
               gotoAndStop((a_1276[0] as FrameLabel).frame);
            }
         }
         else
         {
            visible = true;
            if(y < BattleFieldView.a_1014)
            {
               y += 30;
               this.a_4373();
            }
            else
            {
               this.a_3940();
            }
         }
      }
      
      private function a_4373() : void
      {
         var stFieldGrid:a_3491 = null;
         if(x < 0 || x >= BattleFieldView.a_1013 || y > a_3491.a_1081 * (this.a_1598.m_iYGridNo + 1))
         {
            trace("x < 0 || x >= BattleFieldView.ms_iBattleFieldWidth, HitTest failed. x:" + x + ", BattleFieldView.ms_iBattleFieldWidth:" + BattleFieldView.a_1013);
            this.a_3940();
            return;
         }
         stFieldGrid = this.a_1598;
         if(y > stFieldGrid.m_iYGridNo * a_3491.a_1081)
         {
            this.a_4360(stFieldGrid);
            m_isHited = true;
            gotoAndStop(1);
            if(!a_1283)
            {
               x = stFieldGrid.m_iXGridNo * a_3491.a_1080 + (a_3491.a_1080 - width) * 0.5;
            }
            else
            {
               x = BattleFieldView.a_1013 - (stFieldGrid.m_iXGridNo * a_3491.a_1080 + (a_3491.a_1080 - width) / 2);
            }
            y = stFieldGrid.m_iYGridNo * a_3491.a_1081 + 20;
            if(a_1276.length > 0)
            {
               gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
            }
            return;
         }
      }
      
      private function a_4360(stHitenFieldGrid:a_3491) : void
      {
         var stFieldGrid:a_3491 = null;
         var stFreeEnergy:a_4157 = null;
         var iDropEnergyValue:int = 0;
         var j:int = 0;
         var arrMouveIntruder:Array = null;
         var stMouseIntruder:a_4206 = null;
         if(this.m_iTransEnergyCount > 0)
         {
            stFreeEnergy = a_4162.getInstance().a_4163(b_180.a_420);
            if(null != stFreeEnergy)
            {
               iDropEnergyValue = stHitenFieldGrid.m_stCurrentBattbleFieldView.isOwnBattleField ? this.m_iTransEnergyCount : 5;
               stFreeEnergy.m_stCurrentBattleField = stHitenFieldGrid.m_stCurrentBattbleFieldView;
               stFreeEnergy.a_1797(0,iDropEnergyValue,a_3491.a_1080 * stHitenFieldGrid.m_iXGridNo + Math.random() * 30 - 30,a_3491.a_1081 * stHitenFieldGrid.m_iYGridNo + Math.random() * 20 - 30);
               stHitenFieldGrid.m_stCurrentBattbleFieldView.addChild(stFreeEnergy);
            }
         }
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
                     if(stMouseIntruder)
                     {
                        stMouseIntruder.a_4209(a_1579);
                     }
                  }
               }
            }
         }
      }
   }
}

