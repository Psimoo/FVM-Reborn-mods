package com.aurora.ui.maogoutd.resource.defender.CattleYear.TaurusFireworks
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3960;
   
   public class TaurusFireworksAttackFighter extends a_3960
   {
      
      private var stStartField:a_3491;
      
      public function TaurusFireworksAttackFighter()
      {
         super();
         a_1095 = TaurusFireworksDefine.DEFENSE_PRICE;
         a_1330 = 0;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3960
      {
         return PoolManager.getInstance().CheckOutOne(TaurusFireworksAttackFighter) as TaurusFireworksAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return TaurusFireworksAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = TaurusFireworksDefine.MAX_LIFE_VALUE;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return TaurusFireworksDefine.a_3964(a_1094);
      }
      
      override public function a_3961(iCurrentTime:int) : Boolean
      {
         super.a_3961(iCurrentTime);
         if(a_1329 == iCurrentTime && a_1273 == a_1274 - 5)
         {
            this.stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(0,a_1334.m_iYGridNo);
            this.addShot(this.stStartField);
            if(a_1334.m_iYGridNo > 0)
            {
               this.stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(0,a_1334.m_iYGridNo - 1);
               this.addShot(this.stStartField);
            }
            if(a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1)
            {
               this.stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(0,a_1334.m_iYGridNo + 1);
               this.addShot(this.stStartField,true);
            }
         }
         if(a_1273 == a_1274)
         {
            super.a_3969(a_1339);
            a_3940();
         }
         return true;
      }
      
      private function addShot(stStartField:a_3491, isOverCurYGrid:Boolean = false) : Boolean
      {
         var stLastWaitShot:TaurusFireworksShot = null;
         var tempX2:int = 0;
         if(!stStartField)
         {
            return false;
         }
         var offsetX:int = 0;
         if(isOverCurYGrid)
         {
            offsetX -= 15;
         }
         stLastWaitShot = TaurusFireworksShot.a_4344() as TaurusFireworksShot;
         if(null == stLastWaitShot)
         {
            return false;
         }
         tempX2 = stStartField.m_iXGridNo * a_3491.a_1080 + offsetX;
         var tempY2:int = stStartField.m_iYGridNo * a_3491.a_1081 + 30;
         stLastWaitShot.m_isSpecial = 0;
         stLastWaitShot.a_1797(0,15,500,tempX2,tempY2,a_1334.m_stCurrentBattbleFieldView,stStartField);
         parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
         return true;
      }
   }
}

