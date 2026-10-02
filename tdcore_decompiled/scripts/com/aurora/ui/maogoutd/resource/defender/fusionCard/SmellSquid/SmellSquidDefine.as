package com.aurora.ui.maogoutd.resource.defender.fusionCard.SmellSquid
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   
   public class SmellSquidDefine
   {
      
      internal static const DEFENSE_PRICE:int = 155;
      
      internal static const FIRSTTRANS_DEFENSE_PRICE:int = 95;
      
      internal static const SECONDTRANS_DEFENSE_PRICE:int = 95;
      
      internal static const POISON_ADD_HURT_VALUE:int = 35;
      
      internal static const MAX_LIFE_VALUE:int = 20 * 10;
      
      public function SmellSquidDefine()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int = 0) : int
      {
         return 70;
      }
      
      public static function GetCardGradeDegreeEffectValue(iGradeDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iGradeDegree)
         {
            case 0:
               iStarDegreeEffect = 1.9;
               break;
            case 1:
               iStarDegreeEffect = 1.9;
               break;
            case 2:
               iStarDegreeEffect = 2.3;
               break;
            case 3:
               iStarDegreeEffect = 2.7;
               break;
            case 4:
               iStarDegreeEffect = 3.1;
               break;
            case 5:
               iStarDegreeEffect = 3.8;
               break;
            case 6:
               iStarDegreeEffect = 4.5;
               break;
            case 7:
               iStarDegreeEffect = 5.5;
               break;
            case 8:
               iStarDegreeEffect = 6.5;
               break;
            case 9:
               iStarDegreeEffect = 7.5;
               break;
            case 10:
               iStarDegreeEffect = 9;
               break;
            case 11:
               iStarDegreeEffect = 12;
               break;
            case 12:
               iStarDegreeEffect = 15;
               break;
            case 13:
               iStarDegreeEffect = 18;
               break;
            case 14:
               iStarDegreeEffect = 22;
               break;
            case 15:
               iStarDegreeEffect = 27;
               break;
            case 16:
               iStarDegreeEffect = 33;
         }
         return iStarDegreeEffect * 10;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 3.25;
               break;
            case 1:
               iStarDegreeEffect = 3.9;
               break;
            case 2:
               iStarDegreeEffect = 4.55;
               break;
            case 3:
               iStarDegreeEffect = 5.2;
               break;
            case 4:
               iStarDegreeEffect = 6.5;
               break;
            case 5:
               iStarDegreeEffect = 7.8;
               break;
            case 6:
               iStarDegreeEffect = 9.1;
               break;
            case 7:
               iStarDegreeEffect = 11.05;
               break;
            case 8:
               iStarDegreeEffect = 13;
               break;
            case 9:
               iStarDegreeEffect = 14.95;
               break;
            case 10:
               iStarDegreeEffect = 18.2;
               break;
            case 11:
               iStarDegreeEffect = 23.4;
               break;
            case 12:
               iStarDegreeEffect = 29.9;
               break;
            case 13:
               iStarDegreeEffect = 37.05;
               break;
            case 14:
               iStarDegreeEffect = 44.85;
               break;
            case 15:
               iStarDegreeEffect = 53.3;
               break;
            case 16:
               iStarDegreeEffect = 63.05;
         }
         return iStarDegreeEffect * 10;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 0;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 1.5;
               break;
            case 1:
               iSkillDegreeEffect = 1.45;
               break;
            case 2:
               iSkillDegreeEffect = 1.4;
               break;
            case 3:
               iSkillDegreeEffect = 1.35;
               break;
            case 4:
               iSkillDegreeEffect = 1.3;
               break;
            case 5:
               iSkillDegreeEffect = 1.25;
               break;
            case 6:
               iSkillDegreeEffect = 1.2;
               break;
            case 7:
               iSkillDegreeEffect = 1.15;
               break;
            case 8:
               iSkillDegreeEffect = 1.05;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function GetFieldIntruderNumForFiveDirection(stFieldGrid:a_3491) : int
      {
         var iTotalIntruderNum:int = 0;
         var i:int = 0;
         if(stFieldGrid)
         {
            for(i = 0; i < BattleFieldView.a_1012; i++)
            {
               iTotalIntruderNum += stFieldGrid.m_stCurrentBattbleFieldView.stFieldRowIntruderStatusArray[i];
            }
         }
         return iTotalIntruderNum;
      }
   }
}

