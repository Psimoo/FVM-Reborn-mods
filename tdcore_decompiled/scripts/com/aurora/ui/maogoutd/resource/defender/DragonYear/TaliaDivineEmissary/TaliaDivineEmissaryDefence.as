package com.aurora.ui.maogoutd.resource.defender.DragonYear.TaliaDivineEmissary
{
   import a_4718.b_183;
   
   public class TaliaDivineEmissaryDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 260;
      
      internal static const m_NormalFollowingShotDefense:Array = new Array(289603632,286457934,286457951,286457956,286458078,286458079,286458074,286458075,286458076,286458077,286462304,286462318,286462319,286458724,286458734,286458735,289603636,289603646,289603647,286394656,286394670,286394671,286401552,286401566,286401567,286392656,286392670,286392671,286393946,286393947,286393948,286393949,286402112,286402126,286402127,286402192,286402206,286402207,286402128,286402142,286402143,286402320,286402334,286402335,286402448,286402462,286402463);
      
      internal static const m_SeocndFollowingShotDefense:Array = new Array(286401120,286401134,286401135,294846512,294846526,294846527,286392608,286392622,286392623,286392848,286392862,286392863,286394416,286394430,286394431,294846608,294846622,286393373,294846623,294846618,294846619,294846620,294846621,286392618,286392619,286392620,286392621,286400912,286400926,286400927,286401386,286401387,286401388,286401389,286401386,286401387,286401388,286401389);
      
      internal static const m_GoldFollowingShotDefense:Array = m_NormalFollowingShotDefense.concat(m_SeocndFollowingShotDefense);
      
      public function TaliaDivineEmissaryDefence()
      {
         super();
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_AthenaShot;
      }
      
      internal static function a_3964(iSkillDegree:int = 0) : int
      {
         return a_3966(iSkillDegree);
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 0;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 40;
               break;
            case 1:
               iSkillDegreeEffect = 37;
               break;
            case 2:
               iSkillDegreeEffect = 34;
               break;
            case 3:
               iSkillDegreeEffect = 31;
               break;
            case 4:
               iSkillDegreeEffect = 28;
               break;
            case 5:
               iSkillDegreeEffect = 25;
               break;
            case 6:
               iSkillDegreeEffect = 22;
               break;
            case 7:
               iSkillDegreeEffect = 19;
               break;
            case 8:
               iSkillDegreeEffect = 15;
         }
         return iSkillDegreeEffect * 10;
      }
      
      internal static function a_3965(iStarDegree:int) : Number
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 1.5;
               break;
            case 1:
               iStarDegreeEffect = 1.5;
               break;
            case 2:
               iStarDegreeEffect = 1.6;
               break;
            case 3:
               iStarDegreeEffect = 1.6;
               break;
            case 4:
               iStarDegreeEffect = 1.8;
               break;
            case 5:
               iStarDegreeEffect = 1.9;
               break;
            case 6:
               iStarDegreeEffect = 2;
               break;
            case 7:
               iStarDegreeEffect = 2.1;
               break;
            case 8:
               iStarDegreeEffect = 2.2;
               break;
            case 9:
               iStarDegreeEffect = 2.4;
               break;
            case 10:
               iStarDegreeEffect = 2.6;
               break;
            case 11:
               iStarDegreeEffect = 2.8;
               break;
            case 12:
               iStarDegreeEffect = 3;
               break;
            case 13:
               iStarDegreeEffect = 3.3;
               break;
            case 14:
               iStarDegreeEffect = 3.6;
               break;
            case 15:
               iStarDegreeEffect = 3.9;
               break;
            case 16:
               iStarDegreeEffect = 4.2;
               break;
            case 17:
               iStarDegreeEffect = 4.7;
               break;
            case 18:
               iStarDegreeEffect = 5.5;
         }
         return iStarDegreeEffect - 1;
      }
   }
}

