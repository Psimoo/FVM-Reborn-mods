package com.aurora.ui.maogoutd.resource.defender.HorseYear.menghaima
{
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class MengHaiMaDefine
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 12;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 2;
      
      internal static const DEFENSE_PRICE:int = 255;
      
      public function MengHaiMaDefine()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int) : int
      {
         return 7 * 10;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 0;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 3;
               break;
            case 1:
               iSkillDegreeEffect = 2.95;
               break;
            case 2:
               iSkillDegreeEffect = 2.9;
               break;
            case 3:
               iSkillDegreeEffect = 2.85;
               break;
            case 4:
               iSkillDegreeEffect = 2.8;
               break;
            case 5:
               iSkillDegreeEffect = 2.7;
               break;
            case 6:
               iSkillDegreeEffect = 2.6;
               break;
            case 7:
               iSkillDegreeEffect = 2.5;
               break;
            case 8:
               iSkillDegreeEffect = 2.2;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 2;
               break;
            case 1:
               iStarDegreeEffect = 2.2;
               break;
            case 2:
               iStarDegreeEffect = 2.4;
               break;
            case 3:
               iStarDegreeEffect = 2.6;
               break;
            case 4:
               iStarDegreeEffect = 2.8;
               break;
            case 5:
               iStarDegreeEffect = 3;
               break;
            case 6:
               iStarDegreeEffect = 3.5;
               break;
            case 7:
               iStarDegreeEffect = 4;
               break;
            case 8:
               iStarDegreeEffect = 4.5;
               break;
            case 9:
               iStarDegreeEffect = 5;
               break;
            case 10:
               iStarDegreeEffect = 7;
               break;
            case 11:
               iStarDegreeEffect = 9;
               break;
            case 12:
               iStarDegreeEffect = 11;
               break;
            case 13:
               iStarDegreeEffect = 13;
               break;
            case 14:
               iStarDegreeEffect = 15;
               break;
            case 15:
               iStarDegreeEffect = 17;
               break;
            case 16:
               iStarDegreeEffect = 20;
         }
         return iStarDegreeEffect * 10;
      }
      
      internal static function CheckAttack(intruder:a_4206, trans:int) : Boolean
      {
         if(intruder.iSpaceState == 1 || intruder.iLifeValue <= 0 || !intruder.m_stCurrentFieldGrid)
         {
            return false;
         }
         if(intruder.isCannotSeeByFighter)
         {
            return false;
         }
         if(trans == 2 && intruder.tagCom.HasTag(40003))
         {
            return false;
         }
         return true;
      }
   }
}

