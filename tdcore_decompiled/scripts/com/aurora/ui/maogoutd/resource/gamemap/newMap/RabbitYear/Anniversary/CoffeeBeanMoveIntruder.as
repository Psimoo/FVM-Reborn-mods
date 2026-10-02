package com.aurora.ui.maogoutd.resource.gamemap.newMap.RabbitYear.Anniversary
{
   import a_4718.b_182;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.crossserver.CrossServerHandler;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   
   public class CoffeeBeanMoveIntruder extends a_4206
   {
      
      public var FULL_HP:int = 20000;
      
      private var HURT_HP:int = this.FULL_HP * 0.2;
      
      private var DEAD_HP:int = 0;
      
      private var m_iAppearedTime:int;
      
      public var m_iDisappearTime:int;
      
      private var m_iWattingTime:int;
      
      private var m_iCanShot:Boolean;
      
      public var m_iSkillDisappear:Boolean;
      
      protected var m_iTimeoutIntval:int = -1;
      
      public var m_OutArray:Array = new Array();
      
      private var m_OutIndex:int;
      
      private var m_iCurrentTimeIntval:uint;
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var m_stCoffeeBeanWaterWave:CoffeeBeanWaterWave;
      
      public function CoffeeBeanMoveIntruder()
      {
         super();
         a_1481 = false;
         a_1279 = -40;
         a_1467 = 0;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(CoffeeBeanMoveIntruder) as CoffeeBeanMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return CoffeeBeanMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         visible = false;
         var info:* = CrossServerHandler.Get().m_sitdownInfo;
         this.m_stRandomSeed.setSeed(info.m_iTableID * 100,1000);
         a_1339 = this.FULL_HP;
         this.HURT_HP = this.FULL_HP * 0.2;
         a_1464 = true;
         a_1463 = true;
         this.m_iCanShot = false;
         BoomIsReduceLife = true;
         this.m_iAppearedTime = 0;
         this.m_iWattingTime = 0;
         this.m_iCurrentTimeIntval = 0;
         this.m_OutIndex = 0;
         tagCom.AddTag(40003);
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         this.ClearShield(m_stCurrentFieldGrid);
         super.a_3940();
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         if(m_stCurrentFieldGrid == null)
         {
            return false;
         }
         if(!a_1460)
         {
            a_1465 = 0;
            a_1460 = true;
            this.m_iAppearedTime = iCurrentTime;
            if(this.m_iSkillDisappear)
            {
               this.m_iWattingTime = 20 * this.m_iDisappearTime + 10;
            }
            a_1283 = m_stCurrentFieldGrid.m_iXGridNo >= 5 ? true : false;
            this.SetIsCannotSee(m_stCurrentFieldGrid.m_stAttackFighter is a_3924);
            this.addShield(m_stCurrentFieldGrid);
            if(iLifeValue > this.HURT_HP)
            {
               a_1275 = 2;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
               if(this.m_stCoffeeBeanWaterWave)
               {
                  this.m_stCoffeeBeanWaterWave.m_iFrameIndex = 2;
                  this.m_stCoffeeBeanWaterWave.gotoAndStop((a_1276[1] as FrameLabel).frame);
               }
            }
            else if(a_1339 > 0)
            {
               a_1275 = 6;
               gotoAndStop((a_1276[5] as FrameLabel).frame);
               if(this.m_stCoffeeBeanWaterWave)
               {
                  this.m_stCoffeeBeanWaterWave.m_iFrameIndex = 6;
                  this.m_stCoffeeBeanWaterWave.gotoAndStop((a_1276[5] as FrameLabel).frame);
               }
            }
         }
         this.m_iCurrentTimeIntval = iCurrentTime;
         if(this.m_iCanShot && !a_1462 && iCurrentTime - this.m_iAppearedTime - 10 > 0 && (iCurrentTime - this.m_iAppearedTime - 10) % (1 * 20) == 0)
         {
            if(iLifeValue > this.HURT_HP)
            {
               a_1275 = 2;
               gotoAndStop((a_1276[3] as FrameLabel).frame);
               if(this.m_stCoffeeBeanWaterWave)
               {
                  this.m_stCoffeeBeanWaterWave.m_iFrameIndex = 2;
                  this.m_stCoffeeBeanWaterWave.gotoAndStop((a_1276[3] as FrameLabel).frame);
               }
            }
            else if(a_1339 > 0)
            {
               a_1275 = 6;
               gotoAndStop((a_1276[7] as FrameLabel).frame);
               if(this.m_stCoffeeBeanWaterWave)
               {
                  this.m_stCoffeeBeanWaterWave.m_iFrameIndex = 6;
                  this.m_stCoffeeBeanWaterWave.gotoAndStop((a_1276[7] as FrameLabel).frame);
               }
            }
         }
         if(this.m_iWattingTime > 0 && this.m_iSkillDisappear)
         {
            --this.m_iWattingTime;
            if(this.m_iWattingTime == 0)
            {
               this.m_iCanShot = false;
               if(iLifeValue > this.HURT_HP)
               {
                  a_1275 = 2;
                  gotoAndStop((a_1276[0] as FrameLabel).frame);
                  if(this.m_stCoffeeBeanWaterWave)
                  {
                     this.m_stCoffeeBeanWaterWave.m_iFrameIndex = 2;
                     this.m_stCoffeeBeanWaterWave.gotoAndStop((a_1276[0] as FrameLabel).frame);
                  }
               }
               else if(a_1339 > 0)
               {
                  a_1275 = 6;
                  gotoAndStop((a_1276[4] as FrameLabel).frame);
                  if(this.m_stCoffeeBeanWaterWave)
                  {
                     this.m_stCoffeeBeanWaterWave.m_iFrameIndex = 6;
                     this.m_stCoffeeBeanWaterWave.gotoAndStop((a_1276[4] as FrameLabel).frame);
                  }
               }
            }
         }
         if(0 == iCurrentTime % 2)
         {
            if(this.m_stCoffeeBeanWaterWave)
            {
               this.m_stCoffeeBeanWaterWave.nextFrame();
            }
            if(a_1273 == 32 || a_1273 == 66)
            {
               this.addShot(m_stCurrentFieldGrid);
            }
            else if(a_1273 == 15 || a_1273 == 49)
            {
               this.m_iCanShot = true;
            }
            else if(a_1273 == 9 || a_1273 == 43)
            {
               this.SetIsCannotSee(true);
               if(m_stCurrentFieldGrid == null)
               {
                  return false;
               }
               this.ClearShield(m_stCurrentFieldGrid);
               ++this.m_OutIndex;
               if(this.m_OutIndex >= this.m_OutArray.length)
               {
                  this.m_OutIndex = 0;
               }
               m_iXGridNo = int(this.m_OutArray[this.m_OutIndex][1]);
               m_iYGridNo = int(this.m_OutArray[this.m_OutIndex][0]);
               stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
               this.m_iTimeoutIntval = setTimeout(this.setAppearToGrid,2 * 1000,stTargetFieldGrid);
            }
            else if(a_1273 == a_1274)
            {
               this.a_3940();
            }
         }
         return true;
      }
      
      protected function addShield(stFieldGrid:a_3491) : Boolean
      {
         if(null == this.m_stCoffeeBeanWaterWave && Boolean(parent))
         {
            this.m_stCoffeeBeanWaterWave = CoffeeBeanWaterWave.a_3926();
         }
         if(this.m_stCoffeeBeanWaterWave != null)
         {
            this.m_stCoffeeBeanWaterWave.a_1797(a_1283);
            if(a_1283)
            {
               this.m_stCoffeeBeanWaterWave.x = x - 0.5 * (stDisplayBitmap.width - this.m_stCoffeeBeanWaterWave.width) + 36;
            }
            else
            {
               this.m_stCoffeeBeanWaterWave.x = x + 0.5 * (stDisplayBitmap.width - this.m_stCoffeeBeanWaterWave.width) - 36;
            }
            this.m_stCoffeeBeanWaterWave.y = y + stDisplayBitmap.y + stDisplayBitmap.height + 0.6 * this.m_stCoffeeBeanWaterWave.height - 86;
            parent.addChildAt(this.m_stCoffeeBeanWaterWave,0);
            if(this.m_stCoffeeBeanWaterWave)
            {
               this.m_stCoffeeBeanWaterWave.visible = this.visible;
            }
         }
         if(stFieldGrid != null && 0 == stFieldGrid.m_iFieldGridType && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_iFieldGridType = 3;
            this.a_3502(stFieldGrid);
         }
         if(stFieldGrid != null && Boolean(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap()))
         {
            stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
         }
         return true;
      }
      
      protected function ClearShield(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid != null && stFieldGrid.m_iFieldGridType == 3)
         {
            stFieldGrid.m_iFieldGridType = 0;
         }
         if(this.m_stCoffeeBeanWaterWave)
         {
            this.m_stCoffeeBeanWaterWave.a_3940();
            this.m_stCoffeeBeanWaterWave = null;
         }
         if(stFieldGrid != null && Boolean(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap()))
         {
            stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().RemoveMoveDisplayObject(this);
         }
         return true;
      }
      
      public function initMouse(stFieldGrid:a_3491) : void
      {
      }
      
      protected function SetIsCannotSee(bIsCannotSee:Boolean, bIsSetVisible:Boolean = true) : void
      {
         SetCannotSeeByFighter(bIsCannotSee);
         this.visible = !bIsCannotSee;
         if(this.m_stCoffeeBeanWaterWave)
         {
            this.m_stCoffeeBeanWaterWave.visible = this.visible;
         }
      }
      
      protected function setAppearToGrid(stNextFieldGrid:a_3491, iYOffset:int = 0) : Boolean
      {
         if(this.m_iTimeoutIntval >= 0)
         {
            clearTimeout(this.m_iTimeoutIntval);
         }
         this.m_iTimeoutIntval = -1;
         if(null == stNextFieldGrid || m_stCurrentFieldGrid == null)
         {
            return false;
         }
         this.x = (stNextFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
         this.y = this.iYPosSkewing + a_3491.a_1081 * stNextFieldGrid.m_iYGridNo + (a_3491.a_1081 - this.height);
         this.ChangeToFieldGrid(stNextFieldGrid);
         stNextFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_LAND_TYPE,stNextFieldGrid);
         this.m_iAppearedTime = this.m_iCurrentTimeIntval;
         if(this.m_iSkillDisappear)
         {
            this.m_iWattingTime = 20 * this.m_iDisappearTime + 10;
         }
         a_1283 = m_stCurrentFieldGrid.m_iXGridNo >= 5 ? true : false;
         this.SetIsCannotSee(m_stCurrentFieldGrid.m_stAttackFighter is a_3924);
         this.addShield(m_stCurrentFieldGrid);
         if(iLifeValue > this.HURT_HP)
         {
            a_1275 = 2;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
            if(this.m_stCoffeeBeanWaterWave)
            {
               this.m_stCoffeeBeanWaterWave.m_iFrameIndex = 2;
               this.m_stCoffeeBeanWaterWave.gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
         }
         else if(a_1339 > 0)
         {
            a_1275 = 6;
            gotoAndStop((a_1276[5] as FrameLabel).frame);
            if(this.m_stCoffeeBeanWaterWave)
            {
               this.m_stCoffeeBeanWaterWave.m_iFrameIndex = 6;
               this.m_stCoffeeBeanWaterWave.gotoAndStop((a_1276[5] as FrameLabel).frame);
            }
         }
         return true;
      }
      
      protected function ChangeToFieldGrid(stNextFieldGrid:a_3491) : Boolean
      {
         if(null == stNextFieldGrid || m_stCurrentFieldGrid == null)
         {
            return false;
         }
         if(m_stCurrentFieldGrid.m_iInitialXGridNo == stNextFieldGrid.m_iInitialXGridNo && m_stCurrentFieldGrid.m_iInitialYGridNo == stNextFieldGrid.m_iInitialYGridNo)
         {
            return true;
         }
         ChangeFieldGrid(stNextFieldGrid);
         return true;
      }
      
      private function iSameField(stNextFieldGrid:a_3491) : Boolean
      {
         if(null == stNextFieldGrid || m_stCurrentFieldGrid == null)
         {
            return false;
         }
         if(m_stCurrentFieldGrid.m_iXGridNo == stNextFieldGrid.m_iXGridNo && m_stCurrentFieldGrid.m_iYGridNo == stNextFieldGrid.m_iYGridNo)
         {
            return true;
         }
         return false;
      }
      
      private function addShot(stFieldGrid:a_3491) : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var tempX2:int = 0;
         var tempY2:int = 0;
         var stLastWaitShot:CoffeeBeanShot = null;
         var numShotXpos:Number = NaN;
         if(stFieldGrid == null && this.m_iCanShot)
         {
            return;
         }
         stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
         if(stTargetFieldGrid != null)
         {
            stLastWaitShot = CoffeeBeanShot.a_4344() as CoffeeBeanShot;
            if(null == stLastWaitShot)
            {
               return;
            }
            numShotXpos = 40;
            if(a_1283)
            {
               numShotXpos = -numShotXpos;
            }
            tempX2 = stTargetFieldGrid.m_iXGridNo * a_3491.a_1080 + 23 + numShotXpos;
            tempY2 = stTargetFieldGrid.m_iYGridNo * a_3491.a_1081 + 32;
            stLastWaitShot.m_isSpecial = a_1283 ? 2 : 1;
            stLastWaitShot.a_1797(0,10,50,tempX2,tempY2,stFieldGrid.m_stCurrentBattbleFieldView,stTargetFieldGrid);
            parent.addChildAt(stLastWaitShot,stFieldGrid.m_stCurrentBattbleFieldView.a_3433());
         }
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(!a_1462)
         {
            super.a_3969(iRduceLifeValue);
         }
         return false;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         if(!a_1462)
         {
            super.a_4209(iRduceLifeValue);
         }
         return false;
      }
      
      override public function a_4210() : Boolean
      {
         if(!a_1462)
         {
            super.a_4210();
         }
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         if(!a_1462)
         {
            if(m_stCurrentFieldGrid)
            {
               a_1339 -= BOOM_INJURE_LIFE;
            }
            else
            {
               a_1339 = 0;
            }
            if(a_1339 <= 0)
            {
               if(m_stCurrentFieldGrid)
               {
                  m_stCurrentFieldGrid.a_3457(this);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
               }
               this.a_3940();
            }
         }
         return true;
      }
      
      override public function a_4213() : Boolean
      {
         if(!a_1462)
         {
            a_1339 -= BOOM_INJURE_LIFE;
            if(a_1339 <= 0)
            {
               if(m_stCurrentFieldGrid)
               {
                  m_stCurrentFieldGrid.a_3457(this);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
               }
               this.a_3940();
            }
         }
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 <= 0)
         {
            if(a_1275 != 8)
            {
               a_1275 = 8;
               gotoAndStop((a_1276[8] as FrameLabel).frame);
            }
            a_3419();
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
         return true;
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null || a_1462)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption();
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
   }
}

