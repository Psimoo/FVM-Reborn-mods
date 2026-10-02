package com.aurora.ui.maogoutd.resource.defender.DragonYear.BaobaoLong
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   
   public class BaobaoLongDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 140;
      
      internal static const REDUEC_DEFENSE_PRICE:int = 100;
      
      public function BaobaoLongDefence()
      {
         super();
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_AthenaShot;
      }
      
      internal static function a_3964(iSkillDegree:int = 0) : int
      {
         return 7 * 10;
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
               iSkillDegreeEffect = 0.95;
               break;
            case 8:
               iSkillDegreeEffect = 0.9;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : Number
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 2.5;
               break;
            case 1:
               iStarDegreeEffect = 2.8;
               break;
            case 2:
               iStarDegreeEffect = 3.1;
               break;
            case 3:
               iStarDegreeEffect = 3.4;
               break;
            case 4:
               iStarDegreeEffect = 3.7;
               break;
            case 5:
               iStarDegreeEffect = 4;
               break;
            case 6:
               iStarDegreeEffect = 5;
               break;
            case 7:
               iStarDegreeEffect = 6;
               break;
            case 8:
               iStarDegreeEffect = 8;
               break;
            case 9:
               iStarDegreeEffect = 10;
               break;
            case 10:
               iStarDegreeEffect = 12;
               break;
            case 11:
               iStarDegreeEffect = 14;
               break;
            case 12:
               iStarDegreeEffect = 17;
               break;
            case 13:
               iStarDegreeEffect = 21;
               break;
            case 14:
               iStarDegreeEffect = 25;
               break;
            case 15:
               iStarDegreeEffect = 30;
               break;
            case 16:
               iStarDegreeEffect = 36;
         }
         return iStarDegreeEffect * 10;
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

