package com.aurora.ui.maogoutd.resource.Intruder.newBoss.candyLolita
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import flash.display.FrameLabel;
   import flash.utils.Dictionary;
   
   public class JellyMouseMoveIntruder extends BaseBossMoveIntruder
   {
      
      private static const MOVE_SPEED:Number = 0;
      
      private static const STATE_SKILL_KILL:uint = 6;
      
      private var m_iOldFieldGridType:int;
      
      public function JellyMouseMoveIntruder()
      {
         super();
         IsNeedShadow = true;
         m_fOrginSpeed = MOVE_SPEED;
         a_1279 = -0.3 * this.width - 25;
         a_1467 = -40;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(JellyMouseMoveIntruder,JellyMouseMoveIntruderMovie) as JellyMouseMoveIntruder;
      }
      
      override protected function a_3940() : Boolean
      {
         m_stCurrentFieldGrid.m_iFieldGridType = this.m_iOldFieldGridType;
         super.a_3940();
         return true;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         var b:Boolean = super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         m_bSkillIsOrder = true;
         return b;
      }
      
      override public function get width() : Number
      {
         return 30;
      }
      
      override public function get height() : Number
      {
         return 60;
      }
      
      override protected function InitBossStateFrameID() : void
      {
         m_dictBossStateFrameID = new Dictionary();
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_SKILL_KILL + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = m_dictBossStateFrameID[STATE_APPEAR + "_" + 0];
         m_dictBossStateFrameID[STATE_SKILL_KILL + "_" + 1] = m_dictBossStateFrameID[STATE_SKILL_KILL + "_" + 0];
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = m_dictBossStateFrameID[STATE_WAITING + "_" + 0];
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = m_dictBossStateFrameID[STATE_DEAD + "_" + 0];
      }
      
      public function SetMaxLifeValue(v:int) : void
      {
         m_iMaxLife.Value = v;
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
         m_vStateCache.push([STATE_APPEAR,0,m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo]);
         m_vStateCache.push([STATE_SKILL_KILL,1]);
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.CacheSkillAntiHarm);
      }
      
      private function CacheSkillAntiHarm() : void
      {
         m_vStateCache.push([STATE_WAITING,50]);
         m_vStateCache.push([STATE_DEAD,0]);
      }
      
      override protected function SwitchState(iCurrentTime:int) : Boolean
      {
         if(0 == m_vStateCache.length)
         {
            CacheNextSkill();
         }
         var iNextState:uint = uint(m_vStateCache[0][0]);
         var iNextValue:int = int(m_vStateCache[0][1]);
         this.UpdateSpeedByState(iNextState);
         switch(iNextState)
         {
            case STATE_APPEAR:
               SetIsCannotSee(false);
               setAppearToGrid(m_vStateCache[0][2],m_vStateCache[0][3]);
               break;
            case STATE_SKILL_KILL:
               m_iLaunchNum = 1;
               m_iLaunchDelayTick = 1;
               break;
            case STATE_DEAD:
               a_1339 = 0;
               this.a_3940();
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
               this.m_iOldFieldGridType = m_stCurrentFieldGrid.m_iFieldGridType;
               m_stCurrentFieldGrid.m_iFieldGridType = 1;
         }
         return true;
      }
      
      override protected function IsSkillState() : Boolean
      {
         return Boolean(m_iBossState == STATE_SKILL_KILL);
      }
      
      override protected function IsMoving() : Boolean
      {
         return m_iBossState == STATE_MOVE;
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

