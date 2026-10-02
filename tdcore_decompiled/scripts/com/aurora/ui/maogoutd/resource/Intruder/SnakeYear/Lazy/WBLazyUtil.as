package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.Lazy
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Util.BattleEffectUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   
   public class WBLazyUtil
   {
      
      internal static var tempDefenseArr:Array = new Array(286458240,286458254,286458255,286396464,286396478,286396479);
      
      public function WBLazyUtil()
      {
         super();
      }
      
      internal static function CreateFogInOne(battleView:BattleFieldView, iNoX:int, iNoY:int) : void
      {
         var stFieldGrid:a_3491 = battleView.a_3438(iNoX,iNoY);
         if(stFieldGrid == null)
         {
            return;
         }
         if(stFieldGrid.tagCom.HasTag(137))
         {
            return;
         }
         var stEffect:WBFogEffect = BattleEffectUtil.CreateGameEffect(WBFogEffect,WBFogEffectMovie,stFieldGrid) as WBFogEffect;
         stEffect.InitData(stFieldGrid);
      }
      
      internal static function CreateBOSSBuffEffect(id:int, grid:a_3491) : BaseGameEffect
      {
         var classList:Array = [WBLazyFireEffectMovie,WBLazyIceEffectMovie,WBLazyPoisonEffectMovie,WBLazyMetalEffectMovie];
         var stEffect:BaseGameEffect = BattleEffectUtil.CreateGameEffect2(classList[id],grid);
         stEffect.SetAnimationOnce2Loop(0,1);
         return stEffect;
      }
      
      internal static function CreateLiquid(battleView:BattleFieldView, iNoX:int, iNoY:int, seconds:int = 20) : void
      {
         var grid:a_3491 = null;
         var liquidEffect:WBLazyLiquidEffect = null;
         grid = battleView.a_3438(iNoX,iNoY);
         if(grid == null)
         {
            return;
         }
         if(grid.m_stMouseEarthHole)
         {
            grid.m_stMouseEarthHole.a_3940();
            grid.m_stMouseEarthHole = null;
         }
         liquidEffect = WBLazyLiquidEffect.a_3926();
         liquidEffect.a_1797(false);
         liquidEffect.x = (iNoX + 0.5) * a_3491.a_1080;
         liquidEffect.y = (iNoY + 0.5) * a_3491.a_1081;
         battleView.AddToBattleView(liquidEffect,BattleLayerDefine.EFFECTS_BASE_TYPE,grid);
         if(battleView.GetGameMoveMap())
         {
            battleView.GetGameMoveMap().AddMoveDisplayObject(liquidEffect,iNoX,iNoY);
         }
         battleView.m_arrEffectArray.push(liquidEffect);
         liquidEffect.InitData(grid);
         grid.m_stMouseEarthHole = liquidEffect;
      }
      
      internal static function SleepByDeep(attacker:a_3953, iSleepTime:int) : void
      {
         if(attacker.tagCom.HasTag(30002) || attacker.tagCom.HasTag(30003))
         {
            return;
         }
         attacker.buffCom.RemoveBuff(30001);
         attacker.SleepTimeByParam(30020,iSleepTime,WBLazyDeepSleepBuffEffectMovie);
      }
      
      internal static function SleepByNightMare(attacker:a_3953, iSleepTime:int) : void
      {
         attacker.buffCom.RemoveBuff(30001);
         attacker.buffCom.RemoveBuff(30002);
         attacker.buffCom.RemoveBuff(30003);
         attacker.buffCom.RemoveBuff(30020);
         attacker.SleepTimeByParam(30021,iSleepTime,WBLazyMareSleepEffectMovie);
      }
      
      internal static function FrozenCard(stFieldGrid:a_3491) : void
      {
         if(stFieldGrid == null)
         {
            return;
         }
         if(null != stFieldGrid.m_stBaseToolDefense)
         {
            if(tempDefenseArr.indexOf(stFieldGrid.m_stBaseToolDefense.a_3512()) == -1)
            {
               stFieldGrid.m_stBaseToolDefense.m_isShowFrozen = true;
            }
         }
         if(null != stFieldGrid.m_stProtector)
         {
            if(tempDefenseArr.indexOf(stFieldGrid.m_stProtector.a_3512()) == -1)
            {
               stFieldGrid.m_stProtector.m_isShowFrozen = true;
            }
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            if(tempDefenseArr.indexOf(stFieldGrid.m_stAttackFighter.a_3512()) == -1)
            {
               stFieldGrid.m_stAttackFighter.m_isShowFrozen = true;
            }
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
            if(tempDefenseArr.indexOf(stFieldGrid.m_stBoomDefense.a_3512()) == -1)
            {
               stFieldGrid.m_stBoomDefense.m_isShowFrozen = true;
            }
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            if(tempDefenseArr.indexOf(stFieldGrid.m_stFlowerDefense.a_3512()) == -1)
            {
               stFieldGrid.m_stFlowerDefense.m_isShowFrozen = true;
            }
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            if(tempDefenseArr.indexOf(stFieldGrid.m_stBaseAuxiliaryFighter.a_3512()) == -1)
            {
               stFieldGrid.m_stBaseAuxiliaryFighter.m_isShowFrozen = true;
            }
         }
         if(null != stFieldGrid.m_stTrayDefense)
         {
            if(tempDefenseArr.indexOf(stFieldGrid.m_stTrayDefense.a_3512()) == -1)
            {
               stFieldGrid.m_stTrayDefense.m_isShowFrozen = true;
            }
         }
      }
   }
}

