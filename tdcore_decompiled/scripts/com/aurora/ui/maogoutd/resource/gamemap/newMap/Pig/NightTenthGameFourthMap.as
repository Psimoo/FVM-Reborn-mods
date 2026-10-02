package com.aurora.ui.maogoutd.resource.gamemap.newMap.Pig
{
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.resource.gamemap.BaseGameMap;
   
   public class NightTenthGameFourthMap extends BaseGameMap
   {
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      private var m_iCurrentTimeIntval:uint;
      
      private var m_iChangeCount:int;
      
      public function NightTenthGameFourthMap()
      {
         super();
         m_stMapInfoData.m_iBattleFieldStageType = 0;
         m_stMapInfoData.m_iBattleModType = 0;
         m_stMapInfoData.m_iWeatherType = 0;
      }
      
      override public function SetBattleFieldTerrain(stBattleFieldObject:Object) : Boolean
      {
         var stCurrentBattleFieldView:BattleFieldView = null;
         if(Boolean(stBattleFieldObject) && stBattleFieldObject is BattleFieldView)
         {
            stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
            if(stCurrentBattleFieldView.isOwnBattleField)
            {
               this.m_stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[2][3].m_iFieldGridType = 1;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[2][4].m_iFieldGridType = 1;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[2][5].m_iFieldGridType = 1;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[3][3].m_iFieldGridType = 1;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[3][4].m_iFieldGridType = 1;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[3][5].m_iFieldGridType = 1;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[4][3].m_iFieldGridType = 1;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[4][4].m_iFieldGridType = 1;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[4][5].m_iFieldGridType = 1;
            }
         }
         return true;
      }
      
      override public function ChangeGameMap(stData:Object) : Boolean
      {
         return true;
      }
   }
}

