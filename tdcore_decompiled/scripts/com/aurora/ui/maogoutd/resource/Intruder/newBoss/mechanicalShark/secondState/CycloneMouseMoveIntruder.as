package com.aurora.ui.maogoutd.resource.Intruder.newBoss.mechanicalShark.secondState
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.utils.Dictionary;
   
   public class CycloneMouseMoveIntruder extends BaseBossMoveIntruder
   {
      
      private static const MOVE_SPEED:Number = 25;
      
      private var m_szWayPoint:Array = new Array();
      
      public function CycloneMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(CycloneMouseMoveIntruder) as CycloneMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return CycloneMouseMoveIntruderMovie;
      }
      
      override public function get width() : Number
      {
         return 125;
      }
      
      override public function get height() : Number
      {
         return 135;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 10;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = 500;
         a_1279 = -this.width * 0.5;
         SetCannotSeeByFighter(true);
         a_1463 = true;
         a_1464 = true;
         m_bSkillIsOrder = true;
         return true;
      }
      
      public function SetWaypoint(szPos:Array) : void
      {
         this.m_szWayPoint = szPos;
      }
      
      private function GetOneWaypoint(bShift:Boolean = true) : Array
      {
         if(this.m_szWayPoint.length == 0)
         {
            return null;
         }
         if(bShift)
         {
            return this.m_szWayPoint.shift();
         }
         return this.m_szWayPoint[0];
      }
      
      override protected function InitBossStateFrameID() : void
      {
         m_dictBossStateFrameID = new Dictionary();
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = m_dictBossStateFrameID[STATE_WAITING + "_" + 0];
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = m_dictBossStateFrameID[STATE_APPEAR + "_" + 0];
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = m_dictBossStateFrameID[STATE_MOVE + "_" + 0];
         m_dictBossStateFrameID[STATE_HIDE + "_" + 1] = m_dictBossStateFrameID[STATE_HIDE + "_" + 0];
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = m_dictBossStateFrameID[STATE_DEAD + "_" + 0];
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         if(null == m_stCurrentFieldGrid)
         {
            return false;
         }
         if(!IsCalTick(iCurrentTime))
         {
            return false;
         }
         super.a_4216(iCurrentTime);
         if(m_stCurrentFieldGrid.a_3492())
         {
            this.a_3502(m_stCurrentFieldGrid);
         }
         return true;
      }
      
      override protected function InitSkillCache() : void
      {
         m_vStateCache.length = 0;
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.CacheSkillAppearStep);
         m_vSkillFunction.push(this.CacheSkillNormalStep);
         m_vSkillFunction.push(this.CacheSkillHideStep);
      }
      
      private function CacheSkillAppearStep() : void
      {
         var szPos:Array = this.GetOneWaypoint();
         m_vStateCache.push([STATE_APPEAR,6 - 1,szPos[0],szPos[1]]);
      }
      
      private function CacheSkillNormalStep() : void
      {
         var szPos:Array = this.GetOneWaypoint();
         m_vStateCache.push([STATE_MOVE,0,szPos[0],szPos[1]]);
      }
      
      private function CacheSkillHideStep() : void
      {
         m_vStateCache.push([STATE_HIDE,0]);
      }
      
      override protected function CacheNextSkill() : void
      {
         var iPos:int = 0;
         var iSkillNum:int = 0;
         var k:* = 0;
         var i:* = 0;
         iHorizontalDirect = 1;
         iVerticalDirect = 1;
         if(0 == m_vSkillID.length)
         {
            iSkillNum = m_iSkillNum.Value;
            k = int(this.m_szWayPoint.length - 1 - 1);
            for(i = 0; i < iSkillNum; i++)
            {
               m_vSkillID.push(i);
               if(i == 1 && k > 0)
               {
                  k--;
                  i--;
               }
            }
            if(m_vSkillFunction.length < iSkillNum)
            {
               trace("+++++++++++m_vSkillFunction not init!!!");
            }
         }
         if(m_bSkillIsOrder)
         {
            iPos = 0;
         }
         else
         {
            iPos = int(m_stRandomSeed.nextInt(m_vSkillID.length));
         }
         var iSkillID:int = m_vSkillID[iPos];
         m_vSkillID.splice(iPos,1);
         m_vSkillFunction[iSkillID]();
      }
      
      override protected function SwitchState(iCurrentTime:int) : Boolean
      {
         var fPosX:Number = NaN;
         var fPosY:Number = NaN;
         if(0 == m_vStateCache.length)
         {
            this.CacheNextSkill();
         }
         var iNextState:uint = uint(m_vStateCache[0][0]);
         var iNextValue:int = int(m_vStateCache[0][1]);
         this.UpdateSpeedByState(iNextState);
         switch(iNextState)
         {
            case STATE_APPEAR:
               setAppearToGrid(m_vStateCache[0][2],m_vStateCache[0][3]);
               break;
            case STATE_MOVE:
               fPosX = getPosXByXGridNo(m_vStateCache[0][2]);
               fPosY = getPosYByYGridNo(m_vStateCache[0][3]);
               iNextValue = setMoveToPosition(fPosX,fPosY);
               break;
            case STATE_HIDE:
               a_3969(a_1339);
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
         return false;
      }
      
      override protected function UpdateBossBloodProgress() : void
      {
      }
      
      override protected function IsSkillState() : Boolean
      {
         return false;
      }
      
      override protected function IsMoving() : Boolean
      {
         return true;
      }
      
      override protected function LifeIsZeroHandle(iDeadState:int) : void
      {
         ClearState();
         var iIsNudity:int = IsInjured ? 1 : 0;
         GotoAndStopFrame(m_dictBossStateFrameID[STATE_DEAD + "_" + iIsNudity] - 1);
         m_iBossState = iDeadState;
         play();
      }
      
      override public function a_4210() : Boolean
      {
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         return false;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         if(!(stBaseDefense is a_3924))
         {
            BattleFieldView.ms_kenShi29.play();
         }
         stBaseDefense.m_iDieType = 1;
         stBaseDefense.a_3969(a_1377);
         return true;
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption();
      }
   }
}

