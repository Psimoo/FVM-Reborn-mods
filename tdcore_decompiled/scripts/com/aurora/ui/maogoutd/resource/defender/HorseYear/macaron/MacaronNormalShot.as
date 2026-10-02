package com.aurora.ui.maogoutd.resource.defender.HorseYear.macaron
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class MacaronNormalShot extends a_4348
   {
      
      public var a_1598:a_3491;
      
      public var m_iShotSequence:int;
      
      private var m_iTrans:int = 0;
      
      public function MacaronNormalShot()
      {
         super();
         a_1279 = -width * 0;
         a_1573 = 1;
         a_1576 = false;
         m_isShotHighSkySpace = true;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 1;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         a_1447 = 0;
         m_numXSpeed *= -1;
         a_1275 = 0;
         a_1587 = 1;
         gotoAndStop(1);
         this.m_iShotSequence = 0;
         return true;
      }
      
      public function InitData(trans:int) : void
      {
         this.m_iTrans = trans;
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
      
      override public function a_4216(iCurrentTime:int) : void
      {
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
               x = this.a_1598.m_iXGridNo * a_3491.a_1080 + 0.5 * (a_3491.a_1080 - width);
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
               a_3940();
            }
         }
      }
      
      private function a_4373() : void
      {
         var stFieldGrid:a_3491 = null;
         if(x < 0 || x >= BattleFieldView.a_1013 || y > a_3491.a_1081 * (this.a_1598.m_iYGridNo + 1))
         {
            trace("x < 0 || x >= BattleFieldView.ms_iBattleFieldWidth, HitTest failed. x:" + x + ", BattleFieldView.ms_iBattleFieldWidth:" + BattleFieldView.a_1013);
            a_3940();
            return;
         }
         stFieldGrid = this.a_1598;
         if(y > stFieldGrid.m_iYGridNo * a_3491.a_1081)
         {
            m_isHited = true;
            if(!a_1283)
            {
               x = stFieldGrid.m_iXGridNo * a_3491.a_1080 + 30;
            }
            else
            {
               x = BattleFieldView.a_1013 - (stFieldGrid.m_iXGridNo * a_3491.a_1080 + (a_3491.a_1080 - width) / 2);
            }
            y = stFieldGrid.m_iYGridNo * a_3491.a_1081 + 20;
            MacaronDefence.CreateEffect(stFieldGrid,this.m_iTrans,a_1579);
            a_3940();
            return;
         }
      }
   }
}

