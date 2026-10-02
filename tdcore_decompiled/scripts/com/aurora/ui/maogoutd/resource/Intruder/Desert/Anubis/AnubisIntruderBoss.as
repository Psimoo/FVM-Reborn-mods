package com.aurora.ui.maogoutd.resource.Intruder.Desert.Anubis
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.utils.Dictionary;
   
   public class AnubisIntruderBoss extends BaseBossMoveIntruder
   {
      
      private static const MOVE_SPEED:Number = 15;
      
      private static const STATE_SKILL_One:uint = 6;
      
      private static const STATE_SKILL_Two:uint = 7;
      
      private static const STATE_SKILL_Three:uint = 8;
      
      private static const STATE_CHG_CAN_BE_ATTACK:uint = 9;
      
      private static const STATE_CHG_TOWARD:uint = 10;
      
      private var m_bCanBeAttack:Boolean;
      
      private var m_SkillOneArray:Array = new Array([9,3],[6,3],[3,3]);
      
      private var FirstIndex:int = 0;
      
      private var m_SkillTwoArray:Array = new Array(0,1,2,4,5,6);
      
      private var m_SkillThreeArray:Array = new Array(0,1,2,4,5,6);
      
      private var m_numYSpeed:int = 0;
      
      private var a_1581:int = 0;
      
      private var m_numXSpeed:int = 0;
      
      private var m_ActionOneArray:Array = new Array([0,0],[1,0],[2,0],[6,0],[7,0],[8,0],[3,2],[5,2],[4,3],[3,4],[5,4],[0,6],[1,6],[2,6],[6,6],[7,6],[8,6]);
      
      private var m_ActionTwoArray:Array = new Array([3,0],[4,0],[5,0],[4,1],[7,2],[8,2],[1,3],[2,3],[6,3],[7,3],[8,3],[7,4],[8,4],[4,5],[3,6],[4,6],[5,6]);
      
      private var m_ActionThreeArray:Array = new Array([0,0],[1,0],[7,0],[8,0],[7,1],[8,1],[4,2],[0,3],[3,3],[5,3],[4,4],[7,5],[8,5],[0,6],[1,6],[7,6],[7,6]);
      
      private var m_ActionThreeDemoArray:Array = new Array([4,3]);
      
      private var m_MoveMouse:Array = new Array(8388609,8388610,8388611,8388617,8388620,8388627,8388649,8388657,8388658,8388659,8388668,8388665,8388653,8388752,8388753,8388755,8389109,8389110,8389209,8389210,8389211,8389219,8389221);
      
      public function AnubisIntruderBoss()
      {
         super();
         IsNeedShadow = false;
         m_fOrginSpeed = MOVE_SPEED;
         a_1279 = -0.5 * this.width - 52;
         a_1467 = -45;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(AnubisIntruderBoss) as AnubisIntruderBoss;
      }
      
      override protected function getBindMovie() : Class
      {
         return AnubisIntruderBossMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         var b:Boolean = false;
         b = super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         m_bSkillIsOrder = true;
         this.m_bCanBeAttack = true;
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
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_SKILL_One + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_SKILL_Two + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_SKILL_Three + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 11;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = 5 + 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 5 + 1;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = 5 + 2;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 1] = 5 + 1;
         m_dictBossStateFrameID[STATE_SKILL_One + "_" + 1] = 5 + 3;
         m_dictBossStateFrameID[STATE_SKILL_Two + "_" + 1] = 5 + 4;
         m_dictBossStateFrameID[STATE_SKILL_Three + "_" + 1] = 5 + 5;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = 11;
      }
      
      override protected function InitSkillCache() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_APPEAR,8,this.m_SkillTwoArray[m_stRandomSeed.nextInt(this.m_SkillTwoArray.length + 1)],60]);
         m_vStateCache.push([STATE_WAITING,1 * 20]);
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.SkillTwo);
         m_vSkillFunction.push(this.SkillOne);
         m_vSkillFunction.push(this.SkillThree);
      }
      
      private function SkillTwo() : void
      {
         var m_iYGridNo:int = 0;
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SKILL_Two,33]);
         m_vStateCache.push([STATE_WAITING,1 * 20]);
         this.FirstIndex = m_stRandomSeed.nextInt(this.m_SkillOneArray.length);
         m_vStateCache.push([STATE_MOVE,this.m_SkillOneArray[this.FirstIndex][0],this.m_SkillOneArray[this.FirstIndex][1],0]);
      }
      
      private function SkillOne() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SKILL_One,14]);
         m_vStateCache.push([STATE_WAITING,1 * 20]);
         m_vStateCache.push([STATE_MOVE,-1,this.m_SkillThreeArray[m_stRandomSeed.nextInt(this.m_SkillThreeArray.length)],0]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
      }
      
      private function SkillThree() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SKILL_Three,24]);
         m_vStateCache.push([STATE_WAITING,1 * 20]);
         m_vStateCache.push([STATE_MOVE,8,this.m_SkillTwoArray[m_stRandomSeed.nextInt(this.m_SkillTwoArray.length)],60]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
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
               this.SetIsCannotSee(true);
               iNextValue = 0;
               this.setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2],m_vStateCache[0][3]);
               break;
            case STATE_MOVE:
               this.SetIsCannotSee(false);
               fPosX = getPosXByXGridNo(m_vStateCache[0][1]) + m_vStateCache[0][3];
               fPosY = getPosYByYGridNo(m_vStateCache[0][2]);
               iNextValue = setMoveToPosition(fPosX,fPosY);
               break;
            case STATE_CHG_TOWARD:
               this.SetIsCannotSee(false);
               a_1283 = !a_1283;
               break;
            default:
               this.SetIsCannotSee(false);
         }
         m_vStateCache.shift();
         ChangeState(iNextState,iNextValue,iCurrentTime);
         return true;
      }
      
      override protected function setAppearToGrid(iXGridNo:int, iYGridNo:int, iXOffset:int = 0, iYOffset:int = 0) : void
      {
         var stNextFieldGrid:a_3491 = null;
         stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
         this.x = getPosXByXGridNo(iXGridNo) + iXOffset;
         this.y = getPosYByYGridNo(iYGridNo) + iYOffset;
         ChangeToFieldGrid(stNextFieldGrid);
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
         var xStart:int = 0;
         var xEnd:int = 0;
         var yStart:int = 0;
         var yEnd:int = 0;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         if(m_iBossState != STATE_WAITING)
         {
            trace("m_iCurrentFrame::" + a_1273);
         }
         switch(m_iBossState)
         {
            case STATE_SKILL_One:
               if(a_1273 == 27 || a_1273 == 117)
               {
                  this.ActionSkillOne();
               }
               break;
            case STATE_SKILL_Two:
               if(a_1273 == 59 || a_1273 == 149)
               {
                  this.ActionSkillTwo();
               }
               break;
            case STATE_SKILL_Three:
               if(a_1273 == 87 || a_1273 == 177)
               {
                  xStart = 6;
                  xEnd = 8;
                  yStart = 0;
                  yEnd = 6;
                  for(yIndex = yStart; yIndex <= yEnd; yIndex++)
                  {
                     for(xIndex = xStart; xIndex <= xEnd; xIndex++)
                     {
                        stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
                        this.ActionSkillThree(stTargetFieldGrid);
                     }
                  }
               }
         }
         return true;
      }
      
      override protected function IsSkillState() : Boolean
      {
         return Boolean(m_iBossState == STATE_SKILL_One || m_iBossState == STATE_SKILL_Two || m_iBossState == STATE_SKILL_Three);
      }
      
      override protected function IsMoving() : Boolean
      {
         return m_iBossState == STATE_MOVE;
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
      
      override protected function SetIsCannotSee(bIsCannotSee:Boolean, bIsSetVisible:Boolean = true) : void
      {
         if(m_bIsNoChangeCannotSee)
         {
            return;
         }
         SetCannotSeeByFighter(bIsCannotSee);
      }
      
      private function ActionSkillOne() : void
      {
         var tagetArray:Array = null;
         var stTargetFieldGrid:a_3491 = null;
         switch(this.FirstIndex)
         {
            case 0:
               tagetArray = this.m_ActionOneArray;
               break;
            case 1:
               tagetArray = this.m_ActionTwoArray;
               break;
            case 2:
               tagetArray = this.m_ActionThreeArray;
         }
         for(var i:int = 0; i < tagetArray.length; i++)
         {
            stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(tagetArray[i][0],tagetArray[i][1]);
            this.AddSkillOneShot(stTargetFieldGrid);
         }
      }
      
      private function AddSkillOneShot(stStartField:a_3491) : void
      {
         if(stStartField == null)
         {
            return;
         }
         var stLastWaitShot:a_4348 = AnubisFirstShot.a_4344();
         var iPosX:int = stStartField.m_iXGridNo * a_3491.a_1080 - 17;
         var iPosY:int = stStartField.m_iYGridNo * a_3491.a_1081 - 20;
         stLastWaitShot.a_1797(0,0,50,iPosX,iPosY,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,stStartField,false,1,0);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.EFFECTS_BASE_TYPE,stStartField);
      }
      
      private function ActionSkillTwo() : void
      {
         var stTargetFieldGrid:a_3491 = null;
         stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(3,3);
         this.AddSkillTwoShot(stTargetFieldGrid);
         stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(7,1);
         this.AddSkillTwoShot(stTargetFieldGrid);
         stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(7,5);
         this.AddSkillTwoShot(stTargetFieldGrid);
      }
      
      private function AddSkillTwoShot(stStartField:a_3491) : void
      {
         if(stStartField == null)
         {
            return;
         }
         var stLastWaitShot:a_4348 = AnubisSecondShot.a_4344();
         var iPosX:int = stStartField.m_iXGridNo * a_3491.a_1080 - 17;
         var iPosY:int = stStartField.m_iYGridNo * a_3491.a_1081 - 20;
         stLastWaitShot.a_1797(0,0,50,iPosX,iPosY,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,stStartField,false,1,0);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.EFFECTS_TOP_TYPE,stStartField);
      }
      
      private function ActionSkillThree(stTempFieldGrid:a_3491) : void
      {
         var arrMoveIntruder:Array = null;
         var arrBaseMoveIntruderVector:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(null != stTempFieldGrid)
         {
            arrMoveIntruder = stTempFieldGrid.a_1511.slice();
            arrBaseMoveIntruderVector = stTempFieldGrid.m_stCurrentBattbleFieldView.m_arrBaseMoveIntruderVector;
            for each(stMoveIntruder in arrMoveIntruder)
            {
               if(stMoveIntruder.iSpaceState == 0 && this.m_MoveMouse.indexOf(stMoveIntruder.m_stMoveIntruderTypeID) != -1)
               {
                  trace("stMoveIntruder.m_stMoveIntruderTypeID:" + stMoveIntruder.m_stMoveIntruderTypeID);
                  stTempFieldGrid.a_3457(stMoveIntruder);
                  stTempFieldGrid.m_stCurrentBattbleFieldView.a_3457(stMoveIntruder);
                  if(-1 != arrBaseMoveIntruderVector.indexOf(stMoveIntruder))
                  {
                     arrBaseMoveIntruderVector.splice(arrBaseMoveIntruderVector.indexOf(stMoveIntruder),1);
                  }
                  stTempFieldGrid.m_stCurrentBattbleFieldView.a_3459(stMoveIntruder,stTempFieldGrid.m_stCurrentBattbleFieldView.a_3438(stTempFieldGrid.m_iXGridNo - 3,stTempFieldGrid.m_iYGridNo),false);
                  stMoveIntruder.x = a_3491.a_1080 * (stTempFieldGrid.m_iXGridNo - 2.5);
               }
            }
         }
      }
   }
}

