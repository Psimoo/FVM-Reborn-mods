package com.aurora.ui.maogoutd.resource.defender.fusionCard.CoffeeCup
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class CoffeeCupDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 0;
      
      public function CoffeeCupDefence()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int = 0) : int
      {
         return 70;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 1.3;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 1.3;
               break;
            case 1:
               iSkillDegreeEffect = 1.25;
               break;
            case 2:
               iSkillDegreeEffect = 1.2;
               break;
            case 3:
               iSkillDegreeEffect = 1.15;
               break;
            case 4:
               iSkillDegreeEffect = 1.1;
               break;
            case 5:
               iSkillDegreeEffect = 1.05;
               break;
            case 6:
               iSkillDegreeEffect = 1;
               break;
            case 7:
               iSkillDegreeEffect = 0.95;
               break;
            case 8:
               iSkillDegreeEffect = 0.9;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 1;
               break;
            case 1:
               iStarDegreeEffect = 1.2;
               break;
            case 2:
               iStarDegreeEffect = 1.4;
               break;
            case 3:
               iStarDegreeEffect = 1.6;
               break;
            case 4:
               iStarDegreeEffect = 1.8;
               break;
            case 5:
               iStarDegreeEffect = 2;
               break;
            case 6:
               iStarDegreeEffect = 2.2;
               break;
            case 7:
               iStarDegreeEffect = 2.6;
               break;
            case 8:
               iStarDegreeEffect = 3.2;
               break;
            case 9:
               iStarDegreeEffect = 4;
               break;
            case 10:
               iStarDegreeEffect = 5.5;
               break;
            case 11:
               iStarDegreeEffect = 7;
               break;
            case 12:
               iStarDegreeEffect = 8.5;
               break;
            case 13:
               iStarDegreeEffect = 10;
               break;
            case 14:
               iStarDegreeEffect = 11.5;
               break;
            case 15:
               iStarDegreeEffect = 13;
               break;
            case 16:
               iStarDegreeEffect = 14.5;
         }
         return 10 * iStarDegreeEffect;
      }
      
      internal static function GetCardPrimaryValueByGradeDegree(iGradeDegree:int) : int
      {
         var iGradeDegreeValue:Number = 0;
         switch(iGradeDegree)
         {
            case 1:
               iGradeDegreeValue = 0.6;
               break;
            case 2:
               iGradeDegreeValue = 0.7;
               break;
            case 3:
               iGradeDegreeValue = 0.8;
               break;
            case 4:
               iGradeDegreeValue = 0.9;
               break;
            case 5:
               iGradeDegreeValue = 1;
               break;
            case 6:
               iGradeDegreeValue = 1.1;
               break;
            case 7:
               iGradeDegreeValue = 1.3;
               break;
            case 8:
               iGradeDegreeValue = 1.6;
               break;
            case 9:
               iGradeDegreeValue = 2;
               break;
            case 10:
               iGradeDegreeValue = 2.75;
               break;
            case 11:
               iGradeDegreeValue = 3.5;
               break;
            case 12:
               iGradeDegreeValue = 4.25;
               break;
            case 13:
               iGradeDegreeValue = 5;
               break;
            case 14:
               iGradeDegreeValue = 5.75;
               break;
            case 15:
               iGradeDegreeValue = 6.5;
               break;
            case 16:
               iGradeDegreeValue = 7.25;
         }
         return iGradeDegreeValue * 10;
      }
      
      internal static function GetCardDeepValueByGradeDegree(iGradeDegree:int) : int
      {
         var iGradeDegreeValue:Number = 0;
         switch(iGradeDegree)
         {
            case 1:
               iGradeDegreeValue = 0.6;
               break;
            case 2:
               iGradeDegreeValue = 0.7;
               break;
            case 3:
               iGradeDegreeValue = 0.8;
               break;
            case 4:
               iGradeDegreeValue = 0.9;
               break;
            case 5:
               iGradeDegreeValue = 1;
               break;
            case 6:
               iGradeDegreeValue = 1.1;
               break;
            case 7:
               iGradeDegreeValue = 1.3;
               break;
            case 8:
               iGradeDegreeValue = 1.6;
               break;
            case 9:
               iGradeDegreeValue = 2;
               break;
            case 10:
               iGradeDegreeValue = 2.75;
               break;
            case 11:
               iGradeDegreeValue = 3.5;
               break;
            case 12:
               iGradeDegreeValue = 4.25;
               break;
            case 13:
               iGradeDegreeValue = 5;
               break;
            case 14:
               iGradeDegreeValue = 5.75;
               break;
            case 15:
               iGradeDegreeValue = 6.5;
               break;
            case 16:
               iGradeDegreeValue = 7.25;
         }
         return iGradeDegreeValue * 10;
      }
      
      internal static function GetCardSoulValueByGradeDegree(iGradeDegree:int) : int
      {
         var iGradeDegreeValue:Number = 0;
         switch(iGradeDegree)
         {
            case 1:
               iGradeDegreeValue = 0.6;
               break;
            case 2:
               iGradeDegreeValue = 0.7;
               break;
            case 3:
               iGradeDegreeValue = 0.8;
               break;
            case 4:
               iGradeDegreeValue = 0.9;
               break;
            case 5:
               iGradeDegreeValue = 1;
               break;
            case 6:
               iGradeDegreeValue = 1.1;
               break;
            case 7:
               iGradeDegreeValue = 1.3;
               break;
            case 8:
               iGradeDegreeValue = 1.6;
               break;
            case 9:
               iGradeDegreeValue = 2;
               break;
            case 10:
               iGradeDegreeValue = 2.75;
               break;
            case 11:
               iGradeDegreeValue = 3.5;
               break;
            case 12:
               iGradeDegreeValue = 4.25;
               break;
            case 13:
               iGradeDegreeValue = 5;
               break;
            case 14:
               iGradeDegreeValue = 5.75;
               break;
            case 15:
               iGradeDegreeValue = 6.5;
               break;
            case 16:
               iGradeDegreeValue = 7.25;
         }
         return iGradeDegreeValue * 10;
      }
      
      internal static function GetFieldIntruderNumForAheadDirection(stFieldGrid:a_3491, range:int = 0) : int
      {
         var stTargetFieldGrid:a_3491 = null;
         var stMoveIntruder:a_4206 = null;
         var yStart:int = 0;
         var yEnd:int = 0;
         var yIndex:int = 0;
         var iTotalIntruderNum:int = 0;
         var i:int = 0;
         if(stFieldGrid)
         {
            yStart = Math.max(stFieldGrid.m_iYGridNo - range,0);
            yEnd = Math.min(stFieldGrid.m_iYGridNo + range,BattleFieldView.a_1012 - 1);
            loop0:
            for(i = 0; i < BattleFieldView.a_1011; )
            {
               yIndex = yStart;
               loop1:
               while(true)
               {
                  if(yIndex > yEnd)
                  {
                     i++;
                     continue loop0;
                  }
                  stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,yIndex);
                  if(stTargetFieldGrid != null)
                  {
                     for each(stMoveIntruder in stTargetFieldGrid.a_1511)
                     {
                        if(!stMoveIntruder.isCannotSeeByFighter && (0 == stMoveIntruder.iSpaceState || 2 == stMoveIntruder.iSpaceState))
                        {
                           break loop1;
                        }
                     }
                  }
                  yIndex++;
               }
               return 1;
            }
         }
         return iTotalIntruderNum;
      }
   }
}

