package com.aurora.ui.maogoutd.resource.defender.TigerYear.FruitTower
{
   import a_4715.EncrypNumber;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3959;
   
   public dynamic class FruitTowerSecondAuxiliaryFighter extends a_3959
   {
      
      protected var a_1309:int = 20;
      
      protected var a_1321:int = 0;
      
      protected var m_iSkilled:Boolean = false;
      
      public function FruitTowerSecondAuxiliaryFighter()
      {
         super();
         a_1333 = true;
         a_1095 = FruitTowerAuxiliaryDefine.DEFENSE_PRICE;
         this.InitNumHotMultiplier();
      }
      
      public static function a_3926() : a_3959
      {
         return PoolManager.getInstance().CheckOutOne(FruitTowerSecondAuxiliaryFighter) as FruitTowerSecondAuxiliaryFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return FruitTowerSecondAuxiliaryFighterMovie;
      }
      
      private function InitNumHotMultiplier() : void
      {
         var fBaseHotiplier:EncrypNumber = new EncrypNumber(2 * 0.6 + 0);
         m_ParabolaPathMultiplier = (fBaseHotiplier.Value + 0.1 * FruitTowerAuxiliaryDefine.a_3965(a_1094)) * (1 + FruitTowerAuxiliaryDefine.HURT_ADDITION);
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         this.InitNumHotMultiplier();
         a_1339 = FruitTowerAuxiliaryDefine.LIFE_VALUE;
         return true;
      }
      
      private function a_4360(stFieldGrid:a_3491) : void
      {
         var stFieldGridVector:Array = null;
         var yStart:int = 0;
         var xStart:int = 0;
         var yEnd:int = 0;
         var xEnd:int = 0;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(a_1334 != null)
         {
            stFieldGridVector = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
            yStart = a_1334.m_iYGridNo - 1 < 0 ? 0 : int(a_1334.m_iYGridNo - 1);
            xStart = a_1334.m_iXGridNo - 1 < 0 ? 0 : int(a_1334.m_iXGridNo - 1);
            yEnd = a_1334.m_iYGridNo + 1 >= BattleFieldView.a_1012 ? int(BattleFieldView.a_1012 - 1) : int(a_1334.m_iYGridNo + 1);
            xEnd = a_1334.m_iXGridNo + 1 >= BattleFieldView.a_1011 ? int(BattleFieldView.a_1011 - 1) : int(a_1334.m_iXGridNo + 1);
            for(yIndex = yStart; yIndex <= yEnd; yIndex++)
            {
               for(xIndex = xStart; xIndex <= xEnd; xIndex++)
               {
                  arrMoveIntruder = stFieldGridVector[yIndex][xIndex].a_1511.slice();
                  for each(stMoveIntruder in arrMoveIntruder)
                  {
                     stMoveIntruder.a_3969(100 * 10);
                  }
               }
            }
         }
      }
      
      override protected function a_3964() : int
      {
         return FruitTowerAuxiliaryDefine.a_3964(m_iSkillDegree);
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(!this.m_iSkilled)
         {
            this.m_iSkilled = true;
            this.a_4360(stFieldGrid);
         }
         if(iCurrentTime % 2 == 0)
         {
            super.a_3957(iCurrentTime);
         }
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         this.m_iSkilled = false;
         return true;
      }
   }
}

