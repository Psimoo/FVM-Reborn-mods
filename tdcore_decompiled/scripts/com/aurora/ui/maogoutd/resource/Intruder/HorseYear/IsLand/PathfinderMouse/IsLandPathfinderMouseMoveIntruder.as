package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.IsLand.PathfinderMouse
{
   import a_4752.a_2036;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.Base.BaseGameMoveIntruder;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   
   public class IsLandPathfinderMouseMoveIntruder extends BaseGameMoveIntruder
   {
      
      private var _runTick:int = 0;
      
      private var _fireNum:int = 0;
      
      private var _iSpeed:int = 0;
      
      private var _bBefore:Boolean = false;
      
      private var _bCreateMouse:Boolean = false;
      
      public var needCreateMouse:Boolean = true;
      
      public function IsLandPathfinderMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : IsLandPathfinderMouseMoveIntruder
      {
         var mouse:IsLandPathfinderMouseMoveIntruder = PoolManager.getInstance().CheckOutOne(IsLandPathfinderMouseMoveIntruder,IsLandPathfinderMouseMoveIntruderMovie) as IsLandPathfinderMouseMoveIntruder;
         if(mouse != null)
         {
            mouse.needCreateMouse = true;
         }
         return mouse;
      }
      
      public static function GetFreeInstance2() : IsLandPathfinderMouseMoveIntruder
      {
         var mouse:IsLandPathfinderMouseMoveIntruder = PoolManager.getInstance().CheckOutOne(IsLandPathfinderMouseMoveIntruder,IsLandPathfinderMouseMoveIntruderMovie) as IsLandPathfinderMouseMoveIntruder;
         if(mouse != null)
         {
            mouse.needCreateMouse = false;
         }
         return mouse;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         MAX_LIFE = 2500;
         INJURED_LIFE = 1250;
         ONE_GRID_SPEED = 5;
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1481 = false;
         SetAnimation(0,0);
         AddTag(40012);
         BoomIsReduceLife = true;
         this._runTick = 0;
         this._fireNum = 0;
         this._iSpeed = 0;
         a_1377 = 20;
         this._bBefore = false;
         this._bCreateMouse = false;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 0)
         {
            if(this._bBefore)
            {
               return true;
            }
            if(a_1475)
            {
               if(this._fireNum == 0)
               {
                  SetAnimation(1,9);
               }
               else if(this._fireNum == 1)
               {
                  SetAnimation(4,12);
               }
            }
            else if(this._fireNum == 0)
            {
               SetAnimation(0,8);
            }
            else if(this._fireNum == 1)
            {
               SetAnimation(3,11);
            }
            else if(this._iSpeed == 1)
            {
               SetAnimation(6,14);
            }
         }
         else
         {
            SetDeadAnim(16);
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         super.a_4216(iCurrentTime);
         if(m_stCurrentFieldGrid == null)
         {
            return true;
         }
         ++this._runTick;
         if(this._fireNum == 0)
         {
            if(this._runTick == 5 * 20)
            {
               SetAnimationOnce2Loop(2,3,10,11);
               a_1464 = true;
               SetSpeed(0);
               this._bBefore = true;
            }
            else if(this._runTick == 5 * 20 + 24)
            {
               SetSpeed(5);
               a_1464 = false;
               this._bBefore = false;
               this._runTick = 0;
               this._fireNum = 1;
            }
         }
         else if(this._fireNum == 1)
         {
            if(this._runTick == 5 * 20)
            {
               SetAnimationOnce2Loop(5,6,13,14);
               a_1464 = true;
               SetSpeed(0);
               this._bBefore = true;
            }
            else if(this._runTick == 5 * 20 + 24)
            {
               this._runTick = 0;
               this._fireNum = 2;
               this._iSpeed = 1;
               SetSpeed(1.5);
               this._bBefore = false;
            }
         }
         else if(this._fireNum == 2)
         {
            if(this._iSpeed == 1)
            {
               if(BattleDestroyUtil.HasDefense2(m_stCurrentFieldGrid))
               {
                  SetAnimationOnce2Loop(7,0,15,8);
                  SetSpeed(0);
                  this._runTick = 0;
                  this._iSpeed = 2;
                  this._bBefore = true;
               }
            }
            else if(this._iSpeed == 2)
            {
               if(this._runTick == 12)
               {
                  BattleDestroyUtil.DamageOneGrid(m_stCurrentFieldGrid,1000);
                  if(m_stCurrentFieldGrid.m_stHoneyTrapBaseDefense)
                  {
                     m_stCurrentFieldGrid.m_stHoneyTrapBaseDefense.a_3969(1000);
                  }
                  if(m_stCurrentFieldGrid.m_stOceanGoddessToolDefense)
                  {
                     m_stCurrentFieldGrid.m_stOceanGoddessToolDefense.a_3969(1000);
                  }
               }
               else if(this._runTick == 20)
               {
                  this._runTick = 0;
                  this._fireNum = 0;
                  SetSpeed(5);
                  this._bBefore = false;
                  a_1464 = false;
               }
            }
         }
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         var mouse:IsLandPathfinderMouseSoulMoveIntruder = null;
         if(Boolean(a_2036.getInstance().m_bInBattleView == true && this._bCreateMouse == false) && Boolean(m_stCurrentFieldGrid) && this.needCreateMouse)
         {
            this._bCreateMouse = true;
            mouse = IsLandPathfinderMouseSoulMoveIntruder.a_3926();
            mouse.a_1797((1 << 16) + m_stCurrentFieldGrid.m_iYGridNo + 100 + m_stCurrentFieldGrid.m_iXGridNo,-1);
            mouse.m_stMoveIntruderTypeID = 134242401;
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(mouse,m_stCurrentFieldGrid,false,BattleLayerDefine.INTRUDER_LAND_TYPE);
            mouse.x = x;
         }
         super.a_3940();
         return true;
      }
      
      override public function PowerfulBombReduceLifeRate(fRate:Number = 0.3, bIsIgnoreArmor:Boolean = false) : Boolean
      {
         if(a_1339 <= 0)
         {
            return false;
         }
         if(_damageParam == null)
         {
            _damageParam = [];
         }
         _damageParam.push(131);
         if(bIsIgnoreArmor)
         {
            a_4209(BOOM_INJURE_LIFE * fRate);
         }
         else
         {
            a_3969(BOOM_INJURE_LIFE * fRate);
         }
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         super.a_4208(iEffectType,iEffectTime,stBaseEffect);
      }
      
      override public function a_4213() : Boolean
      {
         this.a_4212();
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         this._bCreateMouse = true;
         super.a_4212();
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         a_3969(BOOM_INJURE_LIFE);
         return true;
      }
      
      override public function ShowBatDieEffect() : void
      {
      }
   }
}

