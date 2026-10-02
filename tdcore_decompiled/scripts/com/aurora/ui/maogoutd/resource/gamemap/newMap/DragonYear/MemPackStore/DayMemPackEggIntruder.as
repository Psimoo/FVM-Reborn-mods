package com.aurora.ui.maogoutd.resource.gamemap.newMap.DragonYear.MemPackStore
{
   import a_4718.b_181;
   import a_4754.a_2161;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4255;
   import com.aurora.ui.maogoutd.resource.defender.RabbitYear.TimeMachine.TimeMachineDefence;
   import com.aurora.ui.maogoutd.resource.defender.RabbitYear.TimeMachine.UpGradeEffect;
   import com.aurora.ui.maogoutd.resource.defender.RabbitYear.TimeMachine.lowGradeEffect;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.defender.a_4012;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.role.a_4463;
   import flash.display.FrameLabel;
   
   public class DayMemPackEggIntruder extends a_4206
   {
      
      private var MAX_INJURED_LIFE:int = 1;
      
      private var FULL_HP:int = 10000;
      
      public var m_iOldFieldGridType:int;
      
      public var m_iRandomIdx:int;
      
      protected var m_iState:int = 0;
      
      protected var m_stGameMap:IMemPackMap;
      
      public function DayMemPackEggIntruder()
      {
         super();
      }
      
      public static function a_3926() : DayMemPackEggIntruder
      {
         return PoolManager.getInstance().CheckOutOne(DayMemPackEggIntruder) as DayMemPackEggIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return DayMemPackEggIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = 0;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = this.FULL_HP;
         this.MAX_INJURED_LIFE = 1;
         a_1279 = -5;
         m_iYDisplayCenterPos = 15;
         a_1272 = 0;
         a_1481 = false;
         a_1464 = true;
         a_1463 = true;
         BoomIsReduceLife = true;
         a_1462 = false;
         a_1465 = 0;
         this.m_iState = 0;
         a_1275 = 1;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         var stBaseMoveIntruder:a_4206 = null;
         if(m_stCurrentFieldGrid != null)
         {
            m_stCurrentFieldGrid.m_iFieldGridType = this.m_iOldFieldGridType;
         }
         if(this.m_iState == 1)
         {
            this.DoSkill();
         }
         else if(this.m_iState == 2)
         {
            stBaseMoveIntruder = a_4255.getInstance().a_4256(8389316);
            if(stBaseMoveIntruder)
            {
               stBaseMoveIntruder.a_1797((1 << 16) + m_stCurrentFieldGrid.m_iYGridNo * 100 + m_stCurrentFieldGrid.m_iXGridNo + 20000,-1);
               stBaseMoveIntruder.m_stMoveIntruderTypeID = 8389316;
               stBaseMoveIntruder.x = m_stCurrentFieldGrid.m_iXGridNo * a_3491.a_1080 + 30;
               stBaseMoveIntruder.y = m_stCurrentFieldGrid.m_iYGridNo * a_3491.a_1081;
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,m_stCurrentFieldGrid,true,BattleLayerDefine.INTRUDER_SKY_TYPE);
               stBaseMoveIntruder.SpecialSkillCallBack();
            }
         }
         this.m_iState = 0;
         this.m_stGameMap.Remove(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo);
         super.a_3940();
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > this.MAX_INJURED_LIFE)
         {
            if(a_1275 != 1)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
            a_3419();
         }
         else if(a_1339 > 0)
         {
            if(a_1275 != 2)
            {
               a_1275 = 2;
               gotoAndStop((a_1276[2] as FrameLabel).frame);
            }
            a_3419();
         }
         else if(a_1339 <= 0 && a_1275 != 3)
         {
            a_1275 = 3;
            gotoAndStop((a_1276[3] as FrameLabel).frame);
            a_3419();
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            this.play();
         }
         return true;
      }
      
      override public function a_4213() : Boolean
      {
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(this.m_iState == 0 && iRduceLifeValue >= a_1339)
         {
            this.m_iState = 1;
            SetCannotSeeByFighter(true);
            a_1465 = 1;
            iRduceLifeValue = iLifeValue - 1;
         }
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         if(this.m_iState == 0 && iRduceLifeValue >= a_1339)
         {
            this.m_iState = 1;
            SetCannotSeeByFighter(true);
            a_1465 = 1;
            iRduceLifeValue = iLifeValue - 1;
         }
         super.a_4209(iRduceLifeValue);
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         if(!a_1460)
         {
            a_1460 = true;
            if(m_stCurrentFieldGrid != null)
            {
               this.m_iOldFieldGridType = m_stCurrentFieldGrid.m_iFieldGridType;
               m_stCurrentFieldGrid.m_iFieldGridType = 8;
            }
         }
         var numOrigXPos:Number = x;
         this.SeekTriger();
         super.a_4216(iCurrentTime);
         if(a_1457 == b_181.a_424 && (x > a_3491.a_1080 * 4 && a_1283 || x < a_3491.a_1080 * 5 && !a_1283))
         {
            y += Math.tan(15 * Math.PI / 180) * Math.abs(numOrigXPos - x);
         }
         return true;
      }
      
      public function SeekTriger() : void
      {
         if(this.m_iState != 0)
         {
            return;
         }
         if(m_stCurrentFieldGrid == null)
         {
            return;
         }
         var arrMoveIntruder:Array = m_stCurrentFieldGrid.a_1511.slice();
         for(var i:int = 0; i < arrMoveIntruder.length; i++)
         {
            if(arrMoveIntruder[i].m_stMoveIntruderTypeID != 8389127 && arrMoveIntruder[i].iSpaceState == 0 && !this.IsBOSS(arrMoveIntruder[i]))
            {
               this.KillSelf();
               break;
            }
         }
      }
      
      public function IsBOSS(stMoveIntruder:a_4206) : Boolean
      {
         return stMoveIntruder.IsBossIntruder;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
      }
      
      public function KillSelf() : void
      {
         this.m_iState = 2;
         this.a_3969(a_1339);
      }
      
      public function GetGradeLevel() : int
      {
         var randomNum:int = BattleFieldView.m_stRandomSeed.nextInt(100) + 1;
         if(randomNum <= 35)
         {
            return 1;
         }
         if(randomNum <= 60)
         {
            return 2;
         }
         if(randomNum <= 70)
         {
            return 3;
         }
         if(randomNum <= 90)
         {
            return -1;
         }
         if(randomNum <= 100)
         {
            return -2;
         }
         return 1;
      }
      
      public function DoSkill() : void
      {
         var stFieldGridVector:Array = null;
         var stBaseDefense:a_3962 = null;
         var newStarDegree:int = 0;
         var m_UpGradeLeve:int = 0;
         var xIndex:int = 0;
         var tempFieldGrid:a_3491 = null;
         if(m_stCurrentFieldGrid != null)
         {
            m_stCurrentFieldGrid.m_iFieldGridType = this.m_iOldFieldGridType;
         }
         if(this.m_iRandomIdx == 0)
         {
            stFieldGridVector = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector;
            m_UpGradeLeve = this.GetGradeLevel();
            for(xIndex = 0; xIndex <= 8; xIndex++)
            {
               tempFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,m_stCurrentFieldGrid.m_iYGridNo);
               if(tempFieldGrid != null)
               {
                  stBaseDefense = TimeMachineDefence.getUpgradeDefense(tempFieldGrid);
                  if(stBaseDefense != null && m_UpGradeLeve > 0)
                  {
                     this.AddUpGradeEffect(tempFieldGrid,m_UpGradeLeve);
                     newStarDegree = Math.min(stBaseDefense.a_1094 + m_UpGradeLeve,16);
                     if(newStarDegree != stBaseDefense.a_1094)
                     {
                        this.InitDefensePosition(stBaseDefense,newStarDegree);
                     }
                  }
                  else if(stBaseDefense != null && m_UpGradeLeve < 0)
                  {
                     this.AddlowGradeEffect(tempFieldGrid,m_UpGradeLeve);
                     newStarDegree = Math.max(stBaseDefense.a_1094 + m_UpGradeLeve,0);
                     if(newStarDegree != stBaseDefense.a_1094)
                     {
                        this.InitDefensePosition(stBaseDefense,newStarDegree);
                     }
                  }
               }
            }
         }
         else if(this.m_iRandomIdx == 1)
         {
            this.AddCat();
         }
         else
         {
            this.AddSmallDefense(m_stCurrentFieldGrid);
         }
      }
      
      override public function play() : void
      {
         super.play();
      }
      
      private function AddlowGradeEffect(stFieldGrid:a_3491, m_Level:int) : void
      {
         var effect:lowGradeEffect = null;
         if(stFieldGrid)
         {
            effect = lowGradeEffect.a_3926();
            effect.m_Level = Math.abs(m_Level);
            effect.a_1797(false);
            effect.x = (stFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
            effect.y = (stFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081 + 25;
            stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(effect,BattleLayerDefine.EFFECTS_TOP_TYPE,stFieldGrid);
            effect.play();
         }
      }
      
      private function AddUpGradeEffect(stFieldGrid:a_3491, m_Level:int) : void
      {
         var effect:UpGradeEffect = null;
         if(stFieldGrid)
         {
            effect = UpGradeEffect.a_3926();
            effect.m_Level = Math.abs(m_Level);
            effect.a_1797(false);
            effect.x = (stFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
            effect.y = (stFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081 + 25;
            stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(effect,BattleLayerDefine.EFFECTS_TOP_TYPE,stFieldGrid);
            effect.play();
         }
      }
      
      public function InitDefensePosition(stBaseDefense:a_3962, newStarDegree:int) : void
      {
         var stInitialFieldGrid:a_3491 = null;
         var role:a_4463 = null;
         if(stBaseDefense == null || stBaseDefense.stFieldGrid == null)
         {
            return;
         }
         var stFieldGrid:a_3491 = stBaseDefense.stFieldGrid;
         var stNewDefense:a_3962 = a_4012.getInstance().a_4013(stBaseDefense.a_3512()) as a_3962;
         if(stNewDefense == null)
         {
            return;
         }
         stNewDefense.iDefenseTypeID = stBaseDefense.a_3512();
         stNewDefense.a_1094 = newStarDegree;
         stNewDefense.m_iSkillDegree = stBaseDefense.m_iSkillDegree;
         stBaseDefense.a_3940();
         stNewDefense.m_iPlaceTimeIntervals = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.iTimeIntervalNum;
         stNewDefense.m_iDefenseGlobalID = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_2180();
         var addResult:Boolean = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3441(stNewDefense,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
         if(addResult)
         {
            stInitialFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
            a_3962.a_1088.a_2059(stNewDefense.m_iDefenseGlobalID,stNewDefense.a_3512(),stInitialFieldGrid.m_iInitialXGridNo,stInitialFieldGrid.m_iInitialYGridNo,0,1,newStarDegree);
            role = a_2161.e.GetCurrentRole() as a_4463;
            role = a_2161.e.GetCurrentRole() as a_4463;
            if(Boolean(role) && role.m_iGamePoint > 10)
            {
               stNewDefense.a_3940();
            }
         }
         else
         {
            stNewDefense.a_3940();
         }
      }
      
      private function AddSmallDefense(grid:a_3491) : void
      {
         var addResult:Boolean = false;
         var stInitialFieldGrid:a_3491 = null;
         if(grid == null)
         {
            return;
         }
         var stSmallSlimeDefense:a_3953 = a_4012.getInstance().a_4013(286457951) as a_3953;
         var xNo:int = grid.m_iXGridNo;
         var yNo:int = grid.m_iYGridNo;
         if(stSmallSlimeDefense)
         {
            stSmallSlimeDefense.iDefenseTypeID = 286457951;
            stSmallSlimeDefense.a_1094 = 14;
            stSmallSlimeDefense.m_iPlaceTimeIntervals = grid.m_stCurrentBattbleFieldView.iTimeIntervalNum;
            stSmallSlimeDefense.m_iDefenseGlobalID = grid.m_stCurrentBattbleFieldView.a_2180();
            addResult = grid.m_stCurrentBattbleFieldView.a_3441(stSmallSlimeDefense,xNo,yNo);
            if(addResult)
            {
               stInitialFieldGrid = grid.m_stCurrentBattbleFieldView.a_3438(xNo,yNo);
               a_3962.a_1088.a_2059(stSmallSlimeDefense.m_iDefenseGlobalID,stSmallSlimeDefense.a_3512(),stInitialFieldGrid.m_iInitialXGridNo,stInitialFieldGrid.m_iInitialYGridNo,0,1,14);
               stSmallSlimeDefense.a_3940();
            }
            else
            {
               stSmallSlimeDefense.a_3940();
            }
         }
      }
      
      public function InitData(hp:int, gameMap:IMemPackMap) : void
      {
         this.m_stGameMap = gameMap;
         this.FULL_HP = hp;
         this.m_iRandomIdx = this.m_stGameMap.GetRandomIdx(3);
      }
      
      private function AddCat() : void
      {
         this.AddCatInGrid(m_stCurrentFieldGrid.m_iYGridNo - 1);
         this.AddCatInGrid(m_stCurrentFieldGrid.m_iYGridNo);
         this.AddCatInGrid(m_stCurrentFieldGrid.m_iYGridNo + 1);
      }
      
      private function AddCatInGrid(iYGridNo:int) : void
      {
         var stLastWaitShot:MemPackStoreCatShot = null;
         var stBattleView:BattleFieldView = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView;
         var stStartField:a_3491 = stBattleView.a_3438(0,iYGridNo);
         if(!stStartField)
         {
            return;
         }
         stLastWaitShot = MemPackStoreCatShot.a_4344() as MemPackStoreCatShot;
         if(null == stLastWaitShot)
         {
            return;
         }
         var tempX2:int = -1 * a_3491.a_1080;
         var tempY2:int = stStartField.m_iYGridNo * a_3491.a_1081 + 30;
         stLastWaitShot.m_isSpecial = 0;
         stLastWaitShot.a_1797(0,5,500,tempX2,tempY2,stBattleView,stStartField);
         parent.addChildAt(stLastWaitShot,stBattleView.a_3433());
      }
   }
}

