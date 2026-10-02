package com.aurora.ui.maogoutd.resource.defender.TigerYear.DangDangTiger
{
   public class DangDangTigerDefine
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const DEFENSE_PRICE:int = 200;
      
      internal static const FIRSTTRANS_ADDITION:Number = 0.1;
      
      public function DangDangTigerDefine()
      {
         super();
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 7;
               break;
            case 1:
               iStarDegreeEffect = 8;
               break;
            case 2:
               iStarDegreeEffect = 9;
               break;
            case 3:
               iStarDegreeEffect = 11.5;
               break;
            case 4:
               iStarDegreeEffect = 14;
               break;
            case 5:
               iStarDegreeEffect = 16.5;
               break;
            case 6:
               iStarDegreeEffect = 19.5;
               break;
            case 7:
               iStarDegreeEffect = 23;
               break;
            case 8:
               iStarDegreeEffect = 27.5;
               break;
            case 9:
               iStarDegreeEffect = 32;
               break;
            case 10:
               iStarDegreeEffect = 36.5;
               break;
            case 11:
               iStarDegreeEffect = 43.5;
               break;
            case 12:
               iStarDegreeEffect = 50.5;
               break;
            case 13:
               iStarDegreeEffect = 57.5;
               break;
            case 14:
               iStarDegreeEffect = 64.5;
               break;
            case 15:
               iStarDegreeEffect = 71.5;
               break;
            case 16:
               iStarDegreeEffect = 78.5;
         }
         return iStarDegreeEffect;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 3.8;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 3.8;
               break;
            case 1:
               iSkillDegreeEffect = 3.7;
               break;
            case 2:
               iSkillDegreeEffect = 3.5;
               break;
            case 3:
               iSkillDegreeEffect = 3.3;
               break;
            case 4:
               iSkillDegreeEffect = 3.1;
               break;
            case 5:
               iSkillDegreeEffect = 2.9;
               break;
            case 6:
               iSkillDegreeEffect = 2.7;
               break;
            case 7:
               iSkillDegreeEffect = 2.5;
               break;
            case 8:
               iSkillDegreeEffect = 2.2;
         }
         return iSkillDegreeEffect * 20;
      }
   }
}

