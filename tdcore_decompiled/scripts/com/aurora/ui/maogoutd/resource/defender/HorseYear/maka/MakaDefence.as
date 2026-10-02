package com.aurora.ui.maogoutd.resource.defender.HorseYear.maka
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Buff.BattleBuffData;
   import com.aurora.ui.maogoutd.game.Buff.BattleBuffParams;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   
   public class MakaDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 50;
      
      public function MakaDefence()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
      {
         return a_3965(iStarDegree);
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 12;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 12;
               break;
            case 1:
               iSkillDegreeEffect = 13;
               break;
            case 2:
               iSkillDegreeEffect = 14;
               break;
            case 3:
               iSkillDegreeEffect = 15;
               break;
            case 4:
               iSkillDegreeEffect = 16;
               break;
            case 5:
               iSkillDegreeEffect = 17;
               break;
            case 6:
               iSkillDegreeEffect = 18;
               break;
            case 7:
               iSkillDegreeEffect = 19;
               break;
            case 8:
               iSkillDegreeEffect = 22;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 55;
               break;
            case 1:
               iStarDegreeEffect = 52;
               break;
            case 2:
               iStarDegreeEffect = 49;
               break;
            case 3:
               iStarDegreeEffect = 46;
               break;
            case 4:
               iStarDegreeEffect = 43;
               break;
            case 5:
               iStarDegreeEffect = 40;
               break;
            case 6:
               iStarDegreeEffect = 37;
               break;
            case 7:
               iStarDegreeEffect = 34;
               break;
            case 8:
               iStarDegreeEffect = 31;
               break;
            case 9:
               iStarDegreeEffect = 28;
               break;
            case 10:
               iStarDegreeEffect = 25;
               break;
            case 11:
               iStarDegreeEffect = 22;
               break;
            case 12:
               iStarDegreeEffect = 19;
               break;
            case 13:
               iStarDegreeEffect = 16;
               break;
            case 14:
               iStarDegreeEffect = 13;
               break;
            case 15:
               iStarDegreeEffect = 10;
               break;
            case 16:
               iStarDegreeEffect = 7;
         }
         return 10 * iStarDegreeEffect;
      }
      
      internal static function WakeUpCardsInRange(a_1334:a_3491, width:int, height:int, skillDegree:int, boomDie:Boolean) : void
      {
         var xIndex:int = 0;
         var stFieldGrid:a_3491 = null;
         var duration:int = a_3966(skillDegree);
         var xStart:int = Math.max(a_1334.m_iXGridNo - int(width / 2),0);
         var xEnd:int = Math.min(a_1334.m_iXGridNo + int(width / 2),BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(a_1334.m_iYGridNo - int(height / 2),0);
         var yEnd:int = Math.min(a_1334.m_iYGridNo + int(height / 2),BattleFieldView.a_1012 - 1);
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               if(null != stFieldGrid)
               {
                  WakeUpAndAddBuffToGrid(stFieldGrid,duration,boomDie);
               }
            }
         }
      }
      
      internal static function WakeUpAndAddBuffToGrid(stFieldGrid:a_3491, duration:int, boomDie:Boolean) : void
      {
         var stMoveIntruder:a_4206 = null;
         if(stFieldGrid.m_stAttackFighter)
         {
            stFieldGrid.m_stAttackFighter.a_3970();
            AddAwakeBuff(stFieldGrid.m_stAttackFighter,duration,stFieldGrid);
         }
         else if(stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3970();
            AddAwakeBuff(stFieldGrid.m_stBaseAuxiliaryFighter,duration,stFieldGrid);
         }
         else if(stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.a_3970();
            AddAwakeBuff(stFieldGrid.m_stFlowerDefense,duration,stFieldGrid);
         }
         else if(stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.a_3970();
            AddAwakeBuff(stFieldGrid.m_stBoomDefense,duration,stFieldGrid);
         }
         else if(stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.a_3970();
            AddAwakeBuff(stFieldGrid.m_stProtector,duration,stFieldGrid);
         }
         if(boomDie == false)
         {
            return;
         }
         var arrMoveIntruder:Array = stFieldGrid.a_1511.slice();
         for each(stMoveIntruder in arrMoveIntruder)
         {
            stMoveIntruder.a_4210();
         }
      }
      
      public static function AddAwakeBuff(defense:a_3962, duration:int, stFieldGrid:a_3491) : void
      {
         var params:BattleBuffParams = new BattleBuffParams();
         params.gameMoveClipClass = MakaBuffMovie;
         params.y = -4;
         params.x = defense.width * 0.5 - 15;
         params.offsetType = 0;
         var buffData:BattleBuffData = defense.buffCom.AddBuff(30003,duration,params);
         if(buffData != null && buffData.stEffect != null)
         {
            stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(buffData.stEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,stFieldGrid);
         }
      }
   }
}

