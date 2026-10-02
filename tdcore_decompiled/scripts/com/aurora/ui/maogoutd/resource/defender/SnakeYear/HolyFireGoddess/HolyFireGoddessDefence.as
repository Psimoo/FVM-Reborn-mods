package com.aurora.ui.maogoutd.resource.defender.SnakeYear.HolyFireGoddess
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class HolyFireGoddessDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 320;
      
      public function HolyFireGoddessDefence()
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
               iSkillDegreeEffect = 0.9;
               break;
            case 8:
               iSkillDegreeEffect = 0.8;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 8;
               break;
            case 1:
               iStarDegreeEffect = 9;
               break;
            case 2:
               iStarDegreeEffect = 10;
               break;
            case 3:
               iStarDegreeEffect = 12;
               break;
            case 4:
               iStarDegreeEffect = 14;
               break;
            case 5:
               iStarDegreeEffect = 16;
               break;
            case 6:
               iStarDegreeEffect = 18;
               break;
            case 7:
               iStarDegreeEffect = 20;
               break;
            case 8:
               iStarDegreeEffect = 25;
               break;
            case 9:
               iStarDegreeEffect = 30;
               break;
            case 10:
               iStarDegreeEffect = 40;
               break;
            case 11:
               iStarDegreeEffect = 55;
               break;
            case 12:
               iStarDegreeEffect = 70;
               break;
            case 13:
               iStarDegreeEffect = 85;
               break;
            case 14:
               iStarDegreeEffect = 105;
               break;
            case 15:
               iStarDegreeEffect = 125;
               break;
            case 16:
               iStarDegreeEffect = 150;
               break;
            case 17:
               iStarDegreeEffect = 225;
               break;
            case 18:
               iStarDegreeEffect = 338;
         }
         return 10 * iStarDegreeEffect;
      }
      
      internal static function GetFieldIntruderNumForAheadDirection(stFieldGrid:a_3491, iYRange:int = 0, killall:Boolean = false) : int
      {
         var yStart:int = 0;
         var yEnd:int = 0;
         var i:int = 0;
         var yIndex:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         var stMoveIntruder:a_4206 = null;
         var iTotalIntruderNum:int = 0;
         if(stFieldGrid)
         {
            yStart = Math.max(stFieldGrid.m_iYGridNo - iYRange,0);
            yEnd = Math.min(stFieldGrid.m_iYGridNo + iYRange,BattleFieldView.a_1012 - 1);
            for(i = 0; i < BattleFieldView.a_1011; i++)
            {
               for(yIndex = yStart; yIndex <= yEnd; yIndex++)
               {
                  stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,yIndex);
                  if(stTargetFieldGrid != null)
                  {
                     for each(stMoveIntruder in stTargetFieldGrid.a_1511)
                     {
                        if(stMoveIntruder != null && stMoveIntruder.iLifeValue > 0)
                        {
                           if(killall)
                           {
                              return 1;
                           }
                           if(BattleFieldView.m_GostMouse.indexOf(stMoveIntruder.m_stMoveIntruderTypeID) != -1)
                           {
                              return 1;
                           }
                           if(BattleFieldView.m_UnPopularMouse.indexOf(stMoveIntruder.m_stMoveIntruderTypeID) != -1)
                           {
                              return 1;
                           }
                           if(stMoveIntruder.iSpaceState == 0 || stMoveIntruder.iSpaceState == 2)
                           {
                              return 1;
                           }
                        }
                     }
                  }
               }
            }
         }
         return iTotalIntruderNum;
      }
   }
}

