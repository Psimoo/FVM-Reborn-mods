package com.aurora.ui.maogoutd.resource.Intruder.newBoss.spiderMan
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.utils.Dictionary;
   
   public class SpiderManSwingMoveIntruder extends BaseBossMoveIntruder
   {
      
      private static const STATE_SKILL_SWING_TO_RIGHT:uint = 6;
      
      private static const STATE_SKILL_SWING_TO_LEFT:uint = 7;
      
      private static const SKILL_SWING_NUM:int = 3;
      
      private var m_stHead:BaseBossMoveIntruder;
      
      public function SpiderManSwingMoveIntruder()
      {
         super();
         a_1279 = -0.5 * this.width;
      }
      
      public static function a_3926() : SpiderManSwingMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(SpiderManSwingMoveIntruder) as SpiderManSwingMoveIntruder;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this.m_stHead = null;
         return true;
      }
      
      override public function get height() : Number
      {
         return 700;
      }
      
      override public function get width() : Number
      {
         return 1146;
      }
      
      override public function get IsInjured() : int
      {
         return this.m_stHead.IsInjured;
      }
      
      public function set Head(stHead:BaseBossMoveIntruder) : void
      {
         this.m_stHead = stHead;
      }
      
      override public function get numHardRate() : Number
      {
         return this.m_stHead.numHardRate;
      }
      
      override protected function get a_1339() : int
      {
         return null == this.m_stHead ? 0 : this.m_stHead.iLifeValue;
      }
      
      override public function get iArmorLifeValue() : int
      {
         return this.m_stHead.iArmorLifeValue;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         return false;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         return false;
      }
      
      override protected function getBindMovie() : Class
      {
         return SpiderManSwingMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1462 = true;
         a_1475 = false;
         a_1481 = false;
         a_1464 = true;
         m_bIsNoChangeCannotSee = true;
         return true;
      }
      
      override protected function InitSkillCache() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_HIDE]);
      }
      
      private function CacheSkillSwing() : void
      {
         var stFieldGrid:a_3491 = null;
         var iDisGridNo:int = 0;
         var vShowGrid:Vector.<a_3491> = GetRandGridArray(2,6,3,6,SKILL_SWING_NUM);
         for(var i:int = 0; i < vShowGrid.length; i++)
         {
            stFieldGrid = vShowGrid[i];
            m_vStateCache.push([STATE_APPEAR,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo]);
            m_vStateCache.push([STATE_SKILL_SWING_TO_RIGHT,24]);
            m_vStateCache.push([STATE_SKILL_SWING_TO_LEFT,24]);
            HavingRestForAwhile(5);
         }
         m_vStateCache.push([STATE_DEAD]);
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.CacheSkillSwing);
      }
      
      override protected function InitBossStateFrameID() : void
      {
         m_dictBossStateFrameID = new Dictionary();
         m_dictBossStateFrameID[STATE_HIDE + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_SKILL_SWING_TO_RIGHT + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_SKILL_SWING_TO_LEFT + "_" + 0] = 2;
         var iAddFrameID:int = 2;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 1] = 5;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = iAddFrameID + 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 5;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = iAddFrameID + 1;
         m_dictBossStateFrameID[STATE_SKILL_SWING_TO_RIGHT + "_" + 1] = iAddFrameID + 1;
         m_dictBossStateFrameID[STATE_SKILL_SWING_TO_LEFT + "_" + 1] = iAddFrameID + 2;
         m_dictBossStateFrameID[STATE_DEAD] = iAddFrameID * 2 + 2;
      }
      
      override protected function IsSkillState() : Boolean
      {
         return STATE_SKILL_SWING_TO_LEFT == m_iBossState || STATE_SKILL_SWING_TO_RIGHT == m_iBossState;
      }
      
      override protected function CheckIsCanLaunchSkill(iCurrentTime:int) : Boolean
      {
         if(!IsCanLaunchShot(iCurrentTime))
         {
            return false;
         }
         switch(m_iBossState)
         {
            case STATE_SKILL_SWING_TO_LEFT:
            case STATE_SKILL_SWING_TO_RIGHT:
               this.RealeaseMouse();
               return true;
            default:
               trace(">>>>>>" + this.toString() + "->CheckIsLaunchSkill:: 不可能事件！！！ m_iBossState = " + m_iBossState);
               return false;
         }
      }
      
      private function RealeaseMouse() : Boolean
      {
         var stStartFieldGrid:a_3491 = m_stCurrentFieldGrid;
         var stBaseMoveIntruder:a_4206 = RealeaseMouseSmokeMoveIntruder.a_3926();
         if(!stBaseMoveIntruder)
         {
            return false;
         }
         stBaseMoveIntruder.m_stMoveIntruderTypeID = 134217728;
         stBaseMoveIntruder.a_1797(a_4265(),a_1283 ? 1 : -1);
         return AddOutMoveIntruder(stBaseMoveIntruder,stStartFieldGrid,a_1283 ? 1 : -1,0);
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
         switch(iNextState)
         {
            case STATE_HIDE:
               SetIsCannotSee(true);
               break;
            case STATE_APPEAR:
               SetIsCannotSee(true);
               setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2]);
               iNextValue = 0;
               break;
            case STATE_MOVE:
               fPosX = getPosXByXGridNo(m_vStateCache[0][1]);
               fPosY = getPosYByYGridNo(m_vStateCache[0][2]);
               iNextValue = setMoveToPosition(fPosX,fPosY);
               break;
            case STATE_SKILL_SWING_TO_LEFT:
            case STATE_SKILL_SWING_TO_RIGHT:
               m_iLaunchNum = 1;
               m_iLaunchDelayTick = 12;
               m_iLaunchIntervalTick = 1;
               break;
            case STATE_DEAD:
               this.a_3940();
         }
         m_vStateCache.shift();
         ChangeState(iNextState,iNextValue,iCurrentTime);
         a_1465 = this.IsFlyState() ? 3 : 0;
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
      }
      
      override protected function UpdateBossBloodProgress() : void
      {
         trace(toString() + "->UpdateBossBloodProgress->null");
      }
      
      private function IsFlyState() : Boolean
      {
         return true;
      }
   }
}

