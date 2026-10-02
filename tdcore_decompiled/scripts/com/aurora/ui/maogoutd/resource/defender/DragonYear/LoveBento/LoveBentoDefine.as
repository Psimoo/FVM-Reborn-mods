package com.aurora.ui.maogoutd.resource.defender.DragonYear.LoveBento
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class LoveBentoDefine
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 8;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 6;
      
      internal static const DEFENSE_PRICE:int = 180;
      
      internal static const FIRSTTRANS_ADDITION:Number = 0.25;
      
      public function LoveBentoDefine()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
      {
         return 70;
      }
      
      internal static function GetShotTypeID() : int
      {
         return b_183.enm_JumpChecken;
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
               iStarDegreeEffect = 11;
               break;
            case 1:
               iStarDegreeEffect = 12;
               break;
            case 2:
               iStarDegreeEffect = 13;
               break;
            case 3:
               iStarDegreeEffect = 14;
               break;
            case 4:
               iStarDegreeEffect = 16;
               break;
            case 5:
               iStarDegreeEffect = 18;
               break;
            case 6:
               iStarDegreeEffect = 20;
               break;
            case 7:
               iStarDegreeEffect = 22;
               break;
            case 8:
               iStarDegreeEffect = 26;
               break;
            case 9:
               iStarDegreeEffect = 30;
               break;
            case 10:
               iStarDegreeEffect = 34;
               break;
            case 11:
               iStarDegreeEffect = 38;
               break;
            case 12:
               iStarDegreeEffect = 42;
               break;
            case 13:
               iStarDegreeEffect = 46;
               break;
            case 14:
               iStarDegreeEffect = 51;
               break;
            case 15:
               iStarDegreeEffect = 56;
               break;
            case 16:
               iStarDegreeEffect = 61;
         }
         return iStarDegreeEffect * 10;
      }
      
      public static function a_3431(stFieldGrid:a_3491) : int
      {
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var j:int = 0;
         var iTotalIntruderNum:int = 0;
         if(stFieldGrid)
         {
            loop0:
            for(j = 0; j < BattleFieldView.a_1011; )
            {
               arrMoveIntruder = stFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[stFieldGrid.m_iYGridNo][j].a_1511;
               var _loc6_:int = 0;
               var _loc7_:* = arrMoveIntruder;
               loop1:
               while(true)
               {
                  for each(stMoveIntruder in _loc7_)
                  {
                     if(stMoveIntruder.iLifeValue > 0 && stMoveIntruder.iSpaceState != 1)
                     {
                        if(BattleFieldView.m_UnPopularMouse.indexOf(stMoveIntruder.m_stMoveIntruderTypeID) != -1)
                        {
                           break loop1;
                        }
                        iTotalIntruderNum++;
                     }
                  }
                  j++;
                  continue loop0;
               }
               return 1;
            }
         }
         return iTotalIntruderNum > 0 ? 2 : 0;
      }
   }
}

