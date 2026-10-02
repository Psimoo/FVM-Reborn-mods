package com.aurora.ui.maogoutd.resource.defender.TigerYear.OilMushroom
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class OilMushroomDefine
   {
      
      internal static const DEFENSE_PRICE:int = 255;
      
      internal static const FIRSTTRANS_DEFENSE_PRICE:int = 225;
      
      internal static const MAX_LIFE_VALUE:int = 90;
      
      public function OilMushroomDefine()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int) : int
      {
         return 70;
      }
      
      internal static function GetHighShotHurtValue(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 5.5;
               break;
            case 1:
               iStarDegreeEffect = 6;
               break;
            case 2:
               iStarDegreeEffect = 6.5;
               break;
            case 3:
               iStarDegreeEffect = 7;
               break;
            case 4:
               iStarDegreeEffect = 8;
               break;
            case 5:
               iStarDegreeEffect = 9;
               break;
            case 6:
               iStarDegreeEffect = 10;
               break;
            case 7:
               iStarDegreeEffect = 12;
               break;
            case 8:
               iStarDegreeEffect = 14;
               break;
            case 9:
               iStarDegreeEffect = 17;
               break;
            case 10:
               iStarDegreeEffect = 20;
               break;
            case 11:
               iStarDegreeEffect = 23;
               break;
            case 12:
               iStarDegreeEffect = 26;
               break;
            case 13:
               iStarDegreeEffect = 29;
               break;
            case 14:
               iStarDegreeEffect = 32;
               break;
            case 15:
               iStarDegreeEffect = 35;
               break;
            case 16:
               iStarDegreeEffect = 38;
         }
         return iStarDegreeEffect * 10;
      }
      
      internal static function GetLowShotHurtValue(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 2.8;
               break;
            case 1:
               iStarDegreeEffect = 3.4;
               break;
            case 2:
               iStarDegreeEffect = 4;
               break;
            case 3:
               iStarDegreeEffect = 4.6;
               break;
            case 4:
               iStarDegreeEffect = 5.2;
               break;
            case 5:
               iStarDegreeEffect = 5.8;
               break;
            case 6:
               iStarDegreeEffect = 6.4;
               break;
            case 7:
               iStarDegreeEffect = 7;
               break;
            case 8:
               iStarDegreeEffect = 7.6;
               break;
            case 9:
               iStarDegreeEffect = 8.6;
               break;
            case 10:
               iStarDegreeEffect = 9.6;
               break;
            case 11:
               iStarDegreeEffect = 10.6;
               break;
            case 12:
               iStarDegreeEffect = 11.6;
               break;
            case 13:
               iStarDegreeEffect = 13.6;
               break;
            case 14:
               iStarDegreeEffect = 15.6;
               break;
            case 15:
               iStarDegreeEffect = 17.6;
               break;
            case 16:
               iStarDegreeEffect = 21.6;
         }
         return iStarDegreeEffect * 10;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 2.5;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 2.5;
               break;
            case 1:
               iSkillDegreeEffect = 2.4;
               break;
            case 2:
               iSkillDegreeEffect = 2.3;
               break;
            case 3:
               iSkillDegreeEffect = 2.2;
               break;
            case 4:
               iSkillDegreeEffect = 2.1;
               break;
            case 5:
               iSkillDegreeEffect = 2;
               break;
            case 6:
               iSkillDegreeEffect = 1.9;
               break;
            case 7:
               iSkillDegreeEffect = 1.8;
               break;
            case 8:
               iSkillDegreeEffect = 1.5;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function GetFieldIntruderNumForAheadDirection(stFieldGrid:a_3491) : int
      {
         var stTargetFieldGrid:a_3491 = null;
         var stMoveIntruder:a_4206 = null;
         var iIntruderIndex:int = 0;
         var iTotalIntruderNum:int = 0;
         var i:int = 0;
         if(stFieldGrid)
         {
            for(i = stFieldGrid.m_iXGridNo; i < BattleFieldView.a_1011; i++)
            {
               stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,stFieldGrid.m_iYGridNo);
               for(iIntruderIndex = 0; iIntruderIndex < stTargetFieldGrid.a_1511.length; iIntruderIndex++)
               {
                  stMoveIntruder = stTargetFieldGrid.a_1511[iIntruderIndex];
                  if(!stMoveIntruder.isCannotSeeByFighter)
                  {
                     iTotalIntruderNum++;
                  }
               }
            }
         }
         return iTotalIntruderNum;
      }
      
      internal static function GetHighIntruderNum(stFieldGrid:a_3491) : int
      {
         var stTargetFieldGrid:a_3491 = null;
         var stMoveIntruder:a_4206 = null;
         var iIntruderIndex:int = 0;
         var iTotalIntruderNum:int = 0;
         var i:int = 0;
         if(stFieldGrid)
         {
            for(i = stFieldGrid.m_iXGridNo; i < BattleFieldView.a_1011; i++)
            {
               stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,stFieldGrid.m_iYGridNo);
               for(iIntruderIndex = 0; iIntruderIndex < stTargetFieldGrid.a_1511.length; iIntruderIndex++)
               {
                  stMoveIntruder = stTargetFieldGrid.a_1511[iIntruderIndex];
                  if(!stMoveIntruder.isCannotSeeByFighter && 3 == stMoveIntruder.iSpaceState)
                  {
                     iTotalIntruderNum++;
                  }
               }
            }
         }
         return iTotalIntruderNum;
      }
      
      internal static function GetNormalIntruderNum(stFieldGrid:a_3491) : int
      {
         var stTargetFieldGrid:a_3491 = null;
         var iIntruderIndex:int = 0;
         var iTotalIntruderNum:int = 0;
         var i:int = 0;
         if(stFieldGrid)
         {
            for(i = stFieldGrid.m_iXGridNo; i < BattleFieldView.a_1011; i++)
            {
               stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,stFieldGrid.m_iYGridNo);
               for(iIntruderIndex = 0; iIntruderIndex < stTargetFieldGrid.a_1511.length; iIntruderIndex++)
               {
                  if((stTargetFieldGrid.a_1511[iIntruderIndex] as a_4206).iSpaceState == 0)
                  {
                     iTotalIntruderNum++;
                  }
               }
            }
         }
         return iTotalIntruderNum;
      }
   }
}

