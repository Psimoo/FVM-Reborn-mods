package com.aurora.ui.maogoutd.resource.defender.PigYear.zhuZhuLieShou
{
   import a_4718.b_183;
   
   public class ZhuZhuLieShouDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 325;
      
      public function ZhuZhuLieShouDefence()
      {
         super();
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_SagittariusShot;
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
      {
         return 70;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 1.2;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 1.2;
               break;
            case 1:
               iSkillDegreeEffect = 1.15;
               break;
            case 2:
               iSkillDegreeEffect = 1.1;
               break;
            case 3:
               iSkillDegreeEffect = 1.05;
               break;
            case 4:
               iSkillDegreeEffect = 1;
               break;
            case 5:
               iSkillDegreeEffect = 0.95;
               break;
            case 6:
               iSkillDegreeEffect = 0.9;
               break;
            case 7:
               iSkillDegreeEffect = 0.85;
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
               iStarDegreeEffect = 1.3;
               break;
            case 1:
               iStarDegreeEffect = 1.56;
               break;
            case 2:
               iStarDegreeEffect = 1.82;
               break;
            case 3:
               iStarDegreeEffect = 2.08;
               break;
            case 4:
               iStarDegreeEffect = 2.34;
               break;
            case 5:
               iStarDegreeEffect = 2.6;
               break;
            case 6:
               iStarDegreeEffect = 2.86;
               break;
            case 7:
               iStarDegreeEffect = 3.38;
               break;
            case 8:
               iStarDegreeEffect = 4.16;
               break;
            case 9:
               iStarDegreeEffect = 5.2;
               break;
            case 10:
               iStarDegreeEffect = 7.15;
               break;
            case 11:
               iStarDegreeEffect = 9.1;
               break;
            case 12:
               iStarDegreeEffect = 11.05;
               break;
            case 13:
               iStarDegreeEffect = 13;
               break;
            case 14:
               iStarDegreeEffect = 14.95;
               break;
            case 15:
               iStarDegreeEffect = 16.9;
               break;
            case 16:
               iStarDegreeEffect = 19.4;
         }
         trace(iStarDegreeEffect * 10);
         return iStarDegreeEffect * 10;
      }
   }
}

