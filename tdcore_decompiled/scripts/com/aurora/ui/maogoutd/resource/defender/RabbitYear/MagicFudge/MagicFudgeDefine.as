package com.aurora.ui.maogoutd.resource.defender.RabbitYear.MagicFudge
{
   import com.aurora.ui.maogoutd.game.a_3491;
   
   public class MagicFudgeDefine
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const DEFENSE_PRICE:int = 25;
      
      internal static const FIRSTTRANS_ADDITION:Number = 0.1;
      
      public function MagicFudgeDefine()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int = 0) : int
      {
         return a_3966(iSkillDegree);
      }
      
      internal static function GetWaterCardStarDegreeEffectValue(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 5;
               break;
            case 1:
               iStarDegreeEffect = 6;
               break;
            case 2:
               iStarDegreeEffect = 7;
               break;
            case 3:
               iStarDegreeEffect = 8;
               break;
            case 4:
               iStarDegreeEffect = 9;
               break;
            case 5:
               iStarDegreeEffect = 10;
               break;
            case 6:
               iStarDegreeEffect = 11;
               break;
            case 7:
               iStarDegreeEffect = 13;
               break;
            case 8:
               iStarDegreeEffect = 15;
               break;
            case 9:
               iStarDegreeEffect = 17;
               break;
            case 10:
               iStarDegreeEffect = 21;
               break;
            case 11:
               iStarDegreeEffect = 25;
               break;
            case 12:
               iStarDegreeEffect = 29;
               break;
            case 13:
               iStarDegreeEffect = 33;
               break;
            case 14:
               iStarDegreeEffect = 37;
               break;
            case 15:
               iStarDegreeEffect = 41;
               break;
            case 16:
               iStarDegreeEffect = 45;
         }
         return iStarDegreeEffect * 10;
      }
      
      internal static function GetLandCardStarDegreeEffectValue(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 360;
               break;
            case 1:
               iStarDegreeEffect = 380;
               break;
            case 2:
               iStarDegreeEffect = 400;
               break;
            case 3:
               iStarDegreeEffect = 420;
               break;
            case 4:
               iStarDegreeEffect = 450;
               break;
            case 5:
               iStarDegreeEffect = 480;
               break;
            case 6:
               iStarDegreeEffect = 510;
               break;
            case 7:
               iStarDegreeEffect = 570;
               break;
            case 8:
               iStarDegreeEffect = 630;
               break;
            case 9:
               iStarDegreeEffect = 690;
               break;
            case 10:
               iStarDegreeEffect = 770;
               break;
            case 11:
               iStarDegreeEffect = 850;
               break;
            case 12:
               iStarDegreeEffect = 930;
               break;
            case 13:
               iStarDegreeEffect = 1010;
               break;
            case 14:
               iStarDegreeEffect = 1090;
               break;
            case 15:
               iStarDegreeEffect = 1170;
               break;
            case 16:
               iStarDegreeEffect = 1250;
         }
         return iStarDegreeEffect * 10;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 7;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 7;
               break;
            case 1:
               iSkillDegreeEffect = 6.5;
               break;
            case 2:
               iSkillDegreeEffect = 6;
               break;
            case 3:
               iSkillDegreeEffect = 5.5;
               break;
            case 4:
               iSkillDegreeEffect = 5;
               break;
            case 5:
               iSkillDegreeEffect = 4.5;
               break;
            case 6:
               iSkillDegreeEffect = 4;
               break;
            case 7:
               iSkillDegreeEffect = 3.5;
               break;
            case 8:
               iSkillDegreeEffect = 3;
         }
         return iSkillDegreeEffect * 10;
      }
      
      internal static function a_3430(stFieldGrid:a_3491) : int
      {
         var stTargetFieldGrid:a_3491 = null;
         var iTotalIntruderNum:int = 0;
         var i:int = 0;
         if(stFieldGrid)
         {
            iTotalIntruderNum += stFieldGrid.m_stCurrentBattbleFieldView.a_3430(stFieldGrid.m_iYGridNo);
         }
         return iTotalIntruderNum;
      }
   }
}

