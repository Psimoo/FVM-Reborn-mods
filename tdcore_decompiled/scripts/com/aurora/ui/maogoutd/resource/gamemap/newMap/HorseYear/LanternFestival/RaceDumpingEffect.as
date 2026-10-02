package com.aurora.ui.maogoutd.resource.gamemap.newMap.HorseYear.LanternFestival
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class RaceDumpingEffect extends BaseGameEffect
   {
      
      private var _iNoX:int = 0;
      
      private var _iNoY:int = 0;
      
      private var _iMoveTick:int = 0;
      
      private var _stBattleView:BattleFieldView;
      
      private var _stMap:LanternFestivalBaseGameMap;
      
      private var _iState:int = 1;
      
      private var _MoveSpeedX:int = 0;
      
      public function RaceDumpingEffect()
      {
         super();
      }
      
      public function InitData(map:LanternFestivalBaseGameMap, battleView:BattleFieldView, iNoX:int, iNoY:int) : void
      {
         SetAnimationOnce2Loop(0,1);
         this._iMoveTick = 0;
         this._stBattleView = battleView;
         this._stMap = map;
         this._iNoX = iNoX;
         this._iNoY = iNoY;
         this._iState = 1;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         if(this._iMoveTick == 30)
         {
            SetAnimation(2);
         }
         if(this._iState == 2)
         {
            x += this._MoveSpeedX;
         }
         if(a_1273 == 13 || a_1273 == 18 || a_1273 == 24)
         {
            this._iState = 2;
            this.CheckGrid();
         }
         else
         {
            super.a_4109(a_4730);
         }
         if(a_1273 == 26)
         {
            this.CreateAllDirty();
         }
         ++this._iMoveTick;
      }
      
      private function CheckGrid() : void
      {
         var stFieldGrid:a_3491 = this._stBattleView.a_3438(this._iNoX,this._iNoY);
         if(stFieldGrid == null)
         {
            a_3940();
            return;
         }
         if(this._stMap.TriggerPot(this._iNoX,this._iNoY))
         {
            a_3940();
            return;
         }
         if(stFieldGrid.m_stBaseAuxiliaryFighter != null && stFieldGrid.m_stBaseAuxiliaryFighter.numMoveSpeedMultiplier == -1)
         {
            this._MoveSpeedX = 20;
            this._iNoX += 2;
            a_1275 = 4;
            gotoAndStop((a_1276[4] as FrameLabel).frame);
         }
         else if(this.HasDefense(stFieldGrid))
         {
            this._MoveSpeedX = 12;
            ++this._iNoX;
            a_1275 = 3;
            gotoAndStop((a_1276[3] as FrameLabel).frame);
         }
         else
         {
            this._iState = 3;
            SetAnimation(5,true);
         }
      }
      
      private function HasDefense(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         return !(null == stFieldGrid.m_stProtector && null == stFieldGrid.m_stAttackFighter && null == stFieldGrid.m_stTrayDefense && null == stFieldGrid.m_stBoomDefense && null == stFieldGrid.m_stFlowerDefense && null == stFieldGrid.m_stBaseAuxiliaryFighter);
      }
      
      private function CreateAllDirty() : void
      {
         this.CreateOneDirty(this._iNoX - 1,this._iNoY - 1);
         this.CreateOneDirty(this._iNoX - 1,this._iNoY);
         this.CreateOneDirty(this._iNoX - 1,this._iNoY + 1);
         this.CreateOneDirty(this._iNoX,this._iNoY - 1);
         this.CreateOneDirty(this._iNoX,this._iNoY + 1);
         this.CreateOneDirty(this._iNoX + 1,this._iNoY - 1);
         this.CreateOneDirty(this._iNoX + 1,this._iNoY);
         this.CreateOneDirty(this._iNoX + 1,this._iNoY + 1);
      }
      
      private function CreateOneDirty(iNoX:int, iNoY:int) : void
      {
         var stFieldGrid:a_3491 = null;
         var stEarthHole:WasteMouseEarthHole = null;
         stFieldGrid = this._stBattleView.a_3438(iNoX,iNoY);
         if(stFieldGrid == null)
         {
            return;
         }
         this.ClearMouse(stFieldGrid);
         if(stFieldGrid.m_stMouseEarthHole)
         {
            stFieldGrid.m_stMouseEarthHole.a_3940();
            stFieldGrid.m_stMouseEarthHole = null;
         }
         if(stFieldGrid.m_iFieldGridType != 0 || stFieldGrid.m_isCannotAddCard)
         {
            return;
         }
         stEarthHole = WasteMouseEarthHole.a_3926();
         stEarthHole.m_stCurrentFieldGrid = stFieldGrid;
         stEarthHole.a_1797(a_1283);
         stEarthHole.x = a_3491.a_1080 * (stFieldGrid.m_iXGridNo + 0.5);
         stEarthHole.y = a_3491.a_1081 * (stFieldGrid.m_iYGridNo + 0.5);
         stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stEarthHole,BattleLayerDefine.EFFECTS_BASE_TYPE,stFieldGrid);
         if(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
         {
            stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(stEarthHole,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
         }
         stEarthHole.play();
         stFieldGrid.m_stMouseEarthHole = stEarthHole;
      }
      
      protected function ClearMouse(stFieldGrid:a_3491) : void
      {
         var mouse:a_4206 = null;
         var arrMoveIntruder:Array = stFieldGrid.a_1511.slice();
         for(var i:int = 0; i < arrMoveIntruder.length; i++)
         {
            mouse = arrMoveIntruder[i];
            if(mouse.IsBossIntruder == false)
            {
               mouse.a_3969(mouse.iLifeValue);
            }
         }
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption();
      }
   }
}

