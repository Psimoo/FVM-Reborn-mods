package com.aurora.ui.maogoutd.resource.defender.PigYear.AirCraftMeow
{
   import a_4718.b_183;
   
   public class AirCraftMeowDefine
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 11;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 4;
      
      internal static const DEFENSE_PRICE:int = 220;
      
      internal static const FIRSTTRANS_ADDITION:Number = 0.3;
      
      public function AirCraftMeowDefine()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
      {
         return 70;
      }
      
      internal static function GetShotTypeID() : int
      {
         return b_183.enm_JumpChecken;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         if(iSkillDegree == 8)
         {
            return 24;
         }
         return 60 - iSkillDegree * 4;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 19;
               break;
            case 1:
               iStarDegreeEffect = 20;
               break;
            case 2:
               iStarDegreeEffect = 21;
               break;
            case 3:
               iStarDegreeEffect = 22;
               break;
            case 4:
               iStarDegreeEffect = 24;
               break;
            case 5:
               iStarDegreeEffect = 27;
               break;
            case 6:
               iStarDegreeEffect = 32;
               break;
            case 7:
               iStarDegreeEffect = 37;
               break;
            case 8:
               iStarDegreeEffect = 42;
               break;
            case 9:
               iStarDegreeEffect = 47;
               break;
            case 10:
               iStarDegreeEffect = 52;
               break;
            case 11:
               iStarDegreeEffect = 57;
               break;
            case 12:
               iStarDegreeEffect = 62;
               break;
            case 13:
               iStarDegreeEffect = 68;
               break;
            case 14:
               iStarDegreeEffect = 72;
               break;
            case 15:
               iStarDegreeEffect = 78;
               break;
            case 16:
               iStarDegreeEffect = 84;
         }
         return iStarDegreeEffect * 10;
      }
   }
}

