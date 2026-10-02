package com.aurora.ui.maogoutd.resource.defender.SnakeYear.goldLightBader
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   
   public class GoldLightBaderDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 395;
      
      public function GoldLightBaderDefence()
      {
         super();
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_AthenaShot;
      }
      
      internal static function a_3964(iSkillDegree:int = 0) : int
      {
         return 210;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 3.5;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 3.5;
               break;
            case 1:
               iSkillDegreeEffect = 3.45;
               break;
            case 2:
               iSkillDegreeEffect = 3.4;
               break;
            case 3:
               iSkillDegreeEffect = 3.35;
               break;
            case 4:
               iSkillDegreeEffect = 3.3;
               break;
            case 5:
               iSkillDegreeEffect = 3.2;
               break;
            case 6:
               iSkillDegreeEffect = 3.1;
               break;
            case 7:
               iSkillDegreeEffect = 3;
               break;
            case 8:
               iSkillDegreeEffect = 2.8;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : Number
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 12;
               break;
            case 1:
               iStarDegreeEffect = 14;
               break;
            case 2:
               iStarDegreeEffect = 16;
               break;
            case 3:
               iStarDegreeEffect = 18;
               break;
            case 4:
               iStarDegreeEffect = 20;
               break;
            case 5:
               iStarDegreeEffect = 25;
               break;
            case 6:
               iStarDegreeEffect = 30;
               break;
            case 7:
               iStarDegreeEffect = 36;
               break;
            case 8:
               iStarDegreeEffect = 42;
               break;
            case 9:
               iStarDegreeEffect = 48;
               break;
            case 10:
               iStarDegreeEffect = 54;
               break;
            case 11:
               iStarDegreeEffect = 66;
               break;
            case 12:
               iStarDegreeEffect = 78;
               break;
            case 13:
               iStarDegreeEffect = 90;
               break;
            case 14:
               iStarDegreeEffect = 102;
               break;
            case 15:
               iStarDegreeEffect = 116;
               break;
            case 16:
               iStarDegreeEffect = 132;
               break;
            case 17:
               iStarDegreeEffect = 198;
               break;
            case 18:
               iStarDegreeEffect = 300;
         }
         return iStarDegreeEffect;
      }
      
      internal static function BoomTrigger(gride:a_3491, stDataEvent:Object, maxCount:int) : void
      {
         var nearestDefenses:Array = null;
         var def:a_3962 = null;
         if(gride == null || stDataEvent.dataObject.length < 4)
         {
            return;
         }
         if(stDataEvent.dataObject[3].m_bPlaceByUpGradeCard)
         {
            return;
         }
         var iDefenseTypeID:int = int(stDataEvent.dataObject[0]);
         var iDefenseCount:int = int(stDataEvent.dataObject[1]);
         var tempFieldGrid:Object = stDataEvent.dataObject[2];
         if(iDefenseTypeID == 286400570 || iDefenseTypeID == 286400571 || iDefenseTypeID == 286400572 || iDefenseTypeID == 286400573)
         {
            nearestDefenses = GetNearestDefensesByTypeID(gride,tempFieldGrid.m_iXGridNo,tempFieldGrid.m_iYGridNo,maxCount);
            for each(def in nearestDefenses)
            {
               def.SpecialSkillCallBack(1);
            }
         }
      }
      
      internal static function GetNearestDefensesByTypeID(gride:a_3491, targetX:int, targetY:int, maxCount:int) : Array
      {
         var x:int = 0;
         var stFieldGrid:a_3491 = null;
         var defense:a_3962 = null;
         var dx:Number = NaN;
         var dy:Number = NaN;
         var distSquared:Number = NaN;
         var battlefield:BattleFieldView = gride.m_stCurrentBattbleFieldView;
         var candidates:Array = [];
         for(var y:int = 0; y < BattleFieldView.a_1012; y++)
         {
            for(x = 0; x < BattleFieldView.a_1011; x++)
            {
               stFieldGrid = battlefield.a_3438(x,y);
               if(stFieldGrid)
               {
                  defense = stFieldGrid.m_stAttackFighter;
                  if(Boolean(defense) && isGoldLightBaderTower(defense.a_3512()))
                  {
                     dx = defense.x - targetX;
                     dy = defense.y - targetY;
                     distSquared = dx * dx + dy * dy;
                     candidates.push({
                        "def":defense,
                        "dist":distSquared
                     });
                  }
               }
            }
         }
         candidates.sortOn("dist",Array.NUMERIC);
         var result:Array = [];
         var len:int = Math.min(maxCount,candidates.length);
         for(var i:int = 0; i < len; i++)
         {
            result.push(candidates[i].def);
         }
         return result;
      }
      
      internal static function isGoldLightBaderTower(id:uint) : Boolean
      {
         return id == 286401898 || id == 286401899 || id == 286401900 || id == 286401901;
      }
      
      internal static function HasDarkGod(gride:a_3491) : Boolean
      {
         var typeID:uint = 0;
         if(!gride)
         {
            return false;
         }
         var darkGodIDs:Array = [286400570,286400571,286400572,286400573];
         for each(typeID in darkGodIDs)
         {
            if(gride.m_stCurrentBattbleFieldView.a_3422(typeID) > 0)
            {
               return true;
            }
         }
         return false;
      }
      
      internal static function HasNormalDarkGod(gride:a_3491) : Boolean
      {
         var typeID:uint = 0;
         if(!gride)
         {
            return false;
         }
         var darkGodIDs:Array = [286400570,286400571,286400572];
         for each(typeID in darkGodIDs)
         {
            if(gride.m_stCurrentBattbleFieldView.a_3422(typeID) > 0)
            {
               return true;
            }
         }
         return false;
      }
      
      internal static function HasSupremeDarkGod(gride:a_3491) : Boolean
      {
         if(!gride)
         {
            return false;
         }
         return gride.m_stCurrentBattbleFieldView.a_3422(286400573) > 0;
      }
      
      internal static function GetFinalLightBaderHolyMultiplier(gride:a_3491) : Number
      {
         if(!gride)
         {
            return 1;
         }
         if(HasSupremeDarkGod(gride))
         {
            return 8;
         }
         if(HasNormalDarkGod(gride))
         {
            return 5;
         }
         return 1;
      }
   }
}

