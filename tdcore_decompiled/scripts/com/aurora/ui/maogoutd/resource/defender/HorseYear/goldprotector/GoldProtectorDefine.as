package com.aurora.ui.maogoutd.resource.defender.HorseYear.goldprotector
{
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Util.BattleVOUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.DisplayObject;
   import flash.utils.Dictionary;
   
   public class GoldProtectorDefine
   {
      
      public static var m_KillSkillMouse:Array = [8389649,8388759,8389644,8389647,8389642,8389013];
      
      private static const m_KillSkillMouseDic:Dictionary = BattleVOUtil.buildLookup(m_KillSkillMouse);
      
      internal static const SHOT_DELAY_TIMENUM:int = 12;
      
      internal static const DEFENSE_PRICE:int = 300;
      
      public function GoldProtectorDefine()
      {
         super();
      }
      
      public static function IsKillSkillMouse(iMoveIntruderTypeID:int) : Boolean
      {
         return m_KillSkillMouseDic[iMoveIntruderTypeID] === true;
      }
      
      internal static function AddShotToBattleView(stShot:a_4348, stFieldGrid:a_3491) : void
      {
         if(!stShot || !stFieldGrid || !stFieldGrid.m_stCurrentBattbleFieldView)
         {
            return;
         }
         var stShotDisplay:DisplayObject = stShot as DisplayObject;
         stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stShotDisplay,BattleLayerDefine.SHOT_TYPE,stFieldGrid);
         if(stShotDisplay.parent)
         {
            stShotDisplay.parent.setChildIndex(stShotDisplay,0);
         }
      }
      
      internal static function a_3964(iStarDegree:int) : int
      {
         return 70;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 0;
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
               iSkillDegreeEffect = 1.55;
               break;
            case 6:
               iSkillDegreeEffect = 1.5;
               break;
            case 7:
               iSkillDegreeEffect = 1.4;
               break;
            case 8:
               iSkillDegreeEffect = 1.3;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 10;
               break;
            case 1:
               iStarDegreeEffect = 12;
               break;
            case 2:
               iStarDegreeEffect = 15;
               break;
            case 3:
               iStarDegreeEffect = 18;
               break;
            case 4:
               iStarDegreeEffect = 21;
               break;
            case 5:
               iStarDegreeEffect = 26;
               break;
            case 6:
               iStarDegreeEffect = 31;
               break;
            case 7:
               iStarDegreeEffect = 36;
               break;
            case 8:
               iStarDegreeEffect = 41;
               break;
            case 9:
               iStarDegreeEffect = 46;
               break;
            case 10:
               iStarDegreeEffect = 56;
               break;
            case 11:
               iStarDegreeEffect = 66;
               break;
            case 12:
               iStarDegreeEffect = 81;
               break;
            case 13:
               iStarDegreeEffect = 96;
               break;
            case 14:
               iStarDegreeEffect = 111;
               break;
            case 15:
               iStarDegreeEffect = 126;
               break;
            case 16:
               iStarDegreeEffect = 141;
               break;
            case 17:
               iStarDegreeEffect = 191;
               break;
            case 18:
               iStarDegreeEffect = 245;
         }
         return iStarDegreeEffect * 10;
      }
      
      public static function CanBeFindIntruder(intruder:a_4206, transIndex:int = 0) : Boolean
      {
         if(!intruder || intruder.iLifeValue <= 0 || !intruder.m_stCurrentFieldGrid)
         {
            return false;
         }
         if(BattleVOUtil.IsGostMouse(intruder.m_stMoveIntruderTypeID) || BattleVOUtil.IsUnPopularMouse(intruder.m_stMoveIntruderTypeID))
         {
            return true;
         }
         if(IsKillSkillMouse(intruder.m_stMoveIntruderTypeID) && transIndex >= 1)
         {
            return true;
         }
         if(intruder.iSpaceState == 1 && transIndex >= 2)
         {
            return true;
         }
         if(!intruder.isCannotSeeByFighter)
         {
            return true;
         }
         return false;
      }
      
      public static function a_3431(gride:a_3491, orgX:Number, orgY:Number, transIndex:int = 0) : a_4206
      {
         var nearest:a_4206 = null;
         var intruder:a_4206 = null;
         var dx:Number = NaN;
         var dy:Number = NaN;
         var distSq:Number = NaN;
         if(!gride)
         {
            return null;
         }
         var minDistSq:Number = -1;
         var intruders:Array = gride.m_stCurrentBattbleFieldView.m_arrBaseMoveIntruderVector;
         for each(intruder in intruders)
         {
            if(CanBeFindIntruder(intruder,transIndex))
            {
               dx = intruder.x - orgX;
               dy = intruder.y - orgY;
               distSq = dx * dx + dy * dy;
               if(minDistSq < 0 || distSq < minDistSq)
               {
                  minDistSq = distSq;
                  nearest = intruder;
               }
            }
         }
         return nearest;
      }
   }
}

