package com.aurora.ui.maogoutd.resource.Intruder.newBoss.candyLolita
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import flash.display.FrameLabel;
   import flash.utils.Dictionary;
   
   public class CandyShellMouseMoveIntruder extends BaseBossMoveIntruder
   {
      
      private static const MOVE_SPEED:Number = 30;
      
      private static const STATE_JUMP_UP:uint = 6;
      
      private static const STATE_JUMP_DOWN:uint = 7;
      
      private static const STATE_SKILL_KILL:uint = 8;
      
      private var m_iJumpTick:int;
      
      private var m_arrHasCandyShell:Array;
      
      private var m_nMaxSpeedY:Number;
      
      private var m_nPreTickChgSpeedY:Number;
      
      public function CandyShellMouseMoveIntruder()
      {
         super();
         IsNeedShadow = false;
         m_fOrginSpeed = MOVE_SPEED;
         a_1279 = -0.5 * this.width - 20;
         a_1467 = -40;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(CandyShellMouseMoveIntruder,CandyShellMouseMoveIntruderMovie) as CandyShellMouseMoveIntruder;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         var b:Boolean = false;
         b = super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         m_bSkillIsOrder = true;
         this.m_iJumpTick = 4;
         SetCannotSeeByFighter(true);
         return b;
      }
      
      override public function get width() : Number
      {
         return 30;
      }
      
      override public function get height() : Number
      {
         return 80;
      }
      
      override protected function InitBossStateFrameID() : void
      {
         m_dictBossStateFrameID = new Dictionary();
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_JUMP_UP + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_JUMP_DOWN + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_SKILL_KILL + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = m_dictBossStateFrameID[STATE_APPEAR + "_" + 0];
         m_dictBossStateFrameID[STATE_JUMP_UP + "_" + 1] = m_dictBossStateFrameID[STATE_JUMP_UP + "_" + 0];
         m_dictBossStateFrameID[STATE_JUMP_DOWN + "_" + 1] = m_dictBossStateFrameID[STATE_JUMP_DOWN + "_" + 0];
         m_dictBossStateFrameID[STATE_SKILL_KILL + "_" + 1] = m_dictBossStateFrameID[STATE_SKILL_KILL + "_" + 0];
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = m_dictBossStateFrameID[STATE_DEAD + "_" + 0];
      }
      
      public function SetData(arr:Array) : void
      {
         this.m_arrHasCandyShell = arr;
      }
      
      override protected function setLifeValue() : void
      {
         a_1339 = m_iMaxLife.Value;
         numHardRate = 1;
      }
      
      override public function nextFrame() : void
      {
         super.nextFrame();
         if(a_1278 != null || a_1273 == a_1274)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
      }
      
      override protected function InitSkillCache() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_APPEAR,3 - 1,m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo]);
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.CacheSkillKill);
      }
      
      private function CacheSkillKill() : void
      {
         m_vStateCache.push([STATE_JUMP_DOWN,0,1,m_stCurrentFieldGrid.m_iYGridNo]);
         m_vStateCache.push([STATE_SKILL_KILL,1]);
         m_vStateCache.push([STATE_JUMP_UP,0]);
         m_vStateCache.push([STATE_JUMP_DOWN,0,4,m_stCurrentFieldGrid.m_iYGridNo]);
         m_vStateCache.push([STATE_SKILL_KILL,1]);
         m_vStateCache.push([STATE_JUMP_UP,0]);
         m_vStateCache.push([STATE_JUMP_DOWN,0,7,m_stCurrentFieldGrid.m_iYGridNo]);
         m_vStateCache.push([STATE_SKILL_KILL,1]);
         m_vStateCache.push([STATE_DEAD,0]);
      }
      
      override protected function SwitchState(iCurrentTime:int) : Boolean
      {
         var fPosX:Number = NaN;
         var fPosY:Number = NaN;
         if(0 == m_vStateCache.length)
         {
            CacheNextSkill();
         }
         var iNextState:uint = uint(m_vStateCache[0][0]);
         var iNextValue:int = int(m_vStateCache[0][1]);
         this.UpdateSpeedByState(iNextState);
         SetCannotSeeByFighter(true);
         switch(iNextState)
         {
            case STATE_APPEAR:
               SetIsCannotSee(false);
               setAppearToGrid(m_vStateCache[0][2],m_vStateCache[0][3],-a_3491.a_1080 * 1.5,-a_3491.a_1081 * 1.5);
               break;
            case STATE_JUMP_UP:
               m_fMoveSpeedX = a_3491.a_1080 * 1.5 / this.m_iJumpTick;
               m_fMoveSpeedY = a_3491.a_1081 * 1.5 / this.m_iJumpTick;
               this.m_nMaxSpeedY = 2 * (m_fMoveSpeedY * this.m_iJumpTick) / this.m_iJumpTick - 0;
               this.m_nPreTickChgSpeedY = (this.m_nMaxSpeedY - 0) / (this.m_iJumpTick - 1);
               iNextValue = this.m_iJumpTick;
               break;
            case STATE_JUMP_DOWN:
               fPosX = getPosXByXGridNo(m_vStateCache[0][2]);
               fPosY = getPosYByYGridNo(m_vStateCache[0][3]);
               m_fMoveSpeedX = (fPosX - this.x) / this.m_iJumpTick;
               m_fMoveSpeedY = (fPosY - this.y) / this.m_iJumpTick;
               this.m_nMaxSpeedY = 2 * (m_fMoveSpeedY * this.m_iJumpTick) / this.m_iJumpTick - 0;
               this.m_nPreTickChgSpeedY = (this.m_nMaxSpeedY - 0) / (this.m_iJumpTick - 1);
               iNextValue = this.m_iJumpTick;
               break;
            case STATE_SKILL_KILL:
               m_iLaunchNum = 1;
               m_iLaunchDelayTick = 1;
               break;
            case STATE_DEAD:
               this.m_arrHasCandyShell[m_stCurrentFieldGrid.m_iYGridNo] = false;
               a_1339 = 0;
               a_3940();
         }
         m_vStateCache.shift();
         ChangeState(iNextState,iNextValue,iCurrentTime);
         return true;
      }
      
      private function UpdateSpeedByState(iNextState:int) : void
      {
         a_1350 = MOVE_SPEED;
      }
      
      override protected function CheckIsCanLaunchSkill(iCurrentTime:int) : Boolean
      {
         if(!IsCanLaunchShot(iCurrentTime))
         {
            return false;
         }
         switch(m_iBossState)
         {
            case STATE_SKILL_KILL:
               this.a_3502(m_stCurrentFieldGrid);
         }
         return true;
      }
      
      override protected function IsSkillState() : Boolean
      {
         return Boolean(m_iBossState == STATE_SKILL_KILL);
      }
      
      override protected function IsMoving() : Boolean
      {
         return m_iBossState == STATE_JUMP_UP || m_iBossState == STATE_JUMP_DOWN;
      }
      
      override protected function MoveMySelf() : void
      {
         if(m_iBossState == STATE_JUMP_UP)
         {
            m_fMoveSpeedY = -this.m_nMaxSpeedY + (this.m_iJumpTick - m_iRestTick) * this.m_nPreTickChgSpeedY;
         }
         else if(m_iBossState == STATE_JUMP_DOWN)
         {
            m_fMoveSpeedY = 0 + (this.m_iJumpTick - m_iRestTick) * this.m_nPreTickChgSpeedY;
         }
         if(m_bIsNeedHighPrecision)
         {
            this.x = Math.round(10000 * this.x + 10000 * m_fMoveSpeedX) * 0.0001;
            this.y = Math.round(10000 * this.y + 10000 * m_fMoveSpeedY) * 0.0001;
         }
         else
         {
            this.x += m_fMoveSpeedX;
            this.y += m_fMoveSpeedY;
         }
         var iXGridNo:int = getXGridNoByPosX();
         var iYGridNo:int = getYGridNoByPosY();
         var stNextFieldGrid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
         ChangeToFieldGrid(stNextFieldGrid);
         SetIsCannotSee(true,false);
      }
      
      override protected function IsCanReduceLife() : Boolean
      {
         return false;
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption();
      }
      
      override protected function UpdateBossBloodProgress() : void
      {
      }
      
      override public function get IsBoss() : Boolean
      {
         return false;
      }
   }
}

