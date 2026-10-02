package com.aurora.ui.maogoutd.resource.Intruder.DragonYear.SummerLittleMouse
{
   import a_4718.b_181;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4255;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class SpaceScientistMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 3000;
      
      private static const MAX_INJURED_LIFE:int = 300;
      
      private static const ONE_GRID_SPEED:int = 2;
      
      private var m_iState:int = 0;
      
      private var m_bHasUseSkill:Boolean = false;
      
      private var m_iCurrentTime:int = 0;
      
      private var m_iThinkTime:int = 0;
      
      private var m_iReduceHPPerSecond:int = 0;
      
      private var m_ReduceHPTick:int = 0;
      
      private var m_stNextFieldGrid:a_3491 = null;
      
      public function SpaceScientistMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(SpaceScientistMouseMoveIntruder) as SpaceScientistMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return SpaceScientistMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (20 * ONE_GRID_SPEED);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = MAX_LIFE;
         a_1279 = -width * 0.2;
         a_1272 = 0;
         this.m_iState = -1;
         this.SwitchState(0);
         this.m_ReduceHPTick = 20;
         this.m_bHasUseSkill = false;
         CanCharm = false;
         return true;
      }
      
      public function SetAnimation(animIdx:int, addIdx:int = 0) : void
      {
         if(a_1339 > 0 && a_1339 < MAX_INJURED_LIFE)
         {
            animIdx += addIdx;
         }
         if(a_1275 != animIdx)
         {
            a_1275 = animIdx;
            gotoAndStop((a_1276[animIdx] as FrameLabel).frame);
            a_3419();
         }
      }
      
      public function SetAnimationOnce2Loop(onceAnimIdx:int, loopAnimIdx:int, addIdx:int = 0) : void
      {
         if(a_1339 > 0 && a_1339 < MAX_INJURED_LIFE)
         {
            onceAnimIdx += addIdx;
            loopAnimIdx += addIdx;
         }
         a_1275 = loopAnimIdx;
         gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         a_3419();
      }
      
      private function CheckSkill() : void
      {
         var iYGridNo:int = 0;
         var stBaseMoveIntruder:a_4206 = null;
         var stFileGrid:a_3491 = null;
         if(this.m_iState == 2 && this.m_bHasUseSkill == false && (a_1273 == 111 || a_1273 == 134))
         {
            this.m_bHasUseSkill = true;
            iYGridNo = int(x / a_3491.a_1081);
            stBaseMoveIntruder = a_4255.getInstance().a_4256(8389011);
            if(stBaseMoveIntruder)
            {
               stBaseMoveIntruder.a_1797((1 << 16) + m_stCurrentFieldGrid.m_iYGridNo + 50,-1);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,m_stCurrentFieldGrid,true,BattleLayerDefine.INTRUDER_LAND_TYPE);
               stBaseMoveIntruder.x = BattleFieldView.a_1013;
               stBaseMoveIntruder.y = m_stCurrentFieldGrid.m_iYGridNo * a_3491.a_1081 - 64;
               stBaseMoveIntruder.SpecialSkillCallBack();
            }
            stFileGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(8,m_stCurrentFieldGrid.m_iYGridNo - 1);
            if(stFileGrid)
            {
               stBaseMoveIntruder = a_4255.getInstance().a_4256(8389010);
               stBaseMoveIntruder.a_1797((1 << 16) + stFileGrid.m_iYGridNo + 60,-1);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stFileGrid,true,BattleLayerDefine.INTRUDER_LAND_TYPE);
               stBaseMoveIntruder.x = BattleFieldView.a_1013;
               stBaseMoveIntruder.y = (m_stCurrentFieldGrid.m_iYGridNo - 1) * a_3491.a_1081 - 15;
               stBaseMoveIntruder.SpecialSkillCallBack();
            }
            stFileGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(8,m_stCurrentFieldGrid.m_iYGridNo + 1);
            if(stFileGrid)
            {
               stBaseMoveIntruder = a_4255.getInstance().a_4256(8389010);
               stBaseMoveIntruder.a_1797((1 << 16) + stFileGrid.m_iYGridNo + 70,-1);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stFileGrid,true,BattleLayerDefine.INTRUDER_LAND_TYPE);
               stBaseMoveIntruder.x = BattleFieldView.a_1013;
               stBaseMoveIntruder.y = (m_stCurrentFieldGrid.m_iYGridNo + 1) * a_3491.a_1081 - 15;
               stBaseMoveIntruder.SpecialSkillCallBack();
            }
         }
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 <= 0 && a_1275 != 10 && a_1275 != 11)
         {
            if(this.m_iState == 2)
            {
               a_1275 = 10;
               gotoAndStop((a_1276[10] as FrameLabel).frame);
            }
            else
            {
               a_1275 = 11;
               gotoAndStop((a_1276[11] as FrameLabel).frame);
            }
            a_3419();
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            this.play();
         }
         else if(a_1475)
         {
            this.SetAnimation(4,1);
         }
         else if(this.m_iState == 0)
         {
            this.SetAnimation(0,1);
         }
         else if(this.m_iState == 1)
         {
            this.SetAnimation(2,1);
         }
         else if(this.m_iState == 2)
         {
            this.SetAnimation(7,2);
         }
         return true;
      }
      
      public function IsInvicible() : Boolean
      {
         return this.m_iState == 2;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(!this.IsInvicible())
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         if(m_stCurrentFieldGrid != null && iRduceLifeValue > 0 && iLifeValue > 0 && m_stCurrentFieldGrid.m_iHurtRate > 0)
         {
            this.SwitchState(2);
         }
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         super.a_4209(iRduceLifeValue);
         if(m_stCurrentFieldGrid != null && iRduceLifeValue > 0 && iLifeValue > 0 && m_stCurrentFieldGrid.m_iHurtRate > 0)
         {
            this.SwitchState(2);
         }
         return true;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         if(m_stCurrentFieldGrid != null && m_stCurrentFieldGrid.m_iHurtRate <= 0)
         {
            return true;
         }
         super.a_4210();
         return true;
      }
      
      public function SwitchState(iState:int) : Boolean
      {
         if(this.m_iState == 999)
         {
            return false;
         }
         if(this.m_iState != iState)
         {
            switch(iState)
            {
               case 0:
                  this.SetAnimation(0,1);
                  a_1464 = false;
                  a_1350 = a_3491.a_1080 / (20 * ONE_GRID_SPEED);
                  if(a_1283 == false)
                  {
                     a_1350 *= -1;
                  }
                  break;
               case 1:
                  this.SetAnimation(2,1);
                  a_1464 = false;
                  a_1350 = 0;
                  this.m_iThinkTime = 60;
                  break;
               case 2:
                  this.SetAnimationOnce2Loop(6,7,2);
                  a_1464 = true;
                  a_1350 = 0;
                  a_1475 = false;
            }
            this.m_iState = iState;
            return true;
         }
         return false;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var iOldState:int = 0;
         var old:Number = NaN;
         if(!a_1460)
         {
            a_1460 = true;
            this.m_iReduceHPPerSecond = iLifeValue * 0.05;
         }
         if(m_stCurrentFieldGrid == null || m_stCurrentFieldGrid.m_iXGridNo >= 8)
         {
            this.CheckSkill();
         }
         if(this.m_ReduceHPTick > 0)
         {
            --this.m_ReduceHPTick;
            if(this.m_ReduceHPTick == 0)
            {
               iOldState = this.m_iState;
               this.m_iState = 999;
               if(m_stCurrentFieldGrid != null)
               {
                  old = m_stCurrentFieldGrid.m_iHurtRate;
                  m_stCurrentFieldGrid.m_iHurtRate = 1;
                  this.a_3969(Math.min(iLifeValue - 1,this.m_iReduceHPPerSecond));
                  m_stCurrentFieldGrid.m_iHurtRate = old;
               }
               this.m_iState = iOldState;
               this.m_ReduceHPTick = 20;
            }
         }
         this.m_iCurrentTime = iCurrentTime;
         if(a_1273 == 108 || a_1273 == 131)
         {
            a_1350 = a_3491.a_1080 / (20 * -1);
            if(a_1283 == false)
            {
               a_1350 *= -1;
            }
         }
         if(this.m_iThinkTime > 0 && !a_1475)
         {
            --this.m_iThinkTime;
            if(this.m_iThinkTime <= 0)
            {
               if(this.m_iState == 1)
               {
                  this.RealChangeFieldGrid();
                  this.SwitchState(0);
               }
            }
         }
         var numOrigXPos:Number = x;
         super.a_4216(iCurrentTime);
         if(a_1457 == b_181.a_424 && (x > a_3491.a_1080 * 4 && a_1283 || x < a_3491.a_1080 * 5 && !a_1283))
         {
            y += Math.tan(15 * Math.PI / 180) * Math.abs(numOrigXPos - x);
         }
         return true;
      }
      
      private function RealChangeFieldGrid() : void
      {
         super.ChangeFieldGrid(this.m_stNextFieldGrid);
      }
      
      override protected function ChangeFieldGrid(stNextFieldGrid:a_3491) : void
      {
         if(this.m_iState != 2)
         {
            this.m_stNextFieldGrid = stNextFieldGrid;
            this.SwitchState(1);
         }
         else
         {
            super.ChangeFieldGrid(stNextFieldGrid);
         }
      }
      
      override public function play() : void
      {
         super.play();
      }
   }
}

