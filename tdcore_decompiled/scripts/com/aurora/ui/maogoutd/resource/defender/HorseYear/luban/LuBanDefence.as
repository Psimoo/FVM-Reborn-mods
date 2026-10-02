package com.aurora.ui.maogoutd.resource.defender.HorseYear.luban
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   
   public class LuBanDefence
   {
      
      internal static const DEFENSE_PRICE:int = 385;
      
      internal static const LUABAN_FINAL_TAG:String = "LUABAN_FINAL_TAG";
      
      public function LuBanDefence()
      {
         super();
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_AthenaShot;
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
      {
         return 70;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 3.5;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 3.5;
               break;
            case 1:
               iSkillDegreeEffect = 3.4;
               break;
            case 2:
               iSkillDegreeEffect = 3.3;
               break;
            case 3:
               iSkillDegreeEffect = 3.2;
               break;
            case 4:
               iSkillDegreeEffect = 3.1;
               break;
            case 5:
               iSkillDegreeEffect = 3;
               break;
            case 6:
               iSkillDegreeEffect = 2.8;
               break;
            case 7:
               iSkillDegreeEffect = 2.6;
               break;
            case 8:
               iSkillDegreeEffect = 2;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 11;
               break;
            case 1:
               iStarDegreeEffect = 14;
               break;
            case 2:
               iStarDegreeEffect = 17;
               break;
            case 3:
               iStarDegreeEffect = 20;
               break;
            case 4:
               iStarDegreeEffect = 25;
               break;
            case 5:
               iStarDegreeEffect = 30;
               break;
            case 6:
               iStarDegreeEffect = 35;
               break;
            case 7:
               iStarDegreeEffect = 40;
               break;
            case 8:
               iStarDegreeEffect = 45;
               break;
            case 9:
               iStarDegreeEffect = 55;
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
               iStarDegreeEffect = 150;
               break;
            case 14:
               iStarDegreeEffect = 190;
               break;
            case 15:
               iStarDegreeEffect = 230;
               break;
            case 16:
               iStarDegreeEffect = 288;
               break;
            case 17:
               iStarDegreeEffect = 372;
               break;
            case 18:
               iStarDegreeEffect = 483;
         }
         return 10 * iStarDegreeEffect;
      }
      
      public static function GetFieldIntruderNumForFiveDirection(stFieldGrid:a_3491) : int
      {
         var i:int = 0;
         if(stFieldGrid)
         {
            for(i = 0; i < BattleFieldView.a_1012; i++)
            {
               if(stFieldGrid.m_stCurrentBattbleFieldView.stFieldRowIntruderStatusArray[i] > 0)
               {
                  return 1;
               }
            }
         }
         return 0;
      }
   }
}

