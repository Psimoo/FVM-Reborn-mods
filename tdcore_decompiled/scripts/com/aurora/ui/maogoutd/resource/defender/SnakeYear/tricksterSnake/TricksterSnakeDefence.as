package com.aurora.ui.maogoutd.resource.defender.SnakeYear.tricksterSnake
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   
   public class TricksterSnakeDefence
   {
      
      internal static const DEFENSE_PRICE:int = 365;
      
      public function TricksterSnakeDefence()
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
               iSkillDegreeEffect = 3.1;
               break;
            case 5:
               iSkillDegreeEffect = 3;
               break;
            case 6:
               iSkillDegreeEffect = 2.8;
               break;
            case 7:
               iSkillDegreeEffect = 2.6;
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
               iStarDegreeEffect = 7;
               break;
            case 1:
               iStarDegreeEffect = 9;
               break;
            case 2:
               iStarDegreeEffect = 11;
               break;
            case 3:
               iStarDegreeEffect = 13;
               break;
            case 4:
               iStarDegreeEffect = 16;
               break;
            case 5:
               iStarDegreeEffect = 19;
               break;
            case 6:
               iStarDegreeEffect = 22;
               break;
            case 7:
               iStarDegreeEffect = 27;
               break;
            case 8:
               iStarDegreeEffect = 32;
               break;
            case 9:
               iStarDegreeEffect = 37;
               break;
            case 10:
               iStarDegreeEffect = 42;
               break;
            case 11:
               iStarDegreeEffect = 48;
               break;
            case 12:
               iStarDegreeEffect = 54;
               break;
            case 13:
               iStarDegreeEffect = 62;
               break;
            case 14:
               iStarDegreeEffect = 70;
               break;
            case 15:
               iStarDegreeEffect = 98;
               break;
            case 16:
               iStarDegreeEffect = 128;
         }
         return 10 * iStarDegreeEffect;
      }
      
      public static function GetFieldIntruderNumForFiveDirection(stFieldGrid:a_3491) : int
      {
         var i:int = 0;
         if(stFieldGrid)
         {
            for(i = 0; i < BattleFieldView.a_1012; i++)
            {
               if(stFieldGrid.m_stCurrentBattbleFieldView.stFieldRowIntruderStatusArray[i] > 0)
               {
                  return 1;
               }
            }
         }
         return 0;
      }
   }
}

