package com.aurora.ui.maogoutd.resource.defender.RabbitYear.LeagueGod
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   
   public class LeagueGodDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 185;
      
      internal static const DEFENSE_PRICE_FIRST:int = 260;
      
      public function LeagueGodDefence()
      {
         super();
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_AthenaShot;
      }
      
      internal static function a_3964(iSkillDegree:int = 0) : int
      {
         return 70;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 1.3;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 1.3;
               break;
            case 1:
               iSkillDegreeEffect = 1.25;
               break;
            case 2:
               iSkillDegreeEffect = 1.2;
               break;
            case 3:
               iSkillDegreeEffect = 1.15;
               break;
            case 4:
               iSkillDegreeEffect = 1.1;
               break;
            case 5:
               iSkillDegreeEffect = 1.05;
               break;
            case 6:
               iSkillDegreeEffect = 1;
               break;
            case 7:
               iSkillDegreeEffect = 0.9;
               break;
            case 8:
               iSkillDegreeEffect = 0.8;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 8.4;
               break;
            case 1:
               iStarDegreeEffect = 10;
               break;
            case 2:
               iStarDegreeEffect = 11.6;
               break;
            case 3:
               iStarDegreeEffect = 13.2;
               break;
            case 4:
               iStarDegreeEffect = 15;
               break;
            case 5:
               iStarDegreeEffect = 16.8;
               break;
            case 6:
               iStarDegreeEffect = 21;
               break;
            case 7:
               iStarDegreeEffect = 25.2;
               break;
            case 8:
               iStarDegreeEffect = 29.4;
               break;
            case 9:
               iStarDegreeEffect = 35.7;
               break;
            case 10:
               iStarDegreeEffect = 42;
               break;
            case 11:
               iStarDegreeEffect = 48.3;
               break;
            case 12:
               iStarDegreeEffect = 69.3;
               break;
            case 13:
               iStarDegreeEffect = 90.3;
               break;
            case 14:
               iStarDegreeEffect = 111.3;
               break;
            case 15:
               iStarDegreeEffect = 132.3;
               break;
            case 16:
               iStarDegreeEffect = 153.3;
               break;
            case 17:
               iStarDegreeEffect = 202.3;
               break;
            case 18:
               iStarDegreeEffect = 303;
         }
         return 10 * iStarDegreeEffect;
      }
      
      internal static function GetFieldIntruderNumForFiveDirection(stFieldGrid:a_3491) : int
      {
         var j:int = 0;
         var k:* = 0;
         var iTotalIntruderNum:int = 0;
         var i:int = 0;
         if(stFieldGrid)
         {
            for(i = stFieldGrid.m_iXGridNo; i < BattleFieldView.a_1011; i++)
            {
               iTotalIntruderNum += stFieldGrid.m_stCurrentBattbleFieldView.stFieldRowIntruderStatusArray[stFieldGrid.m_iYGridNo];
            }
            for(i = stFieldGrid.m_iXGridNo; i < BattleFieldView.a_1011; i++)
            {
               for(j = stFieldGrid.m_iYGridNo; j < BattleFieldView.a_1012; j++)
               {
                  iTotalIntruderNum += stFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,j).a_1511.length;
               }
            }
            for(i = stFieldGrid.m_iXGridNo; i < BattleFieldView.a_1011; i++)
            {
               for(k = stFieldGrid.m_iYGridNo; k >= 0; k--)
               {
                  iTotalIntruderNum += stFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,k).a_1511.length;
               }
            }
         }
         return iTotalIntruderNum;
      }
   }
}

