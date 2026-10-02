package com.aurora.ui.maogoutd.resource.defender.SnakeYear.CrucibleSnake
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3959;
   
   public class CrucibleSnakeBaseAuxiliaryFighter extends a_3959
   {
      
      public function CrucibleSnakeBaseAuxiliaryFighter()
      {
         super();
         a_1095 = CrucibleSnakeAuxiliaryDefine.DEFENSE_PRICE;
      }
      
      public static function a_3926() : a_3959
      {
         return PoolManager.getInstance().CheckOutOne(CrucibleSnakeBaseAuxiliaryFighter) as CrucibleSnakeBaseAuxiliaryFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return CrucibleSnakeBaseAuxiliaryFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1325 = CrucibleSnakeAuxiliaryDefine.a_3965(a_1094);
         a_1339 = 200;
         m_iDefenseRandomSeed.setSeed(BattleFieldView.ms_iServerLockStep,m_iDefenseGlobalID);
         return true;
      }
      
      override protected function a_3964() : int
      {
         return CrucibleSnakeAuxiliaryDefine.a_3964(m_iSkillDegree);
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            super.a_3957(iCurrentTime);
         }
      }
   }
}

