package com.aurora.ui.maogoutd.resource.defender.HorseYear.macaron
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.EffectManager;
   import flash.utils.Dictionary;
   
   public class MacaronDefence
   {
      
      internal static const DEFENSE_PRICE:int = 220;
      
      internal static var m_dictEffect:Dictionary = new Dictionary();
      
      public function MacaronDefence()
      {
         super();
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_AthenaShot;
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
      {
         return 70;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 3;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 3;
               break;
            case 1:
               iSkillDegreeEffect = 2.9;
               break;
            case 2:
               iSkillDegreeEffect = 2.8;
               break;
            case 3:
               iSkillDegreeEffect = 2.7;
               break;
            case 4:
               iSkillDegreeEffect = 2.6;
               break;
            case 5:
               iSkillDegreeEffect = 2.5;
               break;
            case 6:
               iSkillDegreeEffect = 2.3;
               break;
            case 7:
               iSkillDegreeEffect = 2.1;
               break;
            case 8:
               iSkillDegreeEffect = 1.8;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 6;
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
               iStarDegreeEffect = 16;
               break;
            case 7:
               iStarDegreeEffect = 19;
               break;
            case 8:
               iStarDegreeEffect = 23;
               break;
            case 9:
               iStarDegreeEffect = 27;
               break;
            case 10:
               iStarDegreeEffect = 31;
               break;
            case 11:
               iStarDegreeEffect = 35;
               break;
            case 12:
               iStarDegreeEffect = 42;
               break;
            case 13:
               iStarDegreeEffect = 49;
               break;
            case 14:
               iStarDegreeEffect = 56;
               break;
            case 15:
               iStarDegreeEffect = 63;
               break;
            case 16:
               iStarDegreeEffect = 70;
         }
         return iStarDegreeEffect * 10;
      }
      
      internal static function CreateEffect(grid:a_3491, trans:int, iHurtPower:int) : void
      {
         var iID:int = 0;
         var stEffect:MacaronTopEffect = null;
         iID = trans * 1000 + grid.m_iYGridNo * 100 + grid.m_iXGridNo;
         stEffect = m_dictEffect[iID];
         if(stEffect == null)
         {
            stEffect = EffectManager.getInstance().CheckOutOne(MacaronTopEffect,GetShotMovieClip(trans)) as MacaronTopEffect;
            grid.m_stCurrentBattbleFieldView.AddToBattleView(stEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,grid);
            stEffect.x = a_3491.a_1080 * (grid.m_iXGridNo + 0.5);
            stEffect.y = a_3491.a_1081 * (grid.m_iYGridNo + 0.5);
            m_dictEffect[iID] = stEffect;
         }
         stEffect.InitData(grid,trans,iHurtPower);
      }
      
      internal static function GetShotMovieClip(trans:int) : Class
      {
         if(trans == 1)
         {
            return MacaronBaseTopEffectMovie;
         }
         if(trans == 2)
         {
            return MacaronFirstTopEffectMovie;
         }
         return MacaronSecondTopEffectMovie;
      }
      
      internal static function GetShotMovieClip2(trans:int) : Class
      {
         if(trans == 1)
         {
            return MacaronBaseBottomEffectMovie;
         }
         if(trans == 2)
         {
            return MacaronFirstBottomEffectMovie;
         }
         return MacaronSecondBottomEffectMovie;
      }
   }
}

