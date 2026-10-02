package com.aurora.ui.maogoutd.resource.defender.SnakeYear.BananaCannon
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class BananaCannonDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 225;
      
      public function BananaCannonDefence()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int = 0) : int
      {
         return 70;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 2.6;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 2.6;
               break;
            case 1:
               iSkillDegreeEffect = 2.55;
               break;
            case 2:
               iSkillDegreeEffect = 2.5;
               break;
            case 3:
               iSkillDegreeEffect = 2.45;
               break;
            case 4:
               iSkillDegreeEffect = 2.4;
               break;
            case 5:
               iSkillDegreeEffect = 2.35;
               break;
            case 6:
               iSkillDegreeEffect = 2.3;
               break;
            case 7:
               iSkillDegreeEffect = 2.2;
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
               iStarDegreeEffect = 3.5;
               break;
            case 1:
               iStarDegreeEffect = 4;
               break;
            case 2:
               iStarDegreeEffect = 4.5;
               break;
            case 3:
               iStarDegreeEffect = 5.5;
               break;
            case 4:
               iStarDegreeEffect = 6.5;
               break;
            case 5:
               iStarDegreeEffect = 7.5;
               break;
            case 6:
               iStarDegreeEffect = 8.5;
               break;
            case 7:
               iStarDegreeEffect = 10;
               break;
            case 8:
               iStarDegreeEffect = 11.5;
               break;
            case 9:
               iStarDegreeEffect = 13;
               break;
            case 10:
               iStarDegreeEffect = 16.5;
               break;
            case 11:
               iStarDegreeEffect = 20;
               break;
            case 12:
               iStarDegreeEffect = 27;
               break;
            case 13:
               iStarDegreeEffect = 42;
               break;
            case 14:
               iStarDegreeEffect = 57;
               break;
            case 15:
               iStarDegreeEffect = 72;
               break;
            case 16:
               iStarDegreeEffect = 87;
         }
         return 10 * iStarDegreeEffect;
      }
      
      internal static function GetFieldIntruderNumForAheadDirection(stFieldGrid:a_3491, range:int = 1) : int
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

