package com.aurora.ui.maogoutd.resource.defender.PigYear.JadeHareLantern
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3960;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class JadeHareLanternFisrtBoomAttackFighter extends a_3960
   {
      
      protected var a_1386:int = 60;
      
      public function JadeHareLanternFisrtBoomAttackFighter()
      {
         super();
         a_1095 = JadeHareLanternDefence.DEFENSE_PRICE;
         a_1330 = 0;
         m_iBoomType = 1;
      }
      
      public static function a_3926() : a_3960
      {
         return PoolManager.getInstance().CheckOutOne(JadeHareLanternFisrtBoomAttackFighter) as JadeHareLanternFisrtBoomAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return JadeHareLanternFisrtBoomAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         this.a_1386 = 3 * 20;
         a_1339 = 300;
         a_1275 = 0;
         gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         return true;
      }
      
      override protected function a_3964() : int
      {
         return JadeHareLanternDefence.a_3964(a_1094);
      }
      
      override public function a_3961(iCurrentTime:int) : Boolean
      {
         var xStart:int = 0;
         var xEnd:int = 0;
         var yStart:int = 0;
         var yEnd:int = 0;
         var stFieldGridVector:Array = null;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         super.a_3961(iCurrentTime);
         --this.a_1386;
         if(this.a_1386 == 0)
         {
            BattleFieldView.a_1033.play();
            a_1275 = 1;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(a_1329 == iCurrentTime && a_1273 == a_1274 - 4)
         {
            BattleFieldView.a_1049.play();
            a_1334.m_stCurrentBattbleFieldView.a_3466();
            xStart = Math.max(a_1334.m_iXGridNo - 1,0);
            xEnd = Math.min(a_1334.m_iXGridNo + 1,BattleFieldView.a_1011 - 1);
            yStart = Math.max(a_1334.m_iYGridNo - 1,0);
            yEnd = Math.min(a_1334.m_iYGridNo + 1,BattleFieldView.a_1012 - 1);
            stFieldGridVector = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
            for(yIndex = yStart; yIndex <= yEnd; yIndex++)
            {
               for(xIndex = xStart; xIndex <= xEnd; xIndex++)
               {
                  arrMoveIntruder = stFieldGridVector[yIndex][xIndex].a_1511.slice();
                  for each(stMoveIntruder in arrMoveIntruder)
                  {
                     stMoveIntruder.a_3969(8000);
                     if(stMoveIntruder.iLifeValue <= 0 && Boolean(stMoveIntruder.m_stCurrentFieldGrid))
                     {
                        stMoveIntruder.a_4210();
                     }
                  }
               }
            }
         }
         if(a_1273 == a_1274)
         {
            this.addShot();
            super.a_3969(a_1339);
         }
         return true;
      }
      
      private function addShot() : void
      {
         var stStartField:a_3491 = null;
         var stLastWaitShot:a_4348 = null;
         var xIndex:int = 0;
         var iPosX:int = 0;
         var iPosY:int = 0;
         var power:int = 0;
         var xStart:int = Math.max(a_1334.m_iXGridNo - 1,0);
         var xEnd:int = Math.min(a_1334.m_iXGridNo + 1,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(a_1334.m_iYGridNo - 1,0);
         var yEnd:int = Math.min(a_1334.m_iYGridNo + 1,BattleFieldView.a_1012 - 1);
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               if(stStartField)
               {
                  stLastWaitShot = JadeHareLanternFisrtShot.a_4344();
                  iPosX = stStartField.m_iXGridNo * a_3491.a_1080 - 3;
                  iPosY = stStartField.m_iYGridNo * a_3491.a_1081 + 6;
                  power = xIndex == a_1334.m_iXGridNo + 1 ? 2000 : 1000;
                  stLastWaitShot.a_1797(0,0,power,iPosX,iPosY,a_1334.m_stCurrentBattbleFieldView,stStartField,false,1,0);
                  a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.EFFECTS_BASE_TYPE,stStartField);
               }
            }
         }
      }
   }
}

