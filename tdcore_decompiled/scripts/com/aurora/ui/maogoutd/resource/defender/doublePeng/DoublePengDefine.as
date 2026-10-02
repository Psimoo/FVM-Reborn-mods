package com.aurora.ui.maogoutd.resource.defender.doublePeng
{
   import a_4718.b_183;
   
   public class DoublePengDefine
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 225;
      
      public function DoublePengDefine()
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
               iStarDegreeEffect = 13;
               break;
            case 1:
               iStarDegreeEffect = 16;
               break;
            case 2:
               iStarDegreeEffect = 18;
               break;
            case 3:
               iStarDegreeEffect = 21;
               break;
            case 4:
               iStarDegreeEffect = 23;
               break;
            case 5:
               iStarDegreeEffect = 26;
               break;
            case 6:
               iStarDegreeEffect = 29;
               break;
            case 7:
               iStarDegreeEffect = 34;
               break;
            case 8:
               iStarDegreeEffect = 42;
               break;
            case 9:
               iStarDegreeEffect = 52;
               break;
            case 10:
               iStarDegreeEffect = 72;
               break;
            case 11:
               iStarDegreeEffect = 91;
               break;
            case 12:
               iStarDegreeEffect = 111;
               break;
            case 13:
               iStarDegreeEffect = 130;
               break;
            case 14:
               iStarDegreeEffect = 150;
               break;
            case 15:
               iStarDegreeEffect = 169;
               break;
            case 16:
               iStarDegreeEffect = 194;
         }
         return iStarDegreeEffect;
      }
   }
}

