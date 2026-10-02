package com.aurora.ui.maogoutd.resource.defender.TigerYear.GoldEarthGoddess
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   
   public class GoldEarthGoddessDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 350;
      
      internal static const REDUEC_DEFENSE_PRICE:int = 100;
      
      public function GoldEarthGoddessDefence()
      {
         super();
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_AthenaShot;
      }
      
      internal static function a_3964(iSkillDegree:int = 0) : int
      {
         var iSkillDegreeEffect:Number = 0;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 35;
               break;
            case 1:
               iSkillDegreeEffect = 32;
               break;
            case 2:
               iSkillDegreeEffect = 29;
               break;
            case 3:
               iSkillDegreeEffect = 26;
               break;
            case 4:
               iSkillDegreeEffect = 23;
               break;
            case 5:
               iSkillDegreeEffect = 20;
               break;
            case 6:
               iSkillDegreeEffect = 17;
               break;
            case 7:
               iSkillDegreeEffect = 14;
               break;
            case 8:
               iSkillDegreeEffect = 9;
         }
         return iSkillDegreeEffect * 10;
      }
      
      internal static function a_3966(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 35;
               break;
            case 1:
               iStarDegreeEffect = 34;
               break;
            case 2:
               iStarDegreeEffect = 33;
               break;
            case 3:
               iStarDegreeEffect = 32;
               break;
            case 4:
               iStarDegreeEffect = 31;
               break;
            case 5:
               iStarDegreeEffect = 30;
               break;
            case 6:
               iStarDegreeEffect = 29;
               break;
            case 7:
               iStarDegreeEffect = 27;
               break;
            case 8:
               iStarDegreeEffect = 25;
               break;
            case 9:
               iStarDegreeEffect = 23;
               break;
            case 10:
               iStarDegreeEffect = 21;
               break;
            case 11:
               iStarDegreeEffect = 19;
               break;
            case 12:
               iStarDegreeEffect = 17;
               break;
            case 13:
               iStarDegreeEffect = 15;
               break;
            case 14:
               iStarDegreeEffect = 13;
               break;
            case 15:
               iStarDegreeEffect = 11;
               break;
            case 16:
               iStarDegreeEffect = 9;
               break;
            case 17:
               iStarDegreeEffect = 7;
               break;
            case 18:
               iStarDegreeEffect = 5;
         }
         return iStarDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : Number
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 90;
               break;
            case 1:
               iStarDegreeEffect = 90;
               break;
            case 2:
               iStarDegreeEffect = 90;
               break;
            case 3:
               iStarDegreeEffect = 90;
               break;
            case 4:
               iStarDegreeEffect = 90;
               break;
            case 5:
               iStarDegreeEffect = 90;
               break;
            case 6:
               iStarDegreeEffect = 90;
               break;
            case 7:
               iStarDegreeEffect = 90;
               break;
            case 8:
               iStarDegreeEffect = 90;
               break;
            case 9:
               iStarDegreeEffect = 90;
               break;
            case 10:
               iStarDegreeEffect = 90;
               break;
            case 11:
               iStarDegreeEffect = 90;
               break;
            case 12:
               iStarDegreeEffect = 100;
               break;
            case 13:
               iStarDegreeEffect = 100;
               break;
            case 14:
               iStarDegreeEffect = 110;
               break;
            case 15:
               iStarDegreeEffect = 120;
               break;
            case 16:
               iStarDegreeEffect = 130;
               break;
            case 17:
               iStarDegreeEffect = 150;
               break;
            case 18:
               iStarDegreeEffect = 195;
         }
         return iStarDegreeEffect * 10;
      }
      
      public static function a_3431(startFieldGrid:a_3491, iCenterRowNum:int = 1) : int
      {
         if(startFieldGrid == null)
         {
            return 0;
         }
         var iTotalIntruderNum:int = 0;
         var yStart:int = Math.max(startFieldGrid.m_iYGridNo - iCenterRowNum,0);
         var yEnd:int = Math.min(startFieldGrid.m_iYGridNo + iCenterRowNum,BattleFieldView.a_1012 - 1);
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            iTotalIntruderNum += startFieldGrid.m_stCurrentBattbleFieldView.stFieldRowIntruderStatusArray[yIndex];
         }
         return iTotalIntruderNum;
      }
   }
}

