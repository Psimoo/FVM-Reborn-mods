package com.aurora.ui.maogoutd.resource.defender.TigerYear.FruitTower
{
   import a_4715.EncrypNumber;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3959;
   
   public class FruitTowerBaseAuxiliaryFighter extends a_3959
   {
      
      protected var a_1309:int = 20;
      
      protected var a_1321:int = 0;
      
      public function FruitTowerBaseAuxiliaryFighter()
      {
         super();
         a_1095 = FruitTowerAuxiliaryDefine.DEFENSE_PRICE;
         this.InitNumHotMultiplier();
         a_1333 = true;
      }
      
      public static function a_3926() : a_3959
      {
         return PoolManager.getInstance().CheckOutOne(FruitTowerBaseAuxiliaryFighter) as FruitTowerBaseAuxiliaryFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return FruitTowerBaseAuxiliaryFighterMovie;
      }
      
      private function InitNumHotMultiplier() : void
      {
         var fBaseHotiplier:EncrypNumber = new EncrypNumber(2 * 0.6 + 0);
         m_ParabolaPathMultiplier = fBaseHotiplier.Value + 0.1 * FruitTowerAuxiliaryDefine.a_3965(a_1094);
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         this.InitNumHotMultiplier();
         super.a_1797(stFieldGrid);
         a_1339 = FruitTowerAuxiliaryDefine.LIFE_VALUE;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return FruitTowerAuxiliaryDefine.a_3964(m_iSkillDegree);
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

