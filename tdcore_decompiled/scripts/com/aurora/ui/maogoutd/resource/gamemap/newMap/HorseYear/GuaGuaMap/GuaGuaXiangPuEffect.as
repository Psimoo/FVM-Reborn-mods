package com.aurora.ui.maogoutd.resource.gamemap.newMap.HorseYear.GuaGuaMap
{
   import a_4728.a_1778;
   import a_4729.a_1789;
   import com.aurora.protocol.game.maogoutd.CEntityStateChange;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Buff.BattleBuffData;
   import com.aurora.ui.maogoutd.game.Buff.BattleBuffParams;
   import com.aurora.ui.maogoutd.game.Util.BattleCardDefine;
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   import flash.events.Event;
   
   public class GuaGuaXiangPuEffect extends BaseGameEffect
   {
      
      private const MAX_COUNT:int = 6;
      
      private const CHGUP_SECONDS:int = 90;
      
      private const ATTACK_SECONDS:Number = 2.8;
      
      private const ATTACK_CARD_AREAS:Array = [[-1,-1],[-1,0],[-1,1],[-2,-2],[-2,-1],[-2,0],[-2,1],[-2,2]];
      
      private const ATTACK_MOUSE_AREAS:Array = [[1,-1],[1,0],[1,1],[2,-2],[2,-1],[2,0],[2,1],[2,2]];
      
      private const ATTACK_MOUSE2_AREAS:Array = [[0,0],[1,-2],[1,2]];
      
      private var _grid:a_3491;
      
      private var _state:int = 0;
      
      private var _tick:int = 0;
      
      private var _shotCount:int = 0;
      
      private var _attackArr:Array = [];
      
      private var _bDay:Boolean = false;
      
      private var _sEventID:String = "";
      
      public function GuaGuaXiangPuEffect()
      {
         super();
      }
      
      public function InitData(grid:a_3491, state:int, bDay:Boolean) : void
      {
         this._state = -1;
         this._grid = grid;
         this._tick = 0;
         this._shotCount = 0;
         this._attackArr = [];
         this._bDay = bDay;
         a_1789.getInstance().addEventListener("DefenseCardCountChange",this.a_3483);
         a_1789.getInstance().addEventListener("EntityStateChange_CustomMessage_1",this.OnStateChange);
         this._sEventID = "GuaGuaXiangPuShotHited_" + (grid.m_iYGridNo * 100 + grid.m_iXGridNo);
         a_1789.getInstance().addEventListener(this._sEventID,this.OnGuaGuaXiangPuShotHited);
         this.SwitchState(state);
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         super.a_4109(a_4730);
         ++this._tick;
         if(this._state == 0)
         {
            if(this._tick == this.CHGUP_SECONDS * 10)
            {
               this.SwitchState(1);
            }
         }
         else if(this._state == 1)
         {
            if(!(a_1273 >= 7 && a_1273 <= 16))
            {
               this.CheckMouse();
            }
            if(this._shotCount > 0 && this._tick > this.ATTACK_SECONDS * 10)
            {
               this._attackArr = this.CheckAttack();
               if(this._attackArr.length > 0)
               {
                  SetAnimationOnce2Loop(4,3);
                  this._tick = 0;
               }
            }
         }
         var iNoX:int = this._grid.m_iXGridNo;
         var iNoY:int = this._grid.m_iYGridNo;
         var i:int = 0;
         if(a_1273 == 40)
         {
            for(i = 0; i < this._attackArr.length; i++)
            {
               this.AddShot(iNoX + this.ATTACK_CARD_AREAS[this._attackArr[i]][0],iNoY + this.ATTACK_CARD_AREAS[this._attackArr[i]][1],0);
            }
         }
         else if(a_1273 == 50)
         {
            for(i = 0; i < this.ATTACK_MOUSE_AREAS.length; i++)
            {
               this.AddShot(iNoX + this.ATTACK_MOUSE_AREAS[i][0],iNoY + this.ATTACK_MOUSE_AREAS[i][1],1);
            }
         }
         else if(a_1273 == 53)
         {
            for(i = 0; i < this.ATTACK_MOUSE2_AREAS.length; i++)
            {
               this.AttackFieldGrid(iNoX + this.ATTACK_MOUSE2_AREAS[i][0],iNoY + this.ATTACK_MOUSE2_AREAS[i][1]);
            }
         }
      }
      
      private function AttackFieldGrid(iNoX:int, iNoY:int) : void
      {
         var battleView:BattleFieldView = this._grid.m_stCurrentBattbleFieldView;
         var grid:a_3491 = battleView.a_3438(iNoX,iNoY);
         if(grid == null)
         {
            return;
         }
         GuaGuaXiangPuShot.AttackFieldGrid(grid,1);
      }
      
      private function AddShot(iNoX:int, iNoY:int, attackType:int) : void
      {
         var shot:GuaGuaXiangPuShot = null;
         var battleView:BattleFieldView = this._grid.m_stCurrentBattbleFieldView;
         var grid:a_3491 = battleView.a_3438(iNoX,iNoY);
         if(grid == null)
         {
            return;
         }
         if(this._bDay)
         {
            shot = GuaGuaXiangPuShot.GetFreeShotDay();
         }
         else
         {
            shot = GuaGuaXiangPuShot.GetFreeShotNight();
         }
         shot.InitData(grid,attackType);
         shot.a_1797(0,20,0,x,y + 1,battleView,grid);
         battleView.AddToBattleView(shot,BattleLayerDefine.SHOT_TYPE,grid);
      }
      
      private function WakeUp() : void
      {
         if(this._state != 1)
         {
            return;
         }
         SetAnimationOnce2Loop(4,2);
         this._tick = 0;
         this.SwitchState(0);
         this._shotCount = 0;
         this._attackArr.length = 0;
      }
      
      private function CheckAttack() : Array
      {
         var grid:a_3491 = null;
         var arr:Array = [];
         var battleView:BattleFieldView = this._grid.m_stCurrentBattbleFieldView;
         var iNoX:int = this._grid.m_iXGridNo;
         var iNoY:int = this._grid.m_iYGridNo;
         var i:int = 0;
         while(i < this.ATTACK_CARD_AREAS.length && arr.length < this._shotCount)
         {
            grid = battleView.a_3438(iNoX + this.ATTACK_CARD_AREAS[i][0],iNoY + this.ATTACK_CARD_AREAS[i][1]);
            if(grid != null)
            {
               if(BattleDestroyUtil.CanKillDefense(grid))
               {
                  arr.push(i);
               }
            }
            i++;
         }
         return arr;
      }
      
      private function AddGridBuffs() : void
      {
         var iNoX:int = this._grid.m_iXGridNo;
         var iNoY:int = this._grid.m_iYGridNo;
         this.AddGridBuff(iNoX,iNoY);
         this.AddGridBuff(iNoX - 1,iNoY);
         this.AddGridBuff(iNoX + 1,iNoY);
         this.AddGridBuff(iNoX,iNoY - 1);
         this.AddGridBuff(iNoX,iNoY + 1);
      }
      
      private function RemoveGridBuffs() : void
      {
         var iNoX:int = this._grid.m_iXGridNo;
         var iNoY:int = this._grid.m_iYGridNo;
         this.RemoveGridBuff(iNoX,iNoY);
         this.RemoveGridBuff(iNoX - 1,iNoY);
         this.RemoveGridBuff(iNoX + 1,iNoY);
         this.RemoveGridBuff(iNoX,iNoY - 1);
         this.RemoveGridBuff(iNoX,iNoY + 1);
      }
      
      private function RemoveGridBuff(iNoX:int, iNoY:int) : void
      {
         var battleView:BattleFieldView = this._grid.m_stCurrentBattbleFieldView;
         var grid:a_3491 = battleView.a_3438(iNoX,iNoY);
         if(grid == null)
         {
            return;
         }
         grid.buffCom.RemoveLayer(20028);
      }
      
      private function AddGridBuff(iNoX:int, iNoY:int) : void
      {
         var battleView:BattleFieldView = this._grid.m_stCurrentBattbleFieldView;
         var grid:a_3491 = battleView.a_3438(iNoX,iNoY);
         if(grid == null)
         {
            return;
         }
         if(grid.m_isNeedTray == false)
         {
            return;
         }
         grid.buffCom.RemoveBuff(20029);
         var params:BattleBuffParams = new BattleBuffParams();
         params.gameMoveClipClass = this._bDay ? GuaGuaDayPurifyEffectMovie : GuaGuaNightPurifyEffectMovie;
         params.y = 0;
         params.x = 0;
         params.offsetType = 0;
         var buffData:BattleBuffData = grid.buffCom.AddBuff(20028,999999,params);
         if(buffData != null && buffData.stEffect != null)
         {
            battleView.AddToBattleView(buffData.stEffect,BattleLayerDefine.EFFECTS_BASE2_TYPE,grid);
         }
      }
      
      private function CheckMouse() : void
      {
         var stMoveIntruder:a_4206 = null;
         if(this._shotCount > this.MAX_COUNT)
         {
            return;
         }
         var arrMoveIntruder:Array = this._grid.a_1511.slice();
         var lastShot:int = this._shotCount;
         for(var i:int = 0; i < arrMoveIntruder.length; i++)
         {
            stMoveIntruder = arrMoveIntruder[i];
            if(this._shotCount > this.MAX_COUNT)
            {
               break;
            }
            if(!stMoveIntruder.IsBossIntruder)
            {
               stMoveIntruder.iDIYLife = 0;
               stMoveIntruder.a_3432();
               ++this._shotCount;
               if(this._shotCount == 1)
               {
                  this._tick = 0;
               }
               SetAnimation(3);
            }
         }
         if(lastShot != this._shotCount)
         {
            this.BrocastState();
         }
      }
      
      private function SwitchState(state:int) : void
      {
         if(this._state == state)
         {
            return;
         }
         switch(state)
         {
            case 0:
               if(this._state == -1)
               {
                  SetAnimation(0);
               }
               else
               {
                  SetAnimationOnce2Loop(5,0);
               }
               this._grid.m_iFieldGridType = 0;
               this.RemoveGridBuffs();
               break;
            case 1:
               if(this._state == 0)
               {
                  SetAnimationOnce2Loop(1,2);
               }
               else
               {
                  SetAnimation(2);
               }
               this.Change2Barrier(this._grid);
               this.AddGridBuffs();
         }
         this._tick = 0;
         this._state = state;
      }
      
      private function Change2Barrier(grid:a_3491) : void
      {
         grid.m_iFieldGridType = 1;
         BattleDestroyUtil.ClearOneGridIgnoreFangYu(grid);
      }
      
      private function OnGuaGuaXiangPuShotHited(stDataEvent:a_1778) : void
      {
         if(a_1273 >= 43)
         {
            return;
         }
         if(this._state == 0)
         {
            this.SwitchState(1);
         }
      }
      
      private function a_3483(stDataEvent:a_1778) : void
      {
         var iDefenseTypeID:int = int(stDataEvent.dataObject[0]);
         var tempFieldGrid:a_3491 = stDataEvent.dataObject.length >= 3 ? stDataEvent.dataObject[2] : null;
         if(tempFieldGrid == null)
         {
            return;
         }
         if(tempFieldGrid.m_iYGridNo == this._grid.m_iYGridNo && BattleCardDefine.FANS.indexOf(iDefenseTypeID) != -1)
         {
            this.WakeUp();
         }
      }
      
      private function OnStateChange(stDataEvent:a_1778) : void
      {
         var gridID:int = int(stDataEvent.dataObject[0]);
         var key:int = int(stDataEvent.dataObject[1]);
         var value:int = int(stDataEvent.dataObject[2]);
         var iNoY:int = gridID / 100;
         var iNoX:int = gridID % 100;
         if(this._grid.m_iXGridNo == iNoX && this._grid.m_iYGridNo == iNoY)
         {
            if(this._state == 1)
            {
               this._shotCount = value;
               SetAnimation(3);
            }
         }
      }
      
      private function BrocastState() : void
      {
         var stEnemyVanish:CEntityStateChange = new CEntityStateChange();
         stEnemyVanish.m_iGlobalID = 1;
         stEnemyVanish.m_iTypeID = this._grid.m_iYGridNo * 100 + this._grid.m_iXGridNo;
         stEnemyVanish.m_iType = 3;
         stEnemyVanish.key = 1;
         stEnemyVanish.value = this._shotCount;
         a_3962.a_1088.PostEntityStateChange(this._grid.m_stCurrentBattbleFieldView.iTimeIntervalNum,this._grid.m_stCurrentBattbleFieldView.m_byTeamNo,[stEnemyVanish]);
      }
      
      override public function a_3940() : Boolean
      {
         a_1789.getInstance().removeEventListener(this._sEventID,this.OnGuaGuaXiangPuShotHited);
         a_1789.getInstance().removeEventListener("DefenseCardCountChange",this.a_3483);
         a_1789.getInstance().removeEventListener("EntityStateChange_CustomMessage_1",this.OnStateChange);
         return super.a_3940();
      }
   }
}

