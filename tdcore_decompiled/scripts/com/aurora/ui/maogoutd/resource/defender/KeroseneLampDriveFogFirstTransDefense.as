package com.aurora.ui.maogoutd.resource.defender
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   
   public class KeroseneLampDriveFogFirstTransDefense extends a_3971
   {
      
      public function KeroseneLampDriveFogFirstTransDefense()
      {
         super();
         a_1095 = 25;
         a_1344 = 3;
      }
      
      public static function a_3926() : a_3971
      {
         return PoolManager.getInstance().CheckOutOne(KeroseneLampDriveFogFirstTransDefense) as KeroseneLampDriveFogFirstTransDefense;
      }
      
      override protected function getBindMovie() : Class
      {
         return KeroseneLampDriveFogFirstTransDefenseMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         stFieldGrid.m_stCurrentBattbleFieldView.a_3462();
         return true;
      }
      
      override protected function a_3964() : int
      {
         return 300 - this.a_3965();
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 3 == 0)
         {
            nextFrame();
            if(a_1273 == a_1274)
            {
               gotoAndStop(1);
            }
            if(a_1336)
            {
               a_1336.a_3957(iCurrentTime);
            }
            if(m_stFrozenCardEffect)
            {
               m_stFrozenCardEffect.a_3957(iCurrentTime);
            }
            if(m_stShiHuaEffect)
            {
               m_stShiHuaEffect.a_3957(iCurrentTime);
            }
         }
      }
      
      override public function a_3940() : Boolean
      {
         var stTempFieldGrid:a_3491 = a_1334;
         super.a_3940();
         if(stTempFieldGrid)
         {
            stTempFieldGrid.m_stCurrentBattbleFieldView.a_3462();
         }
         return true;
      }
      
      override protected function a_3965() : int
      {
         var iStarDegreeEffect:int = 0;
         if(a_1094 <= 3)
         {
            iStarDegreeEffect = 1 * a_1094;
         }
         else if(a_1094 > 3 && a_1094 <= 6)
         {
            iStarDegreeEffect = 1 * 3 + 2 * (a_1094 - 3);
         }
         else if(a_1094 > 6 && a_1094 <= 9)
         {
            iStarDegreeEffect = 1 * 3 + 2 * (6 - 3) + 3 * (a_1094 - 6);
         }
         else if(a_1094 > 9 && a_1094 <= 14)
         {
            iStarDegreeEffect = 1 * 3 + 2 * 3 + 3 * 3 + 1 * (a_1094 - 9);
         }
         else if(a_1094 == 15)
         {
            iStarDegreeEffect = 1 * 3 + 2 * 3 + 3 * 3 + 1 * (a_1094 - 10);
         }
         else if(a_1094 == 16)
         {
            iStarDegreeEffect = 23;
         }
         return 10 * iStarDegreeEffect;
      }
   }
}

