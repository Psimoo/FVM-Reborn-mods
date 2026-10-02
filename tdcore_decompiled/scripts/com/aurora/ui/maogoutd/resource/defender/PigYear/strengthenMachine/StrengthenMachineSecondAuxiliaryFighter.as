package com.aurora.ui.maogoutd.resource.defender.PigYear.strengthenMachine
{
   import a_4715.EncrypNumber;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3959;
   
   public dynamic class StrengthenMachineSecondAuxiliaryFighter extends a_3959
   {
      
      protected var a_1309:int = 20;
      
      protected var a_1321:int = 0;
      
      public function StrengthenMachineSecondAuxiliaryFighter()
      {
         super();
         a_1333 = true;
         a_1095 = StrengthenMachineAuxiliaryDefine.DEFENSE_PRICE;
         this.InitNumHotMultiplier();
         a_1339 = StrengthenMachineAuxiliaryDefine.GetlifeValueByStarDegree(a_1094);
      }
      
      public static function a_3926() : a_3959
      {
         return PoolManager.getInstance().CheckOutOne(StrengthenMachineSecondAuxiliaryFighter) as StrengthenMachineSecondAuxiliaryFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return StrengthenMachineSecondAuxiliaryFighterMovie;
      }
      
      private function InitNumHotMultiplier() : void
      {
         var fBaseHotiplier:EncrypNumber = new EncrypNumber(2 * 0.8 + 0);
         a_1325 = (fBaseHotiplier.Value + 0.1 * StrengthenMachineAuxiliaryDefine.a_3965(a_1094)) * (1 + StrengthenMachineAuxiliaryDefine.HURT_ADDITION);
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         this.InitNumHotMultiplier();
         a_1339 = StrengthenMachineAuxiliaryDefine.GetlifeValueByStarDegree(a_1094);
         return true;
      }
      
      override protected function a_3964() : int
      {
         return StrengthenMachineAuxiliaryDefine.a_3964(m_iSkillDegree);
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

