package com.aurora.ui.maogoutd.resource.defender.RabbitYear.LeagueGod
{
   import a_4728.a_1778;
   import a_4729.a_1789;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class LeagueGodFinalAttackFighter extends a_3953
   {
      
      private var m_iAppearedTime:int;
      
      public function LeagueGodFinalAttackFighter()
      {
         super();
         a_1095 = LeagueGodDefence.DEFENSE_PRICE_FIRST;
         a_1313 = true;
         a_1310 = 10;
         a_1317 = 2;
         a_1337 = 0;
         a_1333 = true;
         a_1096 = false;
         a_1309 = LeagueGodDefence.a_3966(m_iSkillDegree);
         a_1311 = LeagueGodDefence.a_3965(a_1094) * 1.1;
         a_1789.getInstance().addEventListener("DefenseCardCountChange",this.a_3483);
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(LeagueGodFinalAttackFighter) as LeagueGodFinalAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return LeagueGodFinalAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = LeagueGodDefence.a_3966(m_iSkillDegree);
         a_1311 = LeagueGodDefence.a_3965(a_1094) * 1.1;
         this.m_iAppearedTime = -10;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return LeagueGodDefence.a_3964(m_iSkillDegree);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:a_4348 = null;
         var numShotXpos:Number = NaN;
         var i:int = 0;
         var stStartField:a_3491 = null;
         var j:int = 0;
         var radius:int = 0;
         var TanA:Number = Math.tan(22.5 * Math.PI / 180);
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            if(LeagueGodDefence.GetFieldIntruderNumForFiveDirection(a_1334) <= 0)
            {
               return true;
            }
            while(a_1324.length > 0)
            {
               stLastWaitShot = a_1324.pop();
               stLastWaitShot.a_4350();
            }
            for(j = 0; j < 5 * 2; j++)
            {
               stLastWaitShot = LeagueGodFinalShot.a_4344();
               if(null == stLastWaitShot)
               {
                  return false;
               }
               a_1324.push(stLastWaitShot);
            }
            a_1321 = iCurrentTime;
            a_1323 = 0;
            a_1307 = 10;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            numShotXpos = this.a_3955();
            if(a_1283)
            {
               numShotXpos = -numShotXpos;
            }
            stLastWaitShot = a_1324.pop();
            if(stLastWaitShot != null)
            {
               stLastWaitShot.m_isSpecial = 1;
               stLastWaitShot.a_1797(0,a_1312,a_1311,x + 72 + radius,y + 83,a_1334.m_stCurrentBattbleFieldView,a_1334);
               a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,a_1334);
            }
            stLastWaitShot = a_1324.pop();
            if(stLastWaitShot != null)
            {
               stLastWaitShot.m_isSpecial = 4;
               stLastWaitShot.a_1797(0,a_1312,a_1311,x + 72 + Math.SQRT1_2 * radius,y + 83 - Math.SQRT1_2 * radius,a_1334.m_stCurrentBattbleFieldView,a_1334);
               a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,a_1334);
            }
            stLastWaitShot = a_1324.pop();
            if(stLastWaitShot != null)
            {
               stLastWaitShot.m_isSpecial = 5;
               stLastWaitShot.a_1797(0,a_1312,a_1311,x + 72 + Math.SQRT1_2 * radius,y + 83 + Math.SQRT1_2 * radius,a_1334.m_stCurrentBattbleFieldView,a_1334);
               a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,a_1334);
            }
            stLastWaitShot = a_1324.pop();
            if(stLastWaitShot != null)
            {
               stLastWaitShot.m_isSpecial = 2;
               stLastWaitShot.a_1797(0,a_1312,a_1311,x + 72 + radius / Math.sqrt(Math.pow(TanA,2) + 1),y + 83 - radius / Math.sqrt(Math.pow(1 / TanA,2) + 1),a_1334.m_stCurrentBattbleFieldView,a_1334);
               a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,a_1334);
            }
            stLastWaitShot = a_1324.pop();
            if(stLastWaitShot != null)
            {
               stLastWaitShot.m_isSpecial = 3;
               stLastWaitShot.a_1797(0,a_1312,a_1311,x + 72 + radius / Math.sqrt(Math.pow(TanA,2) + 1),y + 83 + radius / Math.sqrt(Math.pow(1 / TanA,2) + 1),a_1334.m_stCurrentBattbleFieldView,a_1334);
               a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,a_1334);
            }
            if(a_1324.length > 0)
            {
               ++a_1323;
            }
         }
         return true;
      }
      
      private function a_3483(stDataEvent:a_1778) : void
      {
         var iDefenseTypeID:int = int(stDataEvent.dataObject[0]);
         var iDefenseCount:int = stDataEvent.dataObject[1] - 1;
         if(a_3512() == iDefenseTypeID)
         {
            iDefenseCount = iDefenseCount > 9 ? 9 : iDefenseCount;
            iDefenseCount = iDefenseCount < 0 ? 0 : iDefenseCount;
            a_1311 = LeagueGodDefence.a_3965(a_1094) * 1.1 * (1 + iDefenseCount * 0.05);
         }
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            if(a_1278 == null)
            {
               a_1278 = "待机";
            }
            super.a_3957(iCurrentTime);
         }
      }
      
      override protected function a_3955() : Number
      {
         return 0.9 * width;
      }
      
      override protected function a_3956() : Number
      {
         return 0.3 * height;
      }
      
      override protected function a_3966() : int
      {
         return 5 * m_iSkillDegree;
      }
   }
}

