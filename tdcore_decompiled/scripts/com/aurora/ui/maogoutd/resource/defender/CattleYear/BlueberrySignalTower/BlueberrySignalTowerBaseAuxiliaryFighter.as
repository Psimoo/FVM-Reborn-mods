package com.aurora.ui.maogoutd.resource.defender.CattleYear.BlueberrySignalTower
{
   import a_4715.EncrypNumber;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3959;
   
   public class BlueberrySignalTowerBaseAuxiliaryFighter extends a_3959
   {
      
      protected var a_1309:int = 20;
      
      protected var a_1321:int = 0;
      
      public function BlueberrySignalTowerBaseAuxiliaryFighter()
      {
         super();
         a_1095 = BlueberrySignalTowerAuxiliaryDefine.DEFENSE_PRICE;
         a_1339 = BlueberrySignalTowerAuxiliaryDefine.LIFE_VALUE;
         this.InitNumHotMultiplier();
         a_1333 = true;
      }
      
      public static function a_3926() : a_3959
      {
         return PoolManager.getInstance().CheckOutOne(BlueberrySignalTowerBaseAuxiliaryFighter) as BlueberrySignalTowerBaseAuxiliaryFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return BlueberrySignalTowerBaseAuxiliaryFighterMovie;
      }
      
      private function InitNumHotMultiplier() : void
      {
         var fBaseHotiplier:EncrypNumber = new EncrypNumber(0 * 0 + 0);
         a_1325 = fBaseHotiplier.Value + 0.1 * BlueberrySignalTowerAuxiliaryDefine.a_3965(a_1094);
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         this.InitNumHotMultiplier();
         return super.a_1797(stFieldGrid);
      }
      
      override protected function a_3964() : int
      {
         return BlueberrySignalTowerAuxiliaryDefine.a_3964(m_iSkillDegree);
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

