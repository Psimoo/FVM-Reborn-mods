package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.IsLand.ListeningMouse
{
   import a_4718.b_182;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.Base.BaseGameMoveIntruder;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Util.BattleEffectUtil;
   import com.aurora.ui.maogoutd.resource.Intruder.HorseYear.IsLand.ObsessionMouse.IsLandObsessionMouseSoulMoveIntruder;
   import com.aurora.ui.maogoutd.resource.Intruder.HorseYear.IsLand.PathfinderMouse.IsLandPathfinderMouseSoulMoveIntruder;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   
   public class IsLandPrisonMouseMoveIntruder extends BaseGameMoveIntruder
   {
      
      private var state:int = 0;
      
      private var createTick:int = -1;
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      public function IsLandPrisonMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : IsLandPrisonMouseMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(IsLandPrisonMouseMoveIntruder,IsLandPrisonMouseMoveIntruderMovie) as IsLandPrisonMouseMoveIntruder;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         MAX_LIFE = 500000;
         INJURED_LIFE = 1250;
         ONE_GRID_SPEED = 0;
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         SetAnimationOnce2Loop(0,1,0,1);
         AddTag(5);
         a_1464 = true;
         a_1481 = false;
         this.state = 0;
         this.createTick = -1;
         AddTag(40010);
         AddTag(401);
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 <= 0)
         {
            SetDeadAnim(4);
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         if(!a_1460)
         {
            a_1460 = true;
            this.m_stRandomSeed.setSeed(globalMoveFighterID - m_stCurrentFieldGrid.m_iYGridNo,globalMoveFighterID + m_stCurrentFieldGrid.m_iYGridNo);
         }
         super.a_4216(iCurrentTime);
         if(m_stCurrentFieldGrid == null)
         {
            return true;
         }
         if(this.state == 0)
         {
            if(m_stCurrentFieldGrid.tagCom.HasTag(20047))
            {
               this.ActiveBall();
            }
         }
         else if(this.state == 1)
         {
            ++this.createTick;
            if(this.createTick == 20 * 6 - 14)
            {
               BattleEffectUtil.CreateGameEffect2(IsLandGridFireEffectMovie,m_stCurrentFieldGrid).SetAnimation(0,true);
            }
            else if(this.createTick == 20 * 6)
            {
               this.CreateMouse();
            }
            else if(this.createTick == 20 * 21 - 14)
            {
               BattleEffectUtil.CreateGameEffect2(IsLandGridFireEffectMovie,m_stCurrentFieldGrid).SetAnimation(0,true);
            }
            else if(this.createTick == 20 * 21)
            {
               this.CreateMouse();
               this.SetDead();
            }
         }
         return true;
      }
      
      private function SetDead() : void
      {
         this.state = 2;
         a_1339 = 0;
         this.ResetMovieStatus();
      }
      
      public function CreateMouse() : void
      {
         this.CreateMouse2();
      }
      
      private function CreateMouse1() : void
      {
         var mouse:IsLandObsessionMouseSoulMoveIntruder = null;
         mouse = IsLandObsessionMouseSoulMoveIntruder.a_3926();
         mouse.a_1797((1 << 16) + m_stCurrentFieldGrid.m_iYGridNo + 100 + m_stCurrentFieldGrid.m_iXGridNo,-1);
         mouse.m_stMoveIntruderTypeID = 134242433;
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(mouse,m_stCurrentFieldGrid,false,BattleLayerDefine.INTRUDER_LAND_TYPE);
         mouse.x = x;
         mouse.InitNormal();
      }
      
      private function CreateMouse2() : void
      {
         var mouse:IsLandPathfinderMouseSoulMoveIntruder = null;
         mouse = IsLandPathfinderMouseSoulMoveIntruder.a_3926();
         mouse.a_1797((1 << 16) + m_stCurrentFieldGrid.m_iYGridNo + 100 + m_stCurrentFieldGrid.m_iXGridNo,-1);
         mouse.m_stMoveIntruderTypeID = 134242401;
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(mouse,m_stCurrentFieldGrid,false,BattleLayerDefine.INTRUDER_LAND_TYPE);
         mouse.x = x;
         mouse.InitNormal();
      }
      
      public function ActiveBall() : void
      {
         SetAnimationOnce2Loop(2,3,2,3);
         this.state = 1;
         this.createTick = 0;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(this.state == 1 && (b_182.a_433 == iEffectType || b_182.a_434 == iEffectType))
         {
            this.SetDead();
         }
         else if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      override public function a_4210() : Boolean
      {
         return true;
      }
      
      override public function ShowBatDieEffect() : void
      {
      }
   }
}

