package com.aurora.ui.maogoutd.resource.defender.RabbitYear.EggRabbit
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class EggRabbitShot extends a_4348
   {
      
      private static var ms_stEggRabbitShotVector:Array = new Array();
      
      private var a_1598:a_3491;
      
      public function EggRabbitShot()
      {
         super();
         a_1279 = -413;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 0;
      }
      
      public static function a_4344() : a_4348
      {
         var stEggRabbitShot:EggRabbitShot = ms_stEggRabbitShotVector.pop();
         if(null == stEggRabbitShot)
         {
            stEggRabbitShot = new EggRabbitShot();
         }
         return stEggRabbitShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return EggRabbitShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         a_1447 = 0;
         m_numYSpeed = 0;
         m_numXSpeed = m_numXSpeed;
         m_isPenetrate = true;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == ms_stEggRabbitShotVector.indexOf(this))
         {
            ms_stEggRabbitShotVector.push(this);
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(a_1588)
         {
            nextFrame();
            if(a_1273 == a_1276[0].frame - 1 || a_1278 != null)
            {
               a_1275 = 0;
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            if(a_1273 == a_1274 || a_1278 != null)
            {
               a_1275 = 0;
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
         }
         if(0 == a_1447)
         {
            a_1447 = iCurrentTime;
         }
         this.a_4373();
         x += m_numXSpeed;
         y += m_numYSpeed;
      }
      
      private function a_4373() : void
      {
         var iXGridNo:int = 0;
         var arrMoveIntruder:Array = null;
         var iArrMoveIntruderLength:int = 0;
         var stMoveIntruder:a_4206 = null;
         var i:int = 0;
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
         }
         else
         {
            iXGridNo = int(x / a_3491.a_1080);
         }
         var xx:int = int(y / a_3491.a_1081);
         var iYGridNo:int = m_iYGridNo;
         if(x < 0 || x >= BattleFieldView.a_1013 || y + 30 > a_3491.a_1081 * (m_iYGridNo + 1))
         {
            this.a_3940();
            return;
         }
         var stFieldGrid:a_3491 = a_1583.a_3438(iXGridNo,iYGridNo);
         if(stFieldGrid == null)
         {
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
                  if(m_isPenetrate && m_HitMouseArray.indexOf(stMoveIntruder) == -1)
                  {
                     if(Boolean(a_1583) && a_1583.isOwnBattleField)
                     {
                        BattleFieldView.a_1045.play();
                     }
                     m_HitMouseArray.push(stMoveIntruder);
                     a_4352(stMoveIntruder);
                     m_isHited = true;
                     if(a_1276.length > 0)
                     {
                        gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
                     }
                     return;
                  }
                  if(!m_isPenetrate)
                  {
                     if(Boolean(a_1583) && a_1583.isOwnBattleField)
                     {
                        BattleFieldView.a_1045.play();
                     }
                     a_4352(stMoveIntruder);
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
}

