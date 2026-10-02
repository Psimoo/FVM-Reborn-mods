package com.aurora.ui.maogoutd.resource.defender.SnakeYear.elementalSnake
{
   import a_4718.b_183;
   
   public class ElementalSnakeDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 280;
      
      public function ElementalSnakeDefence()
      {
         super();
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_AthenaShot;
      }
      
      internal static function a_3964(iSkillDegree:int = 0) : int
      {
         return a_3966(iSkillDegree);
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 0;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 40;
               break;
            case 1:
               iSkillDegreeEffect = 37;
               break;
            case 2:
               iSkillDegreeEffect = 34;
               break;
            case 3:
               iSkillDegreeEffect = 31;
               break;
            case 4:
               iSkillDegreeEffect = 28;
               break;
            case 5:
               iSkillDegreeEffect = 25;
               break;
            case 6:
               iSkillDegreeEffect = 22;
               break;
            case 7:
               iSkillDegreeEffect = 19;
               break;
            case 8:
               iSkillDegreeEffect = 15;
         }
         return iSkillDegreeEffect * 10;
      }
      
      internal static function a_3965(iStarDegree:int) : Number
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 0.045;
               break;
            case 1:
               iStarDegreeEffect = 0.06;
               break;
            case 2:
               iStarDegreeEffect = 0.075;
               break;
            case 3:
               iStarDegreeEffect = 0.09;
               break;
            case 4:
               iStarDegreeEffect = 0.12;
               break;
            case 5:
               iStarDegreeEffect = 0.15;
               break;
            case 6:
               iStarDegreeEffect = 0.18;
               break;
            case 7:
               iStarDegreeEffect = 0.21;
               break;
            case 8:
               iStarDegreeEffect = 0.24;
               break;
            case 9:
               iStarDegreeEffect = 0.27;
               break;
            case 10:
               iStarDegreeEffect = 0.3;
               break;
            case 11:
               iStarDegreeEffect = 0.45;
               break;
            case 12:
               iStarDegreeEffect = 0.75;
               break;
            case 13:
               iStarDegreeEffect = 1.05;
               break;
            case 14:
               iStarDegreeEffect = 1.35;
               break;
            case 15:
               iStarDegreeEffect = 1.7;
               break;
            case 16:
               iStarDegreeEffect = 2.16;
         }
         return iStarDegreeEffect + 1;
      }
   }
}

