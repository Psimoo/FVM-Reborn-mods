package com.aurora.ui.maogoutd.resource.defender.PigYear.throwPig
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class ThrowPigBaseDefenceShot extends a_4348
   {
      
      private var a_1595:a_4206;
      
      private var a_1596:int;
      
      public var a_1334:a_3491;
      
      public function ThrowPigBaseDefenceShot()
      {
         super();
         a_1279 = 0;
         a_1573 = 1;
         a_1574 = 0;
         a_1576 = true;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 0;
      }
      
      public static function a_4344() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(ThrowPigBaseDefenceShot,ThrowPigBaseDefenceShotMovie) as ThrowPigBaseDefenceShot;
      }
      
      public static function GetFreeShot1() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(ThrowPigBaseDefenceShot,ThrowPigBaseDefenceShot1Movie) as ThrowPigBaseDefenceShot;
      }
      
      public static function GetFreeShot2() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(ThrowPigBaseDefenceShot,ThrowPigBaseDefenceShot2Movie) as ThrowPigBaseDefenceShot;
      }
      
      override protected function a_4349() : Boolean
      {
         var iXGridNo:int = 0;
         var stFieldGrid:a_3491 = null;
         var stMoveIntrude:a_4206 = null;
         var arrMoveIntruder:Array = null;
         var iIntruderIndex:int = 0;
         var numDistance:Number = NaN;
         a_1588 = true;
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
         }
         else
         {
            iXGridNo = int(x / a_3491.a_1080);
         }
         for(var i:int = iXGridNo; i < BattleFieldView.a_1011; i++)
         {
            stFieldGrid = a_1583.a_3438(i,m_iYGridNo);
            if(Boolean(stFieldGrid) && stFieldGrid.a_1511.length > 0)
            {
               arrMoveIntruder = stFieldGrid.a_1511;
               if(stFieldGrid.m_stCurrentBattbleFieldView.iIntruderMoveDirection > 0)
               {
                  arrMoveIntruder.sortOn("x",Array.DESCENDING | Array.NUMERIC);
               }
               else
               {
                  arrMoveIntruder.sortOn("x",Array.NUMERIC);
               }
               for(iIntruderIndex = 0; iIntruderIndex < stFieldGrid.a_1511.length; iIntruderIndex++)
               {
                  if((arrMoveIntruder[iIntruderIndex] as a_4206).iSpaceState == 0)
                  {
                     stMoveIntrude = arrMoveIntruder[0];
                     break;
                  }
               }
            }
            if(stMoveIntrude)
            {
               break;
            }
         }
         if(stMoveIntrude)
         {
            numDistance = Math.abs(stMoveIntrude.x - x) - 0.2 * stMoveIntrude.width - 60;
            a_1581 = Math.abs(int(numDistance / m_numXSpeed));
            if(numDistance < 2 * a_3491.a_1080)
            {
               if(a_1581 < 4)
               {
                  a_1581 = 4;
               }
               m_numYSpeed = a_3491.a_1081 * (m_iYGridNo + 0.6) / a_1581;
            }
            else
            {
               m_numYSpeed = 3 * a_3491.a_1081 / a_1581;
            }
         }
         return true;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier,iThreeRowShotType);
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         var numYMove:Number = NaN;
         if(m_isHited)
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
         a_4351();
         if(a_1578)
         {
            if(!FollowingShotHandle())
            {
               return;
            }
         }
         x += m_numXSpeed;
         if(a_1576)
         {
            numYMove = 2 * m_numYSpeed * (iCurrentTime - a_1447) / a_1581 - m_numYSpeed;
            y += numYMove > 30 ? 30 : numYMove;
         }
      }
      
      override public function a_4352(baseMoveIntruder:a_4206) : Boolean
      {
         m_bActive.Value = false;
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
         if(Boolean(baseMoveIntruder) && baseMoveIntruder.iLifeValue > 0)
         {
            baseMoveIntruder.a_4208(b_182.a_435,40);
         }
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this.a_1595 = null;
         this.a_1596 = -1;
         return true;
      }
   }
}

