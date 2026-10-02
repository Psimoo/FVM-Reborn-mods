package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.IsLand.OxHeadHorseface
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.Util.BattleEffectUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   import flash.events.Event;
   
   public class BellEffect extends BaseGameEffect
   {
      
      public var _grid:a_3491;
      
      public var _tick:int = 0;
      
      public var _state:int = 0;
      
      private var iDestroyCount:int = 0;
      
      private var iCreateCount:int = 0;
      
      public var m_TargetFieldGrid:a_3491;
      
      private var m_rotationRadian:Number = 1.0471975511965976;
      
      private var m_realXSpeed:Number;
      
      private var m_baseYDirection:Number;
      
      private var m_MoveTime:int;
      
      private var m_numXSpeed:Number = 0;
      
      private var m_numYSpeed:Number = 0;
      
      private var a_1581:int = 0;
      
      public function BellEffect()
      {
         super();
      }
      
      public function InitData(grid:a_3491) : void
      {
         this._grid = grid;
         this._tick = 0;
         this._state = 0;
         SetAnimation(0);
         this.m_numXSpeed = 40;
         this.iDestroyCount = 0;
         this.iCreateCount = 0;
         this.SetTargetDefense(grid);
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         super.a_4109(a_4730);
         var iNoX:int = this._grid.m_iXGridNo;
         var iNoY:int = this._grid.m_iYGridNo;
         if(this._state == 0)
         {
            this.UpdateMove();
         }
         else
         {
            ++this._tick;
            if(this._state == 2)
            {
            }
            if(this._state == 4)
            {
               if(this._tick == 12)
               {
                  this.CreateMouse(iNoX,iNoY - 1);
               }
               else if(this._tick == 20)
               {
                  this.CreateMouse(iNoX + 1,iNoY);
               }
               else if(this._tick == 28)
               {
                  this.CreateMouse(iNoX,iNoY + 1);
               }
               else if(this._tick == 36)
               {
                  this.CreateMouse(iNoX - 1,iNoY);
               }
               else if(this._tick == 44)
               {
                  this.CreateMouse(iNoX - 1,iNoY - 1);
               }
               else if(this._tick == 52)
               {
                  this.CreateMouse(iNoX + 1,iNoY - 1);
               }
               else if(this._tick == 60)
               {
                  this.CreateMouse(iNoX + 1,iNoY + 1);
               }
               else if(this._tick == 68)
               {
                  this.CreateMouse(iNoX - 1,iNoY + 1);
               }
            }
         }
      }
      
      private function CreateMouse(iNoX:int, iNoY:int) : void
      {
         if(this.iCreateCount >= 4 + this.iDestroyCount)
         {
            return;
         }
         ++this.iCreateCount;
         var mouse:FoodSpiritMoveIntruder = FoodSpiritMoveIntruder.a_3926();
         BattleEffectUtil.CreateMouse(mouse,this._grid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY),134240634);
      }
      
      public function BeginCreateMouse() : void
      {
         this._state = 4;
         this._tick = 0;
         this.iCreateCount = 0;
         SetAnimation(4);
      }
      
      public function SetDead() : void
      {
         this._state = 5;
         SetAnimation(5,true);
      }
      
      public function ClearOneGrid(iNoX:int, iNoY:int) : void
      {
         var stFieldGrid:a_3491 = this._grid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         if(stFieldGrid == null)
         {
            return;
         }
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(stFieldGrid.m_stProtector.iLifeValue);
            if(stFieldGrid.m_stProtector == null)
            {
               ++this.iDestroyCount;
            }
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(stFieldGrid.m_stAttackFighter.iLifeValue);
            if(stFieldGrid.m_stAttackFighter == null)
            {
               ++this.iDestroyCount;
            }
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(stFieldGrid.m_stBoomDefense.iLifeValue);
            if(stFieldGrid.m_stBoomDefense == null)
            {
               ++this.iDestroyCount;
            }
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(stFieldGrid.m_stFlowerDefense.iLifeValue);
            if(stFieldGrid.m_stFlowerDefense == null)
            {
               ++this.iDestroyCount;
            }
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
            if(stFieldGrid.m_stBaseAuxiliaryFighter == null)
            {
               ++this.iDestroyCount;
            }
         }
         if(null != stFieldGrid.m_stHoneyTrapBaseDefense)
         {
            stFieldGrid.m_stHoneyTrapBaseDefense.m_iDieType = 1;
            stFieldGrid.m_stHoneyTrapBaseDefense.a_3969(stFieldGrid.m_stHoneyTrapBaseDefense.iLifeValue);
            if(stFieldGrid.m_stHoneyTrapBaseDefense == null)
            {
               ++this.iDestroyCount;
            }
         }
         if(null != stFieldGrid.m_stOceanGoddessToolDefense)
         {
            stFieldGrid.m_stOceanGoddessToolDefense.m_iDieType = 1;
            stFieldGrid.m_stOceanGoddessToolDefense.a_3969(stFieldGrid.m_stOceanGoddessToolDefense.iLifeValue);
            if(stFieldGrid.m_stOceanGoddessToolDefense == null)
            {
               ++this.iDestroyCount;
            }
         }
         if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue);
            if(stFieldGrid.m_stTrayDefense == null)
            {
               ++this.iDestroyCount;
            }
         }
      }
      
      public function Change2Purple() : void
      {
         var j:int = 0;
         this._tick = 0;
         this._state = 3;
         SetAnimation(3);
         this.iDestroyCount = 0;
         this.iCreateCount = 0;
         var iNoX:int = this._grid.m_iXGridNo;
         var iNoY:int = this._grid.m_iYGridNo;
         for(var i:int = -1; i <= 1; i++)
         {
            for(j = -1; j <= 1; j++)
            {
               this.ClearOneGrid(iNoX + i,iNoY + j);
            }
         }
      }
      
      override public function a_3940() : Boolean
      {
         this._grid.m_iFieldGridType = 0;
         return super.a_3940();
      }
      
      public function SetTargetDefense(grid:a_3491) : void
      {
         this.m_MoveTime = 0;
         this.m_TargetFieldGrid = grid;
         this.a_4349();
      }
      
      private function a_4349() : Boolean
      {
         var iXGridNo:int = 0;
         var numDistance:Number = NaN;
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
         }
         else
         {
            iXGridNo = int(x / a_3491.a_1080);
         }
         var dx:Number = this.m_TargetFieldGrid.m_iXGridNo * 60 + 30 - x;
         var dy:Number = this.m_TargetFieldGrid.m_iYGridNo * 64 + 32 - y;
         this.m_rotationRadian = Math.atan2(dy,dx);
         this.a_1581 = int(Math.sqrt(dx * dx + dy * dy) / this.m_numXSpeed);
         this.m_numYSpeed = 3 * a_3491.a_1081 / this.a_1581;
         if(numDistance < 2 * a_3491.a_1080)
         {
            if(this.a_1581 < 2)
            {
               this.a_1581 = 2;
            }
            this.m_numYSpeed = a_3491.a_1081 * 0.6 / this.a_1581;
         }
         else
         {
            this.m_numYSpeed = 3 * a_3491.a_1081 / this.a_1581;
         }
         this.m_realXSpeed = this.m_numXSpeed * Math.cos(this.m_rotationRadian);
         this.m_baseYDirection = this.m_numXSpeed * Math.sin(this.m_rotationRadian);
         return true;
      }
      
      public function UpdateMove() : void
      {
         x += this.m_realXSpeed;
         var t:Number = this.m_MoveTime / this.a_1581;
         var baseY:Number = this.m_baseYDirection;
         var parabolaY:Number = 2 * this.m_numYSpeed * t - this.m_numYSpeed;
         y += baseY + parabolaY;
         ++this.m_MoveTime;
         if(this.m_MoveTime > this.a_1581)
         {
            this.EndMove();
         }
      }
      
      public function EndMove() : void
      {
         x = this.m_TargetFieldGrid.m_iXGridNo * 60 + 30;
         y = this.m_TargetFieldGrid.m_iYGridNo * 64 + 32;
         this._state = 1;
         SetAnimationOnce2Loop(1,2);
         this._grid.m_iFieldGridType = 1;
      }
   }
}

