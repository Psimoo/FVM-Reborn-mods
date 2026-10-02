package com.aurora.ui.maogoutd.resource.Intruder.newBoss.King
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4255;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.effect.AddBloodEffect;
   import flash.utils.Dictionary;
   
   public class KingIntruderBoss extends BaseBossMoveIntruder
   {
      
      private static const MOVE_SPEED:Number = 15;
      
      private static const STATE_SKILL_BORN:uint = 6;
      
      private static const STATE_FLASH_OUT:uint = 7;
      
      private static const STATE_FLASH_IN:uint = 8;
      
      private static const STATE_SKILL1:uint = 9;
      
      private static const STATE_SKILL2:uint = 10;
      
      private static const STATE_SKILL3:uint = 11;
      
      private static const STATE_CHG_TOWARD:uint = 12;
      
      private static const STATE_CHG_CAN_BE_ATTACK:uint = 13;
      
      private var RealeaseMouseType:int;
      
      private var m_numYSpeed:int = 0;
      
      private var a_1581:int = 0;
      
      private var m_numXSpeed:int = 0;
      
      private var m_arrTargetFieldGrid:Vector.<a_3491> = new Vector.<a_3491>();
      
      private var randomField:Array = new Array();
      
      public function KingIntruderBoss()
      {
         super();
         IsNeedShadow = false;
         m_fOrginSpeed = MOVE_SPEED;
         a_1279 = -0.5 * this.width - 95;
         a_1467 = -132;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(KingIntruderBoss,KingIntruderBossMovie) as KingIntruderBoss;
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
         m_dictBossStateFrameID[STATE_SKILL_BORN + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_FLASH_OUT + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_FLASH_IN + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_SKILL1 + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_SKILL2 + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_SKILL3 + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 14;
         m_dictBossStateFrameID[STATE_SKILL_BORN + "_" + 1] = 1;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = 8;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 1] = 2;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 8;
         m_dictBossStateFrameID[STATE_FLASH_OUT + "_" + 1] = 9;
         m_dictBossStateFrameID[STATE_FLASH_IN + "_" + 1] = 10;
         m_dictBossStateFrameID[STATE_SKILL1 + "_" + 1] = 11;
         m_dictBossStateFrameID[STATE_SKILL2 + "_" + 1] = 12;
         m_dictBossStateFrameID[STATE_SKILL3 + "_" + 1] = 13;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = 14;
      }
      
      override protected function InitSkillCache() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_APPEAR,7,m_stRandomSeed.nextInt(5) + 2]);
         m_vStateCache.push([STATE_SKILL_BORN,14]);
         m_vStateCache.push([STATE_WAITING,3 * 20]);
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.initSkillOnTwo);
         m_vSkillFunction.push(this.initSkillOne);
      }
      
      private function initSkillOne() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_APPEAR,4,3]);
         m_vStateCache.push([STATE_CHG_TOWARD]);
         m_vStateCache.push([STATE_FLASH_IN]);
         m_vStateCache.push([STATE_SKILL1,20]);
         m_vStateCache.push([STATE_WAITING,4 * 20]);
         m_vStateCache.push([STATE_FLASH_OUT]);
         m_vStateCache.push([STATE_CHG_TOWARD]);
      }
      
      private function initSkillOnTwo() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_APPEAR,0,m_stRandomSeed.nextInt(5) + 2]);
         m_vStateCache.push([STATE_CHG_TOWARD]);
         m_vStateCache.push([STATE_FLASH_IN,5]);
         m_vStateCache.push([STATE_SKILL2,18]);
         m_vStateCache.push([STATE_WAITING,4 * 20]);
         m_vStateCache.push([STATE_FLASH_OUT]);
         this.initSkillOnThree(1);
         m_vStateCache.push([STATE_APPEAR,0,m_stRandomSeed.nextInt(5) + 2]);
         m_vStateCache.push([STATE_CHG_TOWARD]);
         m_vStateCache.push([STATE_FLASH_IN,5]);
         m_vStateCache.push([STATE_SKILL2,18]);
         m_vStateCache.push([STATE_WAITING,4 * 20]);
         m_vStateCache.push([STATE_FLASH_OUT]);
         this.initSkillOnThree(2);
         this.initSkillOnThree(3);
      }
      
      private function initSkillOnThree(index:int) : void
      {
         m_vStateCache.push([STATE_APPEAR,8,m_stRandomSeed.nextInt(7)]);
         if(index != 3)
         {
            m_vStateCache.push([STATE_CHG_TOWARD]);
         }
         m_vStateCache.push([STATE_FLASH_IN]);
         m_vStateCache.push([STATE_SKILL3,28,index]);
         m_vStateCache.push([STATE_WAITING,4 * 20]);
         m_vStateCache.push([STATE_FLASH_OUT]);
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
      
      override protected function SwitchState(iCurrentTime:int) : Boolean
      {
         if(0 == m_vStateCache.length)
         {
            this.CacheNextSkill();
         }
         var iNextState:uint = uint(m_vStateCache[0][0]);
         var iNextValue:int = int(m_vStateCache[0][1]);
         this.UpdateSpeedByState(iNextState);
         switch(iNextState)
         {
            case STATE_FLASH_IN:
               iNextValue = 5;
               SetIsCannotSee(false);
               SetCannotSeeByFighter(true);
               break;
            case STATE_FLASH_OUT:
               iNextValue = 6;
               SetIsCannotSee(false);
               SetCannotSeeByFighter(true);
               break;
            case STATE_APPEAR:
               SetIsCannotSee(true);
               SetCannotSeeByFighter(true);
               iNextValue = 0;
               this.setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2],m_vStateCache[0][3]);
               break;
            case STATE_SKILL_BORN:
               SetIsCannotSee(false);
               SetCannotSeeByFighter(true);
               break;
            case STATE_SKILL3:
               this.RealeaseMouseType = m_vStateCache[0][2];
               SetCannotSeeByFighter(false);
               break;
            case STATE_SKILL1:
            case STATE_SKILL2:
               SetCannotSeeByFighter(false);
               break;
            case STATE_CHG_TOWARD:
               a_1283 = !a_1283;
               SetIsCannotSee(true);
               SetCannotSeeByFighter(true);
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
         var stMoveIntruder:a_4206 = null;
         var stAddBloodEffect:AddBloodEffect = null;
         var i:int = 0;
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         switch(m_iBossState)
         {
            case STATE_FLASH_IN:
            case STATE_SKILL_BORN:
               break;
            case STATE_SKILL1:
               if(a_1273 == 64 || a_1273 == 162)
               {
                  for each(stMoveIntruder in m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_arrBaseMoveIntruderVector)
                  {
                     if(Boolean(stMoveIntruder) && Boolean(stMoveIntruder.parent) && stMoveIntruder.iLifeValue > 0)
                     {
                        stMoveIntruder.a_3969(-2000);
                        stAddBloodEffect = AddBloodEffect.a_3926();
                        stAddBloodEffect.a_1797(false);
                        stAddBloodEffect.x = stMoveIntruder.x;
                        stAddBloodEffect.y = stMoveIntruder.y;
                        m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stAddBloodEffect,BattleLayerDefine.EFFECTS_TOP_TYPE);
                     }
                  }
               }
               break;
            case STATE_SKILL2:
               if(a_1273 == 81 || a_1273 == 178)
               {
                  while(this.randomField.length > 0)
                  {
                     this.randomField.pop();
                  }
                  for(i = 0; i < 5; i++)
                  {
                     do
                     {
                        m_iYGridNo = int(m_stRandomSeed.nextInt(7));
                        m_iXGridNo = int(m_stRandomSeed.nextInt(8));
                        stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
                     }
                     while(this.randomField.indexOf(m_iYGridNo) != -1 || stTargetFieldGrid.m_stAttackFighter is a_3924 || stTargetFieldGrid.m_iFieldGridType != 0);
                     this.randomField[i] = m_iYGridNo;
                     this.addEarthHole(stTargetFieldGrid);
                  }
               }
               break;
            case STATE_SKILL3:
               if(a_1273 == 112 || a_1273 == 208)
               {
                  this.DoskillThreeAction();
               }
         }
         return true;
      }
      
      override protected function IsSkillState() : Boolean
      {
         return Boolean(m_iBossState == STATE_SKILL1 || m_iBossState == STATE_SKILL2 || m_iBossState == STATE_SKILL3);
      }
      
      private function DoskillThreeAction() : void
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         var stStartFieldGrid:a_3491 = null;
         var stBaseMoveIntruder:a_4206 = null;
         var i:int = 0;
         var k:int = 0;
         var i2:int = 0;
         var i4:int = 0;
         if(this.RealeaseMouseType == 1)
         {
            while(this.randomField.length > 0)
            {
               this.randomField.pop();
            }
            for(i = 0; i < 5; i++)
            {
               do
               {
                  m_iXGridNo = int(m_stRandomSeed.nextInt(8));
                  m_iYGridNo = int(m_stRandomSeed.nextInt(6));
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
               }
               while(this.randomField.indexOf(stTargetFieldGrid) != -1);
               this.randomField[i] = stTargetFieldGrid;
               this.RealeaseMouse(stTargetFieldGrid,8388745);
            }
         }
         else if(this.RealeaseMouseType == 2)
         {
            for(k = 0; k < 7; k++)
            {
               m_iXGridNo = 8;
               m_iYGridNo = k;
               stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
               if(k % 2 == 0)
               {
                  this.RealeaseMouse(stTargetFieldGrid,8388759);
               }
               else
               {
                  this.RealeaseMouse(stTargetFieldGrid,8389111);
               }
            }
         }
         else if(this.RealeaseMouseType == 3)
         {
            while(this.randomField.length > 0)
            {
               this.randomField.pop();
            }
            for(i2 = 0; i2 < 3; i2++)
            {
               do
               {
                  m_iXGridNo = 8;
                  m_iYGridNo = int(m_stRandomSeed.nextInt(6));
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
               }
               while(this.randomField.indexOf(stTargetFieldGrid) != -1);
               this.randomField[i2] = stTargetFieldGrid;
               this.RealeaseMouse(stTargetFieldGrid,8389112);
            }
            for(i4 = 0; i4 < 7; i4++)
            {
               m_iXGridNo = 8;
               m_iYGridNo = i4;
               stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
               this.RealeaseMouse(stTargetFieldGrid,8389113);
            }
         }
      }
      
      private function RealeaseMouse(stStartFieldGrid:a_3491, mouseID:uint) : void
      {
         var stBaseMoveIntruder:a_4206 = null;
         var bmi:* = undefined;
         if(!stStartFieldGrid)
         {
            throw Error(toString() + "::RealeaseMouse->iXGridNo = " + stStartFieldGrid.m_iXGridNo + "  iYGridNo = " + stStartFieldGrid.m_iYGridNo);
         }
         stBaseMoveIntruder = a_4255.getInstance().a_4256(mouseID);
         if(null == stBaseMoveIntruder)
         {
            throw Error("前端map_mouse.xml配置 MouseID节点 缺少老鼠ID：" + mouseID.toString(16));
         }
         stBaseMoveIntruder.a_1797((globalMoveFighterID << 16) + stStartFieldGrid.m_iYGridNo,-1);
         stBaseMoveIntruder.m_stMoveIntruderTypeID = mouseID;
         if(mouseID == 8388745)
         {
            bmi = stBaseMoveIntruder;
            bmi.m_iRandomTarget = false;
            bmi.a_1544 = stStartFieldGrid.m_iXGridNo;
            bmi.a_1545 = stStartFieldGrid.m_iYGridNo;
         }
         stBaseMoveIntruder.x = stStartFieldGrid.m_iXGridNo * a_3491.a_1080;
         stBaseMoveIntruder.y = stStartFieldGrid.m_iYGridNo * a_3491.a_1081;
         stStartFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stStartFieldGrid,false);
      }
      
      private function addEarthHole(stFieldGrid:a_3491) : void
      {
         var stDiamondRainEarthHole:DiamondRainEarthHole = null;
         if(stFieldGrid.m_stMouseEarthHole)
         {
            stFieldGrid.m_stMouseEarthHole.a_3940();
            stFieldGrid.m_stMouseEarthHole = null;
         }
         var m_iOldFieldGridType:int = stFieldGrid.m_iFieldGridType;
         if(0 == stFieldGrid.m_iFieldGridType)
         {
            stFieldGrid.m_iFieldGridType = 1;
         }
         else
         {
            trace("地图格子已经有障碍");
         }
         this.a_3502(stFieldGrid);
         stDiamondRainEarthHole = DiamondRainEarthHole.a_3926();
         stDiamondRainEarthHole.m_stCurrentFieldGrid = stFieldGrid;
         stDiamondRainEarthHole.a_1797(false);
         stDiamondRainEarthHole.m_iOldFieldGridType = m_iOldFieldGridType;
         stDiamondRainEarthHole.x = a_3491.a_1080 * stFieldGrid.m_iXGridNo + 0.5 * (a_3491.a_1080 - stDiamondRainEarthHole.width) - 9;
         stDiamondRainEarthHole.y = a_3491.a_1081 * stFieldGrid.m_iYGridNo + (a_3491.a_1081 - stDiamondRainEarthHole.height) + 28;
         stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stDiamondRainEarthHole,BattleLayerDefine.OBSTACL_TYPE,stFieldGrid);
         if(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
         {
            stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(stDiamondRainEarthHole,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
         }
         stDiamondRainEarthHole.play();
         stFieldGrid.m_stMouseEarthHole = stDiamondRainEarthHole;
      }
      
      protected function ClearPigBarrierField(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid.m_stMouseEarthHole)
         {
            stFieldGrid.m_stMouseEarthHole.a_3940();
            stFieldGrid.m_stMouseEarthHole = null;
         }
         if(stFieldGrid.m_stBaseLander != null)
         {
            stFieldGrid.m_stBaseLander.a_3940();
            stFieldGrid.m_stBaseLander = null;
         }
         if(stFieldGrid.m_iFieldGridType == 1)
         {
            stFieldGrid.m_iFieldGridType = 0;
         }
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

