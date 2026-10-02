package com.aurora.ui.maogoutd.resource.defender.fusionCard.oilMushroom
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class OilMushroomDefence
   {
      
      internal static const DEFENSE_PRICE:int = 255;
      
      internal static const FIRSTTRANS_DEFENSE_PRICE:int = 225;
      
      internal static const MAX_LIFE_VALUE:int = 90;
      
      public function OilMushroomDefence()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int = 0) : int
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
      
      internal static function GetPrimaryGroundHurtValue(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 1:
               iStarDegreeEffect = 1.7;
               break;
            case 2:
               iStarDegreeEffect = 2;
               break;
            case 3:
               iStarDegreeEffect = 2.3;
               break;
            case 4:
               iStarDegreeEffect = 2.6;
               break;
            case 5:
               iStarDegreeEffect = 2.9;
               break;
            case 6:
               iStarDegreeEffect = 3.2;
               break;
            case 7:
               iStarDegreeEffect = 3.5;
               break;
            case 8:
               iStarDegreeEffect = 3.8;
               break;
            case 9:
               iStarDegreeEffect = 4.3;
               break;
            case 10:
               iStarDegreeEffect = 4.8;
               break;
            case 11:
               iStarDegreeEffect = 5.3;
               break;
            case 12:
               iStarDegreeEffect = 5.8;
               break;
            case 13:
               iStarDegreeEffect = 6.8;
               break;
            case 14:
               iStarDegreeEffect = 7.8;
               break;
            case 15:
               iStarDegreeEffect = 8.8;
               break;
            case 16:
               iStarDegreeEffect = 10.8;
         }
         return iStarDegreeEffect * 10;
      }
      
      internal static function GetPrimaryAirHurtValue(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 1:
               iStarDegreeEffect = 2.75;
               break;
            case 2:
               iStarDegreeEffect = 3;
               break;
            case 3:
               iStarDegreeEffect = 3.25;
               break;
            case 4:
               iStarDegreeEffect = 3.75;
               break;
            case 5:
               iStarDegreeEffect = 4.25;
               break;
            case 6:
               iStarDegreeEffect = 4.75;
               break;
            case 7:
               iStarDegreeEffect = 5.75;
               break;
            case 8:
               iStarDegreeEffect = 6.75;
               break;
            case 9:
               iStarDegreeEffect = 8;
               break;
            case 10:
               iStarDegreeEffect = 9.5;
               break;
            case 11:
               iStarDegreeEffect = 11;
               break;
            case 12:
               iStarDegreeEffect = 12.5;
               break;
            case 13:
               iStarDegreeEffect = 14;
               break;
            case 14:
               iStarDegreeEffect = 15.5;
               break;
            case 15:
               iStarDegreeEffect = 17;
               break;
            case 16:
               iStarDegreeEffect = 18.5;
         }
         return iStarDegreeEffect * 10;
      }
      
      internal static function GetDeepGroundHurtValue(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 1:
               iStarDegreeEffect = 2.4;
               break;
            case 2:
               iStarDegreeEffect = 2.9;
               break;
            case 3:
               iStarDegreeEffect = 3.4;
               break;
            case 4:
               iStarDegreeEffect = 3.9;
               break;
            case 5:
               iStarDegreeEffect = 4.4;
               break;
            case 6:
               iStarDegreeEffect = 4.9;
               break;
            case 7:
               iStarDegreeEffect = 5.4;
               break;
            case 8:
               iStarDegreeEffect = 5.9;
               break;
            case 9:
               iStarDegreeEffect = 6.4;
               break;
            case 10:
               iStarDegreeEffect = 6.9;
               break;
            case 11:
               iStarDegreeEffect = 7.4;
               break;
            case 12:
               iStarDegreeEffect = 8.2;
               break;
            case 13:
               iStarDegreeEffect = 9;
               break;
            case 14:
               iStarDegreeEffect = 11;
               break;
            case 15:
               iStarDegreeEffect = 13.5;
               break;
            case 16:
               iStarDegreeEffect = 17;
         }
         return iStarDegreeEffect * 10;
      }
      
      internal static function GetSoulAirHurtValue(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 1:
               iStarDegreeEffect = 4;
               break;
            case 2:
               iStarDegreeEffect = 4.4;
               break;
            case 3:
               iStarDegreeEffect = 4.8;
               break;
            case 4:
               iStarDegreeEffect = 5.2;
               break;
            case 5:
               iStarDegreeEffect = 6;
               break;
            case 6:
               iStarDegreeEffect = 6.8;
               break;
            case 7:
               iStarDegreeEffect = 7.6;
               break;
            case 8:
               iStarDegreeEffect = 9.2;
               break;
            case 9:
               iStarDegreeEffect = 10.8;
               break;
            case 10:
               iStarDegreeEffect = 12.8;
               break;
            case 11:
               iStarDegreeEffect = 15.2;
               break;
            case 12:
               iStarDegreeEffect = 17.6;
               break;
            case 13:
               iStarDegreeEffect = 20;
               break;
            case 14:
               iStarDegreeEffect = 31;
               break;
            case 15:
               iStarDegreeEffect = 34;
               break;
            case 16:
               iStarDegreeEffect = 38;
         }
         return iStarDegreeEffect * 10;
      }
   }
}

