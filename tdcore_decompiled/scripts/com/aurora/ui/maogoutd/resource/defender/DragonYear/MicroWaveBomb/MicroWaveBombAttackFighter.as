package com.aurora.ui.maogoutd.resource.defender.DragonYear.MicroWaveBomb
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3960;
   import flash.display.FrameLabel;
   
   public class MicroWaveBombAttackFighter extends a_3960
   {
      
      private var m_AppearTime:int;
      
      public function MicroWaveBombAttackFighter()
      {
         super();
         a_1095 = MicroWaveBombDefine.DEFENSE_PRICE;
         a_1330 = 0;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3960
      {
         return PoolManager.getInstance().CheckOutOne(MicroWaveBombAttackFighter) as MicroWaveBombAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return MicroWaveBombAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = MicroWaveBombDefine.MAX_LIFE_VALUE;
         this.m_AppearTime = 3.5 * 20;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return MicroWaveBombDefine.a_3964(a_1094);
      }
      
      override public function a_3961(iCurrentTime:int) : Boolean
      {
         var xStart:int = 0;
         var xEnd:int = 0;
         var yStart:int = 0;
         var yEnd:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         var stFieldGridVector:Array = null;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(this.m_AppearTime > 0)
         {
            --this.m_AppearTime;
            if(this.m_AppearTime == 0)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
         }
         super.a_3961(iCurrentTime);
         if(a_1329 == iCurrentTime && a_1273 == a_1274 - 6)
         {
            BattleFieldView.a_1048.play();
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
                  stTargetFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
                  arrMoveIntruder = stTargetFieldGrid.a_1511.slice();
                  for each(stMoveIntruder in arrMoveIntruder)
                  {
                     stMoveIntruder.a_4210();
                  }
                  if(stTargetFieldGrid.m_stAttackFighter != null && stTargetFieldGrid.m_stAttackFighter.m_iDefenseStateType == 1)
                  {
                     stTargetFieldGrid.m_stAttackFighter.SpecialSkillCallBack();
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
   }
}

