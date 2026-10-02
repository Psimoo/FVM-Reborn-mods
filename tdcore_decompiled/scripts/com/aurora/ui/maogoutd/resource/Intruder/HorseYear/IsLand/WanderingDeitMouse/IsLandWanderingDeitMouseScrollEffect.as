package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.IsLand.WanderingDeitMouse
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Buff.BattleBuffData;
   import com.aurora.ui.maogoutd.game.Buff.BattleBuffParams;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   import com.aurora.ui.maogoutd.resource.tools.a_4425;
   import flash.display.BitmapData;
   import flash.events.Event;
   
   public class IsLandWanderingDeitMouseScrollEffect extends BaseGameEffect
   {
      
      private var _grid:a_3491;
      
      private var _state:int = 0;
      
      private var _stBoss:IsLandWanderingDeitBoss;
      
      private var _stayTick:int = 0;
      
      private var _isStayMode:Boolean = false;
      
      private var _remainTick:int = -1;
      
      public var m_TargetFieldGrid:a_3491;
      
      private var m_rotationRadian:Number = 1.0471975511965976;
      
      private var m_realXSpeed:Number;
      
      private var m_baseYDirection:Number;
      
      private var m_MoveTime:int;
      
      private var m_numXSpeed:Number = 0;
      
      private var m_numYSpeed:Number = 0;
      
      private var a_1581:int = 0;
      
      public function IsLandWanderingDeitMouseScrollEffect()
      {
         super();
      }
      
      public function InitData(grid:a_3491, boss:IsLandWanderingDeitBoss) : void
      {
         this._grid = grid;
         this._stBoss = boss;
         this.m_numXSpeed = 20;
         this._state = 1;
         this._isStayMode = false;
         this._stayTick = 0;
         SetAnimation(0);
         this._remainTick = -1;
         this.SetTargetDefense(grid);
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         super.a_4109(a_4730);
         if(this._state == 1)
         {
            if(!this._isStayMode)
            {
               this.UpdateMove();
            }
            else
            {
               ++this._stayTick;
               if(this._stayTick >= 30)
               {
                  a_3940();
               }
            }
         }
         else if(this._state == 2)
         {
            if(a_1273 == 10)
            {
               this.CreateMists();
               this._remainTick = 0;
            }
            if(this._remainTick >= 0)
            {
               ++this._remainTick;
               if(this._remainTick >= 80)
               {
                  this.RemoveSelf();
               }
            }
            if(!this._grid.tagCom.HasTag(20040))
            {
               this.RemoveSelf();
            }
         }
      }
      
      private function RemoveSelf() : void
      {
         var j:int = 0;
         var grid:a_3491 = null;
         this._grid.tagCom.HasTag(20040);
         SetAnimation(3,true);
         this._state = 3;
         for(var i:int = -1; i <= 1; i++)
         {
            for(j = -1; j <= 1; j++)
            {
               grid = this.m_TargetFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.m_TargetFieldGrid.m_iXGridNo + i,this.m_TargetFieldGrid.m_iYGridNo + j);
               if(grid != null)
               {
                  grid.buffCom.RemoveLayer(20041);
               }
            }
         }
      }
      
      private function CreateMists() : void
      {
         var j:int = 0;
         for(var i:int = -1; i <= 1; i++)
         {
            for(j = -1; j <= 1; j++)
            {
               this.CreateMist(this.m_TargetFieldGrid.m_iXGridNo + i,this.m_TargetFieldGrid.m_iYGridNo + j);
            }
         }
      }
      
      private function CreateMist(iNoX:int, iNoY:int) : void
      {
         var grid:a_3491 = this.m_TargetFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         if(grid == null)
         {
            return;
         }
         var params:BattleBuffParams = new BattleBuffParams();
         params.gameMoveClipClass = IsLandWanderingDeitMouseMistMovie;
         params.effectClass = IsLandWanderingDeitMouseMistEffect;
         params.y = 0;
         params.x = 0;
         params.offsetType = 0;
         params.startAnim = -1;
         params.loopAnim = 0;
         params.endAnim = 1;
         var buffData:BattleBuffData = grid.buffCom.AddBuff(20041,99999,params);
         if(buffData != null && buffData.stEffect != null)
         {
            (buffData.stEffect as IsLandWanderingDeitMouseMistEffect).InitData(grid,this._stBoss);
            grid.m_stCurrentBattbleFieldView.AddToBattleView(buffData.stEffect,BattleLayerDefine.BOSS_BOTTOM_EFFECT_TYPE,grid);
         }
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
         var stFieldGrid:a_3491 = null;
         x += this.m_realXSpeed;
         var t:Number = this.m_MoveTime / this.a_1581;
         var baseY:Number = this.m_baseYDirection;
         var parabolaY:Number = 2 * this.m_numYSpeed * t - this.m_numYSpeed;
         y += baseY + parabolaY;
         ++this.m_MoveTime;
         var iXGridNo:int = int((x + 30) / a_3491.a_1080);
         var iCheckBlockNoX:int = int(x / a_3491.a_1080);
         var bRealease:Boolean = false;
         if(iCheckBlockNoX <= this.m_TargetFieldGrid.m_iXGridNo + 1)
         {
            stFieldGrid = this.m_TargetFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.m_TargetFieldGrid.m_iXGridNo + 1,this.m_TargetFieldGrid.m_iYGridNo);
            if(Boolean(null != stFieldGrid) && Boolean(stFieldGrid.m_stAttackFighter) && stFieldGrid.m_stAttackFighter.iBreadFighterType > 1)
            {
               this._isStayMode = true;
               this._stayTick = 0;
               bRealease = true;
            }
         }
         if(iCheckBlockNoX <= this.m_TargetFieldGrid.m_iXGridNo)
         {
            if(Boolean(this.m_TargetFieldGrid.m_stAttackFighter) && this.m_TargetFieldGrid.m_stAttackFighter.iBreadFighterType > 1)
            {
               this._isStayMode = true;
               this._stayTick = 0;
               bRealease = true;
            }
            else if(bRealease)
            {
               this.EndMove();
            }
         }
         if(iXGridNo <= this.m_TargetFieldGrid.m_iXGridNo && !bRealease)
         {
            this.EndMove();
         }
      }
      
      public function a_4212() : void
      {
         var stIntruderRemoteThrowEffect:a_4425 = null;
         var stTestBd:BitmapData = this.stDisplayBitmap.bitmapData.clone();
         stIntruderRemoteThrowEffect = a_4425.a_3926();
         stIntruderRemoteThrowEffect.a_1797(stTestBd,a_1283);
         stIntruderRemoteThrowEffect.x = x;
         stIntruderRemoteThrowEffect.y = y;
         parent.addChild(stIntruderRemoteThrowEffect);
      }
      
      public function EndMove() : void
      {
         x = this.m_TargetFieldGrid.m_iXGridNo * 60 + 30;
         y = this.m_TargetFieldGrid.m_iYGridNo * 64 + 32;
         this._state = 2;
         this._grid.tagCom.AddTag(20040);
         SetAnimationOnce2Loop(1,2);
      }
   }
}

