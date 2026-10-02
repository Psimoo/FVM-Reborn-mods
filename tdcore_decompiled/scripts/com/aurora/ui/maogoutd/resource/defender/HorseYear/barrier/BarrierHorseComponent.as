package com.aurora.ui.maogoutd.resource.defender.HorseYear.barrier
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   
   public class BarrierHorseComponent
   {
      
      private var _attackType:int = 0;
      
      public var _baseDefense:a_3962 = null;
      
      public var m_stBattleView:BattleFieldView;
      
      public var stTargetField:a_3491;
      
      private var a_1321:int = 99999;
      
      private const a_1310:int = 8;
      
      public var _trans:int = 1;
      
      private var _duration:int = 0;
      
      public var _shotHurtPower:int = 0;
      
      private var _xOffset:int = 0;
      
      private var _yOffset:int = 0;
      
      private var _iCreateTime:int = -1;
      
      private var _iXGridNo:int = 0;
      
      private var _iYGridNo:int = 0;
      
      public function BarrierHorseComponent()
      {
         super();
      }
      
      public function get m_iXGridNo() : int
      {
         if(this._trans == 3 && this._baseDefense.stFieldGrid != null)
         {
            return this._iXGridNo;
         }
         return this._baseDefense.stFieldGrid.m_iXGridNo;
      }
      
      public function get m_iYGridNo() : int
      {
         if(this._trans == 3 && this._baseDefense.stFieldGrid != null)
         {
            return this._iYGridNo;
         }
         return this._baseDefense.stFieldGrid.m_iYGridNo;
      }
      
      public function InitData(baseDefense:a_3962, trans:int, xOffset:int, yOffset:int) : void
      {
         this._attackType = 0;
         this._baseDefense = baseDefense;
         this._baseDefense.SetAnimationOnce2Loop(0,0);
         this.stTargetField = baseDefense.stFieldGrid;
         this.a_1321 = 99999;
         this._trans = trans;
         this._xOffset = xOffset;
         this._yOffset = yOffset;
         this._duration = BarrierHorseDefine.a_3966(baseDefense.m_iSkillDegree);
         this._shotHurtPower = BarrierHorseDefine.a_3965(baseDefense.a_1094);
         this.m_stBattleView = baseDefense.stFieldGrid.m_stCurrentBattbleFieldView;
         this._iXGridNo = baseDefense.stFieldGrid.m_iXGridNo;
         this._iYGridNo = baseDefense.stFieldGrid.m_iYGridNo;
         this._iCreateTime = -1;
         BarrierHorseManager.getInstance().AddOne(this);
      }
      
      public function a_3897(iCurrentTime:int) : void
      {
         if(this._iCreateTime == -1)
         {
            this._iCreateTime = iCurrentTime;
         }
         if(iCurrentTime - this._iCreateTime >= this._duration)
         {
            this._baseDefense.a_3969(this._baseDefense.iLifeValue);
            return;
         }
         if(this.a_1321 == 99999)
         {
            this.a_1321 = iCurrentTime + 1;
         }
         var attackType:int = BarrierHorseManager.getInstance().attackType;
         if(this._attackType != attackType)
         {
            this.a_1321 = iCurrentTime + this.a_1310 + 1;
            this._attackType = attackType;
            this._baseDefense.SetAnimationOnce2Loop(1,0);
            if(attackType == 1)
            {
               this.CreateGridBuff();
            }
            else
            {
               this.RemoveGridBuff();
            }
         }
         if(attackType == 1)
         {
            this.OneGridShot(iCurrentTime);
         }
         BarrierHorseManager.getInstance().a_3897(iCurrentTime);
      }
      
      protected function CreateGridBuff() : void
      {
         BarrierHorseManager.getInstance().CreateGridBuff(this._baseDefense,this._trans,this._xOffset,this._yOffset);
      }
      
      private function RemoveGridBuff() : void
      {
         BarrierHorseManager.getInstance().RemoveGridBuff(this._baseDefense,this._trans);
      }
      
      private function OneGridShot(iCurrentTime:int) : void
      {
         var grid:a_3491 = null;
         if(iCurrentTime - this.a_1321 >= BarrierHorseDefine.SHOT_INTERVAL)
         {
            this.a_1321 = iCurrentTime;
            grid = this._baseDefense.stFieldGrid;
            BarrierHorseDefine.DamageGrid(grid,this._trans,this._shotHurtPower);
            BarrierHorseDefine.DamageGrid(grid.m_stCurrentBattbleFieldView.a_3438(grid.m_iXGridNo + 1,grid.m_iYGridNo),this._trans,this._shotHurtPower);
         }
      }
      
      public function Remove() : void
      {
         BarrierHorseManager.getInstance().RemoveOne(this);
      }
   }
}

