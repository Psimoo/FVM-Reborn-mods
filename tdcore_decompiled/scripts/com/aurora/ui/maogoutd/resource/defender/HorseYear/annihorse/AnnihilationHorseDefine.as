package com.aurora.ui.maogoutd.resource.defender.HorseYear.annihorse
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class AnnihilationHorseDefine
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 14;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 6;
      
      internal static const DEFENSE_PRICE:int = 320;
      
      internal static const FIRSTTRANS_ADDITION:Number = 0.25;
      
      public function AnnihilationHorseDefine()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
      {
         return 70;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 1.8;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 1.8;
               break;
            case 1:
               iSkillDegreeEffect = 1.75;
               break;
            case 2:
               iSkillDegreeEffect = 1.7;
               break;
            case 3:
               iSkillDegreeEffect = 1.65;
               break;
            case 4:
               iSkillDegreeEffect = 1.6;
               break;
            case 5:
               iSkillDegreeEffect = 1.5;
               break;
            case 6:
               iSkillDegreeEffect = 1.4;
               break;
            case 7:
               iSkillDegreeEffect = 1.3;
               break;
            case 8:
               iSkillDegreeEffect = 1;
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
               iStarDegreeEffect = 9;
               break;
            case 5:
               iStarDegreeEffect = 10;
               break;
            case 6:
               iStarDegreeEffect = 12;
               break;
            case 7:
               iStarDegreeEffect = 14;
               break;
            case 8:
               iStarDegreeEffect = 16;
               break;
            case 9:
               iStarDegreeEffect = 20;
               break;
            case 10:
               iStarDegreeEffect = 24;
               break;
            case 11:
               iStarDegreeEffect = 28;
               break;
            case 12:
               iStarDegreeEffect = 38;
               break;
            case 13:
               iStarDegreeEffect = 58;
               break;
            case 14:
               iStarDegreeEffect = 78;
               break;
            case 15:
               iStarDegreeEffect = 98;
               break;
            case 16:
               iStarDegreeEffect = 118;
         }
         return iStarDegreeEffect * 10;
      }
      
      public static function HasIntruderOnRow(stFieldGrid:a_3491) : Boolean
      {
         var targetGrid:a_3491 = null;
         var arr:Array = null;
         var intruder:a_4206 = null;
         if(!stFieldGrid)
         {
            return false;
         }
         var fieldView:BattleFieldView = stFieldGrid.m_stCurrentBattbleFieldView;
         if(!fieldView)
         {
            return false;
         }
         var grids:Array = fieldView.stFieldGridsVector;
         var y:int = stFieldGrid.m_iYGridNo;
         for(var x:int = 0; x < BattleFieldView.a_1011; x++)
         {
            targetGrid = grids[y][x];
            if(targetGrid)
            {
               arr = targetGrid.IntruderArray;
               if(!(!arr || arr.length == 0))
               {
                  for each(intruder in arr)
                  {
                     if(intruder.iLifeValue > 0)
                     {
                        if(!intruder.isCannotSeeByFighter)
                        {
                           if(intruder.iSpaceState == 0)
                           {
                              return true;
                           }
                        }
                     }
                  }
               }
            }
         }
         return false;
      }
   }
}

