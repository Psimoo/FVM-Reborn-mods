package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.Paparazzi
{
   import a_4718.b_182;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.Base.BaseGameMoveIntruder;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.Util.BattleEffectUtil;
   import com.aurora.ui.maogoutd.game.Util.BattleRandomUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.utils.Dictionary;
   
   public class WBPaparazziMouseMoveIntruder extends BaseGameMoveIntruder
   {
      
      private static var arr_Grid:Array = [];
      
      private static var iLastCreateTick:int = -1;
      
      private var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var m_iState:int = 0;
      
      private var iReachNoY:int = -1;
      
      private var m_bHasTaskCamera:Boolean = false;
      
      private var m_iLastNoX:int = -1;
      
      private var _maxDict:Dictionary = new Dictionary();
      
      private var _maxKey:int = -1;
      
      private var _hasCamera:Boolean = false;
      
      public function WBPaparazziMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : WBPaparazziMouseMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(WBPaparazziMouseMoveIntruder,WBPaparazziMouseMoveIntruderMovie) as WBPaparazziMouseMoveIntruder;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         MAX_LIFE = 7000;
         INJURED_LIFE = 3500;
         ONE_GRID_SPEED = 0;
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1463 = true;
         a_1481 = false;
         a_1464 = true;
         SetAnimation(0,0);
         AddTag(10);
         a_1465 = 3;
         this.m_iState = 0;
         this.m_bHasTaskCamera = false;
         this.iReachNoY = -1;
         a_1283 = true;
         this.m_iLastNoX = -1;
         this._maxDict = new Dictionary();
         this._maxKey = -1;
         visible = false;
         a_1467 = 55;
         this._hasCamera = false;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 0)
         {
            if(a_1339 <= INJURED_LIFE && this.m_iState == 1)
            {
               SetAnimationOnce2Loop(5,6,5,6);
               this.m_iState = 2;
               SetSpeed(0);
            }
            else if(this.m_iState == 3)
            {
               if(a_1475 == true)
               {
                  SetAnimation(7,7);
               }
               else
               {
                  SetAnimation(6,6);
               }
            }
         }
         else
         {
            SetDeadAnim(8);
         }
         return true;
      }
      
      override protected function GetiNoX() : int
      {
         var iXGridNo:int = int((x + 40) / a_3491.a_1080);
         if(iXGridNo < 0)
         {
            iXGridNo = 0;
         }
         if(iXGridNo >= BattleFieldView.a_1011)
         {
            iXGridNo = BattleFieldView.a_1011 - 1;
         }
         return iXGridNo;
      }
      
      override public function a_2062() : void
      {
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var numOrigXPos:Number = x;
         if(!a_1460)
         {
            a_1460 = true;
            this.m_stRandomSeed.setSeed(globalMoveFighterID - m_stCurrentFieldGrid.m_iYGridNo,globalMoveFighterID + m_stCurrentFieldGrid.m_iYGridNo);
            if(iLastCreateTick == -1 || arr_Grid.length == 0 || iCurrentTime - iLastCreateTick > 10 || iLastCreateTick > iCurrentTime)
            {
               arr_Grid = BattleRandomUtil.ShuffleArray([1,3,5],this.m_stRandomSeed);
               iLastCreateTick = iCurrentTime;
            }
            this.iReachNoY = arr_Grid.pop();
            ChangeToFieldGrid(0,this.iReachNoY);
            x = -0.5 * a_3491.a_1080;
            y = -3 * a_3491.a_1081;
            visible = true;
         }
         super.a_4216(iCurrentTime);
         if(m_stCurrentFieldGrid == null)
         {
            return false;
         }
         if(x >= BattleFieldView.a_1013 + 20)
         {
            SetSpeed(0);
            a_3940();
            return false;
         }
         if(this.m_iState == 0)
         {
            y += 8;
            if(y >= (this.iReachNoY + 0.5) * 64)
            {
               y = (this.iReachNoY + 0.5) * 64;
               SetAnimationOnce2Loop(1,0,1,0);
               this.m_iState = 1;
               this.GetMax();
            }
         }
         else if(this.m_iState == 4)
         {
            if(this.m_iLastNoX != m_stCurrentFieldGrid.m_iXGridNo)
            {
               this.m_iLastNoX = m_stCurrentFieldGrid.m_iXGridNo;
               if(m_stCurrentFieldGrid.m_isCanBrokeByWind == true)
               {
                  BattleDestroyUtil.ClearOneGrid(m_stCurrentFieldGrid);
               }
            }
         }
         if(a_1273 == 14)
         {
            if(this.m_bHasTaskCamera == false)
            {
               this.m_bHasTaskCamera = true;
               this.CheckMax();
            }
         }
         else if(a_1273 == 18)
         {
            SetSpeed(3);
            RemoveTag(10);
            this._hasCamera = true;
         }
         else if(a_1273 == 26)
         {
            SetSpeed(1);
         }
         else if(a_1273 == 47)
         {
            SetSpeed(3);
            a_1465 = 0;
            this.m_iState = 3;
            a_1464 = false;
         }
         return true;
      }
      
      public function GetMax() : void
      {
         var grid:a_3491 = null;
         var key:* = undefined;
         this._maxDict = new Dictionary();
         var i:int = 0;
         var j:int = 0;
         this._maxKey = -1;
         for(i = this.iReachNoY - 1; i <= this.iReachNoY + 1; i++)
         {
            for(j = 0; j <= 2; j++)
            {
               this.CheckOneGrid(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(j,i));
            }
         }
         for(key in this._maxDict)
         {
            if(this._maxKey == -1 || this._maxDict[key] > this._maxDict[this._maxKey])
            {
               this._maxKey = key;
            }
         }
      }
      
      public function CheckMax() : void
      {
         if(this._maxKey == -1)
         {
            return;
         }
         var i:int = 0;
         var j:int = 0;
         for(i = this.iReachNoY - 1; i <= this.iReachNoY + 1; i++)
         {
            for(j = 0; j <= 2; j++)
            {
               this.DestroyOneGrid(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(j,i));
            }
         }
      }
      
      public function CheckOneGrid(grid:a_3491) : void
      {
         if(grid == null)
         {
            return;
         }
         if(grid.m_stAttackFighter != null && !(grid.m_stAttackFighter is a_3924))
         {
            this.AddOneDefense(grid.m_stAttackFighter);
         }
         this.AddOneDefense(grid.m_stBaseAuxiliaryFighter);
         this.AddOneDefense(grid.m_stFlowerDefense);
         this.AddOneDefense(grid.m_stProtector);
         this.AddOneDefense(grid.m_stHoneyTrapBaseDefense);
         this.AddOneDefense(grid.m_stOceanGoddessToolDefense);
         this.AddOneDefense(grid.m_stBattleFlagHorseDefense);
         this.AddOneDefense(grid.m_stBattleBarrierHorseDefense);
      }
      
      public function DestroyOneGrid(grid:a_3491) : void
      {
         if(grid == null)
         {
            return;
         }
         var bDestroy:Boolean = false;
         if(grid.m_stAttackFighter != null && !(grid.m_stAttackFighter is a_3924))
         {
            if(this.DestroyDefense(grid.m_stAttackFighter))
            {
               bDestroy = true;
            }
         }
         if(this.DestroyDefense(grid.m_stBaseAuxiliaryFighter))
         {
            bDestroy = true;
         }
         if(this.DestroyDefense(grid.m_stFlowerDefense))
         {
            bDestroy = true;
         }
         if(this.DestroyDefense(grid.m_stProtector))
         {
            bDestroy = true;
         }
         if(this.DestroyDefense(grid.m_stHoneyTrapBaseDefense))
         {
            bDestroy = true;
         }
         if(this.DestroyDefense(grid.m_stOceanGoddessToolDefense))
         {
            bDestroy = true;
         }
         if(this.DestroyDefense(grid.m_stBattleFlagHorseDefense))
         {
            bDestroy = true;
         }
         if(this.DestroyDefense(grid.m_stBattleBarrierHorseDefense))
         {
            bDestroy = true;
         }
         if(bDestroy)
         {
            BattleEffectUtil.CreateGameEffect2(FastFoodSmokeEffectMovie,grid).SetAnimation(0,true);
         }
      }
      
      private function DestroyDefense(defense:a_3962) : Boolean
      {
         if(defense == null)
         {
            return false;
         }
         var typeID:int = defense.a_3512();
         if(typeID == this._maxKey)
         {
            return false;
         }
         BattleDestroyUtil.DestroyCardIgnoreFangYu(defense);
         return true;
      }
      
      public function AddOneDefense(defense:a_3962) : void
      {
         if(defense == null)
         {
            return;
         }
         var typeID:int = defense.a_3512();
         if(this._maxDict[typeID] == null)
         {
            this._maxDict[typeID] = 1;
         }
         else
         {
            this._maxDict[typeID] += 1;
         }
      }
      
      override public function a_4212() : Boolean
      {
         if(tagCom.HasTag(10))
         {
            return false;
         }
         if(m_stCurrentFieldGrid != null && a_1465 == 3 && this.m_iState == 1)
         {
            SetAnimationOnce2Loop(2,3,2,3);
            AddTag(10);
            this.m_iState = 4;
            SetSpeed(0);
         }
         return false;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      override public function a_4213() : Boolean
      {
         if(this._hasCamera == false)
         {
            return false;
         }
         a_1339 = 0;
         if(m_stCurrentFieldGrid)
         {
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         }
         a_3940();
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         if(this._hasCamera == false)
         {
            return false;
         }
         return super.a_4210();
      }
   }
}

