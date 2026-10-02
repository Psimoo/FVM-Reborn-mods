package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.IsLand.OxHeadHorseface
{
   import a_4754.a_2161;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.Util.BattleEffectUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import flash.utils.Dictionary;
   
   public class HorsefaceBossMoveIntruder extends BaseBossMoveIntruder
   {
      
      private static const MOVE_SPEED:Number = 60 / (20 * 0.5);
      
      private static const STATE_BORN:uint = 6;
      
      private static const STATE_WAITING_BELL:uint = 7;
      
      private static const STATE_DIS_APPEAR:uint = 8;
      
      private static const STATE_SKILL_ONE_BEGIN:uint = 9;
      
      private static const STATE_SKILL_ONE_USE1:uint = 10;
      
      private static const STATE_SKILL_ONE_USE2:uint = 11;
      
      private static const STATE_SKILL_TWO_BEGIN:uint = 12;
      
      private static const STATE_SKILL_TWO_LOOP:uint = 13;
      
      private static const STATE_SKILL_TWO_END:uint = 14;
      
      private static const STATE_MOVE2:uint = 15;
      
      private static const STATE_WAITING2:uint = 16;
      
      private static const STATE_MOVE3:uint = 17;
      
      private static const STATE_MOVE_BELL:uint = 18;
      
      private static const STATE_APPEAR2:uint = 19;
      
      private static const STATE_SKILL_TWO_LOOP2:uint = 20;
      
      private var top_border:int = -3;
      
      private var bottom_border:int = 10;
      
      private var left_border:int = -7;
      
      private var right_border:int = 11;
      
      private var _bellPos:Array = [0,0,null];
      
      private var oxHeadBoss:OxHeadBossMoveIntruder;
      
      private var hasBorn:Boolean = false;
      
      private var m_numYSpeed:int = 0;
      
      private var a_1581:int = 0;
      
      private var m_numXSpeed:int = 0;
      
      public function HorsefaceBossMoveIntruder()
      {
         super();
         IsNeedShadow = false;
         m_fOrginSpeed = MOVE_SPEED;
         a_1279 = -90;
         a_1467 = -40;
      }
      
      public static function a_3926() : HorsefaceBossMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(HorsefaceBossMoveIntruder,HorsefaceBossMoveIntruderMovie) as HorsefaceBossMoveIntruder;
      }
      
      override public function get width() : Number
      {
         return 135;
      }
      
      override public function get height() : Number
      {
         return 135;
      }
      
      public function InitData(oxHead:OxHeadBossMoveIntruder) : void
      {
         this.oxHeadBoss = oxHead;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         this.oxHeadBoss.ReduceLife2(iRduceLifeValue,[50004]);
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         this.RealeaseBell();
         return super.a_3940();
      }
      
      private function RealeaseBell() : void
      {
         var effect:BellEffect = this._bellPos[2];
         if(effect != null)
         {
            effect.SetDead();
            this._bellPos[2] = null;
         }
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         this.oxHeadBoss.ReduceLifeIgnoreArmor2(iRduceLifeValue,[50004]);
         return true;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         var b:Boolean = false;
         b = super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         m_bSkillIsOrder = true;
         tagCom.AddTag(40012);
         a_1463 = true;
         return b;
      }
      
      override protected function InitBossStateFrameID() : void
      {
         m_dictBossStateFrameID = new Dictionary();
         m_dictBossStateFrameID[STATE_BORN + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_WAITING_BELL + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_DIS_APPEAR + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_SKILL_ONE_BEGIN + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_SKILL_ONE_USE1 + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_SKILL_ONE_USE2 + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_SKILL_TWO_BEGIN + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_SKILL_TWO_LOOP + "_" + 0] = 10;
         m_dictBossStateFrameID[STATE_SKILL_TWO_LOOP2 + "_" + 0] = 10;
         m_dictBossStateFrameID[STATE_SKILL_TWO_END + "_" + 0] = 11;
         m_dictBossStateFrameID[STATE_BORN + "_" + 1] = 1;
         m_dictBossStateFrameID[STATE_WAITING_BELL + "_" + 1] = 2 + 10;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 3 + 10;
         m_dictBossStateFrameID[STATE_DIS_APPEAR + "_" + 1] = 4 + 10;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = 5 + 10;
         m_dictBossStateFrameID[STATE_SKILL_ONE_BEGIN + "_" + 1] = 6 + 10;
         m_dictBossStateFrameID[STATE_SKILL_ONE_USE1 + "_" + 1] = 7 + 10;
         m_dictBossStateFrameID[STATE_SKILL_ONE_USE2 + "_" + 1] = 8 + 10;
         m_dictBossStateFrameID[STATE_SKILL_TWO_BEGIN + "_" + 1] = 9 + 10;
         m_dictBossStateFrameID[STATE_SKILL_TWO_LOOP + "_" + 1] = 10 + 10;
         m_dictBossStateFrameID[STATE_SKILL_TWO_LOOP2 + "_" + 1] = 10 + 10;
         m_dictBossStateFrameID[STATE_SKILL_TWO_END + "_" + 1] = 11 + 10;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 22;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = 22;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 1] = 3;
         m_dictBossStateFrameID[STATE_MOVE_BELL + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_MOVE_BELL + "_" + 1] = 12;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = 13;
         m_dictBossStateFrameID[STATE_MOVE2 + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_MOVE2 + "_" + 1] = 12;
         m_dictBossStateFrameID[STATE_WAITING2 + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_WAITING2 + "_" + 1] = 13;
         m_dictBossStateFrameID[STATE_MOVE3 + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_MOVE3 + "_" + 1] = 12;
         m_dictBossStateFrameID[STATE_APPEAR2 + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_APPEAR2 + "_" + 1] = 15;
      }
      
      override protected function SetRandomSeed() : void
      {
         var enterRoom:Object = a_2161.e.getEnterRoom();
         m_stRandomSeed.setSeed(enterRoom.m_RandomSeed,1000);
      }
      
      override protected function InitSkillCache() : void
      {
         this.hasBorn = false;
         a_1465 = 3;
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_BORN,43,5,3]);
         m_vStateCache.push([STATE_WAITING_BELL,10]);
         m_vStateCache.push([STATE_MOVE_BELL,5,this.top_border]);
         m_vStateCache.push([STATE_HIDE,9999]);
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.SkillOne);
         m_vSkillFunction.push(this.SkillTwo);
      }
      
      public function GetBellPosition() : Array
      {
         return this._bellPos;
      }
      
      public function SkillOne() : void
      {
         this.hasBorn = true;
         m_iRestTick = 0;
         m_vStateCache.length = 0;
         var iNoY:int = m_stRandomSeed.nextInt(2) == 0 ? 1 : 5;
         var idx2:int = int(m_stRandomSeed.nextInt(2));
         m_vStateCache.push([STATE_MOVE2,this.right_border,iNoY,7,iNoY]);
         m_vStateCache.push([STATE_SKILL_ONE_BEGIN,13]);
         if(idx2 == 0)
         {
            m_vStateCache.push([STATE_SKILL_ONE_USE1,12]);
            this._bellPos = [1,iNoY,null];
         }
         else
         {
            m_vStateCache.push([STATE_SKILL_ONE_USE2,13]);
            this._bellPos = [4,iNoY,null];
         }
         m_vStateCache.push([STATE_WAITING,20]);
         m_vStateCache.push([STATE_WAITING2,20]);
         m_vStateCache.push([STATE_DIS_APPEAR,7]);
         m_vStateCache.push([STATE_HIDE,9999]);
      }
      
      public function SkillTwo() : void
      {
         m_iRestTick = 0;
         m_vStateCache.length = 0;
         var iNoX:int = int(this._bellPos[0]);
         var iNoY:int = int(this._bellPos[1]);
         m_vStateCache.push([STATE_APPEAR2,6,iNoX + 1,iNoY - 1]);
         m_vStateCache.push([STATE_SKILL_TWO_BEGIN,12]);
         m_vStateCache.push([STATE_SKILL_TWO_LOOP,iNoX + 1,iNoY + 1,29,29,false]);
         m_vStateCache.push([STATE_SKILL_TWO_LOOP,iNoX - 1,iNoY + 1,-29,29,false]);
         m_vStateCache.push([STATE_SKILL_TWO_LOOP,iNoX - 1,iNoY - 1,-29,0,true]);
         m_vStateCache.push([STATE_SKILL_TWO_LOOP2,20]);
         m_vStateCache.push([STATE_SKILL_TWO_END,6]);
         if(iNoY == 1)
         {
            m_vStateCache.push([STATE_MOVE3,iNoX - 1,this.top_border,-29,0]);
         }
         else
         {
            m_vStateCache.push([STATE_MOVE3,iNoX - 1,this.bottom_border,-29,0]);
         }
         m_vStateCache.push([STATE_HIDE,10]);
         m_vStateCache.push([STATE_HIDE,9991]);
      }
      
      override protected function SwitchState(iCurrentTime:int) : Boolean
      {
         var iNextValue:int = 0;
         var fPosX:Number = NaN;
         var fPosY:Number = NaN;
         var effect:BellEffect = null;
         if(0 == m_vStateCache.length)
         {
            this.CacheNextSkill();
         }
         var iNextState:uint = uint(m_vStateCache[0][0]);
         iNextValue = int(m_vStateCache[0][1]);
         this.UpdateSpeedByState(iNextState);
         switch(iNextState)
         {
            case STATE_BORN:
               a_1283 = false;
               this.SetIsCannotSee(true);
               this.setAppearToGrid(m_vStateCache[0][2],m_vStateCache[0][3]);
               this.visible = true;
               break;
            case STATE_APPEAR:
               this.setAppearToGrid(m_vStateCache[0][2],m_vStateCache[0][3]);
               break;
            case STATE_HIDE:
               visible = false;
               a_1283 = false;
               this.SetIsCannotSee(true);
               if(iNextValue == 9991)
               {
                  this.oxHeadBoss.SkillThree();
               }
               break;
            case STATE_WAITING:
               this.SetIsCannotSee(false);
               this.visible = true;
               break;
            case STATE_WAITING2:
               this.SetIsCannotSee(false);
               this.visible = true;
               this.oxHeadBoss.SkillTwo();
               break;
            case STATE_MOVE2:
               this.setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2]);
               iNextValue = this.SetMoveToPosition2(m_vStateCache[0][3],m_vStateCache[0][4]);
               break;
            case STATE_MOVE:
            case STATE_MOVE_BELL:
               iNextValue = this.SetMoveToPosition2(m_vStateCache[0][1],m_vStateCache[0][2]);
               break;
            case STATE_APPEAR2:
               this.setAppearToGrid(m_vStateCache[0][2],m_vStateCache[0][3],29,0);
               break;
            case STATE_SKILL_TWO_LOOP:
               this.SetIsCannotSee(false);
               fPosX = getPosXByXGridNo(m_vStateCache[0][1]) + m_vStateCache[0][3];
               fPosY = getPosYByYGridNo(m_vStateCache[0][2]) + m_vStateCache[0][4];
               iNextValue = setMoveToPosition(fPosX,fPosY,60 / (20 * 0.3));
               a_1283 = m_vStateCache[0][5];
               break;
            case STATE_MOVE3:
               fPosX = getPosXByXGridNo(m_vStateCache[0][1]) + m_vStateCache[0][3];
               fPosY = getPosYByYGridNo(m_vStateCache[0][2]) + m_vStateCache[0][4];
               iNextValue = setMoveToPosition(fPosX,fPosY,60 / (20 * 0.3));
               break;
            case STATE_SKILL_TWO_BEGIN:
               effect = this._bellPos[2];
               effect.BeginCreateMouse();
         }
         m_vStateCache.shift();
         ChangeState(iNextState,iNextValue,iCurrentTime);
         return true;
      }
      
      private function SetMoveToPosition2(iNoX:int, iNoY:int, fMoveSpeed:Number = -0.1234) : int
      {
         var fPosX:Number = getPosXByXGridNo(iNoX);
         var fPosY:Number = getPosYByYGridNo(iNoY);
         return setMoveToPosition(fPosX,fPosY,fMoveSpeed);
      }
      
      override protected function setAppearToGrid(iXGridNo:int, iYGridNo:int, iXOffset:int = 0, iYOffset:int = 0) : void
      {
         var stNextFieldGrid:a_3491 = null;
         stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(Math.min(iXGridNo,8),iYGridNo);
         this.x = getPosXByXGridNo(iXGridNo) + iXOffset;
         this.y = getPosYByYGridNo(iYGridNo) + iYOffset;
         ChangeToFieldGrid(stNextFieldGrid);
         this.SetIsCannotSee(false);
         this.visible = true;
      }
      
      protected function a_4349(m_iXGridNo:int, m_iYGridNo:int) : Boolean
      {
         var numDistanceX:Number = Math.abs(getPosXByXGridNo(m_iXGridNo) - x);
         var numDistanceY:Number = Math.abs(getPosYByYGridNo(m_iYGridNo) - y);
         this.m_numXSpeed = (getPosXByXGridNo(m_iXGridNo) - x) / this.a_1581;
         this.m_numYSpeed = (getPosYByYGridNo(m_iYGridNo) - y) / this.a_1581;
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var stNextFieldGrid:a_3491 = null;
         var bIsCanChangeToFieldGrid:Boolean = false;
         if(this.a_1581 > 0)
         {
            --this.a_1581;
            x += this.m_numXSpeed;
            y += this.m_numYSpeed;
            iXGridNo = getXGridNoByPosX();
            iYGridNo = getYGridNoByPosY();
            stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
            bIsCanChangeToFieldGrid = ChangeToFieldGrid(stNextFieldGrid);
         }
         super.a_4216(iCurrentTime);
         return true;
      }
      
      override protected function IsCanReduceLife() : Boolean
      {
         if(this.hasBorn == false)
         {
            return false;
         }
         if(m_iBossState == STATE_BORN || m_iBossState == STATE_HIDE)
         {
            return false;
         }
         return a_1339 > 0;
      }
      
      private function UpdateSpeedByState(iNextState:int) : void
      {
         a_1350 = MOVE_SPEED;
      }
      
      override protected function CheckIsCanLaunchSkill(iCurrentTime:int) : Boolean
      {
         var stTargetFieldGrid:a_3491 = null;
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stBaseMoveIntruder:a_4206 = null;
         var stStartFieldGrid:a_3491 = null;
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         switch(m_iBossState)
         {
            case STATE_BORN:
               if(a_1273 == 21)
               {
               }
               break;
            case STATE_SKILL_ONE_USE1:
               if(a_1273 == 106 || a_1273 == 215)
               {
                  this.CreateBell(-120,-70);
               }
               break;
            case STATE_SKILL_ONE_USE2:
               if(a_1273 == 119 || a_1273 == 228)
               {
                  this.CreateBell(-120,-70);
               }
               break;
            case STATE_SKILL_TWO_LOOP2:
               if(m_iRestTick == 10)
               {
                  this.RealeaseBell();
               }
         }
         return true;
      }
      
      private function CreateBell(offsetX:int, offsetY:int) : void
      {
         var effect:BellEffect = null;
         effect = BattleEffectUtil.CreateGameEffect(BellEffect,BellEffectMovie,m_stCurrentFieldGrid) as BellEffect;
         effect.x = x + offsetX;
         effect.y = y + offsetY;
         effect.InitData(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(this._bellPos[0],this._bellPos[1]));
         this._bellPos[2] = effect;
      }
      
      override protected function IsSkillState() : Boolean
      {
         return Boolean(m_iBossState >= STATE_SKILL_ONE_BEGIN && m_iBossState >= STATE_SKILL_TWO_END);
      }
      
      override protected function IsMoving() : Boolean
      {
         return m_iBossState == STATE_MOVE || m_iBossState == STATE_MOVE2 || m_iBossState == STATE_MOVE3 || m_iBossState == STATE_SKILL_TWO_LOOP || m_iBossState == STATE_MOVE_BELL;
      }
      
      override protected function LifeIsZeroHandle(iDeadState:int) : void
      {
         ClearState();
         var iIsNudity:int = IsInjured ? 1 : 0;
         GotoAndStopFrame(m_dictBossStateFrameID[STATE_DEAD + "_" + iIsNudity] - 1);
         m_iBossState = iDeadState;
         play();
      }
      
      override protected function CacheNextSkill() : void
      {
         var iPos:int = 0;
         var iSkillNum:int = 0;
         var i:int = 0;
         if(0 == m_vSkillID.length)
         {
            iSkillNum = m_iSkillNum.Value;
            for(i = 0; i < iSkillNum; i++)
            {
               m_vSkillID.push(i);
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
      
      override protected function MoveMySelf() : void
      {
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
         var bIsCanChangeToFieldGrid:Boolean = ChangeToFieldGrid(stNextFieldGrid);
      }
      
      override protected function SetIsCannotSee(bIsCannotSee:Boolean, bIsSetVisible:Boolean = true) : void
      {
         if(m_bIsNoChangeCannotSee)
         {
            return;
         }
         SetCannotSeeByFighter(bIsCannotSee);
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

