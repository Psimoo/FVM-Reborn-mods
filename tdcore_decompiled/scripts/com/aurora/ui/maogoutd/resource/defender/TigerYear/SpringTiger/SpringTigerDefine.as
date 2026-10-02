package com.aurora.ui.maogoutd.resource.defender.TigerYear.SpringTiger
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class SpringTigerDefine
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 6;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 6;
      
      internal static const DEFENSE_PRICE:int = 195;
      
      internal static const FIRSTTRANS_ADDITION:Number = 0.25;
      
      public function SpringTigerDefine()
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
               iStarDegreeEffect = 14.5;
               break;
            case 1:
               iStarDegreeEffect = 15.5;
               break;
            case 2:
               iStarDegreeEffect = 16.5;
               break;
            case 3:
               iStarDegreeEffect = 17.5;
               break;
            case 4:
               iStarDegreeEffect = 20;
               break;
            case 5:
               iStarDegreeEffect = 22.5;
               break;
            case 6:
               iStarDegreeEffect = 25;
               break;
            case 7:
               iStarDegreeEffect = 28;
               break;
            case 8:
               iStarDegreeEffect = 33;
               break;
            case 9:
               iStarDegreeEffect = 38;
               break;
            case 10:
               iStarDegreeEffect = 43;
               break;
            case 11:
               iStarDegreeEffect = 48;
               break;
            case 12:
               iStarDegreeEffect = 53;
               break;
            case 13:
               iStarDegreeEffect = 58;
               break;
            case 14:
               iStarDegreeEffect = 63;
               break;
            case 15:
               iStarDegreeEffect = 68;
               break;
            case 16:
               iStarDegreeEffect = 75;
         }
         return iStarDegreeEffect * 10;
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

