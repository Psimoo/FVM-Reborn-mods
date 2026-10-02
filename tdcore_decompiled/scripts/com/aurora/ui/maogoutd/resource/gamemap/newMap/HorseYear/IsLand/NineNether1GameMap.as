package com.aurora.ui.maogoutd.resource.gamemap.newMap.HorseYear.IsLand
{
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.Util.BattleEffectUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.HorseYear.IsLand.Movie.DragonSuppressingPillarOrangeEffectMovie;
   
   public class NineNether1GameMap extends NineNetherBaseGameMap
   {
      
      public function NineNether1GameMap()
      {
         super();
         m_stMapInfoData.m_iBattleFieldStageType = 1;
         m_OutArray = [[1,0],[8,0],[0,1],[0,5],[1,6],[8,6]];
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         if(iTimeNum == 20 * 60)
         {
            this.CreateEffect(m_stCurrentBattleFieldView.a_3438(6,1));
            this.CreateEffect(m_stCurrentBattleFieldView.a_3438(6,5));
         }
      }
      
      private function CreateEffect(grid:a_3491) : void
      {
         var effect:DragonSuppressingPillar1Effect = BattleEffectUtil.CreateGameEffect(DragonSuppressingPillar1Effect,DragonSuppressingPillarOrangeEffectMovie,grid) as DragonSuppressingPillar1Effect;
         effect.InitData(grid);
         BattleDestroyUtil.ClearOneGridIgnoreFangYu(grid);
      }
   }
}

