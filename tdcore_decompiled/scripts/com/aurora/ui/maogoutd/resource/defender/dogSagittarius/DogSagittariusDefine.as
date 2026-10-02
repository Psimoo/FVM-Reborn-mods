package com.aurora.ui.maogoutd.resource.defender.dogSagittarius
{
   import a_4718.b_183;
   
   public class DogSagittariusDefine
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 300;
      
      public function DogSagittariusDefine()
      {
         super();
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_SagittariusShot;
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
      {
         return 100;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         if(iSkillDegree == 8)
         {
            return 23 - iSkillDegree - 1;
         }
         return 23 - iSkillDegree;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 13;
               break;
            case 1:
               iStarDegreeEffect = 15;
               break;
            case 2:
               iStarDegreeEffect = 18;
               break;
            case 3:
               iStarDegreeEffect = 20;
               break;
            case 4:
               iStarDegreeEffect = 23;
               break;
            case 5:
               iStarDegreeEffect = 25;
               break;
            case 6:
               iStarDegreeEffect = 28;
               break;
            case 7:
               iStarDegreeEffect = 33;
               break;
            case 8:
               iStarDegreeEffect = 40;
               break;
            case 9:
               iStarDegreeEffect = 50;
               break;
            case 10:
               iStarDegreeEffect = 70;
               break;
            case 11:
               iStarDegreeEffect = 90;
               break;
            case 12:
               iStarDegreeEffect = 110;
               break;
            case 13:
               iStarDegreeEffect = 130;
               break;
            case 14:
               iStarDegreeEffect = 150;
               break;
            case 15:
               iStarDegreeEffect = 170;
               break;
            case 16:
               iStarDegreeEffect = 200;
         }
         return iStarDegreeEffect;
      }
   }
}

