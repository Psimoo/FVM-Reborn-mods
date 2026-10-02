package com.aurora.ui.maogoutd.resource.Intruder.DragonYear.GiantIron
{
   import a_4718.b_182;
   import a_4754.a_2161;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.utils.Dictionary;
   
   public class GiantIronBossMoveIntruder extends BaseBossMoveIntruder
   {
      
      private static const MOVE_SPEED:Number = 0.85;
      
      private static const STATE_PRE_BORN:uint = 17;
      
      private static const STATE_BORN:uint = 6;
      
      private static const STATE_SKILL_ONE_DO:uint = 8;
      
      private static const STATE_SKILL_TWO_DO:uint = 9;
      
      private static const STATE_SKILL_THREE_BEGIN:uint = 10;
      
      private static const STATE_SKILL_THREE_DO:uint = 11;
      
      private static const STATE_SKILL_THREE_END:uint = 12;
      
      private static const STATE_SKILL_THREE_YUN_BEGIN:uint = 13;
      
      private static const STATE_SKILL_THREE_YUN_DO:uint = 14;
      
      private static const STATE_SKILL_THREE_YUN_END:uint = 15;
      
      private static const STATE_SKILL_FOUR_DO:uint = 16;
      
      private var m_stArrADMouse:Array = new Array();
      
      private var m_bFirstThreeSkill:Boolean = false;
      
      private var m_lMoveGrid:Array = new Array([8,5],[7,5],[6,5],[6,4],[6,3],[6,2],[6,1],[5,1],[4,1],[4,2],[4,3],[4,4],[4,5],[3,5],[2,5],[2,4],[2,3],[2,2],[2,1],[1,1],[0,1]);
      
      private var m_lMoveEffect:Array = new Array();
      
      private var m_lDeleteGrid:Array = new Array([1,8,2],[2,7,2],[3,6,3],[4,5,3],[5,4,3],[6,4,4],[7,3,4],[8,4,5],[9,5,5],[10,6,5],[11,6,4],[12,7,4],[13,8,4]);
      
      private var m_lSollider:Array = new Array([8,1,null,-1],[8,2,null,-1],[8,4,null,-1],[8,5,null,-1],[0,0,null,1],[0,3,null,1],[0,6,null,1]);
      
      private var iDefenceCount:Number = 0;
      
      private var m_bFireCreateSolider:Boolean = false;
      
      private var lastSkillIndex:int = 0;
      
      private var moveTargetIndex:int = 2;
      
      private var m_isJumping:Boolean = false;
      
      private var m_iEnterTime:int = 0;
      
      private var m_numYSpeed:int = 0;
      
      private var a_1581:int = 0;
      
      private var m_numXSpeed:int = 0;
      
      private var m_arrTargetFieldGrid:Vector.<a_3491> = new Vector.<a_3491>();
      
      private var m_iCreateIndex:int = 0;
      
      public function GiantIronBossMoveIntruder()
      {
         super();
         IsNeedShadow = false;
         m_fOrginSpeed = MOVE_SPEED;
         a_1279 = -100;
         a_1467 = -5;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(GiantIronBossMoveIntruder) as GiantIronBossMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return GiantIronBossMoveIntruderMovie;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         for(var i:int = 0; i < this.m_lMoveEffect.length; i++)
         {
            this.m_lMoveEffect[i].a_3940();
         }
         this.m_lMoveEffect.length = 0;
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         var iHurtRate:Number = NaN;
         var i:int = 0;
         var rate:Number = NaN;
         if(m_iDieType == 0)
         {
            iHurtRate = this.iDefenceCount;
            for(i = 0; i < this.m_lSollider.length; i++)
            {
               if(this.m_lSollider[i][2] != null && this.m_lSollider[i][2].inPool == false)
               {
                  iHurtRate += 0.15;
               }
            }
            rate = Math.round((1 - Math.min(iHurtRate,0.9)) * 100) / 100;
            super.a_3969(iRduceLifeValue * rate);
         }
         else
         {
            super.a_3969(iRduceLifeValue);
         }
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         var iHurtRate:Number = NaN;
         var i:int = 0;
         if(m_iDieType == 0)
         {
            iHurtRate = this.iDefenceCount;
            for(i = 0; i < this.m_lSollider.length; i++)
            {
               if(this.m_lSollider[i][2] != null && this.m_lSollider[i][2].inPool == false)
               {
                  iHurtRate += 0.15;
               }
            }
            super.a_4209(iRduceLifeValue * (1 - Math.min(iHurtRate,0.9)));
         }
         else
         {
            super.a_4209(iRduceLifeValue);
         }
         return true;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         var b:Boolean = false;
         b = super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         m_bSkillIsOrder = true;
         a_1465 = 0;
         this.iDefenceCount = 0;
         this.m_bFireCreateSolider = false;
         a_1463 = false;
         return b;
      }
      
      override protected function InitState() : void
      {
         setLifeValue();
         this.SetIsCannotSee(true);
         stop();
         m_vSkillID.length = 0;
         a_1465 = 0;
         m_iRestTick = 0;
         m_iBossState = STATE_NONE;
         this.m_bFireCreateSolider = false;
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
         m_dictBossStateFrameID[STATE_PRE_BORN + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_SKILL_ONE_DO + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_SKILL_TWO_DO + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_SKILL_THREE_BEGIN + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_SKILL_THREE_DO + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_SKILL_THREE_END + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_SKILL_THREE_YUN_BEGIN + "_" + 0] = 10;
         m_dictBossStateFrameID[STATE_SKILL_THREE_YUN_DO + "_" + 0] = 11;
         m_dictBossStateFrameID[STATE_SKILL_THREE_YUN_END + "_" + 0] = 12;
         m_dictBossStateFrameID[STATE_SKILL_FOUR_DO + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 24;
         m_dictBossStateFrameID[STATE_BORN + "_" + 1] = 1;
         m_dictBossStateFrameID[STATE_PRE_BORN + "_" + 1] = 13;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 13;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = 15;
         m_dictBossStateFrameID[STATE_SKILL_ONE_DO + "_" + 1] = 16;
         m_dictBossStateFrameID[STATE_SKILL_TWO_DO + "_" + 1] = 17;
         m_dictBossStateFrameID[STATE_SKILL_THREE_BEGIN + "_" + 1] = 18;
         m_dictBossStateFrameID[STATE_SKILL_THREE_DO + "_" + 1] = 19;
         m_dictBossStateFrameID[STATE_SKILL_THREE_END + "_" + 1] = 20;
         m_dictBossStateFrameID[STATE_SKILL_THREE_YUN_BEGIN + "_" + 1] = 21;
         m_dictBossStateFrameID[STATE_SKILL_THREE_YUN_DO + "_" + 1] = 22;
         m_dictBossStateFrameID[STATE_SKILL_THREE_YUN_END + "_" + 1] = 23;
         m_dictBossStateFrameID[STATE_SKILL_FOUR_DO + "_" + 1] = 14;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = 24;
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
         m_vStateCache.push([STATE_PRE_BORN,44]);
         m_vStateCache.push([STATE_BORN,50,7,5]);
         m_vStateCache.push([STATE_WAITING,10]);
         m_vStateCache.push([STATE_SKILL_TWO_DO,39]);
         m_vStateCache.push([STATE_WAITING,20]);
         this.lastSkillIndex = 2;
         this.moveTargetIndex = 2;
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.SkillOne);
      }
      
      private function MoveToNext() : void
      {
         if(this.moveTargetIndex >= this.m_lMoveGrid.length)
         {
            m_vStateCache.push([STATE_MOVE,-1,1]);
            ++this.moveTargetIndex;
         }
         else
         {
            m_vStateCache.push([STATE_MOVE,this.m_lMoveGrid[this.moveTargetIndex][0],this.m_lMoveGrid[this.moveTargetIndex][1]]);
            ++this.moveTargetIndex;
         }
      }
      
      private function MoveOrAttack() : void
      {
         var iXGridNo1:int = getXGridNoByPosX();
         var iYGridNo1:int = getYGridNoByPosY();
         var iCount:int = 0;
         iCount += this.CheckFieldGridDefense(iXGridNo1 - 1,iYGridNo1);
         iCount += this.CheckFieldGridDefense(iXGridNo1 - 2,iYGridNo1);
         iCount += this.CheckFieldGridDefense(iXGridNo1 - 1,iYGridNo1 - 1);
         iCount += this.CheckFieldGridDefense(iXGridNo1 - 2,iYGridNo1 - 1);
         if(iCount >= 3)
         {
            m_vStateCache.push([STATE_SKILL_FOUR_DO,17]);
            m_vStateCache.push([STATE_WAITING,20]);
            this.MoveToNext();
         }
         else
         {
            this.MoveToNext();
         }
         this.lastSkillIndex = -1;
      }
      
      private function SkillOne() : void
      {
         m_vStateCache.length = 0;
         var lastMoveIndex:int = this.moveTargetIndex - 1;
         if(lastMoveIndex == this.m_lMoveGrid.length)
         {
            if(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.isOwnBattleField)
            {
               a_1088.a_2062(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.iTimeIntervalNum,m_stCurrentFieldGrid.m_iYGridNo);
            }
            m_vStateCache.push([STATE_WAITING,999]);
            return;
         }
         var stNextFieldGrid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.m_lMoveGrid[lastMoveIndex][0],this.m_lMoveGrid[lastMoveIndex][1]);
         if(stNextFieldGrid != null)
         {
            this.a_3502(stNextFieldGrid);
         }
         if(this.lastSkillIndex == 1 || this.lastSkillIndex == 2 || this.lastSkillIndex == 3)
         {
            this.MoveOrAttack();
         }
         else if(lastMoveIndex == 2 || lastMoveIndex == 8 || lastMoveIndex == 12 || lastMoveIndex == 18)
         {
            m_vStateCache.push([STATE_SKILL_THREE_BEGIN,14]);
            m_vStateCache.push([STATE_SKILL_THREE_DO,30]);
            m_vStateCache.push([STATE_SKILL_THREE_END,5]);
            m_vStateCache.push([STATE_WAITING,20]);
            this.lastSkillIndex = 3;
         }
         else if(lastMoveIndex == 4 || lastMoveIndex == 10 || lastMoveIndex == 16 || lastMoveIndex == 19)
         {
            m_vStateCache.push([STATE_SKILL_TWO_DO,39]);
            m_vStateCache.push([STATE_WAITING,20]);
            this.lastSkillIndex = 2;
         }
         else if(lastMoveIndex == 3 || lastMoveIndex == 9 || lastMoveIndex == 15)
         {
            m_vStateCache.push([STATE_SKILL_ONE_DO,35]);
            m_vStateCache.push([STATE_WAITING,2 * 10]);
            this.lastSkillIndex = 1;
         }
         else if(lastMoveIndex != -1)
         {
            this.MoveOrAttack();
         }
      }
      
      protected function CheckFieldGridDefense(iXGridNo:int, iYGridNo:int) : int
      {
         var stFieldGrid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
         if(stFieldGrid == null)
         {
            return 0;
         }
         if(null != stFieldGrid.m_stProtector)
         {
            return 1;
         }
         if(null != stFieldGrid.m_stAttackFighter)
         {
            return 1;
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
            return 1;
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            return 1;
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            return 1;
         }
         if(null != stFieldGrid.m_stHoneyTrapBaseDefense)
         {
            return 1;
         }
         if(null != stFieldGrid.m_stOceanGoddessToolDefense)
         {
            return 1;
         }
         if(null != stFieldGrid.m_stTrayDefense)
         {
            return 1;
         }
         return 0;
      }
      
      override protected function SwitchState(iCurrentTime:int) : Boolean
      {
         var m_iSceneCount:int = 0;
         var i:int = 0;
         if(0 == m_vStateCache.length)
         {
            this.CacheNextSkill();
         }
         var iNextState:uint = uint(m_vStateCache[0][0]);
         var iNextValue:int = int(m_vStateCache[0][1]);
         this.UpdateSpeedByState(iNextState);
         this.m_iEnterTime = iCurrentTime;
         switch(iNextState)
         {
            case STATE_PRE_BORN:
               this.SetIsCannotSee(true);
               this.visible = false;
               break;
            case STATE_BORN:
               this.SetIsCannotSee(true);
               this.setAppearToGrid(m_vStateCache[0][2],m_vStateCache[0][3],0);
               this.visible = true;
               break;
            case STATE_APPEAR:
               this.SetIsCannotSee(true);
               iNextValue = 0;
               this.setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2],m_vStateCache[0][3]);
               this.visible = true;
               break;
            case STATE_WAITING:
               this.SetIsCannotSee(false);
               this.visible = true;
               break;
            case STATE_MOVE:
               this.SetIsCannotSee(false);
               this.visible = true;
               iNextValue = setMoveToPosition(getPosXByXGridNo(m_vStateCache[0][1]),getPosYByYGridNo(m_vStateCache[0][2]));
               break;
            case STATE_SKILL_THREE_BEGIN:
               m_iSceneCount = int(m_vStateCache[0][2]);
               break;
            case STATE_SKILL_TWO_DO:
               this.m_iCreateIndex = m_vStateCache[0][2];
               break;
            case STATE_DEAD:
               for(i = 0; i < this.m_lMoveEffect.length; i++)
               {
                  this.m_lMoveEffect[i].a_3940();
               }
               this.m_lMoveEffect.length = 0;
         }
         m_vStateCache.shift();
         ChangeState(iNextState,iNextValue,iCurrentTime);
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         var moveIdx:int = 0;
         if(b_182.enm_shotEffectFreezeStop == iEffectType || b_182.a_434 == iEffectType)
         {
            if(m_iBossState == STATE_SKILL_THREE_DO || m_iBossState == STATE_SKILL_THREE_BEGIN)
            {
               m_iRestTick = 0;
               m_vStateCache.length = 0;
               m_vStateCache.push([STATE_SKILL_THREE_YUN_BEGIN,6]);
               m_vStateCache.push([STATE_SKILL_THREE_YUN_DO,40]);
               m_vStateCache.push([STATE_SKILL_THREE_YUN_END,10]);
               m_vStateCache.push([STATE_WAITING,20]);
               moveIdx = this.moveTargetIndex - 1;
               m_vStateCache.push([STATE_MOVE,this.m_lMoveGrid[moveIdx][0],this.m_lMoveGrid[moveIdx][1]]);
            }
         }
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
         return STATE_BORN != m_iBossState && STATE_PRE_BORN != m_iBossState && this.m_bFireCreateSolider != false && a_1339 > 0;
      }
      
      private function UpdateSpeedByState(iNextState:int) : void
      {
         a_1350 = MOVE_SPEED;
      }
      
      private function CreateFireGrid(x:int, y:int) : void
      {
         var giantIronSkillTwoEffect:GiantIronSkillTwoEffect = GiantIronSkillTwoEffect.a_3926();
         giantIronSkillTwoEffect.a_1797(false);
         giantIronSkillTwoEffect.x = x - 30;
         giantIronSkillTwoEffect.y = y + 95;
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(giantIronSkillTwoEffect,BattleLayerDefine.EFFECTS_BASE_TYPE);
      }
      
      override protected function CheckIsCanLaunchSkill(iCurrentTime:int) : Boolean
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stBaseMoveIntruder:a_4206 = null;
         var stStartFieldGrid:a_3491 = null;
         var i:int = 0;
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var elpsed:int = 0;
         var index:int = 0;
         var giantIronSkillFireEffect:GiantIronSkillFireEffect = null;
         var stNextFieldGrid:a_3491 = null;
         var giantIronSkillOneEffect1:GiantIronSkillOneEffect = null;
         var giantIronSkillOneEffect2:GiantIronSkillOneEffect = null;
         var stFieldGrid:a_3491 = null;
         var giantIronSoliderMouseMoveIntruder:GiantIronSoliderMouseMoveIntruder = null;
         var m_stTargetGrid:a_3491 = null;
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         switch(m_iBossState)
         {
            case STATE_PRE_BORN:
               elpsed = iCurrentTime - this.m_iEnterTime;
               if((iCurrentTime - this.m_iEnterTime) % 4 == 0)
               {
                  index = (iCurrentTime - this.m_iEnterTime) / 4 - 1;
                  if(index < this.m_lMoveGrid.length)
                  {
                     giantIronSkillFireEffect = GiantIronSkillFireEffect.a_3926();
                     giantIronSkillFireEffect.a_1797(false);
                     giantIronSkillFireEffect.x = a_3491.a_1080 * this.m_lMoveGrid[index][0] - 5;
                     giantIronSkillFireEffect.y = a_3491.a_1081 * this.m_lMoveGrid[index][1] + 10;
                     m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(giantIronSkillFireEffect,BattleLayerDefine.EFFECTS_BASE_TYPE);
                     this.m_lMoveEffect.push(giantIronSkillFireEffect);
                  }
               }
               break;
            case STATE_BORN:
               if(a_1273 < 15)
               {
                  for(i = 0; i < this.m_lDeleteGrid.length; i++)
                  {
                     if(this.m_lDeleteGrid[i][0] == a_1273)
                     {
                        stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.m_lDeleteGrid[i][1],this.m_lDeleteGrid[i][2]);
                        if(stNextFieldGrid != null)
                        {
                           this.a_3502(stNextFieldGrid);
                        }
                     }
                  }
               }
               break;
            case STATE_SKILL_ONE_DO:
               if(a_1273 == 124 || a_1273 == 307)
               {
                  giantIronSkillOneEffect1 = GiantIronSkillOneEffect.a_3926();
                  giantIronSkillOneEffect1.a_1797(false);
                  giantIronSkillOneEffect1.x = x - 100;
                  giantIronSkillOneEffect1.y = y + 70;
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(giantIronSkillOneEffect1,BattleLayerDefine.EFFECTS_TOP_TYPE);
                  giantIronSkillOneEffect2 = GiantIronSkillOneEffect.a_3926();
                  giantIronSkillOneEffect2.a_1797(true);
                  giantIronSkillOneEffect2.x = x + 100;
                  giantIronSkillOneEffect2.y = y + 70;
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(giantIronSkillOneEffect2,BattleLayerDefine.EFFECTS_TOP_TYPE);
               }
               if(a_1273 == 125 || a_1273 == 308)
               {
                  this.CreateFireGrid(x - 60 * -1,y - 64 * -1);
                  this.CreateFireGrid(x - 60 * 0,y - 64 * -1);
                  this.CreateFireGrid(x - 60 * 1,y - 64 * -1);
                  this.CreateFireGrid(x - 60 * -1,y - 64 * 0);
                  this.CreateFireGrid(x - 60 * 1,y - 64 * 0);
                  this.CreateFireGrid(x - 60 * -1,y - 64 * 1);
                  this.CreateFireGrid(x - 60 * 0,y - 64 * 1);
                  this.CreateFireGrid(x - 60 * 1,y - 64 * 1);
               }
               if(a_1273 == 130 || a_1273 == 313)
               {
                  iXGridNo = getXGridNoByPosX();
                  iYGridNo = getYGridNoByPosY();
                  this.ReduceGridDefense(iXGridNo - 1,iYGridNo - 1,false);
                  this.ReduceGridDefense(iXGridNo,iYGridNo - 1,false);
                  this.ReduceGridDefense(iXGridNo + 1,iYGridNo - 1,false);
                  this.ReduceGridDefense(iXGridNo - 1,iYGridNo,false);
                  this.ReduceGridDefense(iXGridNo + 1,iYGridNo,false);
                  this.ReduceGridDefense(iXGridNo - 1,iYGridNo + 1,false);
                  this.ReduceGridDefense(iXGridNo,iYGridNo + 1,false);
                  this.ReduceGridDefense(iXGridNo + 1,iYGridNo + 1,false);
                  this.ReduceGridDefense(iXGridNo + 2,iYGridNo,false);
                  this.ReduceGridDefense(iXGridNo - 2,iYGridNo,false);
                  this.ReduceGridDefense(iXGridNo,iYGridNo + 2,false);
                  this.ReduceGridDefense(iXGridNo,iYGridNo - 2,false);
                  this.CreateFireGrid(x - 60 * 2,y - 64 * 0);
                  this.CreateFireGrid(x - 60 * -2,y - 64 * 0);
                  this.CreateFireGrid(x - 60 * 0,y - 64 * 2);
                  this.CreateFireGrid(x - 60 * 0,y - 64 * -2);
               }
               break;
            case STATE_SKILL_TWO_DO:
               if(a_1273 == 167 || a_1273 == 353)
               {
                  this.m_bFireCreateSolider = true;
                  for(i = 0; i < this.m_lSollider.length; i++)
                  {
                     if(this.m_lSollider[i][2] == null || this.m_lSollider[i][2].inPool == true)
                     {
                        stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.m_lSollider[i][0],this.m_lSollider[i][1]);
                        if(!(stFieldGrid != null && stFieldGrid.m_stAttackFighter != null && stFieldGrid.m_stAttackFighter is a_3924))
                        {
                           giantIronSoliderMouseMoveIntruder = GiantIronSoliderMouseMoveIntruder.a_3926();
                           if(giantIronSoliderMouseMoveIntruder)
                           {
                              giantIronSoliderMouseMoveIntruder.a_1797((globalMoveFighterID << 16) + this.m_lSollider[i][1],this.m_lSollider[i][3]);
                              giantIronSoliderMouseMoveIntruder.m_stMoveIntruderTypeID = 134224513;
                              m_stTargetGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.m_lSollider[i][0],this.m_lSollider[i][1]);
                              m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(giantIronSoliderMouseMoveIntruder,m_stTargetGrid,false,BattleLayerDefine.INTRUDER_LAND_TYPE);
                              giantIronSoliderMouseMoveIntruder.InitField();
                              this.m_lSollider[i][2] = giantIronSoliderMouseMoveIntruder;
                           }
                        }
                     }
                     else
                     {
                        this.m_lSollider[i][2].DoFire();
                     }
                  }
                  this.CreateSkillUpEffect();
               }
               break;
            case STATE_SKILL_THREE_END:
               if(a_1273 == 391 || a_1273 == 205)
               {
                  this.iDefenceCount += 0.1;
                  this.CreateSkillUpEffect();
               }
               break;
            case STATE_SKILL_FOUR_DO:
               if(a_1273 == 76 || a_1273 == 263)
               {
                  iXGridNo = getXGridNoByPosX();
                  iYGridNo = getYGridNoByPosY();
                  this.ReduceGridDefense(iXGridNo - 1,iYGridNo);
                  this.ReduceGridDefense(iXGridNo - 2,iYGridNo);
                  this.ReduceGridDefense(iXGridNo - 1,iYGridNo - 1);
                  this.ReduceGridDefense(iXGridNo - 2,iYGridNo - 1);
               }
         }
         return true;
      }
      
      private function CreateSkillUpEffect() : void
      {
         var skillUpEffect:GiantIronSkillUpEffect = GiantIronSkillUpEffect.a_3926();
         skillUpEffect.a_1797(false);
         skillUpEffect.x = x - 5;
         skillUpEffect.y = y - 40;
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(skillUpEffect,BattleLayerDefine.EFFECTS_TOP_TYPE);
      }
      
      override protected function IsSkillState() : Boolean
      {
         return Boolean(m_iBossState >= STATE_SKILL_ONE_DO && m_iBossState <= STATE_SKILL_FOUR_DO);
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
      
      protected function ReduceGridDefense(iXGridNo:int, iYGridNo:int, bHurtHero:Boolean = true) : Boolean
      {
         var stFieldGrid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(bHurtHero ? 1000 : stFieldGrid.m_stProtector.iLifeValue);
         }
         if(null != stFieldGrid.m_stAttackFighter)
         {
            if(!(stFieldGrid.m_stAttackFighter is a_3924))
            {
               stFieldGrid.m_stAttackFighter.m_iDieType = 1;
               stFieldGrid.m_stAttackFighter.a_3969(bHurtHero ? 1000 : stFieldGrid.m_stAttackFighter.iLifeValue);
            }
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(bHurtHero ? 1000 : stFieldGrid.m_stBoomDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(bHurtHero ? 1000 : stFieldGrid.m_stFlowerDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(bHurtHero ? 1000 : stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
         }
         if(null != stFieldGrid.m_stHoneyTrapBaseDefense)
         {
            stFieldGrid.m_stHoneyTrapBaseDefense.m_iDieType = 1;
            stFieldGrid.m_stHoneyTrapBaseDefense.a_3969(bHurtHero ? 1000 : stFieldGrid.m_stHoneyTrapBaseDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stOceanGoddessToolDefense)
         {
            stFieldGrid.m_stOceanGoddessToolDefense.m_iDieType = 1;
            stFieldGrid.m_stOceanGoddessToolDefense.a_3969(bHurtHero ? 1000 : stFieldGrid.m_stOceanGoddessToolDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(bHurtHero ? 1000 : stFieldGrid.m_stTrayDefense.iLifeValue);
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

