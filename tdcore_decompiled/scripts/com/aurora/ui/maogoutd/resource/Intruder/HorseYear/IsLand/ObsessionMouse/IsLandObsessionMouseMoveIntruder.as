package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.IsLand.ObsessionMouse
{
   import a_4752.a_2036;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.Base.BaseGameMoveIntruder;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   
   public class IsLandObsessionMouseMoveIntruder extends BaseGameMoveIntruder
   {
      
      private var _bCreateMouse:Boolean = false;
      
      public var needCreateMouse:Boolean = true;
      
      public function IsLandObsessionMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : IsLandObsessionMouseMoveIntruder
      {
         var mouse:IsLandObsessionMouseMoveIntruder = PoolManager.getInstance().CheckOutOne(IsLandObsessionMouseMoveIntruder,IsLandObsessionMouseMoveIntruderMovie) as IsLandObsessionMouseMoveIntruder;
         if(mouse != null)
         {
            mouse.needCreateMouse = true;
         }
         return mouse;
      }
      
      public static function GetFreeInstance2() : IsLandObsessionMouseMoveIntruder
      {
         var mouse:IsLandObsessionMouseMoveIntruder = PoolManager.getInstance().CheckOutOne(IsLandObsessionMouseMoveIntruder,IsLandObsessionMouseMoveIntruderMovie) as IsLandObsessionMouseMoveIntruder;
         if(mouse != null)
         {
            mouse.needCreateMouse = false;
         }
         return mouse;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         MAX_LIFE = 4800;
         INJURED_LIFE = 2400;
         ONE_GRID_SPEED = 3;
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         BoomIsReduceLife = true;
         SetAnimation(0,2);
         AddTag(40012);
         a_1481 = false;
         this._bCreateMouse = false;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 0)
         {
            if(isEatingDefense)
            {
               SetAnimation(1,3);
            }
            else
            {
               SetAnimation(0,2);
            }
         }
         else
         {
            SetDeadAnim(4);
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
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         var mouse:IsLandObsessionMouseSoulMoveIntruder = null;
         if(Boolean(a_2036.getInstance().m_bInBattleView == true && this._bCreateMouse == false) && Boolean(m_stCurrentFieldGrid) && this.needCreateMouse)
         {
            this._bCreateMouse = true;
            mouse = IsLandObsessionMouseSoulMoveIntruder.a_3926();
            mouse.a_1797((1 << 16) + m_stCurrentFieldGrid.m_iYGridNo + 100 + m_stCurrentFieldGrid.m_iXGridNo,-1);
            mouse.m_stMoveIntruderTypeID = 134242433;
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(mouse,m_stCurrentFieldGrid,false,BattleLayerDefine.INTRUDER_LAND_TYPE);
            mouse.x = x;
         }
         super.a_3940();
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
   }
}

