package com.aurora.ui.maogoutd.resource.defender.SnakeYear.explosiveSnake
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3960;
   import flash.display.FrameLabel;
   
   public class ExplosiveSnakeBombAttackFighter extends a_3960
   {
      
      private var m_AppearTime:int;
      
      public function ExplosiveSnakeBombAttackFighter()
      {
         super();
         a_1095 = ExplosiveSnakeBombDefine.DEFENSE_PRICE;
         a_1330 = 0;
         a_1333 = true;
         a_1337 = 4;
         a_1279 = 4;
         m_iYDisplayCenterPos = -3;
      }
      
      public static function a_3926() : a_3960
      {
         return PoolManager.getInstance().CheckOutOne(ExplosiveSnakeBombAttackFighter) as ExplosiveSnakeBombAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return ExplosiveSnakeBombAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = ExplosiveSnakeBombDefine.MAX_LIFE_VALUE;
         this.m_AppearTime = ExplosiveSnakeBombDefine.a_3966(m_iSkillDegree);
         if(a_1336)
         {
            a_1336.x += 4;
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return ExplosiveSnakeBombDefine.a_3964(a_1094);
      }
      
      override public function a_3961(iCurrentTime:int) : Boolean
      {
         if(this.m_AppearTime > 0)
         {
            --this.m_AppearTime;
            if(this.m_AppearTime == 0)
            {
               a_1275 = 2;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
         }
         super.a_3961(iCurrentTime);
         if(a_1329 == iCurrentTime && a_1273 == 17)
         {
            BattleFieldView.a_1048.play();
            a_1334.m_stCurrentBattbleFieldView.a_3466();
            this.TatalRangeBoom(stFieldGrid,1,900);
         }
         else if(a_1329 == iCurrentTime && a_1273 == 33)
         {
            if(a_1336)
            {
               a_1336.visible = false;
            }
         }
         else if(a_1329 == iCurrentTime && a_1273 == 36)
         {
            BattleFieldView.a_1048.play();
            a_1334.m_stCurrentBattbleFieldView.a_3466();
            this.TatalRangeBoom(stFieldGrid,1,900);
         }
         if(a_1273 == a_1274)
         {
            super.a_3969(a_1339);
         }
         return true;
      }
      
      private function TatalRangeBoom(stFieldGrid:a_3491, range:int, iHurtPower:int) : void
      {
         var xIndex:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(stFieldGrid == null)
         {
            return;
         }
         var xStart:int = Math.max(stFieldGrid.m_iXGridNo - range,0);
         var xEnd:int = Math.min(stFieldGrid.m_iXGridNo + range,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(stFieldGrid.m_iYGridNo - range,0);
         var yEnd:int = Math.min(stFieldGrid.m_iYGridNo + range,BattleFieldView.a_1012 - 1);
         var stFieldGridVector:Array = stFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               arrMoveIntruder = stFieldGridVector[yIndex][xIndex].a_1511.slice();
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  if(!stMoveIntruder.IsElite)
                  {
                     stMoveIntruder.a_4210();
                  }
                  else
                  {
                     stMoveIntruder.PowerfulBombReduceLifeRate(iHurtPower / 900,true);
                  }
               }
            }
         }
      }
   }
}

