package com.aurora.ui.maogoutd.resource.defender.Sagittarius
{
   import a_4718.b_183;
   
   public class SagittariusDefine
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 300;
      
      public function SagittariusDefine()
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
         if(iSkillDegree == 8)
         {
            return 28 - iSkillDegree - 1;
         }
         return 28 - iSkillDegree;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 15;
               break;
            case 1:
               iStarDegreeEffect = 18;
               break;
            case 2:
               iStarDegreeEffect = 21;
               break;
            case 3:
               iStarDegreeEffect = 24;
               break;
            case 4:
               iStarDegreeEffect = 27;
               break;
            case 5:
               iStarDegreeEffect = 30;
               break;
            case 6:
               iStarDegreeEffect = 33;
               break;
            case 7:
               iStarDegreeEffect = 39;
               break;
            case 8:
               iStarDegreeEffect = 48;
               break;
            case 9:
               iStarDegreeEffect = 60;
               break;
            case 10:
               iStarDegreeEffect = 83;
               break;
            case 11:
               iStarDegreeEffect = 105;
               break;
            case 12:
               iStarDegreeEffect = 128;
               break;
            case 13:
               iStarDegreeEffect = 150;
               break;
            case 14:
               iStarDegreeEffect = 172;
               break;
            case 15:
               iStarDegreeEffect = 194;
               break;
            case 16:
               iStarDegreeEffect = 224;
         }
         return iStarDegreeEffect;
      }
   }
}

