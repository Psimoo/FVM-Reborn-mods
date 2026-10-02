package com.aurora.ui.maogoutd.resource.Intruder.newBoss.spiderMan
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import com.aurora.ui.maogoutd.resource.shot.boss.spiderMan.SpiderManCobwebShot;
   import flash.display.Bitmap;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   
   public class SpiderManBossMoveIntruder extends BaseBossMoveIntruder
   {
      
      private static const STATE_SKILL_STOLEN_CARD:uint = 7;
      
      private static const STATE_STOLEN_CAR_MOVE:uint = 6;
      
      private static const STATE_PREPARE_INJECTION:uint = 8;
      
      private static const STATE_SKILL_INJECTION_COBWEB:uint = 9;
      
      private static const STATE_SPRAY_RECOVERY:uint = 10;
      
      private static const STATE_SKILL_SWING:uint = 11;
      
      private static const SKILL_STOLEN_CARD_NUM:uint = 3;
      
      private static const OUT_GRID_ID:int = 3;
      
      private var m_fStolenCardSpeed:Number = a_3491.a_1081 / 2;
      
      private var m_iCardBitmapContinueTick:int;
      
      private var m_stCardBitmap:Bitmap = new Bitmap();
      
      private var m_stSwingMoveIntruder:a_4206;
      
      public function SpiderManBossMoveIntruder()
      {
         super();
         IsNeedShadow = true;
         m_fOrginSpeed = a_3491.a_1081 / 3;
         a_1279 = -75;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(SpiderManBossMoveIntruder) as SpiderManBossMoveIntruder;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(null != this.m_stSwingMoveIntruder)
         {
            this.m_stSwingMoveIntruder.a_3432();
            this.m_stSwingMoveIntruder = null;
         }
         return true;
      }
      
      override protected function getBindMovie() : Class
      {
         return SpiderManBossMoveIntruderMovie;
      }
      
      override public function get height() : Number
      {
         return 645;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         this.InitCardBitmap();
         return super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
      }
      
      private function InitCardBitmap() : void
      {
         this.m_stCardBitmap.x = this.m_stCardBitmap.y = 0;
         this.m_stCardBitmap.bitmapData = null;
         if(null != this.m_stCardBitmap.parent)
         {
            this.m_stCardBitmap.parent.removeChild(this.m_stCardBitmap);
         }
      }
      
      override protected function InitSkillCache() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_HIDE,m_iStartShowGridNo,-OUT_GRID_ID]);
      }
      
      private function CacheSkillStolenCard() : void
      {
         var stFieldGrid:a_3491 = null;
         var iYGridNo:int = 0;
         var iPos:int = 0;
         var iXMoveGridNo:int = 0;
         var iYMoveGridNo:int = 0;
         var vShowGrid:Vector.<a_3491> = new Vector.<a_3491>();
         for(var iXGridNo:int = 3; iXGridNo <= 5; iXGridNo++)
         {
            for(iYGridNo = 2; iYGridNo <= 4; iYGridNo++)
            {
               stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
               if(stFieldGrid.a_3492())
               {
                  vShowGrid.push(stFieldGrid);
               }
            }
         }
         var iLen:int = int(vShowGrid.length);
         if(iLen > SKILL_STOLEN_CARD_NUM)
         {
            iLen = int(SKILL_STOLEN_CARD_NUM);
         }
         var iShowTick:int = 0;
         var fMoveSpeed:Number = Math.abs(a_1350);
         for(var i:int = 0; i < iLen; i++)
         {
            iPos = int(m_stRandomSeed.nextInt(vShowGrid.length));
            stFieldGrid = vShowGrid[iPos];
            iXMoveGridNo = stFieldGrid.m_iXGridNo + 1;
            iYMoveGridNo = stFieldGrid.m_iYGridNo - 1;
            m_vStateCache.push([STATE_APPEAR,iXMoveGridNo,-OUT_GRID_ID]);
            m_vStateCache.push([STATE_MOVE,iXMoveGridNo,iYMoveGridNo]);
            iShowTick += 1 + a_3491.a_1081 * (iYMoveGridNo + OUT_GRID_ID) / fMoveSpeed;
            AddWarningSignEffectToGrid(stFieldGrid,iShowTick);
            m_vStateCache.push([STATE_SKILL_STOLEN_CARD,8]);
            m_vStateCache.push([STATE_STOLEN_CAR_MOVE,iXMoveGridNo,-OUT_GRID_ID]);
            HavingRestForAwhile(10);
            iShowTick += 20 + a_3491.a_1081 * (iYMoveGridNo + OUT_GRID_ID) / this.m_fStolenCardSpeed;
            vShowGrid.splice(iPos,1);
         }
         m_vStateCache.push([STATE_HIDE]);
      }
      
      private function CacheSkillInjectionCobweb() : void
      {
         var iYGridNo:int = 0;
         var iMaxXGrid:int = BattleFieldView.a_1011 - 1;
         var iMaxYGrid:int = BattleFieldView.a_1012 - 1;
         m_vStateCache.push([STATE_APPEAR,iMaxXGrid,-OUT_GRID_ID]);
         var arrYGridNo:Array = [0,iMaxYGrid - 1];
         for(var i:int = 0; i < arrYGridNo.length; i++)
         {
            iYGridNo = int(arrYGridNo[i]);
            m_vStateCache.push([STATE_MOVE,iMaxXGrid,iYGridNo]);
            m_vStateCache.push([STATE_PREPARE_INJECTION,8]);
            m_vStateCache.push([STATE_SKILL_INJECTION_COBWEB,7]);
            m_vStateCache.push([STATE_SPRAY_RECOVERY,4]);
         }
         m_vStateCache.push([STATE_MOVE,iMaxXGrid,-OUT_GRID_ID]);
         m_vStateCache.push([STATE_HIDE]);
      }
      
      private function CacheSkillSwing() : void
      {
         m_vStateCache.push([STATE_APPEAR,m_iStartShowGridNo,-OUT_GRID_ID]);
         m_vStateCache.push([STATE_SKILL_SWING,168 + 10]);
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.CacheSkillStolenCard);
         m_vSkillFunction.push(this.CacheSkillInjectionCobweb);
         m_vSkillFunction.push(this.CacheSkillSwing);
      }
      
      override protected function InitBossStateFrameID() : void
      {
         m_dictBossStateFrameID = new Dictionary();
         m_dictBossStateFrameID[STATE_HIDE + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_SKILL_STOLEN_CARD + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_STOLEN_CAR_MOVE + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_PREPARE_INJECTION + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_SKILL_INJECTION_COBWEB + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_SPRAY_RECOVERY + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_SKILL_SWING + "_" + 0] = 7;
         var iAddFrameID:int = 7;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 1] = iAddFrameID + 7;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = iAddFrameID + 7;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = iAddFrameID + 1;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = iAddFrameID + 7;
         m_dictBossStateFrameID[STATE_SKILL_STOLEN_CARD + "_" + 1] = iAddFrameID + 2;
         m_dictBossStateFrameID[STATE_STOLEN_CAR_MOVE + "_" + 1] = iAddFrameID + 3;
         m_dictBossStateFrameID[STATE_PREPARE_INJECTION + "_" + 1] = iAddFrameID + 4;
         m_dictBossStateFrameID[STATE_SKILL_INJECTION_COBWEB + "_" + 1] = iAddFrameID + 5;
         m_dictBossStateFrameID[STATE_SPRAY_RECOVERY + "_" + 1] = iAddFrameID + 6;
         m_dictBossStateFrameID[STATE_SKILL_SWING + "_" + 1] = iAddFrameID + 7;
         m_dictBossStateFrameID[STATE_DEAD] = iAddFrameID * 2 + 1;
      }
      
      override protected function IsSkillState() : Boolean
      {
         return STATE_SKILL_INJECTION_COBWEB == m_iBossState || STATE_SKILL_STOLEN_CARD == m_iBossState || STATE_SKILL_SWING == m_iBossState;
      }
      
      override protected function IsMoving() : Boolean
      {
         return m_iBossState == STATE_MOVE || STATE_STOLEN_CAR_MOVE == m_iBossState;
      }
      
      override protected function IsInBattle() : Boolean
      {
         return true;
      }
      
      override protected function CheckIsCanLaunchSkill(iCurrentTime:int) : Boolean
      {
         var stBaseShot:a_4348 = null;
         var fPosX:Number = NaN;
         var fPosY:Number = NaN;
         if(!IsCanLaunchShot(iCurrentTime))
         {
            return false;
         }
         switch(m_iBossState)
         {
            case STATE_SKILL_STOLEN_CARD:
               this.StolenCard();
               break;
            case STATE_SKILL_INJECTION_COBWEB:
               this.RealeaseCobweb();
               break;
            case STATE_SKILL_SWING:
               this.RealeaseMouse();
               break;
            default:
               trace(">>>>>>" + this.toString() + "->CheckIsLaunchSkill:: 不可能事件！！！ m_iBossState = " + m_iBossState);
               return false;
         }
         return true;
      }
      
      private function StolenCard() : void
      {
         var stStolenCardFieldGrid:a_3491 = null;
         var stBaseDefense:a_3962 = null;
         stStolenCardFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 1,m_stCurrentFieldGrid.m_iYGridNo + 1);
         stBaseDefense = stStolenCardFieldGrid.a_3494();
         if(null == stBaseDefense)
         {
            return;
         }
         var stPoint:Point = globalToLocal(stBaseDefense.parent.localToGlobal(new Point(stBaseDefense.x,stBaseDefense.y)));
         this.m_stCardBitmap.x = stPoint.x;
         this.m_stCardBitmap.y = stPoint.y;
         this.m_stCardBitmap.bitmapData = stBaseDefense.stDisplayBitmap.bitmapData;
         this.m_iCardBitmapContinueTick = a_3491.a_1081 * (stStolenCardFieldGrid.m_iYGridNo + OUT_GRID_ID) / this.m_fStolenCardSpeed;
         addChild(this.m_stCardBitmap);
         stBaseDefense.m_iDieType = 1;
         stBaseDefense.a_3969(stBaseDefense.iLifeValue);
      }
      
      override protected function MoveMySelf() : void
      {
         super.MoveMySelf();
         if(this.m_iCardBitmapContinueTick > 0)
         {
            --this.m_iCardBitmapContinueTick;
            if(0 == this.m_iCardBitmapContinueTick)
            {
               this.InitCardBitmap();
            }
         }
      }
      
      private function RealeaseMouse() : Boolean
      {
         var stStartFieldGrid:a_3491 = m_stCurrentFieldGrid;
         var stBaseMoveIntruder:SpiderManSwingMoveIntruder = SpiderManSwingMoveIntruder.a_3926();
         stBaseMoveIntruder.Head = this;
         this.m_stSwingMoveIntruder = stBaseMoveIntruder;
         stBaseMoveIntruder.m_stMoveIntruderTypeID = 134217728;
         stBaseMoveIntruder.a_1797(a_4265(),a_1283 ? 1 : -1);
         return AddOutMoveIntruder(stBaseMoveIntruder,stStartFieldGrid,a_1283 ? 1 : -1);
      }
      
      private function RealeaseCobweb() : void
      {
         var stSpiderManCobwebShot:SpiderManCobwebShot = SpiderManCobwebShot.a_4344();
         var iXPos:Number = this.x - 100;
         var iYPos:Number = this.y + this.height - 25;
         stSpiderManCobwebShot.a_1797(a_4265(),a_1350,0,iXPos,iYPos,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,m_stCurrentFieldGrid);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stSpiderManCobwebShot,BattleLayerDefine.SHOT_TYPE);
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
               setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2]);
               iNextValue = 1;
               break;
            case STATE_MOVE:
            case STATE_STOLEN_CAR_MOVE:
               if(STATE_STOLEN_CAR_MOVE == iNextState)
               {
                  a_1350 = this.m_fStolenCardSpeed;
               }
               else
               {
                  a_1350 = a_3491.a_1081 / 3;
               }
               if(!a_1283)
               {
                  a_1350 *= -1;
               }
               fPosX = getPosXByXGridNo(m_vStateCache[0][1]);
               fPosY = getPosYByYGridNo(m_vStateCache[0][2]);
               iNextValue = setMoveToPosition(fPosX,fPosY);
               break;
            case STATE_SKILL_STOLEN_CARD:
               m_iLaunchNum = 1;
               m_iLaunchDelayTick = 7;
               m_iLaunchIntervalTick = 4;
               break;
            case STATE_SKILL_INJECTION_COBWEB:
               m_iLaunchNum = 1;
               m_iLaunchDelayTick = 2;
               m_iLaunchIntervalTick = 5;
               break;
            case STATE_SKILL_SWING:
               m_iLaunchNum = 1;
               m_iLaunchDelayTick = 1;
               m_iLaunchIntervalTick = 1;
               SetIsCannotSee(true);
         }
         m_vStateCache.shift();
         ChangeState(iNextState,iNextValue,iCurrentTime);
         a_1465 = this.IsFlyState() ? 3 : 0;
         return true;
      }
      
      private function IsFlyState() : Boolean
      {
         return true;
      }
   }
}

