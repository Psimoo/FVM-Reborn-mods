package com.aurora.ui.maogoutd.resource.Intruder.newBoss.baby
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import com.aurora.ui.maogoutd.resource.shot.boss.baby.BabyBandageShot;
   import com.aurora.ui.maogoutd.resource.shot.boss.baby.BabyStarShot;
   import flash.utils.Dictionary;
   
   public class BabyBossMoveIntruder extends BaseBossMoveIntruder
   {
      
      private static const STATE_ATTACK_STAR:uint = 6;
      
      private static const STATE_ATTACK_DIAMONDS:uint = 7;
      
      private static const STATE_ATTACK_BANDAGE:uint = 8;
      
      private static const STATE_ANGRY:uint = 9;
      
      private static const LAUNCH_DIAMONDS_NUM:uint = 3;
      
      private static const LAUNCH_BANDAGE_NUM:uint = 4;
      
      public function BabyBossMoveIntruder()
      {
         super();
         IsNeedShadow = true;
         a_1467 = 0.3 * this.height - a_3491.a_1081;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(BabyBossMoveIntruder) as BabyBossMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return BabyBossMoveIntruderMovie;
      }
      
      private function CacheSkillStar() : void
      {
         var iMaxYGrid:int = BattleFieldView.a_1012;
         var iXGrid:int = BattleFieldView.a_1011 - 1;
         if(STATE_NONE != m_iBossState)
         {
            HiddenMySelf(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo);
         }
         var iYGrid:int = int(m_stRandomSeed.nextInt(2));
         m_vStateCache.push([STATE_APPEAR,pressData(iXGrid,iYGrid,8)]);
         HavingRestForAwhile(20);
         m_vStateCache.push([STATE_ATTACK_STAR,11]);
         for(iYGrid += 2; iYGrid < iMaxYGrid; iYGrid += 2)
         {
            m_vStateCache.push([STATE_MOVE,pressData(iXGrid,iYGrid,8)]);
            m_vStateCache.push([STATE_ATTACK_STAR,11]);
         }
         iYGrid -= 2;
         HavingRestForAwhile(20);
         HiddenMySelf(iXGrid,iYGrid);
         m_vStateCache.push([STATE_APPEAR,pressData(iXGrid,m_iStartShowGridNo,8)]);
         HavingRestForAwhile(20);
      }
      
      private function CacheSkillDiamonds() : void
      {
         m_vStateCache.push([STATE_ATTACK_DIAMONDS,45]);
         HavingRestForAwhile(20);
      }
      
      private function CacheSkillBangage() : void
      {
         var iMaxXGrid:int = BattleFieldView.a_1011;
         var iMaxYGrid:int = BattleFieldView.a_1012;
         m_vStateCache.push([STATE_ANGRY,13]);
         var vRandGrid:Vector.<a_3491> = GetRandGridArray(2,5,0,iMaxYGrid - 1,LAUNCH_BANDAGE_NUM);
         for(var i:int = 0; i < vRandGrid.length; i++)
         {
            m_vStateCache.push([STATE_MOVE,pressData(vRandGrid[i].m_iXGridNo,vRandGrid[i].m_iYGridNo,8)]);
            m_vStateCache.push([STATE_ATTACK_BANDAGE,23]);
         }
         m_vStateCache.push([STATE_MOVE,pressData(iMaxXGrid - 1,m_iStartShowGridNo,8)]);
         HavingRestForAwhile(20);
      }
      
      override protected function InitBossStateFrameID() : void
      {
         m_dictBossStateFrameID = new Dictionary();
         m_dictBossStateFrameID[STATE_DEAD] = 16;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = 1;
         m_dictBossStateFrameID[STATE_ATTACK_STAR + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_ATTACK_STAR + "_" + 1] = 9;
         m_dictBossStateFrameID[STATE_ATTACK_DIAMONDS + "_" + 0] = 10;
         m_dictBossStateFrameID[STATE_ATTACK_DIAMONDS + "_" + 1] = 11;
         m_dictBossStateFrameID[STATE_ANGRY + "_" + 0] = 12;
         m_dictBossStateFrameID[STATE_ANGRY + "_" + 1] = 13;
         m_dictBossStateFrameID[STATE_ATTACK_BANDAGE + "_" + 0] = 14;
         m_dictBossStateFrameID[STATE_ATTACK_BANDAGE + "_" + 1] = 15;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 1] = 3;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 3;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0 + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0 + "_" + 1] = 4;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0 + "_" + 2] = 6;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1 + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1 + "_" + 1] = 5;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1 + "_" + 2] = 7;
      }
      
      override protected function getBossFrameStateKey() : String
      {
         var strKey:String = super.getBossFrameStateKey();
         if(STATE_MOVE == m_iBossState)
         {
            if(m_fMoveSpeedX > 0.1)
            {
               strKey += "_2";
            }
            else if(m_fMoveSpeedX < -0.1)
            {
               strKey += "_1";
            }
            else
            {
               strKey += "_0";
            }
         }
         return strKey;
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.CacheSkillStar);
         m_vSkillFunction.push(this.CacheSkillDiamonds);
         m_vSkillFunction.push(this.CacheSkillBangage);
      }
      
      override protected function IsSkillState() : Boolean
      {
         return m_iBossState == STATE_ATTACK_STAR || m_iBossState == STATE_ATTACK_DIAMONDS || m_iBossState == STATE_ATTACK_BANDAGE;
      }
      
      override protected function IsInBattle() : Boolean
      {
         var iXGridNo:int = getXGridNoByPosX();
         var iYGridNo:int = getYGridNoByPosY();
         return iXGridNo >= 0 && iXGridNo < BattleFieldView.a_1011 && iYGridNo >= 0 && iYGridNo <= BattleFieldView.a_1012;
      }
      
      override protected function CheckIsCanLaunchSkill(iCurrentTime:int) : Boolean
      {
         var stBaseShot:a_4348 = null;
         var fPosX:Number = NaN;
         var fPosY:Number = NaN;
         var stStartFieldGrid:a_3491 = null;
         var stBabyDiamondsMouseEarthHole:BabyDiamondsMouseEarthHole = null;
         var stFieldGrid:a_3491 = null;
         var stBandageStartFieldGrid:a_3491 = null;
         if(!IsCanLaunchShot(iCurrentTime))
         {
            return false;
         }
         switch(m_iBossState)
         {
            case STATE_ATTACK_STAR:
               stBaseShot = BabyStarShot.a_4344();
               if(!stBaseShot)
               {
                  return false;
               }
               stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 2,m_stCurrentFieldGrid.m_iYGridNo);
               fPosX = a_3491.a_1080 * stStartFieldGrid.m_iXGridNo - 30;
               fPosY = a_3491.a_1081 * (stStartFieldGrid.m_iYGridNo + 1) - stBaseShot.height - 24;
               stBaseShot.a_1797(a_4265(),0,10000,fPosX,fPosY,stStartFieldGrid.m_stCurrentBattbleFieldView,stStartFieldGrid);
               stStartFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stBaseShot,BattleLayerDefine.SHOT_TYPE);
               break;
            case STATE_ATTACK_DIAMONDS:
               stBabyDiamondsMouseEarthHole = BabyDiamondsMouseEarthHole.a_3926() as BabyDiamondsMouseEarthHole;
               if(!stBabyDiamondsMouseEarthHole)
               {
                  return false;
               }
               stFieldGrid = GetRandSingleGrid(1,5,1,BattleFieldView.a_1012 - 2);
               if(!stFieldGrid)
               {
                  return false;
               }
               if(stFieldGrid.m_stMouseEarthHole)
               {
                  stFieldGrid.m_stMouseEarthHole.a_3940();
                  stFieldGrid.m_stMouseEarthHole = null;
               }
               stFieldGrid.m_stMouseEarthHole = stBabyDiamondsMouseEarthHole;
               stBabyDiamondsMouseEarthHole.setGridNo(stFieldGrid);
               stBabyDiamondsMouseEarthHole.a_1797(a_1283);
               stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stBabyDiamondsMouseEarthHole,BattleLayerDefine.OBSTACL_TYPE,stFieldGrid);
               stBabyDiamondsMouseEarthHole.play();
               break;
            case STATE_ATTACK_BANDAGE:
               stBaseShot = BabyBandageShot.a_4344();
               if(!stBaseShot)
               {
                  return false;
               }
               stBandageStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 1,m_stCurrentFieldGrid.m_iYGridNo);
               fPosX = a_3491.a_1080 * stBandageStartFieldGrid.m_iXGridNo;
               fPosY = a_3491.a_1081 * (stBandageStartFieldGrid.m_iYGridNo + 1) - stBaseShot.height;
               stBaseShot.a_1797(a_4265(),0,100000,fPosX,fPosY,stBandageStartFieldGrid.m_stCurrentBattbleFieldView,stBandageStartFieldGrid);
               stBandageStartFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stBaseShot,BattleLayerDefine.SHOT_TYPE);
               break;
            default:
               trace(">>>>>>CheckIsLaunchSkill:: 不可能事件！！！ m_iBossState = " + m_iBossState);
               return false;
         }
         return true;
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
               SetIsCannotSee(false);
               setAppearToGrid(0xFF & iNextValue >> 8,0xFF & iNextValue);
               iNextValue = 7;
               break;
            case STATE_MOVE:
               fPosX = getPosXByXGridNo(0xFF & iNextValue >> 8);
               fPosY = getPosYByYGridNo(0xFF & iNextValue);
               iNextValue = setMoveToPosition(fPosX,fPosY);
               break;
            case STATE_ATTACK_STAR:
               m_iLaunchNum = 1;
               m_iLaunchDelayTick = 7;
               break;
            case STATE_ATTACK_DIAMONDS:
               m_iLaunchNum = LAUNCH_DIAMONDS_NUM;
               m_iLaunchDelayTick = 35;
               m_iLaunchIntervalTick = 4;
               break;
            case STATE_ATTACK_BANDAGE:
               m_iLaunchNum = 1;
               m_iLaunchDelayTick = 6;
         }
         m_vStateCache.shift();
         ChangeState(iNextState,iNextValue,iCurrentTime);
         if(STATE_MOVE == m_iBossState || STATE_HIDE == m_iBossState || STATE_ATTACK_BANDAGE == m_iBossState || STATE_APPEAR == m_iBossState)
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

