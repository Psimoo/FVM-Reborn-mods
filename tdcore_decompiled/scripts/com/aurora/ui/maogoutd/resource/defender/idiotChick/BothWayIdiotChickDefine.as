package com.aurora.ui.maogoutd.resource.defender.idiotChick
{
   public class BothWayIdiotChickDefine
   {
      
      internal static const DEFENSE_PRICE:int = 115;
      
      public function BothWayIdiotChickDefine()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int) : int
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
               iStarDegreeEffect = 11;
               break;
            case 1:
               iStarDegreeEffect = 13;
               break;
            case 2:
               iStarDegreeEffect = 15;
               break;
            case 3:
               iStarDegreeEffect = 18;
               break;
            case 4:
               iStarDegreeEffect = 20;
               break;
            case 5:
               iStarDegreeEffect = 22;
               break;
            case 6:
               iStarDegreeEffect = 24;
               break;
            case 7:
               iStarDegreeEffect = 29;
               break;
            case 8:
               iStarDegreeEffect = 35;
               break;
            case 9:
               iStarDegreeEffect = 44;
               break;
            case 10:
               iStarDegreeEffect = 61;
               break;
            case 11:
               iStarDegreeEffect = 77;
               break;
            case 12:
               iStarDegreeEffect = 94;
               break;
            case 13:
               iStarDegreeEffect = 110;
               break;
            case 14:
               iStarDegreeEffect = 127;
               break;
            case 15:
               iStarDegreeEffect = 143;
               break;
            case 16:
               iStarDegreeEffect = 163;
         }
         return iStarDegreeEffect;
      }
   }
}

