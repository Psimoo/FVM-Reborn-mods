package com.aurora.ui.maogoutd.resource.Intruder.DragonYear.WaterLime
{
   import a_4754.a_2161;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.effect.AddBloodEffect;
   import flash.utils.Dictionary;
   
   public class WaterLimeIntruderBoss extends BaseBossMoveIntruder
   {
      
      private static const MOVE_SPEED:Number = 10;
      
      private static const STATE_BORN:uint = 6;
      
      private static const STATE_SPECIAL_WAITING:uint = 7;
      
      private static const STATE_JUMPREADY:uint = 8;
      
      private static const STATE_JUMPING:uint = 9;
      
      private static const STATE_JUMPEND:uint = 10;
      
      private static const STATE_SKILL_ONE:uint = 11;
      
      private static const STATE_SKILL_TWO:uint = 12;
      
      private static const STATE_SKILL_TWOLOOP:uint = 13;
      
      private static const STATE_SKILL_TWOEND:uint = 14;
      
      private static const STATE_SKILL_THREESTART:uint = 15;
      
      private static const STATE_SKILL_THREELOOP:uint = 16;
      
      private static const STATE_SKILL_THREEEND:uint = 17;
      
      private static const STATE_CHG_CAN_BE_ATTACK:uint = 18;
      
      private static const STATE_CHG_TOWARD:uint = 19;
      
      private var m_OutArray:Array = new Array([1,5],[2,5],[4,5],[5,5]);
      
      private var m_TotalLife:Number;
      
      private var m_isJumping:Boolean = false;
      
      private var m_numYSpeed:int = 0;
      
      private var a_1581:int = 0;
      
      private var m_numXSpeed:int = 0;
      
      public function WaterLimeIntruderBoss()
      {
         super();
         IsNeedShadow = false;
         m_fOrginSpeed = MOVE_SPEED;
         a_1279 = -105;
         m_iYDisplayCenterPos = -92;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(WaterLimeIntruderBoss) as WaterLimeIntruderBoss;
      }
      
      override protected function getBindMovie() : Class
      {
         return WaterLimeIntruderBossMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         var b:Boolean = false;
         b = super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         m_bSkillIsOrder = true;
         return b;
      }
      
      override public function get width() : Number
      {
         return 100;
      }
      
      override public function get height() : Number
      {
         return 165;
      }
      
      override protected function InitBossStateFrameID() : void
      {
         m_dictBossStateFrameID = new Dictionary();
         m_dictBossStateFrameID[STATE_BORN + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_SPECIAL_WAITING + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_JUMPREADY + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_JUMPING + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_JUMPEND + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_SKILL_ONE + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_SKILL_TWO + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_SKILL_TWOLOOP + "_" + 0] = 10;
         m_dictBossStateFrameID[STATE_SKILL_TWOEND + "_" + 0] = 11;
         m_dictBossStateFrameID[STATE_SKILL_THREESTART + "_" + 0] = 12;
         m_dictBossStateFrameID[STATE_SKILL_THREELOOP + "_" + 0] = 13;
         m_dictBossStateFrameID[STATE_SKILL_THREEEND + "_" + 0] = 14;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 28;
         m_dictBossStateFrameID[STATE_BORN + "_" + 1] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 13 + 2;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 1] = 13 + 2;
         m_dictBossStateFrameID[STATE_SPECIAL_WAITING + "_" + 1] = 13 + 3;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = 13 + 4;
         m_dictBossStateFrameID[STATE_JUMPREADY + "_" + 1] = 13 + 5;
         m_dictBossStateFrameID[STATE_JUMPING + "_" + 1] = 13 + 6;
         m_dictBossStateFrameID[STATE_JUMPEND + "_" + 1] = 13 + 7;
         m_dictBossStateFrameID[STATE_SKILL_ONE + "_" + 1] = 13 + 8;
         m_dictBossStateFrameID[STATE_SKILL_TWO + "_" + 1] = 13 + 9;
         m_dictBossStateFrameID[STATE_SKILL_TWOLOOP + "_" + 1] = 13 + 10;
         m_dictBossStateFrameID[STATE_SKILL_TWOEND + "_" + 1] = 13 + 11;
         m_dictBossStateFrameID[STATE_SKILL_THREESTART + "_" + 1] = 13 + 12;
         m_dictBossStateFrameID[STATE_SKILL_THREELOOP + "_" + 1] = 13 + 13;
         m_dictBossStateFrameID[STATE_SKILL_THREEEND + "_" + 1] = 13 + 14;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = 28;
      }
      
      override protected function set a_1339(value:int) : void
      {
         super.a_1339 = value;
      }
      
      override protected function set a_1460(value:Boolean) : void
      {
         super.a_1460 = value;
         if(value)
         {
            this.m_TotalLife = a_1339;
         }
      }
      
      override protected function SetRandomSeed() : void
      {
         var enterRoom:Object = a_2161.e.getEnterRoom();
         m_stRandomSeed.setSeed(enterRoom.m_RandomSeed,1000);
      }
      
      override protected function InitSkillCache() : void
      {
         m_vStateCache.length = 0;
         var m_iXGridNo:int = 7;
         var m_iYGridNo:int = m_stRandomSeed.nextInt(3) + 2;
         m_vStateCache.push([STATE_BORN,m_iXGridNo,m_iYGridNo,0]);
         m_vStateCache.push([STATE_WAITING,3 * 10]);
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.SkillOne);
         m_vSkillFunction.push(this.SkillTwo);
         m_vSkillFunction.push(this.SkillOne);
         m_vSkillFunction.push(this.SkillThree);
      }
      
      private function SkillOne() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SKILL_ONE,29]);
         m_vStateCache.push([STATE_WAITING,3 * 10]);
      }
      
      private function SkillTwo() : void
      {
         var m_iYGridNo:int = 0;
         m_vStateCache.length = 0;
         var m_iXGridNo:int = m_stCurrentFieldGrid.m_iXGridNo - 2;
         do
         {
            m_iYGridNo = int(this.m_OutArray[m_stRandomSeed.nextInt(this.m_OutArray.length)][0]);
         }
         while(Math.abs(m_stCurrentFieldGrid.m_iYGridNo - m_iYGridNo) > 1);
         m_vStateCache.push([STATE_JUMPREADY,3]);
         m_vStateCache.push([STATE_JUMPING,m_iXGridNo,m_iYGridNo,3]);
         m_vStateCache.push([STATE_JUMPEND,3]);
         m_vStateCache.push([STATE_SKILL_TWO,16]);
         m_vStateCache.push([STATE_SKILL_TWOLOOP,5 * 6]);
         m_vStateCache.push([STATE_SKILL_TWOEND,5]);
         m_vStateCache.push([STATE_WAITING,3 * 10]);
      }
      
      private function SkillThree() : void
      {
         var m_iYGridNo:int = 0;
         var m_CacheYGridNo:int = 0;
         var moveToward:int = 0;
         m_vStateCache.length = 0;
         var m_iXGridNo:int = m_stCurrentFieldGrid.m_iXGridNo - 3;
         do
         {
            m_iYGridNo = m_stRandomSeed.nextInt(5) + 1;
         }
         while(Math.abs(m_stCurrentFieldGrid.m_iYGridNo - m_iYGridNo) > 1);
         m_vStateCache.push([STATE_JUMPREADY,3]);
         m_vStateCache.push([STATE_JUMPING,m_iXGridNo,m_iYGridNo,3]);
         m_vStateCache.push([STATE_JUMPEND,3]);
         m_CacheYGridNo = m_iYGridNo;
         do
         {
            m_iYGridNo = int(m_stRandomSeed.nextInt(7));
         }
         while(Math.abs(m_CacheYGridNo - m_iYGridNo) > 1);
         m_vStateCache.push([STATE_JUMPREADY,3]);
         m_vStateCache.push([STATE_JUMPING,0,m_iYGridNo,3]);
         m_vStateCache.push([STATE_JUMPEND,3]);
         m_CacheYGridNo = m_iYGridNo;
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
         m_vStateCache.push([STATE_SKILL_THREESTART,16]);
         m_vStateCache.push([STATE_SKILL_THREELOOP,8,m_iYGridNo,0]);
         m_vStateCache.push([STATE_SKILL_THREEEND,16]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
         m_vStateCache.push([STATE_WAITING,3 * 10 - 21]);
         m_vStateCache.push([STATE_SPECIAL_WAITING,21]);
         do
         {
            moveToward = m_stRandomSeed.nextInt(2) == 1 ? -3 : 3;
            m_iYGridNo = m_CacheYGridNo + moveToward;
         }
         while(m_iYGridNo < 0 || m_iYGridNo > 6);
         m_vStateCache.push([STATE_MOVE,8,m_iYGridNo,0]);
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
            case STATE_BORN:
               this.SetIsCannotSee(true);
               iNextValue = 36;
               this.setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2],m_vStateCache[0][3]);
               this.visible = true;
               break;
            case STATE_JUMPING:
               fPosX = getPosXByXGridNo(m_vStateCache[0][1]);
               fPosY = getPosYByYGridNo(m_vStateCache[0][2]);
               iNextValue = this.setJumpToPosition(fPosX,fPosY,m_vStateCache[0][3]);
               break;
            case STATE_APPEAR:
               this.SetIsCannotSee(true);
               iNextValue = 0;
               this.setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2],m_vStateCache[0][3]);
               this.visible = false;
               break;
            case STATE_WAITING:
               this.SetIsCannotSee(false);
               this.visible = true;
               break;
            case STATE_CHG_CAN_BE_ATTACK:
               this.SetIsCannotSee(true);
               this.visible = false;
               break;
            case STATE_MOVE:
               fPosX = getPosXByXGridNo(m_vStateCache[0][1]);
               fPosY = getPosYByYGridNo(m_vStateCache[0][2]);
               iNextValue = setMoveToPosition(fPosX,fPosY,a_3491.a_1080 / 10);
               break;
            case STATE_SKILL_THREELOOP:
               fPosX = getPosXByXGridNo(m_vStateCache[0][1]);
               fPosY = getPosYByYGridNo(m_vStateCache[0][2]);
               iNextValue = setMoveToPosition(fPosX,fPosY);
               break;
            case STATE_CHG_TOWARD:
               a_1283 = !a_1283;
         }
         m_vStateCache.shift();
         ChangeState(iNextState,iNextValue,iCurrentTime);
         return true;
      }
      
      protected function setJumpToPosition(fPosX:Number, fPosY:Number, fMoveTick:Number = -0.1234) : int
      {
         var fDistanceX:Number = fPosX - this.x;
         var fDistanceY:Number = fPosY - this.y;
         var iMoveTick:int = fMoveTick;
         if(iMoveTick > 0)
         {
            m_fMoveSpeedY = fDistanceY / iMoveTick;
            m_fMoveSpeedX = fDistanceX / iMoveTick;
         }
         return iMoveTick;
      }
      
      override protected function setAppearToGrid(iXGridNo:int, iYGridNo:int, iXOffset:int = 0, iYOffset:int = 0) : void
      {
         var stNextFieldGrid:a_3491 = null;
         stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
         this.x = getPosXByXGridNo(iXGridNo) + iXOffset;
         this.y = getPosYByYGridNo(iYGridNo) + iYOffset;
         ChangeToFieldGrid(stNextFieldGrid);
         this.SetIsCannotSee(true);
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
         if(this.a_1581 > 0 && this.m_isJumping)
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
         return STATE_MOVE != m_iBossState && a_1339 > 0;
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
         var findCard:Boolean = false;
         var indexY:int = 0;
         var indexX:int = 0;
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         switch(m_iBossState)
         {
            case STATE_BORN:
               if(a_1273 == 5)
               {
                  this.a_3502(m_stCurrentFieldGrid);
               }
               break;
            case STATE_JUMPEND:
               if(a_1273 == 101 || a_1273 == 269)
               {
                  this.a_3502(m_stCurrentFieldGrid);
               }
               break;
            case STATE_SKILL_ONE:
               if(a_1273 == 124 || a_1273 == 292)
               {
                  this.ActionSkillOne(m_stCurrentFieldGrid);
               }
               break;
            case STATE_SKILL_TWOLOOP:
               if(a_1273 == 155 || a_1273 == 323)
               {
                  findCard = false;
                  for(indexY = 0; indexY < BattleFieldView.a_1012; indexY++)
                  {
                     if(findCard)
                     {
                        break;
                     }
                     for(indexX = 0; indexX < BattleFieldView.a_1011; indexX++)
                     {
                        stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(indexX,indexY);
                        if(stTargetFieldGrid != null && stTargetFieldGrid.a_3492() && stTargetFieldGrid.m_iSpecialType == 0)
                        {
                           findCard = true;
                           this.ActionSkillTwo(stTargetFieldGrid);
                           break;
                        }
                     }
                  }
                  if(!findCard)
                  {
                     do
                     {
                        m_iYGridNo = int(m_stRandomSeed.nextInt(7));
                        m_iXGridNo = int(m_stRandomSeed.nextInt(9));
                        stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
                     }
                     while(stTargetFieldGrid.m_iSpecialType == 1);
                     this.ActionSkillTwo(stTargetFieldGrid);
                  }
               }
               break;
            case STATE_SKILL_THREEEND:
               if(a_1273 == 187 || a_1273 == 355)
               {
                  this.ActionSkillThree();
               }
         }
         return true;
      }
      
      private function ActionSkillThree() : void
      {
         var stAddBloodEffect:AddBloodEffect = null;
         var addlife:int = this.m_TotalLife * 0.05;
         if(iLifeValue + addlife >= this.m_TotalLife)
         {
            this.a_3969(-(this.m_TotalLife - iLifeValue));
         }
         else
         {
            this.a_3969(-addlife);
         }
         stAddBloodEffect = AddBloodEffect.a_3926();
         stAddBloodEffect.a_1797(false);
         stAddBloodEffect.x = this.x;
         stAddBloodEffect.y = this.y;
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stAddBloodEffect,BattleLayerDefine.EFFECTS_TOP_TYPE);
      }
      
      private function ActionSkillTwo(stFieldGrid:a_3491) : void
      {
         var tempX2:int = 0;
         var tempY2:int = 0;
         var stLastWaitShot:SkillTwoShot = null;
         if(stFieldGrid)
         {
            stLastWaitShot = SkillTwoShot.a_4344() as SkillTwoShot;
            if(null == stLastWaitShot)
            {
               return;
            }
            tempX2 = (stFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
            tempY2 = (stFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081;
            stLastWaitShot.a_1797(0,10,50,tempX2,tempY2,stFieldGrid.m_stCurrentBattbleFieldView,stFieldGrid);
            stFieldGrid.m_iSpecialType = 1;
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE);
         }
      }
      
      private function ActionSkillOne(stFieldGrid:a_3491) : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var stBaseMoveIntruder:a_4206 = null;
         if(stFieldGrid)
         {
            stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(stFieldGrid.m_iXGridNo - 2,stFieldGrid.m_iYGridNo);
            stBaseMoveIntruder = SmallWaterLimeMouseMoveIntruder.a_3926();
            if(Boolean(stBaseMoveIntruder) && Boolean(stTargetFieldGrid))
            {
               (stBaseMoveIntruder as SmallWaterLimeMouseMoveIntruder).FULL_HP = a_1339 * 0.2;
               stBaseMoveIntruder.a_1797((1 << 16) + stTargetFieldGrid.m_iYGridNo,-1);
               stBaseMoveIntruder.m_stMoveIntruderTypeID = 134217728;
               stBaseMoveIntruder.x = (stTargetFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
               stBaseMoveIntruder.y = (stTargetFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081;
               stTargetFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stTargetFieldGrid,false,BattleLayerDefine.INTRUDER_LAND_TYPE);
            }
         }
      }
      
      override protected function IsSkillState() : Boolean
      {
         return Boolean(m_iBossState == STATE_SKILL_TWO);
      }
      
      override protected function IsMoving() : Boolean
      {
         return Boolean(m_iBossState == STATE_MOVE || Boolean(m_iBossState == STATE_JUMPING) || Boolean(m_iBossState == STATE_SKILL_THREELOOP));
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
      
      override public function a_4210() : Boolean
      {
         super.a_4210();
         return true;
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
         if(bIsCanChangeToFieldGrid && (m_iBossState == STATE_MOVE || m_iBossState == STATE_SKILL_THREELOOP))
         {
            this.a_3502(m_stCurrentFieldGrid);
         }
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

