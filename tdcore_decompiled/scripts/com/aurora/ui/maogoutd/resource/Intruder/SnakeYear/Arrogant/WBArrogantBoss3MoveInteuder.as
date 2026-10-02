package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.Arrogant
{
   import a_4728.a_1778;
   import a_4729.a_1789;
   import a_4752.a_2036;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.GameCardView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.WorldBoss.WBGluttonyKingBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import flash.display.DisplayObjectContainer;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   
   public class WBArrogantBoss3MoveInteuder extends WBGluttonyKingBossMoveIntruder
   {
      
      protected static const STATE_BORN:uint = 6;
      
      protected static const STATE_AIR2LAND:uint = 7;
      
      protected static const STATE_LAND_WAITING:uint = 8;
      
      protected static const STATE_LAND2AIR:uint = 9;
      
      protected static const STATE_AIR_WAITING:uint = 10;
      
      protected static const STATE_AIR_MOVE:uint = 11;
      
      protected static const STATE_APPEAR_OUT:uint = 12;
      
      protected static const STATE_APPEAR_IN:uint = 13;
      
      protected static const STATE_SKILL_ONE:uint = 14;
      
      protected static const STATE_SKILL_TWO_BEGIN:uint = 15;
      
      protected static const STATE_SKILL_TWO_LOOP:uint = 16;
      
      protected static const STATE_SKILL_TWO_END:uint = 17;
      
      protected static const STATE_SKILL_THREE:uint = 18;
      
      protected static const STATE_SKILL_FOUR:uint = 19;
      
      protected static const STATE_SKILL_FOUR_APPEAR_IN:uint = 20;
      
      protected static const STATE_SKILL_FIVE:uint = 21;
      
      protected static const STATE_HIDE:uint = 22;
      
      private var iSkillOneIndex:int = 0;
      
      protected var m_OutArray:Array = new Array([1,0,null],[1,1,null],[1,2,null],[1,3,null],[1,4,null],[1,5,null],[1,6,null],[2,3,null],[5,2,null],[6,4,null]);
      
      public function WBArrogantBoss3MoveInteuder()
      {
         super();
         a_1279 = -90;
         m_iYDisplayCenterPos = 248;
         _bossStep = 3;
         a_1789.getInstance().addEventListener("WB_Apple_Dead",this.On_WB_Apple_Dead);
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(WBArrogantBoss3MoveInteuder) as WBArrogantBoss3MoveInteuder;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBArrogantBoss3MoveInteuderMovie;
      }
      
      private function On_WB_Apple_Dead(e:a_1778) : void
      {
         if(iLifeValue > 0)
         {
            ReduceLife2(40000,[107]);
         }
      }
      
      override protected function InitState() : void
      {
         super.InitState();
         a_1789.getInstance().addEventListener("DefenseCardCountChange",this.a_3483);
      }
      
      override protected function a_3940() : Boolean
      {
         a_1789.getInstance().removeEventListener("DefenseCardCountChange",this.a_3483);
         for(var i:int = 0; i < this.m_OutArray.length; i++)
         {
            this.m_OutArray[i][2] = null;
         }
         super.a_3940();
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      override protected function InitBossStateFrameID() : void
      {
         m_dictBossStateFrameID = new Dictionary();
         m_dictBossStateFrameID[STATE_BORN + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_AIR2LAND + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_LAND_WAITING + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_LAND2AIR + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_AIR_WAITING + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_AIR_MOVE + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_APPEAR_OUT + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_APPEAR_IN + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_SKILL_ONE + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_SKILL_TWO_BEGIN + "_" + 0] = 10;
         m_dictBossStateFrameID[STATE_SKILL_TWO_LOOP + "_" + 0] = 11;
         m_dictBossStateFrameID[STATE_SKILL_TWO_END + "_" + 0] = 12;
         m_dictBossStateFrameID[STATE_SKILL_THREE + "_" + 0] = 13;
         m_dictBossStateFrameID[STATE_SKILL_FOUR + "_" + 0] = 14;
         m_dictBossStateFrameID[STATE_SKILL_FOUR_APPEAR_IN + "_" + 0] = 15;
         m_dictBossStateFrameID[STATE_SKILL_FIVE + "_" + 0] = 16;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 16;
         m_dictBossStateFrameID[STATE_BORN + "_" + 1] = 1;
         m_dictBossStateFrameID[STATE_AIR2LAND + "_" + 1] = 2;
         m_dictBossStateFrameID[STATE_LAND_WAITING + "_" + 1] = 3;
         m_dictBossStateFrameID[STATE_LAND2AIR + "_" + 1] = 4;
         m_dictBossStateFrameID[STATE_AIR_WAITING + "_" + 1] = 5;
         m_dictBossStateFrameID[STATE_AIR_MOVE + "_" + 1] = 6;
         m_dictBossStateFrameID[STATE_APPEAR_OUT + "_" + 1] = 7;
         m_dictBossStateFrameID[STATE_APPEAR_IN + "_" + 1] = 8;
         m_dictBossStateFrameID[STATE_SKILL_ONE + "_" + 1] = 9;
         m_dictBossStateFrameID[STATE_SKILL_TWO_BEGIN + "_" + 1] = 10;
         m_dictBossStateFrameID[STATE_SKILL_TWO_LOOP + "_" + 1] = 11;
         m_dictBossStateFrameID[STATE_SKILL_TWO_END + "_" + 1] = 12;
         m_dictBossStateFrameID[STATE_SKILL_THREE + "_" + 1] = 13;
         m_dictBossStateFrameID[STATE_SKILL_FOUR + "_" + 1] = 14;
         m_dictBossStateFrameID[STATE_SKILL_FOUR_APPEAR_IN + "_" + 1] = 15;
         m_dictBossStateFrameID[STATE_SKILL_FIVE + "_" + 1] = 16;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 1] = 3;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = 6;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = 16;
      }
      
      public function SkillBorn() : void
      {
         RemoveTag(28);
         a_1465 = 3;
         this.iSkillOneIndex = m_stRandomSeed.nextInt(2);
         m_vStateCache.push([STATE_BORN,43,4,3]);
         m_vStateCache.push([STATE_HIDE,20]);
      }
      
      public function GetRandomSeed() : RandomSeed
      {
         return m_stRandomSeed;
      }
      
      public function SkillOne() : void
      {
         ++this.iSkillOneIndex;
         if(this.iSkillOneIndex % 2 == 0)
         {
            m_vStateCache.push([STATE_SKILL_FOUR_APPEAR_IN,4,6,1]);
         }
         else
         {
            m_vStateCache.push([STATE_SKILL_FOUR_APPEAR_IN,4,6,2]);
         }
         m_vStateCache.push([STATE_SKILL_ONE,51]);
         m_vStateCache.push([STATE_LAND_WAITING,20]);
         m_vStateCache.push([STATE_LAND2AIR,8]);
      }
      
      public function SkillTwo() : void
      {
         m_vStateCache.push([STATE_APPEAR_IN,12,0,2 + m_stRandomSeed.nextInt(4),true]);
         m_vStateCache.push([STATE_SKILL_TWO_BEGIN,11]);
         m_vStateCache.push([STATE_SKILL_TWO_LOOP,11]);
         m_vStateCache.push([STATE_SKILL_TWO_END,29]);
         m_vStateCache.push([STATE_AIR_WAITING,20]);
         m_vStateCache.push([STATE_APPEAR_OUT,12]);
         m_vStateCache.push([STATE_HIDE,30]);
      }
      
      public function SkillThree() : void
      {
         m_vStateCache.push([STATE_AIR_MOVE,7,3]);
         m_vStateCache.push([STATE_SKILL_THREE,46]);
         m_vStateCache.push([STATE_AIR2LAND,9]);
         m_vStateCache.push([STATE_LAND_WAITING,30]);
         m_vStateCache.push([STATE_SKILL_FOUR,17]);
         m_vStateCache.push([STATE_HIDE,10]);
      }
      
      public function SkillThree2() : void
      {
         var idx:int = 0;
         ++this.iSkillOneIndex;
         if(a_4206.m_iViewBuffId == 320012400)
         {
            idx = int(m_stRandomSeed.nextInt(3));
            if(idx == 0)
            {
               m_vStateCache.push([STATE_SKILL_FOUR_APPEAR_IN,4,8,0]);
            }
            else if(idx == 1)
            {
               m_vStateCache.push([STATE_SKILL_FOUR_APPEAR_IN,4,4,3]);
            }
            else
            {
               m_vStateCache.push([STATE_SKILL_FOUR_APPEAR_IN,4,8,6]);
            }
         }
         else if(this.iSkillOneIndex % 2 == 0)
         {
            m_vStateCache.push([STATE_SKILL_FOUR_APPEAR_IN,4,5,5]);
         }
         else
         {
            m_vStateCache.push([STATE_SKILL_FOUR_APPEAR_IN,4,5,6]);
         }
         m_vStateCache.push([STATE_SKILL_ONE,51]);
         m_vStateCache.push([STATE_LAND_WAITING,15]);
         m_vStateCache.push([STATE_LAND2AIR,8]);
         m_vStateCache.push([STATE_APPEAR_OUT,12]);
         m_vStateCache.push([STATE_HIDE,30]);
      }
      
      private function GetRandomY4() : int
      {
         return m_stRandomSeed.nextInt(7);
      }
      
      public function SkillFour() : void
      {
         var iNextNoY:int = 0;
         var iLastNoY:int = 0;
         if(a_4206.m_iViewBuffId == 320012416)
         {
            iLastNoY = this.GetRandomY4();
            m_vStateCache.push([STATE_SKILL_FOUR_APPEAR_IN,4,8,iLastNoY,false]);
            m_vStateCache.push([STATE_SKILL_FOUR,17]);
            m_vStateCache.push([STATE_HIDE,20]);
            iNextNoY = this.GetRandomY4();
            while(iNextNoY == iLastNoY)
            {
               iNextNoY = this.GetRandomY4();
            }
            m_vStateCache.push([STATE_SKILL_FOUR_APPEAR_IN,4,8,iNextNoY,false]);
            m_vStateCache.push([STATE_SKILL_FOUR,17]);
            m_vStateCache.push([STATE_HIDE,20]);
         }
         else
         {
            iLastNoY = this.GetRandomY4();
            m_vStateCache.push([STATE_SKILL_FOUR_APPEAR_IN,4,8,iLastNoY,false]);
            m_vStateCache.push([STATE_SKILL_FOUR,17]);
            m_vStateCache.push([STATE_HIDE,20]);
            iLastNoY = int(m_stRandomSeed.nextInt(7));
            m_vStateCache.push([STATE_SKILL_FOUR_APPEAR_IN,4,4,iLastNoY,false]);
            m_vStateCache.push([STATE_SKILL_FOUR,17]);
            m_vStateCache.push([STATE_HIDE,20]);
         }
         if(a_4206.m_iViewBuffId == 320012400)
         {
            m_vStateCache.push([STATE_SKILL_FOUR_APPEAR_IN,4,6,1,false]);
         }
         else
         {
            m_vStateCache.push([STATE_SKILL_FOUR_APPEAR_IN,4,6,4,false]);
         }
         m_vStateCache.push([STATE_LAND_WAITING,40]);
         m_vStateCache.push([STATE_LAND2AIR,8]);
         m_vStateCache.push([STATE_APPEAR_OUT,12,false]);
         m_vStateCache.push([STATE_HIDE,30]);
      }
      
      protected function SkillFive() : void
      {
         m_vStateCache.push([STATE_SKILL_FIVE,42,0,4]);
         m_vStateCache.push([STATE_AIR_WAITING,20]);
         m_vStateCache.push([STATE_APPEAR_OUT,12,false]);
         m_vStateCache.push([STATE_HIDE,40]);
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.SkillOne);
         m_vSkillFunction.push(this.SkillThree);
         m_vSkillFunction.push(this.SkillTwo);
         m_vSkillFunction.push(this.SkillThree2);
         m_vSkillFunction.push(this.SkillFour);
         m_vSkillFunction.push(this.SkillFive);
      }
      
      override protected function InitSkillCache() : void
      {
         m_vStateCache.length = 0;
         iLastNoX = 7;
         iLastNoY = 4;
         this.SkillBorn();
      }
      
      override protected function CheckIsCanLaunchSkill(iCurrentTime:int) : Boolean
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stBaseMoveIntruder:a_4206 = null;
         var stTargetFieldGrid:a_3491 = null;
         var arr:Array = null;
         var hole1:PlumberPipelineOutletMoveIntruder = null;
         var hole2:PlumberPipelineOutletMoveIntruder = null;
         var hole3:PlumberPipelineOutletMoveIntruder = null;
         var bNeedAddEffect:Boolean = false;
         var snakeShot:WBSnakeShot = null;
         var stStartField:a_3491 = null;
         var i:int = 0;
         switch(m_iBossState)
         {
            case STATE_BORN:
               if(a_1273 == 9)
               {
                  this.ClearFieldGridDefense3(2,4);
                  this.ClearFieldGridDefense3(3,4);
                  this.ClearFieldGridDefense3(4,4);
                  this.ClearFieldGridDefense3(5,4);
                  this.ClearFieldGridDefense3(6,4);
               }
               break;
            case STATE_SKILL_FOUR_APPEAR_IN:
               if(a_1273 == 305)
               {
                  this.ClearFieldGridDefense2(m_stCurrentFieldGrid);
               }
               break;
            case STATE_LAND2AIR:
               if(a_1273 == 72)
               {
                  a_1465 = 3;
               }
               break;
            case STATE_AIR2LAND:
               if(a_1273 == 50)
               {
                  a_1465 = 0;
               }
               break;
            case STATE_SKILL_ONE:
               if(a_1273 == 160)
               {
                  this.CreateHoles();
               }
               break;
            case STATE_SKILL_TWO_END:
               if(a_1273 == 222)
               {
                  hole1 = this.CreateChangeHole(2,0 + m_stRandomSeed.nextInt(2),6);
                  hole2 = this.CreateChangeHole(4,2 + m_stRandomSeed.nextInt(2),8);
                  hole3 = this.CreateChangeHole(2,5 + m_stRandomSeed.nextInt(2),7);
                  PlumberPipelineOutletMoveIntruder.createIndex = 0;
                  PlumberPipelineOutletMoveIntruder.createTick = 0;
                  arr = [hole1,hole2,hole3];
                  hole1.holes = arr;
                  hole2.holes = arr;
                  hole3.holes = arr;
               }
               break;
            case STATE_SKILL_THREE:
               if(a_1273 == 267)
               {
                  bNeedAddEffect = true;
                  if(a_2036.getInstance().tagCom.HasTag(17) || a_2036.getInstance().tagCom.HasTag(18) || a_2036.getInstance().tagCom.HasTag(19))
                  {
                     bNeedAddEffect = false;
                  }
                  a_2036.getInstance().tagCom.AddTag(19);
                  if(bNeedAddEffect)
                  {
                     this.AddOneTimeChangeEffect(288948688);
                     this.AddOneTimeChangeEffect(288948702);
                     this.AddOneTimeChangeEffect(288948703);
                  }
                  this.ClearFieldGridDefense3(3,1);
                  this.ClearFieldGridDefense3(4,1);
                  this.ClearFieldGridDefense3(5,1);
                  this.ClearFieldGridDefense3(3,2);
                  this.ClearFieldGridDefense3(4,2);
                  this.ClearFieldGridDefense3(5,2);
                  this.ClearFieldGridDefense3(3,3);
                  this.ClearFieldGridDefense3(4,3);
                  this.ClearFieldGridDefense3(5,3);
               }
               break;
            case STATE_SKILL_FOUR:
               if(a_1273 == 291)
               {
                  snakeShot = WBSnakeShot.a_4344();
                  stStartField = m_stCurrentFieldGrid;
                  snakeShot.a_1797(0,-7,0,x - 60,y + 10,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,stStartField);
                  snakeShot.m_iTargetNoY = m_stCurrentFieldGrid.m_iYGridNo;
                  snakeShot.m_stBOSS3 = this;
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(snakeShot,BattleLayerDefine.SHOT_TYPE,stStartField);
               }
               break;
            case STATE_SKILL_FIVE:
               if(a_1273 == 336)
               {
                  for(arr = this.GetRandomCagePosition(); i < 5; )
                  {
                     if(i < arr.length)
                     {
                        this.CreateCage(arr[i][0],arr[i][1]);
                     }
                     i++;
                  }
               }
         }
         return true;
      }
      
      private function CreateCage(iNoX:int, iNoY:int) : void
      {
         var grid1:a_3491 = null;
         var bat:WBBirdCageEffect = null;
         grid1 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         if(grid1 == null)
         {
            return;
         }
         bat = WBBirdCageEffect.a_3926() as WBBirdCageEffect;
         bat.a_1797(0,-1);
         bat.iGlobalMoveFighterID = a_4265();
         bat.m_stMoveIntruderTypeID = 8388608;
         bat.x = a_3491.a_1080 * (grid1.m_iXGridNo + 0.5);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(bat,grid1);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(bat,BattleLayerDefine.INTRUDER_LAND_TYPE,grid1);
         bat.y = a_3491.a_1081 * (grid1.m_iYGridNo + 0.5);
      }
      
      override protected function IsSkillState() : Boolean
      {
         return Boolean(m_iBossState >= STATE_SKILL_ONE && m_iBossState <= STATE_SKILL_FIVE);
      }
      
      override protected function IsMoving() : Boolean
      {
         return m_iBossState == STATE_MOVE || m_iBossState == STATE_AIR_MOVE;
      }
      
      override protected function IsCanReduceLife() : Boolean
      {
         return STATE_HIDE != m_iBossState && STATE_BORN != m_iBossState && STATE_NONE != m_iBossState && a_1339 > 0;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var stNextFieldGrid:a_3491 = null;
         var bIsCanChangeToFieldGrid:Boolean = false;
         _iTimeNum = iCurrentTime;
         if(a_1581 > 0)
         {
            --a_1581;
            x += m_numXSpeed;
            y += m_numYSpeed;
            iXGridNo = getXGridNoByPosX();
            iYGridNo = getYGridNoByPosY();
            stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
            bIsCanChangeToFieldGrid = ChangeToFieldGrid(stNextFieldGrid);
         }
         if(null == m_stCurrentFieldGrid)
         {
            return false;
         }
         if(!IsCalTick(iCurrentTime))
         {
            return false;
         }
         m_iLastCalTime = iCurrentTime;
         ++m_iLaunchRunTick;
         if(!a_1460)
         {
            this.InitState();
            a_1460 = true;
            _MAXLifeValue = iLifeValue;
            _Reduce2ShieldLifeValue = _MAXLifeValue * 0.25;
            _ReduceOneStepLifeValue = _MAXLifeValue * 0.1;
         }
         if(m_iBossState != STATE_DEAD && a_1339 <= 0)
         {
            LifeIsZeroHandle(STATE_DEAD);
            return false;
         }
         if(m_iBossState == STATE_DEAD)
         {
            nextFrame();
            return false;
         }
         if(m_iRestTick > 0)
         {
            nextFrame();
            if(this.IsMoving())
            {
               MoveMySelf();
            }
            this.CheckIsCanLaunchSkill(iCurrentTime);
            if(a_1278 != null)
            {
               GotoAndStopFrame(a_1275);
            }
            --m_iRestTick;
            return false;
         }
         return this.SwitchState(iCurrentTime);
      }
      
      private function ClearFieldGridDefense3(iNoX:int, iNoY:int) : void
      {
         this.ClearFieldGridDefense2(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY));
      }
      
      protected function ClearFieldGridDefense2(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(stFieldGrid.m_stProtector.iLifeValue);
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(stFieldGrid.m_stAttackFighter.iLifeValue);
         }
         if(null != stFieldGrid.m_stBoomDefense && stFieldGrid.m_stBoomDefense.isCanBeEaten)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(stFieldGrid.m_stBoomDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(stFieldGrid.m_stFlowerDefense.iLifeValue);
         }
         stFieldGrid.DamageNewSlot(true,0,true,0,1);
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
         }
         if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue);
         }
         return true;
      }
      
      override protected function SwitchState(iCurrentTime:int) : Boolean
      {
         var targetY:Number = NaN;
         if(0 == m_vStateCache.length)
         {
            CacheNextSkill();
         }
         var iNextState:uint = uint(m_vStateCache[0][0]);
         var iNextValue:int = int(m_vStateCache[0][1]);
         switch(iNextState)
         {
            case STATE_BORN:
               _battleView = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView;
               setAppearToGrid(m_vStateCache[0][2],m_vStateCache[0][3],0);
               break;
            case STATE_NONE:
            case STATE_HIDE:
               SetIsCannotSee(true);
               this.visible = false;
               break;
            case STATE_SKILL_FOUR:
               break;
            case STATE_LAND2AIR:
               RemoveTag(28);
               break;
            case STATE_SKILL_ONE:
               AddTag(28);
               break;
            case STATE_SKILL_FOUR_APPEAR_IN:
               a_1465 = 0;
               SetIsCannotSee(false);
               this.visible = true;
               setAppearToGrid(m_vStateCache[0][2],m_vStateCache[0][3]);
               a_1283 = false;
               break;
            case STATE_APPEAR_IN:
               a_1465 = 3;
               SetIsCannotSee(false);
               this.visible = true;
               setAppearToGrid(m_vStateCache[0][2],m_vStateCache[0][3]);
               a_1283 = m_vStateCache[0][4];
               break;
            case STATE_WAITING:
               SetIsCannotSee(false);
               break;
            case STATE_MOVE:
            case STATE_AIR_MOVE:
               targetY = m_vStateCache[0][2] == -1 ? y : getPosYByYGridNo(m_vStateCache[0][2]);
               iNextValue = setMoveToPosition(getPosXByXGridNo(m_vStateCache[0][1]),targetY,60 / (20 * 0.5));
               break;
            case STATE_SKILL_FIVE:
               setAppearToGrid(m_vStateCache[0][2],m_vStateCache[0][3]);
               a_1283 = true;
               break;
            case STATE_SKILL_TWO_BEGIN:
            case STATE_SKILL_FIVE:
               AddTag(2);
               AddTag(3);
               break;
            case STATE_APPEAR_OUT:
               RemoveTag(2);
               RemoveTag(3);
         }
         m_vStateCache.shift();
         ChangeState(iNextState,iNextValue,iCurrentTime);
         return true;
      }
      
      private function a_3483(stDataEvent:a_1778) : void
      {
         var i:int = 0;
         var item:Array = null;
         var iDefenseTypeID:int = int(stDataEvent.dataObject[0]);
         var tempFieldGrid:Object = stDataEvent.dataObject.length >= 3 ? stDataEvent.dataObject[2] : null;
         if(tempFieldGrid == null)
         {
            return;
         }
         if(iDefenseTypeID == 286851441)
         {
            for(i = 0; i < this.m_OutArray.length; i++)
            {
               item = this.m_OutArray[i];
               if(item[1] == tempFieldGrid.m_iYGridNo && item[0] == tempFieldGrid.m_iXGridNo && item[2] != null)
               {
                  item[2].OnStopperPlace();
               }
            }
         }
      }
      
      private function InSeamArray(iNoX:int, iNoY:int) : Boolean
      {
         for(var i:int = 0; i < this.m_OutArray.length; i++)
         {
            if(this.m_OutArray[i][0] == iNoX && this.m_OutArray[i][1] == iNoY)
            {
               return true;
            }
         }
         return false;
      }
      
      private function IsNormalGrid(iNoX:int, iNoY:int) : Boolean
      {
         var grid:a_3491 = _battleView.a_3438(iNoX,iNoY);
         if(grid != null)
         {
            return grid.m_iFieldGridType == 0 && grid.m_bShowFrozenEffect == true;
         }
         return false;
      }
      
      private function GetRandomCagePosition() : Array
      {
         var j:int = 0;
         var arr:Array = new Array();
         for(var i:int = 1; i <= 5; i++)
         {
            for(j = 0; j <= 6; j++)
            {
               if(this.IsNormalGrid(i,j) && !this.InSeamArray(i,j))
               {
                  arr.push([i,j]);
               }
            }
         }
         return shuffleArray(arr);
      }
      
      private function CreateHoles() : void
      {
         var holeArray:Array = new Array();
         var i:int = 0;
         for(i = 0; i < this.m_OutArray.length; i++)
         {
            if(this.m_OutArray[i][2] == null)
            {
               holeArray.push(i);
            }
         }
         if(holeArray.length <= 2)
         {
            for(i = 0; i < holeArray.length; i++)
            {
               this.CreateHole(holeArray[i]);
            }
         }
         else
         {
            holeArray = shuffleArray(holeArray);
            this.CreateHole(holeArray[0]);
            this.CreateHole(holeArray[1]);
         }
      }
      
      public function CreateHole(index:int) : void
      {
         var grid:a_3491 = null;
         var seamEffect:WBSeamEffect = null;
         var iNoX:int = int(this.m_OutArray[index][0]);
         var iNoY:int = int(this.m_OutArray[index][1]);
         grid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         if(grid == null)
         {
            return;
         }
         seamEffect = WBSeamEffect.a_3926();
         seamEffect.a_1797(false);
         seamEffect.InitData(grid,this);
         seamEffect.x = grid.m_iXGridNo * a_3491.a_1080;
         seamEffect.y = grid.m_iYGridNo * a_3491.a_1081;
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(seamEffect,BattleLayerDefine.EFFECTS_BASE_TYPE,grid);
         this.m_OutArray[index][2] = seamEffect;
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_arrEffectArray.push(seamEffect);
      }
      
      public function RemoveHole(seam:WBSeamEffect) : void
      {
         for(var i:int = 0; i < this.m_OutArray.length; i++)
         {
            if(this.m_OutArray[i][2] == seam)
            {
               this.m_OutArray[i][2] = null;
            }
         }
      }
      
      public function GetGuardGlobalID2() : int
      {
         return pressData(globalMoveFighterID,++m_iSummonUpSequence,16);
      }
      
      private function CreateChangeHole(iNoX:int, iNoY:int, iNoX2:int) : PlumberPipelineOutletMoveIntruder
      {
         var grid1:a_3491 = null;
         var grid2:a_3491 = null;
         var stPlumberPipelineEntranceMoveIntruder:PlumberPipelineEntranceMoveIntruder = null;
         var stPlumberPipelineOutletMoveIntruder:PlumberPipelineOutletMoveIntruder = null;
         grid1 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX2,iNoY);
         grid2 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         if(grid1 == null || grid2 == null)
         {
            return null;
         }
         stPlumberPipelineEntranceMoveIntruder = PlumberPipelineEntranceMoveIntruder.a_3926() as PlumberPipelineEntranceMoveIntruder;
         stPlumberPipelineEntranceMoveIntruder.a_1797(0,-1);
         stPlumberPipelineEntranceMoveIntruder.iGlobalMoveFighterID = a_4265();
         stPlumberPipelineEntranceMoveIntruder.m_stMoveIntruderTypeID = 8388608;
         stPlumberPipelineEntranceMoveIntruder.x = a_3491.a_1080 * grid1.m_iXGridNo + (a_3491.a_1080 - stPlumberPipelineEntranceMoveIntruder.width);
         stPlumberPipelineEntranceMoveIntruder.y = a_3491.a_1081 * grid1.m_iYGridNo + (a_3491.a_1081 - stPlumberPipelineEntranceMoveIntruder.height);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(stPlumberPipelineEntranceMoveIntruder,grid1);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stPlumberPipelineEntranceMoveIntruder,BattleLayerDefine.INTRUDER_LAND_TYPE,grid1);
         stPlumberPipelineOutletMoveIntruder = PlumberPipelineOutletMoveIntruder.a_3926() as PlumberPipelineOutletMoveIntruder;
         stPlumberPipelineOutletMoveIntruder.a_1797(0,-1);
         stPlumberPipelineOutletMoveIntruder.iGlobalMoveFighterID = a_4265();
         stPlumberPipelineOutletMoveIntruder.m_stMoveIntruderTypeID = 8388608;
         stPlumberPipelineOutletMoveIntruder.x = a_3491.a_1080 * grid2.m_iXGridNo + (a_3491.a_1080 - stPlumberPipelineOutletMoveIntruder.width);
         stPlumberPipelineOutletMoveIntruder.y = a_3491.a_1081 * grid2.m_iYGridNo + (a_3491.a_1081 - stPlumberPipelineOutletMoveIntruder.height);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(stPlumberPipelineOutletMoveIntruder,grid2);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stPlumberPipelineOutletMoveIntruder,BattleLayerDefine.INTRUDER_LAND_TYPE,grid2);
         stPlumberPipelineOutletMoveIntruder.createMouse = true;
         stPlumberPipelineOutletMoveIntruder.m_stPipelineEntranceMoveIntruder = stPlumberPipelineEntranceMoveIntruder;
         stPlumberPipelineEntranceMoveIntruder.m_stPipelineOutletMoveIntruder = stPlumberPipelineOutletMoveIntruder;
         stPlumberPipelineOutletMoveIntruder.duration = 1010;
         stPlumberPipelineEntranceMoveIntruder.duration = 1010;
         return stPlumberPipelineOutletMoveIntruder;
      }
      
      private function AddOneTimeChangeEffect(iGameCardTypeID:uint) : void
      {
         var timeChangeEffect:WBTimeChangeEffect = null;
         var gameCardView:GameCardView = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3476(iGameCardTypeID);
         if(gameCardView == null)
         {
            return;
         }
         timeChangeEffect = WBTimeChangeEffect.a_3926();
         timeChangeEffect.a_1797(false);
         timeChangeEffect.x = gameCardView.x - 200 + (gameCardView.parent.x - 114);
         timeChangeEffect.y = gameCardView.y - 98;
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(timeChangeEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,m_stCurrentFieldGrid);
         var stGlobalPoint:Point = timeChangeEffect.parent.localToGlobal(new Point(timeChangeEffect.x,timeChangeEffect.y));
         var stRootLocalPoint:Point = root.globalToLocal(stGlobalPoint);
         timeChangeEffect.x = stRootLocalPoint.x;
         timeChangeEffect.y = stRootLocalPoint.y;
         var stRootContainer:DisplayObjectContainer = root as DisplayObjectContainer;
         if(timeChangeEffect.parent.contains(timeChangeEffect))
         {
            timeChangeEffect.parent.removeChild(timeChangeEffect);
         }
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(timeChangeEffect,BattleLayerDefine.EFFECTS_TOP_TYPE);
         stRootContainer.addChild(timeChangeEffect);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_arrEffectArray.push(timeChangeEffect);
      }
   }
}

