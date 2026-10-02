package com.aurora.ui.maogoutd.resource.defender.SnakeYear.JuicerBooster
{
   public class JuicerBoosterAuxiliaryDefine
   {
      
      internal static const DEFENSE_PRICE:int = 260;
      
      internal static const REDUCE_DEFENSE_PRICE:int = 50;
      
      internal static const HURT_ADDITION:Number = 0.2;
      
      internal static const FIRSTTRANS_LIFEADD:int = 24;
      
      internal static const LIFE_VALUE:int = 60;
      
      public function JuicerBoosterAuxiliaryDefine()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int) : int
      {
         return a_3966(iSkillDegree);
      }
      
      internal static function a_3965(iStarDegree:int) : Number
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 1.1;
               break;
            case 1:
               iStarDegreeEffect = 1.1;
               break;
            case 2:
               iStarDegreeEffect = 1.2;
               break;
            case 3:
               iStarDegreeEffect = 1.2;
               break;
            case 4:
               iStarDegreeEffect = 1.3;
               break;
            case 5:
               iStarDegreeEffect = 1.3;
               break;
            case 6:
               iStarDegreeEffect = 1.4;
               break;
            case 7:
               iStarDegreeEffect = 1.5;
               break;
            case 8:
               iStarDegreeEffect = 1.6;
               break;
            case 9:
               iStarDegreeEffect = 1.7;
               break;
            case 10:
               iStarDegreeEffect = 1.8;
               break;
            case 11:
               iStarDegreeEffect = 1.9;
               break;
            case 12:
               iStarDegreeEffect = 2.1;
               break;
            case 13:
               iStarDegreeEffect = 2.3;
               break;
            case 14:
               iStarDegreeEffect = 2.5;
               break;
            case 15:
               iStarDegreeEffect = 2.7;
               break;
            case 16:
               iStarDegreeEffect = 2.9;
         }
         return iStarDegreeEffect;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 45;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 45;
               break;
            case 1:
               iSkillDegreeEffect = 42;
               break;
            case 2:
               iSkillDegreeEffect = 39;
               break;
            case 3:
               iSkillDegreeEffect = 36;
               break;
            case 4:
               iSkillDegreeEffect = 33;
               break;
            case 5:
               iSkillDegreeEffect = 30;
               break;
            case 6:
               iSkillDegreeEffect = 27;
               break;
            case 7:
               iSkillDegreeEffect = 24;
               break;
            case 8:
               iSkillDegreeEffect = 18;
         }
         return iSkillDegreeEffect * 10;
      }
   }
}

