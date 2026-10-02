package com.aurora.ui.maogoutd.resource.defender.kettleAtomicBomb
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3960;
   import flash.display.FrameLabel;
   
   public class KettleAtomicBombAttackFighter extends a_3960
   {
      
      public function KettleAtomicBombAttackFighter()
      {
         super();
         gotoAndStop((a_1276[2] as FrameLabel).frame);
         a_1095 = KettleAtomicBombDefine.DEFENSE_PRICE;
         a_1330 = 0;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3960
      {
         return PoolManager.getInstance().CheckOutOne(KettleAtomicBombAttackFighter) as KettleAtomicBombAttackFighter;
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         gotoAndStop((a_1276[2] as FrameLabel).frame);
         return true;
      }
      
      override protected function getBindMovie() : Class
      {
         return KettleAtomicBombAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = KettleAtomicBombDefine.MAX_LIFE_VALUE;
         if(null == stFieldGrid)
         {
            return false;
         }
         if(stFieldGrid.m_stCurrentBattbleFieldView.iBattleFieldStageType == 1)
         {
            a_1340 = true;
            a_1275 = 0;
         }
         else
         {
            a_1340 = false;
            a_1275 = 2;
            gotoAndStop((a_1276[2] as FrameLabel).frame);
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return KettleAtomicBombDefine.a_3964(a_1094);
      }
      
      override public function a_3961(iCurrentTime:int) : Boolean
      {
         var stFieldGridVector:Array = null;
         var yStart:int = 0;
         var xStart:int = 0;
         var yEnd:int = 0;
         var xEnd:int = 0;
         var y:int = 0;
         var x:int = 0;
         var stMoveIntruder:a_4206 = null;
         super.a_3961(iCurrentTime);
         if(!a_1340 && a_1273 == (a_1276[2] as FrameLabel).frame - 1)
         {
            a_1275 = 2;
         }
         if(!a_1340 && a_1273 == (a_1276[3] as FrameLabel).frame - 1)
         {
            a_1275 = 3;
         }
         if(a_1273 == a_1274 - 13 && a_1329 == iCurrentTime)
         {
            BattleFieldView.a_1050.play();
            a_1334.m_stCurrentBattbleFieldView.a_3466();
            stFieldGridVector = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
            yStart = a_1334.m_iYGridNo - 2 < 0 ? 0 : int(a_1334.m_iYGridNo - 2);
            xStart = a_1334.m_iXGridNo - 2 < 0 ? 0 : int(a_1334.m_iXGridNo - 2);
            yEnd = a_1334.m_iYGridNo + 2 >= BattleFieldView.a_1012 ? int(BattleFieldView.a_1012 - 1) : int(a_1334.m_iYGridNo + 2);
            xEnd = a_1334.m_iXGridNo + 2 >= BattleFieldView.a_1011 ? int(BattleFieldView.a_1011 - 1) : int(a_1334.m_iXGridNo + 2);
            for(y = yStart; y <= yEnd; y++)
            {
               for(x = xStart; x <= xEnd; x++)
               {
                  for each(stMoveIntruder in stFieldGridVector[y][x].a_1511.slice())
                  {
                     stMoveIntruder.a_4210();
                  }
               }
            }
         }
         if(a_1273 == a_1274)
         {
            super.a_3969(a_1339);
            this.a_3940();
         }
         return true;
      }
      
      override public function a_3970() : Boolean
      {
         if(a_1340)
         {
            a_1340 = false;
            a_1275 = 1;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         return true;
      }
   }
}

