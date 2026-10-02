package com.aurora.ui.maogoutd.resource.defender.fusionCard.rockfiretower
{
   import a_4715.EncrypNumber;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3959;
   
   public class RockFireTowerPrimaryAuxiliaryFighter extends a_3959
   {
      
      public function RockFireTowerPrimaryAuxiliaryFighter()
      {
         super();
         a_1095 = RockFireTowerAuxiliaryDefine.DEFENSE_PRICE;
      }
      
      public static function a_3926() : a_3959
      {
         return PoolManager.getInstance().CheckOutOne(RockFireTowerPrimaryAuxiliaryFighter) as RockFireTowerPrimaryAuxiliaryFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return RockFireTowerPrimaryAuxiliaryFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         this.InitNumHotMultiplier();
         a_1339 = RockFireTowerAuxiliaryDefine.LIFE_VALUE;
         return true;
      }
      
      private function InitNumHotMultiplier() : void
      {
         var fBaseHotiplier:EncrypNumber = new EncrypNumber(2 * 0.7 + 0.1);
         a_1325 = (fBaseHotiplier.Value + 0.1 * RockFireTowerAuxiliaryDefine.a_3965(a_1094) + RockFireTowerAuxiliaryDefine.GetCardPrimaryValueByGradeDegree(m_iGradeDegree)) * (1 + RockFireTowerAuxiliaryDefine.HURT_ADDITION);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(Boolean(a_1334 && iRduceLifeValue > 0) && Boolean(a_1334) && m_iDieType == 1)
         {
            arrMoveIntruder = a_1334.IntruderArray;
            for each(stMoveIntruder in arrMoveIntruder)
            {
               if(stMoveIntruder.isEatingDefense)
               {
                  stMoveIntruder.a_3969(iRduceLifeValue);
                  break;
               }
            }
         }
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override protected function a_3964() : int
      {
         return RockFireTowerAuxiliaryDefine.a_3964(m_iSkillDegree);
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

