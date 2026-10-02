package com.aurora.ui.maogoutd.resource.defender.PigYear.CureMeow
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3960;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   
   public class CureMeowBaseDefence extends a_3960
   {
      
      public function CureMeowBaseDefence()
      {
         super();
         a_1095 = CureMeowDefence.DEFENSE_PRICE;
         a_1330 = 0;
      }
      
      public static function a_3926() : a_3960
      {
         return PoolManager.getInstance().CheckOutOne(CureMeowBaseDefence) as CureMeowBaseDefence;
      }
      
      override protected function getBindMovie() : Class
      {
         return CureMeowBaseDefenceMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = CureMeowDefence.MAX_LIFE_VALUE;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return CureMeowDefence.a_3964(a_1094);
      }
      
      override public function a_3961(iCurrentTime:int) : Boolean
      {
         super.a_3961(iCurrentTime);
         if(a_1273 == a_1274 - 4)
         {
            this.CureSkill();
            super.a_3969(a_1339);
            a_3940();
         }
         return true;
      }
      
      private function addCureEffect() : void
      {
         var stLastWaitShot:a_4348 = null;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var stFieldGrid:a_3491 = null;
         var xStart:int = Math.max(a_1334.m_iXGridNo - 0,0);
         var xEnd:int = Math.min(a_1334.m_iXGridNo + 0,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(a_1334.m_iYGridNo - 0,0);
         var yEnd:int = Math.min(a_1334.m_iYGridNo + 0,BattleFieldView.a_1012 - 1);
         var stFieldGridVector:Array = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
         for(yIndex = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               stLastWaitShot = CureEffect.a_4344();
               (stLastWaitShot as CureEffect).m_ishowType = 3;
               stLastWaitShot.a_1797(0,0,0,x,y,stFieldGrid.m_stCurrentBattbleFieldView,stFieldGrid);
               parent.addChildAt(stLastWaitShot,stFieldGrid.m_stCurrentBattbleFieldView.a_3433());
               stLastWaitShot.x = xIndex * a_3491.a_1080 + 0.5 * (a_3491.a_1080 - stLastWaitShot.width);
               stLastWaitShot.y = yIndex * a_3491.a_1081 + 0.5 * (a_3491.a_1081 - stLastWaitShot.height);
            }
         }
      }
      
      protected function CureSkill() : void
      {
         var xIndex:int = 0;
         var xStart:int = Math.max(a_1334.m_iXGridNo - 2,0);
         var xEnd:int = Math.min(a_1334.m_iXGridNo + 2,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(a_1334.m_iYGridNo - 2,0);
         var yEnd:int = Math.min(a_1334.m_iYGridNo + 2,BattleFieldView.a_1012 - 1);
         var stFieldGridVector:Array = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               this.CureFieldGridDefense(stFieldGridVector[yIndex][xIndex],-50);
            }
         }
      }
      
      protected function CureFieldGridDefense(stFieldGrid:a_3491, value:int = 10) : Boolean
      {
         var stAddDefBloodEffect:AddDefBloodEffect = null;
         if(stFieldGrid.a_3492() && stFieldGrid.m_stBoomDefense != this && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stAddDefBloodEffect = AddDefBloodEffect.a_3926();
            stAddDefBloodEffect.a_1797(false);
            stAddDefBloodEffect.x = stFieldGrid.m_iXGridNo * a_3491.a_1080 + 0.5 * (a_3491.a_1080 - stAddDefBloodEffect.width);
            stAddDefBloodEffect.y = stFieldGrid.m_iYGridNo * a_3491.a_1081 + 0.5 * (a_3491.a_1081 - stAddDefBloodEffect.height);
            stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stAddDefBloodEffect,BattleLayerDefine.EFFECTS_TOP_TYPE);
         }
         if(null != stFieldGrid.m_stBaseToolDefense)
         {
            stFieldGrid.m_stBaseToolDefense.m_iDieType = 1;
            stFieldGrid.m_stBaseToolDefense.a_3969(value);
         }
         else if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(value);
         }
         else if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(value);
         }
         else if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(value);
         }
         else if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(value);
         }
         else if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(value);
         }
         else if(stFieldGrid.HasNewSlot())
         {
            stFieldGrid.DamageNewSlot(false,0,false,value,1);
         }
         else if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(value);
         }
         return true;
      }
   }
}

