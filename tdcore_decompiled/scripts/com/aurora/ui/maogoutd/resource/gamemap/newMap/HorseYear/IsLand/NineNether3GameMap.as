package com.aurora.ui.maogoutd.resource.gamemap.newMap.HorseYear.IsLand
{
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.Util.BattleEffectUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.HorseYear.IsLand.Movie.DragonSuppressingPillarGreenEffectMovie;
   
   public class NineNether3GameMap extends NineNetherBaseGameMap
   {
      
      public function NineNether3GameMap()
      {
         super();
         m_stMapInfoData.m_iBattleFieldStageType = 0;
         m_TotalObstaclePos = [[4,5],[5,1]];
         m_WaterArray = [[3,0],[4,0],[5,0],[6,0],[3,1],[4,1],[6,1],[4,2],[5,2],[4,4],[5,4],[3,5],[5,5],[6,5],[3,6],[4,6],[5,6],[6,6]];
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         if(iTimeNum == 5 * 20)
         {
            this.CreateEffect(m_stCurrentBattleFieldView.a_3438(1,3));
            this.CreateEffect(m_stCurrentBattleFieldView.a_3438(7,3));
         }
      }
      
      private function CreateEffect(grid:a_3491) : void
      {
         var effect:DragonSuppressingPillar2Effect = BattleEffectUtil.CreateGameEffect(DragonSuppressingPillar2Effect,DragonSuppressingPillarGreenEffectMovie,grid) as DragonSuppressingPillar2Effect;
         effect.InitData(grid);
         BattleDestroyUtil.ClearOneGridIgnoreFangYu(grid);
      }
   }
}

