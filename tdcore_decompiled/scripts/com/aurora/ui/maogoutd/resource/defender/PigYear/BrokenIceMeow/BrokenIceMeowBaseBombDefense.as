package com.aurora.ui.maogoutd.resource.defender.PigYear.BrokenIceMeow
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3960;
   
   public class BrokenIceMeowBaseBombDefense extends a_3960
   {
      
      public function BrokenIceMeowBaseBombDefense()
      {
         super();
         a_1095 = BrokenIceMeowDefense.DEFENSE_PRICE;
         a_1330 = 0;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3960
      {
         return PoolManager.getInstance().CheckOutOne(BrokenIceMeowBaseBombDefense) as BrokenIceMeowBaseBombDefense;
      }
      
      override protected function getBindMovie() : Class
      {
         return BrokenIceMeowBaseBombDefenseMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = BrokenIceMeowDefense.MAX_LIFE_VALUE;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return BrokenIceMeowDefense.a_3964(a_1094);
      }
      
      override public function a_3961(iCurrentTime:int) : Boolean
      {
         var xStart:int = 0;
         var xEnd:int = 0;
         var yStart:int = 0;
         var yEnd:int = 0;
         var stFieldGridVector:Array = null;
         var yIndex:int = 0;
         var xIndex:int = 0;
         super.a_3961(iCurrentTime);
         if(a_1329 == iCurrentTime && a_1273 == a_1274 - 6)
         {
            BattleFieldView.a_1048.play();
            a_1334.m_stCurrentBattbleFieldView.a_3466();
         }
         if(a_1273 == a_1274)
         {
            xStart = Math.max(a_1334.m_iXGridNo - 1,0);
            xEnd = Math.min(a_1334.m_iXGridNo + 1,BattleFieldView.a_1011 - 1);
            yStart = Math.max(a_1334.m_iYGridNo - 1,0);
            yEnd = Math.min(a_1334.m_iYGridNo + 1,BattleFieldView.a_1012 - 1);
            stFieldGridVector = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
            for(yIndex = yStart; yIndex <= yEnd; yIndex++)
            {
               for(xIndex = xStart; xIndex <= xEnd; xIndex++)
               {
                  this.FrozenCard(stFieldGridVector[yIndex][xIndex],false);
               }
            }
            super.a_3969(a_1339);
            a_3940();
         }
         return true;
      }
      
      private function FrozenCard(stFieldGrid:a_3491, m_isShowCood:Boolean = false) : void
      {
         if(stFieldGrid == null)
         {
            return;
         }
         if(null != stFieldGrid.m_stBaseToolDefense)
         {
            stFieldGrid.m_stBaseToolDefense.m_isShowFrozen = m_isShowCood;
         }
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_isShowFrozen = m_isShowCood;
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.m_isShowFrozen = m_isShowCood;
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_isShowFrozen = m_isShowCood;
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_isShowFrozen = m_isShowCood;
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_isShowFrozen = m_isShowCood;
         }
         if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_isShowFrozen = m_isShowCood;
         }
      }
   }
}

