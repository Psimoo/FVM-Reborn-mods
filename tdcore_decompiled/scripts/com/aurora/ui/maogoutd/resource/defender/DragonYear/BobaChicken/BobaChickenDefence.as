package com.aurora.ui.maogoutd.resource.defender.DragonYear.BobaChicken
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class BobaChickenDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 375;
      
      internal static const m_GostMouse:Array = new Array(8388631,8388749,8388750,8392727);
      
      internal static const m_UnPopularMouse:Array = new Array(8388649,8392745,8389221);
      
      public function BobaChickenDefence()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int = 0) : int
      {
         return 150;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 55;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 55;
               break;
            case 1:
               iSkillDegreeEffect = 53;
               break;
            case 2:
               iSkillDegreeEffect = 51;
               break;
            case 3:
               iSkillDegreeEffect = 49;
               break;
            case 4:
               iSkillDegreeEffect = 47;
               break;
            case 5:
               iSkillDegreeEffect = 45;
               break;
            case 6:
               iSkillDegreeEffect = 43;
               break;
            case 7:
               iSkillDegreeEffect = 41;
               break;
            case 8:
               iSkillDegreeEffect = 39;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : int
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
               iStarDegreeEffect = 10;
               break;
            case 5:
               iStarDegreeEffect = 12;
               break;
            case 6:
               iStarDegreeEffect = 14;
               break;
            case 7:
               iStarDegreeEffect = 17;
               break;
            case 8:
               iStarDegreeEffect = 20;
               break;
            case 9:
               iStarDegreeEffect = 23;
               break;
            case 10:
               iStarDegreeEffect = 28;
               break;
            case 11:
               iStarDegreeEffect = 36;
               break;
            case 12:
               iStarDegreeEffect = 45;
               break;
            case 13:
               iStarDegreeEffect = 55;
               break;
            case 14:
               iStarDegreeEffect = 66;
               break;
            case 15:
               iStarDegreeEffect = 78;
               break;
            case 16:
               iStarDegreeEffect = 90;
         }
         return 10 * iStarDegreeEffect;
      }
      
      internal static function GetFieldIntruderNumForAheadDirection(stFieldGrid:a_3491) : int
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
            yStart = Math.max(stFieldGrid.m_iYGridNo - 0,0);
            yEnd = Math.min(stFieldGrid.m_iYGridNo + 0,BattleFieldView.a_1012 - 1);
            for(i = 0; i < BattleFieldView.a_1011; i++)
            {
               for(yIndex = yStart; yIndex <= yEnd; yIndex++)
               {
                  stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,yIndex);
                  if(stTargetFieldGrid != null)
                  {
                     for each(stMoveIntruder in stTargetFieldGrid.a_1511)
                     {
                        if(!stMoveIntruder.isCannotSeeByFighter && (0 == stMoveIntruder.iSpaceState || 2 == stMoveIntruder.iSpaceState))
                        {
                           iTotalIntruderNum++;
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

