package com.aurora.ui.maogoutd.resource.defender.PigYear.SellMeow
{
   import a_4718.b_183;
   
   public class SellMeowDefine
   {
      
      internal static const DEFENSE_PRICE:int = 225;
      
      public function SellMeowDefine()
      {
         super();
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_ScorpioShot;
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
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
               iStarDegreeEffect = 4.6;
               break;
            case 1:
               iStarDegreeEffect = 5.4;
               break;
            case 2:
               iStarDegreeEffect = 6.2;
               break;
            case 3:
               iStarDegreeEffect = 7;
               break;
            case 4:
               iStarDegreeEffect = 7.8;
               break;
            case 5:
               iStarDegreeEffect = 8.6;
               break;
            case 6:
               iStarDegreeEffect = 9.4;
               break;
            case 7:
               iStarDegreeEffect = 10.9;
               break;
            case 8:
               iStarDegreeEffect = 13;
               break;
            case 9:
               iStarDegreeEffect = 17;
               break;
            case 10:
               iStarDegreeEffect = 23;
               break;
            case 11:
               iStarDegreeEffect = 30;
               break;
            case 12:
               iStarDegreeEffect = 37;
               break;
            case 13:
               iStarDegreeEffect = 45;
               break;
            case 14:
               iStarDegreeEffect = 58;
               break;
            case 15:
               iStarDegreeEffect = 71;
               break;
            case 16:
               iStarDegreeEffect = 83;
         }
         return iStarDegreeEffect * 10;
      }
   }
}

