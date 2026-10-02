package com.aurora.ui.maogoutd.resource.defender.DragonYear.DreamyDonets
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class DreamyDonetsDefine
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 6;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 6;
      
      internal static const DEFENSE_PRICE:int = 200;
      
      internal static const FIRSTTRANS_ADDITION:Number = 0.25;
      
      public function DreamyDonetsDefine()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int) : int
      {
         return 7 * 10;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 10;
               break;
            case 1:
               iStarDegreeEffect = 11;
               break;
            case 2:
               iStarDegreeEffect = 12;
               break;
            case 3:
               iStarDegreeEffect = 13;
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
               iStarDegreeEffect = 23;
               break;
            case 9:
               iStarDegreeEffect = 26;
               break;
            case 10:
               iStarDegreeEffect = 29;
               break;
            case 11:
               iStarDegreeEffect = 32;
               break;
            case 12:
               iStarDegreeEffect = 36;
               break;
            case 13:
               iStarDegreeEffect = 40;
               break;
            case 14:
               iStarDegreeEffect = 44;
               break;
            case 15:
               iStarDegreeEffect = 48;
               break;
            case 16:
               iStarDegreeEffect = 52;
         }
         return iStarDegreeEffect * 10;
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
      
      internal static function GetShotTypeID() : int
      {
         return b_183.enm_JumpChecken;
      }
      
      public static function a_3431(startFieldGrid:a_3491) : int
      {
         var stMoveIntrude:a_4206 = null;
         var stMoveIntruder:a_4206 = null;
         if(startFieldGrid == null)
         {
            return 0;
         }
         var stRowIntruderArray:Array = new Array();
         for each(stMoveIntruder in startFieldGrid.m_stCurrentBattbleFieldView.m_arrBaseMoveIntruderVector)
         {
            if(stMoveIntruder.iLifeValue > 0 && (stMoveIntruder.iSpaceState != 0 || !stMoveIntruder.isCannotSeeByFighter) && stMoveIntruder.m_stCurrentFieldGrid.m_iYGridNo == startFieldGrid.m_iYGridNo)
            {
               stRowIntruderArray.push(stMoveIntruder);
            }
         }
         return stRowIntruderArray.length;
      }
   }
}

