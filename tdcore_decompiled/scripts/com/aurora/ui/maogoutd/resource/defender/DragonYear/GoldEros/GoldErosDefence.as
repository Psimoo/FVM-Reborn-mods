package com.aurora.ui.maogoutd.resource.defender.DragonYear.GoldEros
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class GoldErosDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 275;
      
      public function GoldErosDefence()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int = 0) : int
      {
         return 70;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 0;
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
      
      internal static function a_3965(starDegree:int) : int
      {
         var starDegreeEffect:int = 0;
         switch(starDegree)
         {
            case 0:
               starDegreeEffect = 18;
               break;
            case 1:
               starDegreeEffect = 20;
               break;
            case 2:
               starDegreeEffect = 22;
               break;
            case 3:
               starDegreeEffect = 24;
               break;
            case 4:
               starDegreeEffect = 28;
               break;
            case 5:
               starDegreeEffect = 32;
               break;
            case 6:
               starDegreeEffect = 36;
               break;
            case 7:
               starDegreeEffect = 40;
               break;
            case 8:
               starDegreeEffect = 46;
               break;
            case 9:
               starDegreeEffect = 52;
               break;
            case 10:
               starDegreeEffect = 58;
               break;
            case 11:
               starDegreeEffect = 68;
               break;
            case 12:
               starDegreeEffect = 80;
               break;
            case 13:
               starDegreeEffect = 94;
               break;
            case 14:
               starDegreeEffect = 110;
               break;
            case 15:
               starDegreeEffect = 130;
               break;
            case 16:
               starDegreeEffect = 159;
               break;
            case 17:
               starDegreeEffect = 221;
               break;
            case 18:
               starDegreeEffect = 332;
         }
         return starDegreeEffect * 10;
      }
      
      internal static function GetFieldIntruderNumForAheadDirection(stFieldGrid:a_3491, yRange:int = 1) : int
      {
         var targetY:int = 0;
         var x:int = 0;
         var targetFieldGrid:a_3491 = null;
         if(stFieldGrid == null || stFieldGrid.m_stCurrentBattbleFieldView == null)
         {
            return 0;
         }
         var battleFieldView:BattleFieldView = stFieldGrid.m_stCurrentBattbleFieldView;
         for(var yOffset:int = -yRange; yOffset <= yRange; yOffset++)
         {
            targetY = stFieldGrid.m_iYGridNo + yOffset;
            if(!(targetY < 0 || targetY >= BattleFieldView.a_1012))
            {
               x = 0;
               while(x < BattleFieldView.a_1011)
               {
                  targetFieldGrid = battleFieldView.a_3438(x,targetY);
                  if(targetFieldGrid != null && CountVisibleIntruders(targetFieldGrid) > 0)
                  {
                     return 1;
                     break;
                  }
                  x++;
               }
            }
         }
         return 0;
      }
      
      private static function CountVisibleIntruders(fieldGrid:a_3491) : int
      {
         var intruder:a_4206 = null;
         var count:int = 0;
         for each(intruder in fieldGrid.a_1511)
         {
            if(intruder.iLifeValue > 0 && (intruder.iSpaceState == 1 || !intruder.isCannotSeeByFighter))
            {
               count++;
            }
         }
         return count;
      }
   }
}

