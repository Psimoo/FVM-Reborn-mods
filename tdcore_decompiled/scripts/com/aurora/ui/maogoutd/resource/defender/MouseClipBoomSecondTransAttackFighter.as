package com.aurora.ui.maogoutd.resource.defender
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import flash.display.FrameLabel;
   
   public class MouseClipBoomSecondTransAttackFighter extends a_3960
   {
      
      protected var a_1386:int;
      
      public function MouseClipBoomSecondTransAttackFighter()
      {
         super();
         gotoAndStop((a_1276[2] as FrameLabel).frame);
         a_1095 = 25;
         a_1332 = true;
         m_iBoomType = 1;
      }
      
      public static function a_3926() : a_3960
      {
         return PoolManager.getInstance().CheckOutOne(MouseClipBoomSecondTransAttackFighter) as MouseClipBoomSecondTransAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return MouseClipBoomSecondTransAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         this.a_1386 = 300 - this.a_3965();
         super.a_1797(stFieldGrid);
         a_1340 = true;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return 300;
      }
      
      override public function a_3961(iCurrentTime:int) : Boolean
      {
         var stMoveIntruder:a_4206 = null;
         var stFieldGridVector:Array = null;
         var yStart:int = 0;
         var xStart:int = 0;
         var yEnd:int = 0;
         var xEnd:int = 0;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var arrMoveIntruder:Array = null;
         super.a_3961(iCurrentTime);
         --this.a_1386;
         if(this.a_1386 == 0)
         {
            BattleFieldView.a_1033.play();
            a_1275 = 2;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
            a_1340 = false;
         }
         if(a_1275 == 2 && a_1334.a_1511.length > 0)
         {
            for each(stMoveIntruder in a_1334.a_1511)
            {
               if(0 == stMoveIntruder.iSpaceState || 1 == stMoveIntruder.iSpaceState || 3 == stMoveIntruder.iSpaceState)
               {
                  a_1275 = 3;
                  gotoAndStop((a_1276[3] as FrameLabel).frame);
                  break;
               }
            }
         }
         if(a_1273 == a_1274 - 7 && a_1329 == iCurrentTime)
         {
            BattleFieldView.a_1049.play();
            a_1334.m_stCurrentBattbleFieldView.a_3466();
            stFieldGridVector = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
            yStart = a_1334.m_iYGridNo - 1 < 0 ? 0 : int(a_1334.m_iYGridNo - 1);
            xStart = a_1334.m_iXGridNo - 2 < 0 ? 0 : int(a_1334.m_iXGridNo - 2);
            yEnd = a_1334.m_iYGridNo + 1 >= BattleFieldView.a_1012 ? int(BattleFieldView.a_1012 - 1) : int(a_1334.m_iYGridNo + 1);
            xEnd = a_1334.m_iXGridNo + 1 >= BattleFieldView.a_1011 ? int(BattleFieldView.a_1011 - 1) : int(a_1334.m_iXGridNo + 1);
            for(yIndex = yStart; yIndex <= yEnd; yIndex++)
            {
               for(xIndex = xStart; xIndex <= xEnd; xIndex++)
               {
                  arrMoveIntruder = stFieldGridVector[yIndex][xIndex].a_1511.slice();
                  for each(stMoveIntruder in arrMoveIntruder)
                  {
                     stMoveIntruder.a_4210();
                  }
               }
            }
         }
         if(a_1273 == a_1274)
         {
            super.a_3969(a_1339);
         }
         return true;
      }
      
      override protected function a_3965() : int
      {
         if(a_1094 == 15)
         {
            return 280;
         }
         if(a_1094 == 16)
         {
            return 290;
         }
         return 20 * a_1094;
      }
   }
}

