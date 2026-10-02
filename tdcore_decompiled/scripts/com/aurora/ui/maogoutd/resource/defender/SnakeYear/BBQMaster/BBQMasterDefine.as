package com.aurora.ui.maogoutd.resource.defender.SnakeYear.BBQMaster
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class BBQMasterDefine
   {
      
      internal static const DEFENSE_PRICE:int = 350;
      
      public function BBQMasterDefine()
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
         var iSkillDegreeEffect:Number = 1.4;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 1.4;
               break;
            case 1:
               iSkillDegreeEffect = 1.35;
               break;
            case 2:
               iSkillDegreeEffect = 1.3;
               break;
            case 3:
               iSkillDegreeEffect = 1.25;
               break;
            case 4:
               iSkillDegreeEffect = 1.2;
               break;
            case 5:
               iSkillDegreeEffect = 1.15;
               break;
            case 6:
               iSkillDegreeEffect = 1.1;
               break;
            case 7:
               iSkillDegreeEffect = 1;
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
               iStarDegreeEffect = 2.2;
               break;
            case 1:
               iStarDegreeEffect = 2.6;
               break;
            case 2:
               iStarDegreeEffect = 3;
               break;
            case 3:
               iStarDegreeEffect = 3.4;
               break;
            case 4:
               iStarDegreeEffect = 3.8;
               break;
            case 5:
               iStarDegreeEffect = 4.2;
               break;
            case 6:
               iStarDegreeEffect = 5;
               break;
            case 7:
               iStarDegreeEffect = 6;
               break;
            case 8:
               iStarDegreeEffect = 7;
               break;
            case 9:
               iStarDegreeEffect = 8;
               break;
            case 10:
               iStarDegreeEffect = 11;
               break;
            case 11:
               iStarDegreeEffect = 14;
               break;
            case 12:
               iStarDegreeEffect = 17;
               break;
            case 13:
               iStarDegreeEffect = 22;
               break;
            case 14:
               iStarDegreeEffect = 27;
               break;
            case 15:
               iStarDegreeEffect = 32;
               break;
            case 16:
               iStarDegreeEffect = 37;
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
                        if(stMoveIntruder != null && stMoveIntruder.iLifeValue > 0 && (stMoveIntruder.iSpaceState == 0 || stMoveIntruder.iSpaceState == 2))
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

