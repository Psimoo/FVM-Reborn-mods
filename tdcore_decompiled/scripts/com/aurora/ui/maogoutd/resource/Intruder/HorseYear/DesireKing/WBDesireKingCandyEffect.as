package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing
{
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.Util.BattleEffectUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   import flash.events.Event;
   
   public class WBDesireKingCandyEffect extends BaseGameEffect
   {
      
      private var _grid:a_3491;
      
      public function WBDesireKingCandyEffect()
      {
         super();
      }
      
      public function InitData(grid:a_3491) : void
      {
         this._grid = grid;
         SetAnimation(0,true);
      }
      
      public function CandySkillOneGrid(stFieldGrid:a_3491, damage:int) : void
      {
         if(stFieldGrid == null)
         {
            return;
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(damage);
         }
         else if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(damage);
         }
         else if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(damage);
         }
         else if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(damage);
         }
         else if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(damage);
         }
      }
      
      private function DoBoom(iNoX:int, iNoY:int) : void
      {
         var effect2:BaseGameEffect = null;
         var grid:a_3491 = this._grid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         this.CandySkillOneGrid(grid,30);
         if(BattleDestroyUtil.HasDefense(grid))
         {
            effect2 = BattleEffectUtil.CreateGameEffect2(WBDesireKingSlimeMovie,grid);
            effect2.SetAnimation(0,true);
         }
         if(null != grid.m_stAttackFighter && !(grid.m_stAttackFighter is a_3924))
         {
            grid.m_stAttackFighter.buffCom.AddBuff(30032,999999);
         }
      }
      
      public function DamageOneGrid(stFieldGrid:a_3491, damage:int) : void
      {
         if(stFieldGrid == null)
         {
            return;
         }
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(damage);
         }
         else if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(damage);
         }
         else if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(damage);
         }
         else if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(damage);
         }
         else if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(damage);
         }
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         super.a_4109(a_4730);
         if(a_1273 == 9)
         {
            this.DoBoom(5,this._grid.m_iYGridNo);
         }
         else if(a_1273 == 14)
         {
            this.DoBoom(3,this._grid.m_iYGridNo);
         }
         else if(a_1273 == 19)
         {
            this.DoBoom(1,this._grid.m_iYGridNo);
         }
      }
   }
}

