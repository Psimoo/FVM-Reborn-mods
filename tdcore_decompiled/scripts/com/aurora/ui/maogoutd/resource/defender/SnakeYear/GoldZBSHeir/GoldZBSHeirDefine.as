package com.aurora.ui.maogoutd.resource.defender.SnakeYear.GoldZBSHeir
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class GoldZBSHeirDefine
   {
      
      internal static const DEFENSE_PRICE:int = 385;
      
      public function GoldZBSHeirDefine()
      {
         super();
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_ScorpioShot;
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
      {
         return 70;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 1.25;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 1.25;
               break;
            case 1:
               iSkillDegreeEffect = 1.2;
               break;
            case 2:
               iSkillDegreeEffect = 1.15;
               break;
            case 3:
               iSkillDegreeEffect = 1.1;
               break;
            case 4:
               iSkillDegreeEffect = 1.05;
               break;
            case 5:
               iSkillDegreeEffect = 1;
               break;
            case 6:
               iSkillDegreeEffect = 0.95;
               break;
            case 7:
               iSkillDegreeEffect = 0.9;
               break;
            case 8:
               iSkillDegreeEffect = 0.85;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 6;
               break;
            case 1:
               iStarDegreeEffect = 7;
               break;
            case 2:
               iStarDegreeEffect = 8;
               break;
            case 3:
               iStarDegreeEffect = 9;
               break;
            case 4:
               iStarDegreeEffect = 11;
               break;
            case 5:
               iStarDegreeEffect = 13;
               break;
            case 6:
               iStarDegreeEffect = 15;
               break;
            case 7:
               iStarDegreeEffect = 17;
               break;
            case 8:
               iStarDegreeEffect = 19;
               break;
            case 9:
               iStarDegreeEffect = 21;
               break;
            case 10:
               iStarDegreeEffect = 30;
               break;
            case 11:
               iStarDegreeEffect = 39;
               break;
            case 12:
               iStarDegreeEffect = 48;
               break;
            case 13:
               iStarDegreeEffect = 63;
               break;
            case 14:
               iStarDegreeEffect = 78;
               break;
            case 15:
               iStarDegreeEffect = 93;
               break;
            case 16:
               iStarDegreeEffect = 108;
               break;
            case 17:
               iStarDegreeEffect = 162;
               break;
            case 18:
               iStarDegreeEffect = 291;
         }
         return iStarDegreeEffect * 10;
      }
      
      internal static function GetFieldIntruderNumForAheadDirection(stFieldGrid:a_3491, iYRange:int = 0) : int
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
                           if(stMoveIntruder.iSpaceState == 0 || stMoveIntruder.iSpaceState == 2)
                           {
                              return 1;
                           }
                           if(BattleFieldView.m_GostMouse.indexOf(stMoveIntruder.m_stMoveIntruderTypeID) != -1)
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

