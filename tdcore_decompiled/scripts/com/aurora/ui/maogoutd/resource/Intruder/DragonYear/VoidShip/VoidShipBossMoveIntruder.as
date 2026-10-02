package com.aurora.ui.maogoutd.resource.Intruder.DragonYear.VoidShip
{
   import a_4754.a_2161;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Util.BattleRandomUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4255;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.effect.AddBloodEffect;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.utils.Dictionary;
   
   public class VoidShipBossMoveIntruder extends BaseBossMoveIntruder
   {
      
      private static const MOVE_SPEED:Number = 8.5;
      
      private static const STATE_BORN:uint = 6;
      
      private static const STATE_SKILL_APEAR_OUT:uint = 8;
      
      private static const STATE_SKILL_APEAR_IN:uint = 9;
      
      private static const STATE_SKILL_ONE_DO:uint = 10;
      
      private static const STATE_SKILL_TWO_OUT_BEGIN:uint = 11;
      
      private static const STATE_SKILL_TWO_OUT_LOOP:uint = 12;
      
      private static const STATE_SKILL_TWO_OUT_IDEL:uint = 13;
      
      private static const STATE_SKILL_TWO_IN_LOOP:uint = 14;
      
      private static const STATE_SKILL_TWO_IN_END:uint = 15;
      
      private static const STATE_SKILL_THREE_DO:uint = 16;
      
      private static const SKILL_ONE_REDUCE_LIFE:int = 30000;
      
      private static const SKILL_THREE_REDUCE_LIFE:int = 50000;
      
      private var m_bFirstThreeSkill:Boolean = false;
      
      private var m_iInSkillThreeWaiting:Boolean = false;
      
      private var m_lSkillOneApearPos:Array = new Array([4,1],[6,3],[4,5],[2,3]);
      
      private var m_lStoneDropPos:Array = new Array();
      
      private var m_iUseSkillIndex:int = 0;
      
      private var iSkillTwoIndex:int = 1;
      
      private var m_lSkillThreeApearPos:Array = new Array([0,4,2,2],[5,0,6,4]);
      
      private var m_lSkillHouseArray:Array = new Array([0,-2,null],[1,-1,null],[2,0,null],[1,1,null],[0,2,null],[-1,1,null],[-2,0,null],[-1,-1,null]);
      
      private var m_lSkillTwoMovePos:Array = new Array([2,1],[2,3],[2,5],[4,5],[6,5],[6,3],[6,1],[4,1]);
      
      private var m_iFlyIndex:int = 0;
      
      private var m_lFlyGranuleMouse:Array = new Array();
      
      private var m_isJumping:Boolean = false;
      
      private var m_numYSpeed:int = 0;
      
      private var a_1581:int = 0;
      
      private var m_numXSpeed:int = 0;
      
      private var m_arrTargetFieldGrid:Vector.<a_3491> = new Vector.<a_3491>();
      
      private var m_iCreateIndex:int = 0;
      
      public function VoidShipBossMoveIntruder()
      {
         super();
         IsNeedShadow = false;
         m_fOrginSpeed = MOVE_SPEED;
         a_1279 = -130;
         a_1467 = -50;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(VoidShipBossMoveIntruder) as VoidShipBossMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return VoidShipBossMoveIntruderMovie;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         for(var i:int = 0; i < this.m_lSkillHouseArray.length; i++)
         {
            if(this.m_lSkillHouseArray[i][2] != null)
            {
               this.m_lSkillHouseArray[i][2].ClearSelf();
               this.m_lSkillHouseArray[i][2] = null;
            }
         }
         return true;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         var b:Boolean = false;
         b = super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         m_bSkillIsOrder = true;
         a_1465 = 3;
         return b;
      }
      
      override protected function InitState() : void
      {
         setLifeValue();
         this.SetIsCannotSee(true);
         this.iSkillTwoIndex = 1;
         stop();
         m_vSkillID.length = 0;
         a_1465 = 3;
         m_iRestTick = 0;
         m_iBossState = STATE_NONE;
         this.SetRandomSeed();
         this.InitSkillCache();
         InitShadow();
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
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_SKILL_APEAR_OUT + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_SKILL_APEAR_IN + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_SKILL_ONE_DO + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_SKILL_TWO_OUT_BEGIN + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_SKILL_TWO_OUT_LOOP + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_SKILL_TWO_OUT_IDEL + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_SKILL_TWO_IN_LOOP + "_" + 0] = 10;
         m_dictBossStateFrameID[STATE_SKILL_TWO_IN_END + "_" + 0] = 11;
         m_dictBossStateFrameID[STATE_SKILL_THREE_DO + "_" + 0] = 12;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 24;
         m_dictBossStateFrameID[STATE_BORN + "_" + 1] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 13;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = 14;
         m_dictBossStateFrameID[STATE_SKILL_APEAR_OUT + "_" + 1] = 15;
         m_dictBossStateFrameID[STATE_SKILL_APEAR_IN + "_" + 1] = 16;
         m_dictBossStateFrameID[STATE_SKILL_ONE_DO + "_" + 1] = 17;
         m_dictBossStateFrameID[STATE_SKILL_TWO_OUT_BEGIN + "_" + 1] = 18;
         m_dictBossStateFrameID[STATE_SKILL_TWO_OUT_LOOP + "_" + 1] = 19;
         m_dictBossStateFrameID[STATE_SKILL_TWO_OUT_IDEL + "_" + 1] = 20;
         m_dictBossStateFrameID[STATE_SKILL_TWO_IN_LOOP + "_" + 1] = 21;
         m_dictBossStateFrameID[STATE_SKILL_TWO_IN_END + "_" + 1] = 22;
         m_dictBossStateFrameID[STATE_SKILL_THREE_DO + "_" + 1] = 23;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = 24;
      }
      
      override public function get IsInjured() : int
      {
         var iIsInjured:int = 0;
         if(a_1339 < SKILL_ONE_REDUCE_LIFE && a_1339 < m_iInjuredLife * numHardRate)
         {
            iIsInjured = 1;
         }
         return iIsInjured;
      }
      
      override protected function set a_1460(value:Boolean) : void
      {
         super.a_1460 = value;
      }
      
      override protected function SetRandomSeed() : void
      {
         var enterRoom:Object = a_2161.e.getEnterRoom();
         m_stRandomSeed.setSeed(enterRoom.m_RandomSeed,1000);
      }
      
      override protected function InitSkillCache() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_BORN,4,3,0]);
         m_vStateCache.push([STATE_WAITING,1 * 10]);
      }
      
      private function IsInvicible() : Boolean
      {
         return this.m_iInSkillThreeWaiting == false && iLifeValue > SKILL_ONE_REDUCE_LIFE;
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.SkillTwo);
         m_vSkillFunction.push(this.SkillOne);
         m_vSkillFunction.push(this.SkillThree);
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(!this.IsInvicible())
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      override public function a_4212() : Boolean
      {
         if(!this.IsInvicible())
         {
            super.a_4212();
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(!this.IsInvicible() || iRduceLifeValue < 0)
         {
            super.a_3969(iRduceLifeValue);
         }
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         if(!this.IsInvicible() || iRduceLifeValue < 0)
         {
            super.a_4209(iRduceLifeValue);
         }
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         if(!this.IsInvicible())
         {
            super.a_4210();
         }
         return true;
      }
      
      private function ReduceMyLife(hp:int) : void
      {
         super.a_3969(hp);
      }
      
      private function SkillOne() : void
      {
         var i:int = 0;
         this.m_iUseSkillIndex = 1;
         m_vStateCache.length = 0;
         this.m_lStoneDropPos.length = 0;
         m_vStateCache.push([STATE_SKILL_APEAR_OUT,6]);
         var iPosIndex:int = int(m_stRandomSeed.nextInt(this.m_lSkillOneApearPos.length));
         m_vStateCache.push([STATE_SKILL_APEAR_IN,6,this.m_lSkillOneApearPos[iPosIndex][0],this.m_lSkillOneApearPos[iPosIndex][1]]);
         var lRow:Array = BattleRandomUtil.ShuffleArray([m_stRandomSeed.nextInt(2),2 + m_stRandomSeed.nextInt(2),4 + m_stRandomSeed.nextInt(2),6,m_stRandomSeed.nextInt(7)],m_stRandomSeed);
         if(iLifeValue > SKILL_ONE_REDUCE_LIFE)
         {
            for(i = 1; i <= 8; i++)
            {
               this.m_lStoneDropPos.push([i,lRow[i - 1]]);
            }
            this.m_lStoneDropPos = BattleRandomUtil.ShuffleArray(this.m_lStoneDropPos,m_stRandomSeed);
            m_vStateCache.push([STATE_SKILL_ONE_DO,31,iPosIndex == 3 ? 1 : 0]);
         }
         m_vStateCache.push([STATE_WAITING,2 * 10,0]);
      }
      
      private function SkillTwo() : void
      {
         this.m_iUseSkillIndex = 2;
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_MOVE,4,3]);
         m_vStateCache.push([STATE_SKILL_TWO_OUT_BEGIN,13]);
         if(this.iSkillTwoIndex % 2 == 1)
         {
            this.m_iFlyIndex = 0;
            m_vStateCache.push([STATE_SKILL_TWO_OUT_LOOP,6]);
            m_vStateCache.push([STATE_SKILL_TWO_OUT_LOOP,6]);
            m_vStateCache.push([STATE_SKILL_TWO_OUT_LOOP,6]);
            m_vStateCache.push([STATE_SKILL_TWO_OUT_LOOP,6]);
            m_vStateCache.push([STATE_SKILL_TWO_OUT_LOOP,6]);
            m_vStateCache.push([STATE_SKILL_TWO_OUT_LOOP,6]);
            m_vStateCache.push([STATE_SKILL_TWO_OUT_LOOP,6]);
            m_vStateCache.push([STATE_SKILL_TWO_OUT_LOOP,6]);
         }
         else
         {
            m_vStateCache.push([STATE_SKILL_TWO_OUT_IDEL,99999]);
         }
         m_vStateCache.push([STATE_SKILL_TWO_IN_END,15]);
         ++this.iSkillTwoIndex;
         m_vStateCache.push([STATE_WAITING,1 * 10,0]);
         m_vStateCache.push([STATE_SKILL_APEAR_OUT,6]);
         m_vStateCache.push([STATE_NONE,3 * 10]);
      }
      
      private function SkillThree() : void
      {
         var iRealIdex:int = 0;
         this.m_iUseSkillIndex = 3;
         m_vStateCache.length = 0;
         var iYellowStartIdx:int = int(m_stRandomSeed.nextInt(2));
         for(var i:int = 0; i < 2; i++)
         {
            iRealIdex = (iYellowStartIdx + i) % 2;
            if(i == 1)
            {
               m_vStateCache.push([STATE_SKILL_APEAR_OUT,6]);
            }
            m_vStateCache.push([STATE_SKILL_APEAR_IN,6,this.m_lSkillThreeApearPos[iRealIdex][0] + m_stRandomSeed.nextInt(3),this.m_lSkillThreeApearPos[iRealIdex][1] + m_stRandomSeed.nextInt(3)]);
            m_vStateCache.push([STATE_WAITING,2 * 10,1]);
         }
         m_vStateCache.push([STATE_SKILL_APEAR_OUT,6]);
         var iResStartIdx:int = int(m_stRandomSeed.nextInt(2));
         m_vStateCache.push([STATE_SKILL_APEAR_IN,6,this.m_lSkillThreeApearPos[iResStartIdx][2],this.m_lSkillThreeApearPos[iResStartIdx][3]]);
         m_vStateCache.push([STATE_SKILL_THREE_DO,25]);
         m_vStateCache.push([STATE_WAITING,2 * 10,0]);
      }
      
      private function rebackFlyGranuleMouse() : void
      {
         for(var i:int = 0; i < this.m_lFlyGranuleMouse.length; i++)
         {
            this.m_lFlyGranuleMouse[i].CallBack();
         }
      }
      
      private function checkFlyGranuleMouse() : void
      {
         var stAddBloodEffect:AddBloodEffect = null;
         var iCount:int = 0;
         for(var i:int = 0; i < this.m_lFlyGranuleMouse.length; i++)
         {
            if(this.m_lFlyGranuleMouse[i].m_iCallBack >= 4)
            {
               iCount++;
            }
            if(this.m_lFlyGranuleMouse[i].m_iCallBack == 5)
            {
               this.m_lFlyGranuleMouse[i].m_iCallBack = 6;
               this.a_3969(-10000);
               stAddBloodEffect = AddBloodEffect.a_3926();
               stAddBloodEffect.a_1797(false);
               stAddBloodEffect.x = x;
               stAddBloodEffect.y = y - 10;
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stAddBloodEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,m_stCurrentFieldGrid);
            }
         }
         if(iCount == this.m_lFlyGranuleMouse.length && m_iRestTick > 500)
         {
            this.m_lFlyGranuleMouse.length = 0;
            m_iRestTick = 5;
         }
      }
      
      private function addFlyGranuleMouse() : Boolean
      {
         var stTargetFieldGrid:a_3491 = null;
         var stBaseMoveIntruder:a_4206 = null;
         stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(4,3);
         stBaseMoveIntruder = a_4255.getInstance().a_4256(8389008);
         if(stBaseMoveIntruder)
         {
            stBaseMoveIntruder.SpecialSkillCallBack(null,100000,a_3491.a_1080 / (2 * 20),this.m_lSkillTwoMovePos[this.m_iFlyIndex][1],this.m_lSkillTwoMovePos[this.m_iFlyIndex][0]);
            stBaseMoveIntruder.a_1797((1 << 16) + 3,-1);
            stBaseMoveIntruder.m_stMoveIntruderTypeID = 8389008;
            this.m_lFlyGranuleMouse.push(stBaseMoveIntruder);
            stTargetFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,m_stCurrentFieldGrid,true,BattleLayerDefine.INTRUDER_SKY_TYPE);
         }
         ++this.m_iFlyIndex;
         return true;
      }
      
      override protected function SwitchState(iCurrentTime:int) : Boolean
      {
         var i:int = 0;
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
               iNextValue = 50;
               this.setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2],m_vStateCache[0][3]);
               this.visible = true;
               break;
            case STATE_APPEAR:
               this.SetIsCannotSee(true);
               iNextValue = 0;
               this.setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2],m_vStateCache[0][3]);
               this.visible = true;
               break;
            case STATE_NONE:
               this.SetIsCannotSee(true);
               this.visible = false;
               break;
            case STATE_SKILL_APEAR_IN:
               a_1283 = false;
               this.SetIsCannotSee(true);
               this.setAppearToGrid(m_vStateCache[0][2],m_vStateCache[0][3],0);
               this.visible = true;
               break;
            case STATE_SKILL_APEAR_OUT:
               a_1283 = false;
               this.m_iInSkillThreeWaiting = false;
               break;
            case STATE_WAITING:
               this.SetIsCannotSee(false);
               this.visible = true;
               if(m_vStateCache[0][2] == 1)
               {
                  this.m_iInSkillThreeWaiting = true;
               }
               else
               {
                  this.m_iInSkillThreeWaiting = false;
               }
               break;
            case STATE_MOVE:
               this.SetIsCannotSee(false);
               this.visible = true;
               iNextValue = setMoveToPosition(getPosXByXGridNo(m_vStateCache[0][1]),getPosYByYGridNo(m_vStateCache[0][2]));
               break;
            case STATE_SKILL_ONE_DO:
               a_1283 = m_vStateCache[0][2] == 1;
               break;
            case STATE_SKILL_TWO_OUT_IDEL:
               this.rebackFlyGranuleMouse();
               break;
            case STATE_SKILL_TWO_OUT_LOOP:
               break;
            case STATE_SKILL_THREE_DO:
               for(i = 0; i < this.m_lSkillHouseArray.length; i++)
               {
                  if(this.m_lSkillHouseArray[i][2] != null)
                  {
                     this.m_lSkillHouseArray[i][2].ClearSelf();
                     this.m_lSkillHouseArray[i][2] = null;
                  }
               }
               if(iLifeValue < SKILL_THREE_REDUCE_LIFE)
               {
                  iNextValue = 0;
               }
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
         return STATE_BORN != m_iBossState && STATE_NONE != m_iBossState && a_1339 > 0;
      }
      
      private function UpdateSpeedByState(iNextState:int) : void
      {
         a_1350 = MOVE_SPEED;
      }
      
      override protected function CheckIsCanLaunchSkill(iCurrentTime:int) : Boolean
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stBaseMoveIntruder:a_4206 = null;
         var stStartFieldGrid:a_3491 = null;
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var i:int = 0;
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         switch(m_iBossState)
         {
            case STATE_BORN:
               if(a_1273 == 45)
               {
                  this.a_3502(m_stCurrentFieldGrid);
               }
               break;
            case STATE_SKILL_ONE_DO:
               if(a_1273 == 278 || a_1273 == 118)
               {
                  this.PlayStoneByIndex(0);
                  this.PlayStoneByIndex(1);
                  this.PlayStoneByIndex(2);
                  this.PlayStoneByIndex(3);
                  this.PlayStoneByIndex(4);
                  this.PlayStoneByIndex(5);
                  this.PlayStoneByIndex(6);
                  this.PlayStoneByIndex(7);
               }
               if(a_1273 == 282 || a_1273 == 122)
               {
                  this.ReduceMyLife(SKILL_ONE_REDUCE_LIFE);
               }
               break;
            case STATE_SKILL_TWO_OUT_LOOP:
               if(a_1273 == 146 || a_1273 == 307)
               {
                  this.addFlyGranuleMouse();
               }
               break;
            case STATE_SKILL_THREE_DO:
               if(a_1273 == 210 || a_1273 == 370)
               {
                  iXGridNo = getXGridNoByPosX();
                  iYGridNo = getYGridNoByPosY();
                  for(i = 0; i < this.m_lSkillHouseArray.length; i++)
                  {
                     this.m_lSkillHouseArray[i][2] = this.CreateHouse(iXGridNo + this.m_lSkillHouseArray[i][0],iYGridNo + this.m_lSkillHouseArray[i][1]);
                  }
                  this.ReduceMyLife(SKILL_THREE_REDUCE_LIFE);
               }
               break;
            case STATE_SKILL_TWO_OUT_IDEL:
               this.checkFlyGranuleMouse();
         }
         return true;
      }
      
      public function CreateHouse(iNoX:int, iNoY:int) : VoidShipPortalMouseMoveIntruder
      {
         var voidShipPortalMouseMoveIntruder:VoidShipPortalMouseMoveIntruder = VoidShipPortalMouseMoveIntruder.a_3926();
         var stNextFieldGrid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         voidShipPortalMouseMoveIntruder.a_1797(stNextFieldGrid);
         return voidShipPortalMouseMoveIntruder;
      }
      
      public function PlayStoneByIndex(index:int) : void
      {
         var voidShipStoneEffect:VoidShipStoneEffect = VoidShipStoneEffect.a_3926();
         var stNextFieldGrid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.m_lStoneDropPos[index][0],this.m_lStoneDropPos[index][1]);
         voidShipStoneEffect.a_1797(stNextFieldGrid);
      }
      
      override protected function IsSkillState() : Boolean
      {
         return Boolean(m_iBossState >= STATE_SKILL_APEAR_OUT && m_iBossState <= STATE_SKILL_THREE_DO);
      }
      
      override protected function IsMoving() : Boolean
      {
         return m_iBossState == STATE_MOVE;
      }
      
      override protected function LifeIsZeroHandle(iDeadState:int) : void
      {
         ClearState();
         var iIsNudity:int = this.IsInjured ? 1 : 0;
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
         ChangeToFieldGrid(stNextFieldGrid);
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

