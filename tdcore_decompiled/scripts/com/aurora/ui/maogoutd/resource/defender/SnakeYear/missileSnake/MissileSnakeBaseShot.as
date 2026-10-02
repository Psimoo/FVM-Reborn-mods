package com.aurora.ui.maogoutd.resource.defender.SnakeYear.missileSnake
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class MissileSnakeBaseShot extends a_4348
   {
      
      private static var ms_stMissileSnakeBaseShotVector:Array = new Array();
      
      public var a_1598:a_3491;
      
      public var m_iShotSequence:int;
      
      private var m_iXGridNo:int;
      
      public function MissileSnakeBaseShot()
      {
         super();
         a_1279 = -30;
         m_iYDisplayCenterPos = -27;
         a_1573 = 1;
         a_1576 = true;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 2;
      }
      
      public static function a_4344() : a_4348
      {
         var stMissileSnakeBaseShot:MissileSnakeBaseShot = ms_stMissileSnakeBaseShotVector.pop();
         if(null == stMissileSnakeBaseShot)
         {
            stMissileSnakeBaseShot = new MissileSnakeBaseShot();
         }
         BattleFieldView.a_1017.play();
         return stMissileSnakeBaseShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return MissileSnakeBaseShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         a_1447 = 0;
         m_numXSpeed *= -1;
         this.m_iShotSequence = 0;
         a_1275 = 0;
         this.m_iXGridNo = BattleFieldView.a_1011 - 2;
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
         else
         {
            this.a_3940();
         }
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == ms_stMissileSnakeBaseShotVector.indexOf(this))
         {
            ms_stMissileSnakeBaseShotVector.push(this);
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
         var elapsedTime:int = iCurrentTime - a_1447;
         if(elapsedTime < 20)
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
                  x = (this.m_iXGridNo + 0.5) * a_3491.a_1080;
               }
               else
               {
                  x = BattleFieldView.a_1013 - (this.m_iXGridNo + 0.5) * a_3491.a_1080;
               }
            }
         }
         else
         {
            visible = true;
            if(a_1275 != 1)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
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
         if(x < 0 || x >= BattleFieldView.a_1013 || y > a_3491.a_1081 * (a_1584.m_iYGridNo + 1))
         {
            trace("x < 0 || x >= BattleFieldView.ms_iBattleFieldWidth, HitTest failed. x:" + x + ", BattleFieldView.ms_iBattleFieldWidth:" + BattleFieldView.a_1013);
            this.a_3940();
            return;
         }
         stFieldGrid = this.a_1598.m_stCurrentBattbleFieldView.a_3438(this.m_iXGridNo,a_1584.m_iYGridNo);
         if(y > stFieldGrid.m_iYGridNo * a_3491.a_1081)
         {
            y = (stFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081 + 10;
            this.a_4360(stFieldGrid);
            m_isHited = true;
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
                     if(!stMouseIntruder.IsElite)
                     {
                        stMouseIntruder.a_4210();
                     }
                     else
                     {
                        stMouseIntruder.PowerfulBombReduceLifeRate(GetFinalDamage() / 900,true);
                     }
                  }
               }
            }
         }
      }
   }
}

