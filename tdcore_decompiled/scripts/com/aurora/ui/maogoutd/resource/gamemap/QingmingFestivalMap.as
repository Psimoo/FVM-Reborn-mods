package com.aurora.ui.maogoutd.resource.gamemap
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   
   public class QingmingFestivalMap extends BaseGameMap
   {
      
      private static var a_1445:a_4187 = new a_4187();
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      public function QingmingFestivalMap()
      {
         super();
         a_1445.m_iBattleFieldStageType = 0;
         a_1445.m_iBattleModType = 0;
         a_1445.m_iWeatherType = 0;
      }
      
      override public function a_4176() : a_4187
      {
         return a_1445;
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
               this.m_stCurrentBattleFieldView.stFieldGridsVector[0][7].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[1][0].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[1][8].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[2][7].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[3][0].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[3][8].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[4][7].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[5][0].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[5][8].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[6][7].m_iFieldGridType = 3;
            }
         }
         return true;
      }
   }
}

