package com.aurora.ui.maogoutd.resource.Intruder.kfcarbon.newBoss.captainAmerica
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4255;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.effect.CaptainAmericaOnslaughtEffect;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import com.aurora.ui.maogoutd.resource.shot.boss.BaseBossShot;
   import com.aurora.ui.maogoutd.resource.shot.boss.captainAmerica.CaptainAmericaShieldShot;
   import flash.utils.Dictionary;
   
   public class CaptainAmericaBossMoveIntruder extends BaseBossMoveIntruder
   {
      
      private static const STATE_DUMP_SHIELD_HIDE:uint = 6;
      
      private static const STATE_DUMP_SHIELD_APPEAR:uint = 7;
      
      private static const STATE_DUMP_SHIELD_WAITING:uint = 8;
      
      private static const STATE_SKILL_DUMP_SHIELD:uint = 9;
      
      private static const STATE_SKILL_GROUND_SHIELD:uint = 10;
      
      private static const STATE_SKILL_SALUTE:uint = 11;
      
      private static const STATE_SKILL_ONSLAUGHT:uint = 12;
      
      private static const STATE_PREPARE_HIDE:uint = 13;
      
      private static const SKILL_HIDE_APPEAR_FRAME_NUM:int = 11;
      
      private static const SKILL_SALUTE_NUM:uint = 3;
      
      private static const SKILL_RAINBOW_NUM:uint = 5;
      
      public function CaptainAmericaBossMoveIntruder()
      {
         super();
         IsNeedShadow = true;
         a_1279 = -40 - a_3491.a_1080;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(CaptainAmericaBossMoveIntruder) as CaptainAmericaBossMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return CaptainAmericaBossMoveIntruderMovie;
      }
      
      private function HideMySelf(iTickNum:int = 0) : void
      {
         m_vStateCache.push([STATE_PREPARE_HIDE,SKILL_HIDE_APPEAR_FRAME_NUM]);
         m_vStateCache.push([STATE_HIDE,iTickNum]);
      }
      
      override protected function InitSkillCache() : void
      {
         m_bSkillIsOrder = true;
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_APPEAR,BattleFieldView.a_1011 - 1,m_iStartShowGridNo]);
         HavingRestForAwhile(10);
         this.HideMySelf();
      }
      
      private function CacheSkillDumpShield() : void
      {
         m_bSkillIsOrder = false;
         var iMaxXGrid:int = BattleFieldView.a_1011 - 1;
         var iMaxYGrid:int = BattleFieldView.a_1012 - 1;
         m_vStateCache.push([STATE_APPEAR,iMaxXGrid,iMaxYGrid]);
         m_vStateCache.push([STATE_SKILL_DUMP_SHIELD,27]);
         m_vStateCache.push([STATE_DUMP_SHIELD_WAITING,8]);
         m_vStateCache.push([STATE_DUMP_SHIELD_HIDE,11]);
         m_vStateCache.push([STATE_DUMP_SHIELD_APPEAR,iMaxXGrid,0]);
         m_vStateCache.push([STATE_DUMP_SHIELD_WAITING,8]);
         m_vStateCache.push([STATE_SKILL_GROUND_SHIELD,5]);
         HavingRestForAwhile(20);
         this.HideMySelf();
      }
      
      private function CacheSkillOnslaught() : void
      {
         var stFieldGrid:a_3491 = null;
         var iMaxYGrid:int = BattleFieldView.a_1012 - 1;
         var iCurXGrid:int = BattleFieldView.a_1011 - 2;
         for(var i:int = 0; i < SKILL_SALUTE_NUM; i++)
         {
            stFieldGrid = GetRandSingleGrid(iCurXGrid - 1,iCurXGrid,1,iMaxYGrid - 1);
            if(null != stFieldGrid)
            {
               m_vStateCache.push([STATE_APPEAR,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo]);
               m_vStateCache.push([STATE_SKILL_ONSLAUGHT,20]);
               this.HideMySelf();
            }
            iCurXGrid -= 2;
         }
      }
      
      private function CacheSkillSalute() : void
      {
         m_vStateCache.push([STATE_APPEAR,BattleFieldView.a_1011 - 2,m_iStartShowGridNo]);
         m_vStateCache.push([STATE_SKILL_SALUTE,52]);
         this.HideMySelf();
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.CacheSkillDumpShield);
         m_vSkillFunction.push(this.CacheSkillSalute);
         m_vSkillFunction.push(this.CacheSkillOnslaught);
      }
      
      override protected function InitBossStateFrameID() : void
      {
         m_dictBossStateFrameID = new Dictionary();
         m_dictBossStateFrameID[STATE_HIDE + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_DUMP_SHIELD_HIDE + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_DUMP_SHIELD_APPEAR + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_DUMP_SHIELD_WAITING + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_SKILL_DUMP_SHIELD + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_SKILL_GROUND_SHIELD + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_SKILL_SALUTE + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_SKILL_ONSLAUGHT + "_" + 0] = 10;
         m_dictBossStateFrameID[STATE_PREPARE_HIDE + "_" + 0] = 1;
         var iAddFrameID:int = 10;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 1] = iAddFrameID + 1;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = iAddFrameID + 2;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = iAddFrameID + 5;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = iAddFrameID + 5;
         m_dictBossStateFrameID[STATE_DUMP_SHIELD_HIDE + "_" + 1] = iAddFrameID + 3;
         m_dictBossStateFrameID[STATE_DUMP_SHIELD_APPEAR + "_" + 1] = iAddFrameID + 4;
         m_dictBossStateFrameID[STATE_DUMP_SHIELD_WAITING + "_" + 1] = iAddFrameID + 7;
         m_dictBossStateFrameID[STATE_SKILL_DUMP_SHIELD + "_" + 1] = iAddFrameID + 6;
         m_dictBossStateFrameID[STATE_SKILL_GROUND_SHIELD + "_" + 1] = iAddFrameID + 8;
         m_dictBossStateFrameID[STATE_SKILL_SALUTE + "_" + 1] = iAddFrameID + 9;
         m_dictBossStateFrameID[STATE_SKILL_ONSLAUGHT + "_" + 1] = iAddFrameID + 10;
         m_dictBossStateFrameID[STATE_PREPARE_HIDE + "_" + 1] = iAddFrameID + 1;
         m_dictBossStateFrameID[STATE_DEAD] = iAddFrameID * 2 + 1;
      }
      
      override protected function IsSkillState() : Boolean
      {
         return STATE_SKILL_DUMP_SHIELD == m_iBossState || STATE_SKILL_SALUTE == m_iBossState || STATE_SKILL_ONSLAUGHT == m_iBossState;
      }
      
      override protected function CheckIsCanLaunchSkill(iCurrentTime:int) : Boolean
      {
         var stBaseShot:a_4348 = null;
         var fPosX:Number = NaN;
         var fPosY:Number = NaN;
         var stBaseBossShot:BaseBossShot = null;
         var stFieldGrid:a_3491 = null;
         var iXPos:int = 0;
         var iYPos:int = 0;
         var stOnslaughtFieldGrid:a_3491 = null;
         var stOnslaughtEffect:a_4108 = null;
         if(!IsCanLaunchShot(iCurrentTime))
         {
            return false;
         }
         switch(m_iBossState)
         {
            case STATE_SKILL_DUMP_SHIELD:
               ClearDefenseCardByGridNo(m_stCurrentFieldGrid.m_iXGridNo - 1,m_stCurrentFieldGrid.m_iYGridNo);
               stBaseBossShot = CaptainAmericaShieldShot.a_4344();
               stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 2,m_stCurrentFieldGrid.m_iYGridNo);
               iXPos = (stFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
               iYPos = (stFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081;
               stBaseBossShot.a_1797(a_4265(),0,0,iXPos,iYPos,stFieldGrid.m_stCurrentBattbleFieldView,stFieldGrid);
               stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stBaseBossShot,BattleLayerDefine.SHOT_TYPE);
               break;
            case STATE_SKILL_ONSLAUGHT:
               stOnslaughtFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 1,m_stCurrentFieldGrid.m_iYGridNo);
               ClearFieldGridDefenseCard(stOnslaughtFieldGrid);
               if(m_stCurrentFieldGrid.m_iXGridNo - 2 >= 0)
               {
                  stOnslaughtFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 2,m_stCurrentFieldGrid.m_iYGridNo);
                  ClearFieldGridDefenseCard(stOnslaughtFieldGrid);
               }
               stOnslaughtEffect = CaptainAmericaOnslaughtEffect.a_3926();
               stOnslaughtEffect.a_1797(!stOnslaughtFieldGrid.m_stCurrentBattbleFieldView.isOwnBattleField);
               stOnslaughtEffect.x = this.x - 160;
               stOnslaughtEffect.y = this.y + 45;
               stOnslaughtFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stOnslaughtEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,stOnslaughtFieldGrid);
               stOnslaughtEffect.play();
               break;
            case STATE_SKILL_SALUTE:
               if(m_iLaunchNum > -1)
               {
                  this.RealeaseRainbow(m_iLaunchNum);
               }
               else
               {
                  this.RealeaseAirCarrier();
               }
               break;
            default:
               trace(">>>>>>" + this.toString() + "->CheckIsLaunchSkill:: 不可能事件！！！ m_iBossState = " + m_iBossState);
               return false;
         }
         return true;
      }
      
      private function RealeaseAirCarrier() : void
      {
         var stBaseMoveIntruder:a_4206 = null;
         var stFieldGrid:a_3491 = null;
         var iXGridMax:int = BattleFieldView.a_1011 - 1;
         var iYGridMax:int = BattleFieldView.a_1012 - 1;
         var arrYGrid:Array = [1,iYGridMax - 1];
         for(var i:int = 0; i < 2; i++)
         {
            stBaseMoveIntruder = a_4255.getInstance().a_4256(8388761);
            if(null == stBaseMoveIntruder)
            {
               throw Error("前端map_mouse.xml配置 MouseID节点 缺少老鼠ID：" + (8388761).toString(16));
            }
            stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridMax,arrYGrid[i]);
            AddOutMoveIntruder(stBaseMoveIntruder,stFieldGrid,-1,0.5,true);
         }
      }
      
      private function RealeaseRainbow(iYGridNo:int) : void
      {
         var stRainbowFieldGrid:a_3491 = null;
         var stCaptainAmericaRainbowMoveIntruder:CaptainAmericaRainbowMoveIntruder = null;
         var iXGridNo:int = 5;
         stRainbowFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
         stCaptainAmericaRainbowMoveIntruder = CaptainAmericaRainbowMoveIntruder.a_3926();
         stCaptainAmericaRainbowMoveIntruder.iGlobalMoveFighterID = a_4265();
         stCaptainAmericaRainbowMoveIntruder.m_stMoveIntruderTypeID = 8388608;
         stCaptainAmericaRainbowMoveIntruder.x = iXGridNo * a_3491.a_1080 + 0.5 * (a_3491.a_1080 - stCaptainAmericaRainbowMoveIntruder.width);
         stCaptainAmericaRainbowMoveIntruder.y = (1 + iYGridNo) * a_3491.a_1081 - stCaptainAmericaRainbowMoveIntruder.height + stCaptainAmericaRainbowMoveIntruder.iYPosSkewing;
         stRainbowFieldGrid.m_stCurrentBattbleFieldView.a_3459(stCaptainAmericaRainbowMoveIntruder,stRainbowFieldGrid);
         stRainbowFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stCaptainAmericaRainbowMoveIntruder,BattleLayerDefine.EFFECTS_TOP_TYPE,stRainbowFieldGrid);
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
            case STATE_DUMP_SHIELD_APPEAR:
               SetIsCannotSee(false);
               setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2]);
               iNextValue = 11;
               break;
            case STATE_MOVE:
               fPosX = getPosXByXGridNo(m_vStateCache[0][1]);
               fPosY = getPosYByYGridNo(m_vStateCache[0][2]);
               iNextValue = setMoveToPosition(fPosX,fPosY);
               break;
            case STATE_SKILL_DUMP_SHIELD:
               m_iLaunchNum = 1;
               m_iLaunchDelayTick = 22;
               m_iLaunchIntervalTick = 4;
               break;
            case STATE_SKILL_ONSLAUGHT:
               m_iLaunchNum = 1;
               m_iLaunchDelayTick = 10;
               m_iLaunchIntervalTick = 5;
               break;
            case STATE_SKILL_SALUTE:
               m_iLaunchNum = SKILL_RAINBOW_NUM + 2;
               m_iLaunchDelayTick = 8;
               m_iLaunchIntervalTick = 6;
         }
         m_vStateCache.shift();
         ChangeState(iNextState,iNextValue,iCurrentTime);
         if(STATE_HIDE == m_iBossState || STATE_PREPARE_HIDE == m_iBossState || STATE_APPEAR == m_iBossState || STATE_DUMP_SHIELD_HIDE == m_iBossState || STATE_DUMP_SHIELD_APPEAR == m_iBossState)
         {
            a_1465 = 3;
         }
         else
         {
            a_1465 = 0;
         }
         return true;
      }
   }
}

