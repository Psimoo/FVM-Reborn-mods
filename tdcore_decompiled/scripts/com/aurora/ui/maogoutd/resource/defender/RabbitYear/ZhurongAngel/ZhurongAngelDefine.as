package com.aurora.ui.maogoutd.resource.defender.RabbitYear.ZhurongAngel
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   
   public class ZhurongAngelDefine
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const DEFENSE_PRICE:int = 245;
      
      internal static const FIRSTTRANS_ADDITION:Number = 0.1;
      
      public function ZhurongAngelDefine()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int = 0) : int
      {
         return 70;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 9;
               break;
            case 1:
               iStarDegreeEffect = 10;
               break;
            case 2:
               iStarDegreeEffect = 12;
               break;
            case 3:
               iStarDegreeEffect = 15;
               break;
            case 4:
               iStarDegreeEffect = 18;
               break;
            case 5:
               iStarDegreeEffect = 22;
               break;
            case 6:
               iStarDegreeEffect = 26;
               break;
            case 7:
               iStarDegreeEffect = 31;
               break;
            case 8:
               iStarDegreeEffect = 36;
               break;
            case 9:
               iStarDegreeEffect = 42;
               break;
            case 10:
               iStarDegreeEffect = 48;
               break;
            case 11:
               iStarDegreeEffect = 57;
               break;
            case 12:
               iStarDegreeEffect = 66;
               break;
            case 13:
               iStarDegreeEffect = 75;
               break;
            case 14:
               iStarDegreeEffect = 85;
               break;
            case 15:
               iStarDegreeEffect = 95;
               break;
            case 16:
               iStarDegreeEffect = 105;
               break;
            case 17:
               iStarDegreeEffect = 127;
               break;
            case 18:
               iStarDegreeEffect = 178;
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
      
      internal static function GetFieldRowIntruderNumForSevenRow(stFieldGrid:a_3491) : int
      {
         var iTotalIntruderNum:int = 0;
         if(stFieldGrid == null)
         {
            return iTotalIntruderNum;
         }
         var iCenterRowNum:int = stFieldGrid.m_iYGridNo;
         if(iCenterRowNum >= 0 && iCenterRowNum < BattleFieldView.a_1012)
         {
            iTotalIntruderNum += stFieldGrid.m_stCurrentBattbleFieldView.stFieldRowIntruderStatusArray[iCenterRowNum];
         }
         if(iCenterRowNum + 1 >= 0 && iCenterRowNum + 1 < BattleFieldView.a_1012)
         {
            iTotalIntruderNum += stFieldGrid.m_stCurrentBattbleFieldView.stFieldRowIntruderStatusArray[iCenterRowNum + 1];
         }
         if(iCenterRowNum - 1 >= 0 && iCenterRowNum - 1 < BattleFieldView.a_1012)
         {
            iTotalIntruderNum += stFieldGrid.m_stCurrentBattbleFieldView.stFieldRowIntruderStatusArray[iCenterRowNum - 1];
         }
         if(iCenterRowNum + 2 >= 0 && iCenterRowNum + 2 < BattleFieldView.a_1012)
         {
            iTotalIntruderNum += stFieldGrid.m_stCurrentBattbleFieldView.stFieldRowIntruderStatusArray[iCenterRowNum + 2];
         }
         if(iCenterRowNum - 2 >= 0 && iCenterRowNum - 2 < BattleFieldView.a_1012)
         {
            iTotalIntruderNum += stFieldGrid.m_stCurrentBattbleFieldView.stFieldRowIntruderStatusArray[iCenterRowNum - 2];
         }
         if(iCenterRowNum + 3 >= 0 && iCenterRowNum + 3 < BattleFieldView.a_1012)
         {
            iTotalIntruderNum += stFieldGrid.m_stCurrentBattbleFieldView.stFieldRowIntruderStatusArray[iCenterRowNum + 3];
         }
         if(iCenterRowNum - 3 >= 0 && iCenterRowNum - 3 < BattleFieldView.a_1012)
         {
            iTotalIntruderNum += stFieldGrid.m_stCurrentBattbleFieldView.stFieldRowIntruderStatusArray[iCenterRowNum - 3];
         }
         return iTotalIntruderNum;
      }
   }
}

