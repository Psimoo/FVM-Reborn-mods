package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.DietaryFarm
{
   import a_4718.b_180;
   import a_4718.b_182;
   import a_4728.a_1778;
   import a_4729.a_1789;
   import a_4752.a_2036;
   import a_4754.a_2161;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.GameCardView;
   import com.aurora.ui.maogoutd.game.Util.BattleCardDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.energy.a_4157;
   import com.aurora.ui.maogoutd.resource.energy.a_4162;
   import flash.display.DisplayObjectContainer;
   import flash.display.FrameLabel;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.setTimeout;
   
   public class DietaryFarmJuBaoMoveIntruder extends a_4206
   {
      
      private var MAX_INJURED_LIFE:int = 1;
      
      private var MAX_LIFE:int = 1;
      
      private var DAMAGE_MAX:int = 100000;
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var m_iState:int = 0;
      
      private var m_stGridArray:Array;
      
      private var m_iWaitTick:int = 0;
      
      private var m_numXMoveSpeed:Number;
      
      private var m_numYMoveSpeed:Number;
      
      private var m_iReduceLife:Number = 0;
      
      private var m_iRunTime:int = 0;
      
      private var m_bMoving:Boolean = false;
      
      private var m_iHasMoveTime:int = 0;
      
      private var m_iMoveTime:int = 0;
      
      private var m_iEndMoveX:Number = 0;
      
      private var m_iEndMoveY:Number = 0;
      
      private var m_iSkillCount:int = 0;
      
      private var m_bHasCard:Boolean = false;
      
      public function DietaryFarmJuBaoMoveIntruder()
      {
         super();
         a_1279 = -45;
         m_iYDisplayCenterPos = -10;
      }
      
      public static function a_3926() : DietaryFarmJuBaoMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(DietaryFarmJuBaoMoveIntruder) as DietaryFarmJuBaoMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return DietaryFarmJuBaoMoveIntruderMovie;
      }
      
      public function InitData(fullHP:int, deadHP:int, arr:Array, waitTick:int) : void
      {
         this.MAX_LIFE = fullHP;
         this.MAX_INJURED_LIFE = deadHP;
         this.m_stGridArray = arr;
         this.m_iWaitTick = waitTick;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = 0;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = this.MAX_LIFE;
         a_1272 = 0;
         a_1481 = false;
         a_1464 = true;
         a_1463 = true;
         BoomIsReduceLife = true;
         this.m_iRunTime = 0;
         this.m_iState = 0;
         this.m_numXMoveSpeed = 0;
         this.m_numXMoveSpeed = 0;
         SetCannotSeeByFighter(true);
         a_1465 = 1;
         this.m_bMoving = false;
         this.m_iSkillCount = 0;
         this.m_bHasCard = false;
         a_1789.getInstance().addEventListener("Boom_JunBao_Mouse",this.On_Boom_JunBao_Mouse);
         return true;
      }
      
      private function On_Boom_JunBao_Mouse(e:a_1778) : void
      {
         var tagIndex:int = 0;
         var i:int = 0;
         if(this.m_iState != 3)
         {
            tagIndex = -1;
            for(i = 0; i < 20; i++)
            {
               if(a_2036.getInstance().tagCom.HasTag(300 + i))
               {
                  tagIndex = 300 + i;
               }
            }
            if(tagIndex != -1)
            {
               a_2036.getInstance().tagCom.RemoveTag(tagIndex);
            }
            this.ProdudeEnergy();
            SetCannotSeeByFighter(false);
            a_1465 = 0;
            this.SetStep(3);
         }
      }
      
      private function ProdudeEnergy() : void
      {
         var stFreeEnergy:a_4157 = null;
         for(var iIndex:int = 0; iIndex < 8; iIndex++)
         {
            stFreeEnergy = a_4162.getInstance().a_4163(b_180.a_420);
            if(null != stFreeEnergy)
            {
               stFreeEnergy.m_stCurrentBattleField = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView;
               stFreeEnergy.a_1797(0,100,x - 110 + iIndex * 20,y - 78);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stFreeEnergy,BattleLayerDefine.EFFECTS_TOP_TYPE);
               setTimeout(this.onDispathEvent,500,stFreeEnergy);
            }
         }
      }
      
      private function onDispathEvent(stFreeEnergy:a_4157) : void
      {
         stFreeEnergy.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_OVER));
      }
      
      protected function GetiNoY() : int
      {
         var iYGridNo:int = int(y / a_3491.a_1081);
         if(iYGridNo < 0)
         {
            iYGridNo = 0;
         }
         if(iYGridNo >= BattleFieldView.a_1012 - 1)
         {
            iYGridNo = BattleFieldView.a_1012 - 1;
         }
         return iYGridNo;
      }
      
      override protected function GetiNoX() : int
      {
         var iXGridNo:int = int(x / a_3491.a_1080);
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - iXGridNo;
         }
         if(iXGridNo < 0)
         {
            iXGridNo = 0;
         }
         if(iXGridNo >= BattleFieldView.a_1011 - 1)
         {
            iXGridNo = BattleFieldView.a_1011 - 1;
         }
         return iXGridNo;
      }
      
      public function Down2Move() : void
      {
         SetCannotSeeByFighter(true);
         a_1465 = 1;
         this.setMoveToPosition((this.m_stRandomSeed.nextInt(BattleFieldView.a_1011) + 0.5) * a_3491.a_1080,(this.m_stRandomSeed.nextInt(BattleFieldView.a_1012) + 0.5) * a_3491.a_1081,60 / (20 * 0.8));
      }
      
      override protected function a_3940() : Boolean
      {
         a_1789.getInstance().removeEventListener("Boom_JunBao_Mouse",this.On_Boom_JunBao_Mouse);
         super.a_3940();
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 <= 0 && a_1275 != 11)
         {
            a_1275 = 11;
            gotoAndStop((a_1276[11] as FrameLabel).frame);
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
      
      public function ChangeDamage(iRduceLifeValue:int) : int
      {
         if(this.m_iReduceLife < this.DAMAGE_MAX)
         {
            this.m_iReduceLife += iRduceLifeValue;
            if(this.m_iReduceLife > this.DAMAGE_MAX)
            {
               return iRduceLifeValue - (this.m_iReduceLife - this.DAMAGE_MAX);
            }
            return iRduceLifeValue;
         }
         return 0;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(_damageParam.indexOf(110) != -1)
         {
            super.a_3969(iRduceLifeValue);
            return true;
         }
         if(this.m_iState != 3)
         {
            return true;
         }
         iRduceLifeValue = this.ChangeDamage(iRduceLifeValue);
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         if(this.m_iState != 3)
         {
            return true;
         }
         iRduceLifeValue = this.ChangeDamage(iRduceLifeValue);
         super.a_4209(iRduceLifeValue);
         return true;
      }
      
      override public function ReduceAllLife(iRduceLifeValue:int, bIsIgnoreArmor:Boolean = false, ishowHuijing:Boolean = false) : Boolean
      {
         if(this.m_iState != 3)
         {
            return true;
         }
         iRduceLifeValue = this.ChangeDamage(iRduceLifeValue);
         super.ReduceAllLife(iRduceLifeValue,bIsIgnoreArmor,ishowHuijing);
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      public function SetStep(iState:int) : void
      {
         var arr:Array = null;
         this.m_numXMoveSpeed = 0;
         this.m_numYMoveSpeed = 0;
         this.m_iReduceLife = 0;
         this.m_iRunTime = 0;
         this.m_iHasMoveTime = 0;
         this.m_bMoving = false;
         if(iState == 0)
         {
            this.SetAnimation(0,0);
            this.Down2Move();
         }
         else if(iState == 1)
         {
            arr = this.m_stGridArray[this.m_stRandomSeed.nextInt(this.m_stGridArray.length)];
            this.setMoveToPosition((arr[0] + 0.5) * a_3491.a_1080,(arr[1] + 0.5) * a_3491.a_1081,60 / (20 * 0.5));
         }
         else if(iState == 2)
         {
            this.SetAnimationOnce2Loop(2,3,2,3);
         }
         else if(iState == 3)
         {
            this.SetAnimationOnce2Loop(5,6,8,9);
         }
         this.m_iState = iState;
      }
      
      private function ChangeGrid() : void
      {
         var stNextFieldGrid:a_3491 = null;
         var iXGridNo:int = this.GetiNoX();
         var iYGridNo:int = this.GetiNoY();
         if(m_stCurrentFieldGrid.m_iXGridNo != iXGridNo || m_stCurrentFieldGrid.m_iYGridNo != iYGridNo)
         {
            stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
            ChangeFieldGrid(stNextFieldGrid);
            trace("改变格子::" + stNextFieldGrid.m_iXGridNo + "--" + stNextFieldGrid.m_iYGridNo);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.addChildAt(this,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3440(iYGridNo));
            if(stNextFieldGrid.m_stBaseLander != null)
            {
               SetClarmLanderTime();
            }
         }
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var enterRoom:Object = null;
         var numOrigXPos:Number = x;
         if(!a_1460)
         {
            a_1460 = true;
            enterRoom = a_2161.e.getEnterRoom();
            this.m_stRandomSeed.setSeed(enterRoom.m_RandomSeed,1000);
            this.SetStep(0);
            ++this.m_iSkillCount;
         }
         if(this.m_bMoving)
         {
            ++this.m_iHasMoveTime;
            x += this.m_numXMoveSpeed;
            y += this.m_numYMoveSpeed;
         }
         if(this.m_numXMoveSpeed <= 0)
         {
            a_1283 = false;
         }
         else
         {
            a_1283 = true;
         }
         this.ChangeGrid();
         ++this.m_iRunTime;
         if(this.m_iState == 0)
         {
            if(this.m_iHasMoveTime >= this.m_iMoveTime)
            {
               x = this.m_iEndMoveX;
               y = this.m_iEndMoveY;
               this.ChangeGrid();
               this.Down2Move();
            }
            if(this.m_iRunTime == 20 * 10)
            {
               this.SetStep(1);
            }
         }
         else if(this.m_iState == 1)
         {
            if(this.m_iHasMoveTime >= this.m_iMoveTime)
            {
               x = this.m_iEndMoveX;
               y = this.m_iEndMoveY;
               this.ChangeGrid();
               this.SetStep(2);
            }
         }
         else if(this.m_iState == 2)
         {
            if(this.m_iRunTime == 24)
            {
               this.m_bHasCard = this.m_iSkillCount % 3 != 0;
               if(this.m_bHasCard)
               {
                  this.SetAnimationOnce2Loop(4,3,4,3);
               }
               else
               {
                  this.AddOneTimeChangeEffect();
               }
            }
            else if(this.m_bHasCard == true && this.m_iRunTime == 32)
            {
               this.a_3502(m_stCurrentFieldGrid);
            }
            else if(this.m_bHasCard == true && this.m_iRunTime == 50)
            {
               this.SetStep(0);
               ++this.m_iSkillCount;
            }
            else if(this.m_bHasCard == false && this.m_iRunTime == 90)
            {
               this.SetStep(0);
               ++this.m_iSkillCount;
            }
         }
         else if(this.m_iState == 3)
         {
            if(this.m_iRunTime == 130)
            {
               this.SetAnimationOnce2Loop(7,0,10,0);
               ++this.m_iSkillCount;
            }
            if(iCurrentTime % 2 == 1 && (a_1273 == 74 || a_1273 == 115))
            {
               this.SetPosition(4,3);
               this.SetStep(1);
            }
         }
         SetGameMapModePicnicPosition(numOrigXPos);
         return true;
      }
      
      private function SetPosition(iNoX:int, iNoY:int) : void
      {
         x = (iNoX + 0.5) * a_3491.a_1080;
         y = (iNoY + 0.5) * a_3491.a_1081;
         this.ChangeGrid();
      }
      
      private function AddOneTimeChangeEffect() : void
      {
         var battleView:BattleFieldView = null;
         var count:int = 0;
         var timeChangeEffect:DietaryFarmCardClawEffect = null;
         var stRootLocalPoint:Point = null;
         var gameCardView3:GameCardView = null;
         battleView = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView;
         var gameCardView1:GameCardView = null;
         var gameCardView2:GameCardView = null;
         var gameCardView:GameCardView = null;
         count = 0;
         for(var i:int = 0; i < BattleCardDefine.MAX_HAND_CARD_NUM; i++)
         {
            gameCardView3 = battleView.GetGameCardViewByIndex(i);
            if(gameCardView3 == null)
            {
               break;
            }
            if(a_2036.getInstance().tagCom.HasTag(300 + i))
            {
               count++;
               gameCardView2 = gameCardView3;
            }
            else if(gameCardView1 == null && gameCardView3.iGrowTimes <= 0)
            {
               gameCardView1 = gameCardView3;
            }
         }
         if(count < 5)
         {
            gameCardView = gameCardView1;
         }
         else
         {
            gameCardView = gameCardView2;
         }
         if(gameCardView == null)
         {
            gameCardView = battleView.GetGameCardViewByIndex(0);
         }
         timeChangeEffect = DietaryFarmCardClawEffect.a_3926();
         timeChangeEffect.a_1797(false);
         timeChangeEffect.x = gameCardView.x - 150 + (gameCardView.parent.x - 114);
         timeChangeEffect.y = gameCardView.y - 50;
         battleView.AddToBattleView(timeChangeEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,m_stCurrentFieldGrid);
         timeChangeEffect.battleView = battleView;
         if(count < 5)
         {
            timeChangeEffect.AddGameCardView(gameCardView);
         }
         else
         {
            timeChangeEffect.AddGameCardView(null);
         }
         var stGlobalPoint:Point = timeChangeEffect.parent.localToGlobal(new Point(timeChangeEffect.x,timeChangeEffect.y));
         stRootLocalPoint = root.globalToLocal(stGlobalPoint);
         timeChangeEffect.x = stRootLocalPoint.x;
         timeChangeEffect.y = stRootLocalPoint.y;
         var stRootContainer:DisplayObjectContainer = root as DisplayObjectContainer;
         if(timeChangeEffect.parent.contains(timeChangeEffect))
         {
            timeChangeEffect.parent.removeChild(timeChangeEffect);
         }
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(timeChangeEffect,BattleLayerDefine.EFFECTS_TOP_TYPE);
         stRootContainer.addChild(timeChangeEffect);
         timeChangeEffect.play();
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_arrEffectArray.push(timeChangeEffect);
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption();
      }
      
      override public function play() : void
      {
         super.play();
      }
      
      protected function setMoveToPosition(fPosX:Number, fPosY:Number, fMoveSpeed:Number) : void
      {
         this.m_bMoving = true;
         this.m_iHasMoveTime = 0;
         var fDistanceX:Number = fPosX - this.x;
         var fDistanceY:Number = fPosY - this.y;
         var fDistance:Number = Math.max(Math.abs(fDistanceX),Math.abs(fDistanceY));
         var iMoveTick:int = fDistance / Math.abs(fMoveSpeed);
         if(iMoveTick > 0)
         {
            this.m_numYMoveSpeed = fDistanceY / iMoveTick;
            this.m_numXMoveSpeed = fDistanceX / iMoveTick;
         }
         this.m_iMoveTime = iMoveTick;
         this.m_iEndMoveX = fPosX;
         this.m_iEndMoveY = fPosY;
      }
      
      public function SetAnimation(animIdx:int, animIdx2:int) : void
      {
         if(a_1275 != animIdx)
         {
            if(a_1339 > 0 && a_1339 < this.MAX_INJURED_LIFE)
            {
               a_1275 = animIdx2;
               gotoAndStop((a_1276[animIdx2] as FrameLabel).frame);
            }
            else
            {
               a_1275 = animIdx;
               gotoAndStop((a_1276[animIdx] as FrameLabel).frame);
            }
            a_3419();
         }
      }
      
      public function SetAnimationOnce2Loop(onceAnimIdx:int, loopAnimIdx:int, onceAnimIdx2:int, loopAnimIdx2:int) : void
      {
         if(a_1339 > 0 && a_1339 < this.MAX_INJURED_LIFE)
         {
            a_1275 = loopAnimIdx2;
            gotoAndStop((a_1276[onceAnimIdx2] as FrameLabel).frame);
         }
         else
         {
            a_1275 = loopAnimIdx;
            gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         }
         a_3419();
      }
   }
}

