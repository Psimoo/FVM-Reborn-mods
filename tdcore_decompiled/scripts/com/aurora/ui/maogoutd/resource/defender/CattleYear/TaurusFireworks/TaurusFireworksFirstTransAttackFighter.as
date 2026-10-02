package com.aurora.ui.maogoutd.resource.defender.CattleYear.TaurusFireworks
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3960;
   
   public class TaurusFireworksFirstTransAttackFighter extends a_3960
   {
      
      private var stStartField:a_3491;
      
      public function TaurusFireworksFirstTransAttackFighter()
      {
         super();
         a_1095 = TaurusFireworksDefine.FIRSTTRANS_DEFENSE_PRICE;
         a_1330 = 0;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3960
      {
         return PoolManager.getInstance().CheckOutOne(TaurusFireworksFirstTransAttackFighter) as TaurusFireworksFirstTransAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return TaurusFireworksFirstTransAttackFighterMovie;
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
            if(a_1334.m_iYGridNo > 0)
            {
               this.stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(0,a_1334.m_iYGridNo - 1);
               this.addShotToField(this.stStartField);
            }
            this.stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(0,a_1334.m_iYGridNo);
            this.addShotToField(this.stStartField,false);
            if(a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1)
            {
               this.stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(0,a_1334.m_iYGridNo + 1);
               this.addShotToField(this.stStartField,false,true);
            }
         }
         if(a_1273 == a_1274)
         {
            super.a_3969(a_1339);
            a_3940();
         }
         return true;
      }
      
      private function addShotToField(field:a_3491, isReversed:Boolean = false, isOverCurYGrid:Boolean = false) : Boolean
      {
         var shot:TaurusFireworksFirstShot = null;
         var tempX:int = 0;
         var offsetX:int = 0;
         if(isOverCurYGrid)
         {
            offsetX += isReversed ? 15 : -15;
         }
         if(!field)
         {
            return false;
         }
         shot = TaurusFireworksFirstShot.a_4344() as TaurusFireworksFirstShot;
         if(null == shot)
         {
            return false;
         }
         tempX = field.m_iXGridNo * a_3491.a_1080 + offsetX;
         var tempY:int = field.m_iYGridNo * a_3491.a_1081 + 30;
         shot.m_isSpecial = 0;
         shot.a_1797(0,15,500,tempX,tempY,a_1334.m_stCurrentBattbleFieldView,field);
         field.m_stCurrentBattbleFieldView.AddToBattleView(shot,BattleLayerDefine.SHOT_TYPE,field);
         return true;
      }
   }
}

