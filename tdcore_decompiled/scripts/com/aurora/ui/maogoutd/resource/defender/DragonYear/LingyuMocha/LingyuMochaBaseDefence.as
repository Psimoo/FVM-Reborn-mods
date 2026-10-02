package com.aurora.ui.maogoutd.resource.defender.DragonYear.LingyuMocha
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3960;
   
   public class LingyuMochaBaseDefence extends a_3960
   {
      
      public function LingyuMochaBaseDefence()
      {
         super();
         a_1095 = LingyuMochaDefine.DEFENSE_PRICE;
         a_1331 = false;
         a_1330 = 0;
         a_1328 = 2;
      }
      
      public static function a_3926() : a_3960
      {
         return PoolManager.getInstance().CheckOutOne(LingyuMochaBaseDefence) as LingyuMochaBaseDefence;
      }
      
      override protected function getBindMovie() : Class
      {
         return LingyuMochaBaseDefenceMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         a_1331 = false;
         super.a_1797(stFieldGrid);
         return true;
      }
      
      override protected function a_3964() : int
      {
         return LingyuMochaDefine.a_3964(a_1094);
      }
      
      override public function a_3961(iCurrentTime:int) : Boolean
      {
         var offsetY:int = 0;
         var stStartField:a_3491 = null;
         super.a_3961(iCurrentTime);
         if(a_1329 == iCurrentTime && a_1273 == a_1274 - 3)
         {
            BattleFieldView.ms_lingyu_92.play();
            for(offsetY = -2; offsetY <= 1; offsetY++)
            {
               stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(0,a_1334.m_iYGridNo + offsetY);
               this.addShot(stStartField);
            }
         }
         if(a_1273 == a_1274)
         {
            super.a_3969(a_1339);
         }
         return true;
      }
      
      private function addShot(stStartField:a_3491) : Boolean
      {
         var stLastWaitShot:LingyuMochaBaseHorzShot = null;
         var tempX2:int = 0;
         var tempY2:int = 0;
         if(!stStartField)
         {
            return false;
         }
         stLastWaitShot = LingyuMochaBaseHorzShot.a_4344() as LingyuMochaBaseHorzShot;
         if(null == stLastWaitShot)
         {
            return false;
         }
         tempX2 = stStartField.m_iXGridNo * a_3491.a_1080;
         tempY2 = stStartField.m_iYGridNo * a_3491.a_1081 + 33;
         stLastWaitShot.m_isSpecial = 0;
         stLastWaitShot.a_1797(0,15,10,tempX2,tempY2,a_1334.m_stCurrentBattbleFieldView,stStartField);
         parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
         return true;
      }
   }
}

