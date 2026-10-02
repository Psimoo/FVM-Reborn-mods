package com.aurora.ui.maogoutd.resource.defender.PigYear.EnergyMeow
{
   import a_4715.EncrypNumber;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3959;
   
   public class EnergyMeowBaseAuxiliaryFighter extends a_3959
   {
      
      public function EnergyMeowBaseAuxiliaryFighter()
      {
         super();
         a_1095 = EnergyMeowAuxiliaryDefine.DEFENSE_PRICE;
      }
      
      public static function a_3926() : a_3959
      {
         return PoolManager.getInstance().CheckOutOne(EnergyMeowBaseAuxiliaryFighter) as EnergyMeowBaseAuxiliaryFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return EnergyMeowBaseAuxiliaryFighterMovie;
      }
      
      private function InitNumHotMultiplier() : void
      {
         var fBaseHotiplier:EncrypNumber = new EncrypNumber(2 * 1.1 + 0);
         a_1325 = fBaseHotiplier.Value + 0.1 * EnergyMeowAuxiliaryDefine.a_3965(a_1094);
         var fParabola:EncrypNumber = new EncrypNumber(2 * 0.6 + 0.1);
         m_ParabolaPathMultiplier = fParabola.Value + 0.1 * EnergyMeowAuxiliaryDefine.GetCardStarDegreeEffectValueParabolaPath(a_1094);
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         this.InitNumHotMultiplier();
         super.a_1797(stFieldGrid);
         a_1339 = 50;
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

