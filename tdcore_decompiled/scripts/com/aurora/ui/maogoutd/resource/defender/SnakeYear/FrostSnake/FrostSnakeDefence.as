package com.aurora.ui.maogoutd.resource.defender.SnakeYear.FrostSnake
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class FrostSnakeDefence
   {
      
      internal static const DEFENSE_PRICE:int = 300;
      
      public function FrostSnakeDefence()
      {
         super();
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_AthenaShot;
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
      {
         return 70;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 3.5;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 3.5;
               break;
            case 1:
               iSkillDegreeEffect = 3.4;
               break;
            case 2:
               iSkillDegreeEffect = 3.3;
               break;
            case 3:
               iSkillDegreeEffect = 3.2;
               break;
            case 4:
               iSkillDegreeEffect = 3;
               break;
            case 5:
               iSkillDegreeEffect = 2.8;
               break;
            case 6:
               iSkillDegreeEffect = 2.6;
               break;
            case 7:
               iSkillDegreeEffect = 2.4;
               break;
            case 8:
               iSkillDegreeEffect = 2;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 8.5;
               break;
            case 1:
               iStarDegreeEffect = 9.5;
               break;
            case 2:
               iStarDegreeEffect = 10.5;
               break;
            case 3:
               iStarDegreeEffect = 13.5;
               break;
            case 4:
               iStarDegreeEffect = 16.5;
               break;
            case 5:
               iStarDegreeEffect = 19.5;
               break;
            case 6:
               iStarDegreeEffect = 23.5;
               break;
            case 7:
               iStarDegreeEffect = 27.5;
               break;
            case 8:
               iStarDegreeEffect = 33;
               break;
            case 9:
               iStarDegreeEffect = 38.5;
               break;
            case 10:
               iStarDegreeEffect = 44;
               break;
            case 11:
               iStarDegreeEffect = 52;
               break;
            case 12:
               iStarDegreeEffect = 60;
               break;
            case 13:
               iStarDegreeEffect = 68;
               break;
            case 14:
               iStarDegreeEffect = 76;
               break;
            case 15:
               iStarDegreeEffect = 86;
               break;
            case 16:
               iStarDegreeEffect = 96;
         }
         return iStarDegreeEffect;
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
            if(intruder.iLifeValue > 0 && (intruder.iSpaceState == 0 || intruder.iSpaceState == 3))
            {
               return 1;
            }
         }
         return count;
      }
   }
}

