package com.aurora.ui.maogoutd.resource.defender.TigerYear.PressureCookerTiger
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3960;
   
   public class PressureTigerBombAttackFighter extends a_3960
   {
      
      private var stStartField:a_3491;
      
      private var stMouseArr:Array = new Array(8388649,8389221);
      
      public function PressureTigerBombAttackFighter()
      {
         super();
         a_1095 = PressureTigerBombDefine.DEFENSE_PRICE;
         a_1330 = 0;
         a_1333 = true;
         a_1337 = -8;
         a_1338 = 10;
      }
      
      public static function a_3926() : a_3960
      {
         return PoolManager.getInstance().CheckOutOne(PressureTigerBombAttackFighter) as PressureTigerBombAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return PressureTigerBombAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         if(a_1336)
         {
            a_1336.x += 15;
         }
         a_1339 = PressureTigerBombDefine.MAX_LIFE_VALUE;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return PressureTigerBombDefine.a_3964(a_1094);
      }
      
      override public function a_3961(iCurrentTime:int) : Boolean
      {
         var i:int = 0;
         super.a_3961(iCurrentTime);
         if(a_1329 == iCurrentTime && a_1273 == a_1274 - 6)
         {
            this.addXuanYun(a_1334);
            for(i = 0; i < BattleFieldView.a_1011; i++)
            {
               this.stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(0,i);
               this.addShot(this.stStartField);
            }
         }
         if(a_1273 == a_1274)
         {
            super.a_3969(a_1339);
            a_3940();
         }
         return true;
      }
      
      private function addShot(stStartField:a_3491) : Boolean
      {
         var stLastWaitShot:PressureTigerBombShot = null;
         if(!stStartField)
         {
            return false;
         }
         stLastWaitShot = PressureTigerBombShot.a_4344() as PressureTigerBombShot;
         if(null == stLastWaitShot)
         {
            return false;
         }
         var tempX2:int = stStartField.m_iXGridNo * a_3491.a_1080;
         var tempY2:int = stStartField.m_iYGridNo * a_3491.a_1081;
         stLastWaitShot.m_isSpecial = 0;
         stLastWaitShot.a_1797(0,12,2000,tempX2,tempY2,a_1334.m_stCurrentBattbleFieldView,stStartField);
         parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
         return true;
      }
      
      public function addXuanYun(stFieldGrid:a_3491) : void
      {
         var xIndex:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(stFieldGrid == null)
         {
            return;
         }
         var xStart:int = Math.max(0,0);
         var xEnd:int = Math.min(BattleFieldView.a_1011 - 1,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(0,0);
         var yEnd:int = Math.min(BattleFieldView.a_1012 - 1,BattleFieldView.a_1012 - 1);
         var stFieldGridVector:Array = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               arrMoveIntruder = stFieldGridVector[yIndex][xIndex].a_1511.slice();
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  if(stMoveIntruder.iLifeValue > 0 && this.stMouseArr.indexOf(stMoveIntruder.m_stMoveIntruderTypeID) == -1 && !stMoveIntruder.isCannotSeeByInsurance)
                  {
                     stMoveIntruder.a_4208(b_182.enm_shotEffectXuanYun,20);
                  }
               }
            }
         }
      }
   }
}

