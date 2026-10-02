package com.aurora.ui.maogoutd.resource.defender.PigYear.EnergyMeow
{
   import a_4715.EncrypNumber;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3959;
   
   public dynamic class EnergyMeowSecondAuxiliaryFighter extends a_3959
   {
      
      public function EnergyMeowSecondAuxiliaryFighter()
      {
         super();
         a_1095 = EnergyMeowAuxiliaryDefine.DEFENSE_PRICE - EnergyMeowAuxiliaryDefine.REDUCE_DEFENSE_PRICE;
      }
      
      public static function a_3926() : a_3959
      {
         return PoolManager.getInstance().CheckOutOne(EnergyMeowSecondAuxiliaryFighter) as EnergyMeowSecondAuxiliaryFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return EnergyMeowSecondAuxiliaryFighterMovie;
      }
      
      private function InitNumHotMultiplier() : void
      {
         var fBaseHotiplier:EncrypNumber = new EncrypNumber(2 * 1.1 + 0);
         a_1325 = (fBaseHotiplier.Value + 0.1 * EnergyMeowAuxiliaryDefine.a_3965(a_1094)) * (1 + EnergyMeowAuxiliaryDefine.HURT_ADDITION);
         var fParabola:EncrypNumber = new EncrypNumber(2 * 0.6 + 0.1);
         m_ParabolaPathMultiplier = (fParabola.Value + 0.1 * EnergyMeowAuxiliaryDefine.GetCardStarDegreeEffectValueParabolaPath(a_1094)) * (1 + EnergyMeowAuxiliaryDefine.HURT_ADDITION);
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         this.InitNumHotMultiplier();
         a_1339 = EnergyMeowAuxiliaryDefine.GetlifeValueByStarDegree(a_1094);
         return true;
      }
      
      override protected function a_3964() : int
      {
         return EnergyMeowAuxiliaryDefine.a_3964(m_iSkillDegree);
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

