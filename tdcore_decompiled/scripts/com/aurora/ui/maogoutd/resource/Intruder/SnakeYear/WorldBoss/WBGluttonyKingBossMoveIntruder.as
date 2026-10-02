package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.WorldBoss
{
   import a_4718.b_182;
   import a_4728.a_1778;
   import a_4729.a_1789;
   import a_4754.a_2161;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.Util.BattleRandomUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   
   public class WBGluttonyKingBossMoveIntruder extends BaseBossMoveIntruder
   {
      
      private static const MOVE_SPEED:Number = 8.5;
      
      protected var m_stBossBloodDataEvent2:a_1778;
      
      protected var _bossStep:int = -1;
      
      protected var _battleView:BattleFieldView;
      
      protected var _MAXLifeValue:int;
      
      protected var _ReduceOneStepLifeValue:int;
      
      protected var _Reduce2ShieldLifeValue:int;
      
      protected var _ReduceLifeInNoShield:int = 0;
      
      protected var _brokenTick:int = -1;
      
      protected var _iTimeNum:int = 0;
      
      protected var armorLife:int = 0;
      
      protected var m_numYSpeed:int = 0;
      
      protected var a_1581:int = 0;
      
      protected var m_numXSpeed:int = 0;
      
      protected var iLastNoX:int = -1;
      
      protected var iLastNoY:int = -1;
      
      protected var m_iCount:int = 0;
      
      protected var m_bHasShield:Boolean = false;
      
      public function WBGluttonyKingBossMoveIntruder()
      {
         super();
         IsNeedShadow = false;
         m_fOrginSpeed = MOVE_SPEED;
         a_1279 = -142;
         a_1467 = -75;
         this.m_stBossBloodDataEvent2 = new a_1778("WorldBossBloodProgress");
      }
      
      override protected function UpdateBossBloodProgress() : void
      {
         var bloodObj:Object = null;
         var maxLife:int = 0;
         if(Boolean(root) && a_1460)
         {
            bloodObj = new Object();
            maxLife = numHardRate * 15000;
            if(m_InitialLifeValue != 0)
            {
               maxLife = m_InitialLifeValue;
            }
            bloodObj.now = a_1339 / maxLife;
            bloodObj.all = (a_1339 + this.armorLife) / maxLife;
            if(HasTag(11))
            {
               bloodObj.leaveCount = 15 - this.m_iCount;
               bloodObj.activeProgress = this._ReduceLifeInNoShield / this._Reduce2ShieldLifeValue;
            }
            else if(HasTag(13))
            {
               bloodObj.leaveCount = 3 - this.m_iCount;
               bloodObj.activeProgress = this._ReduceLifeInNoShield / this._Reduce2ShieldLifeValue;
            }
            else
            {
               bloodObj.leaveCount = 0;
               bloodObj.activeProgress = 1;
            }
            bloodObj.hasShield = this.m_bHasShield;
            m_stBossBloodDataEvent.dataObjectNew = bloodObj;
            root.dispatchEvent(m_stBossBloodDataEvent);
         }
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         var b:Boolean = false;
         b = super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         m_bSkillIsOrder = true;
         a_1465 = 0;
         return b;
      }
      
      public function RecoverLife2Armor(armorValue:int) : void
      {
         this.armorLife += armorValue;
         this.UpdateBossBloodProgress();
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
         this.SetRandomSeed();
         InitSkillCache();
         InitShadow();
         m_fOrginSpeed = a_3491.a_1080 / 10;
         this.m_bHasShield = false;
         a_1463 = true;
         this.m_iCount = 0;
         this._ReduceLifeInNoShield = 0;
         this._battleView = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView;
         this.armorLife = 0;
         this._brokenTick = -1;
         this._iTimeNum = 0;
         var iBuffID:int = m_iViewBuffId;
         if(iBuffID != 0)
         {
            if(iBuffID == 320012288)
            {
               AddTag(11);
            }
            else if(iBuffID == 320012304)
            {
               AddTag(13);
            }
            else if(iBuffID == 320012320)
            {
               AddTag(14);
            }
         }
         this.UpdateBossBloodProgress();
      }
      
      protected function CallChangeStep() : void
      {
         var stAurDataEvent:a_1778 = new a_1778("FastFoodStepChange");
         stAurDataEvent.dataObject = [this._bossStep + 1];
         a_1789.getInstance().dispatchEvent(stAurDataEvent);
      }
      
      override public function get width() : Number
      {
         return 100;
      }
      
      override public function get height() : Number
      {
         return 165;
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
      
      protected function shuffleArray(arr:Array) : Array
      {
         return BattleRandomUtil.ShuffleArray(arr,m_stRandomSeed);
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
      
      protected function GetRandomPos(array:Array) : void
      {
         if(m_stRandomSeed == null && array.length > 0)
         {
            this.iLastNoX = array[0][1];
            this.iLastNoY = array[0][0];
            return;
         }
         var j:int = int(m_stRandomSeed.nextInt(array.length));
         var iNoX:int = int(array[j][1]);
         var iNoY:int = int(array[j][0]);
         var count:int = 0;
         while(iNoX == this.iLastNoX || iNoY == this.iLastNoY)
         {
            j = int(m_stRandomSeed.nextInt(array.length));
            iNoX = int(array[j][1]);
            iNoY = int(array[j][0]);
            if(++count > 8)
            {
               break;
            }
         }
         this.iLastNoX = iNoX;
         this.iLastNoY = iNoY;
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
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
         if(null != stFieldGrid.m_stBoomDefense)
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
      
      protected function DispatchDamage(damage:int, bDouble:Boolean) : void
      {
         var obj:Object = null;
         if(Boolean(root) && a_1460)
         {
            obj = new Object();
            obj.damage = damage;
            obj.bDouble = bDouble;
            this.m_stBossBloodDataEvent2.dataObjectNew = obj;
            root.dispatchEvent(this.m_stBossBloodDataEvent2);
         }
      }
      
      private function ReduceArmor(iRduceLifeValue:int) : int
      {
         if(this.armorLife > 0)
         {
            if(this.armorLife >= iRduceLifeValue)
            {
               this.armorLife -= iRduceLifeValue;
               iRduceLifeValue = 0;
            }
            else
            {
               iRduceLifeValue -= this.armorLife;
               this.armorLife = 0;
            }
         }
         return iRduceLifeValue;
      }
      
      override public function ReduceLife2(iRduceLifeValue:int, damageParams:Array = null) : Boolean
      {
         if(damageParams.indexOf(111) != -1)
         {
            if(this._bossStep == 1)
            {
               iRduceLifeValue = 20000;
            }
            else if(this._bossStep == 2)
            {
               iRduceLifeValue = 40000;
            }
            else if(this._bossStep == 3)
            {
               iRduceLifeValue = 80000;
            }
         }
         return super.ReduceLife2(iRduceLifeValue,damageParams);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         var iOldLifeValue:int = 0;
         if(a_1339 <= 0)
         {
            return false;
         }
         var bDouble:Boolean = false;
         var iOldLife:int = iLifeValue;
         if(HasTag(15))
         {
            iRduceLifeValue *= 1.05;
         }
         if(HasTag(11) || HasTag(13))
         {
            if(this.m_bHasShield)
            {
               _damageParam.push(108);
               super.a_3969(iRduceLifeValue);
               _damageParam.length = 0;
            }
            else
            {
               iOldLifeValue = iLifeValue;
               if(this._brokenTick >= 0 && this._iTimeNum - this._brokenTick < 200)
               {
                  iRduceLifeValue *= 2;
                  bDouble = true;
               }
               iRduceLifeValue = this.ReduceArmor(iRduceLifeValue);
               super.a_3969(iRduceLifeValue);
               this._ReduceLifeInNoShield += Math.max(iOldLifeValue - iLifeValue,0);
               if(this._ReduceLifeInNoShield >= this._Reduce2ShieldLifeValue)
               {
                  this.CreateShiled();
               }
            }
         }
         else
         {
            iRduceLifeValue = this.ReduceArmor(iRduceLifeValue);
            super.a_3969(iRduceLifeValue);
         }
         var iReduce:int = iOldLife - Math.max(iLifeValue,0);
         this.DispatchDamage(iReduce,bDouble);
         this.OnReduceLife(iReduce);
         if(iLifeValue < this._ReduceOneStepLifeValue * 5 && this._bossStep == 3)
         {
            a_1339 += this._ReduceOneStepLifeValue * 3;
         }
         this.UpdateBossBloodProgress();
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         var iOldLifeValue:int = 0;
         if(a_1339 <= 0)
         {
            return false;
         }
         var bDouble:Boolean = false;
         var iOldLife:int = iLifeValue;
         if(HasTag(14))
         {
            iRduceLifeValue *= 1.05;
         }
         if(HasTag(11) || HasTag(13))
         {
            if(this.m_bHasShield)
            {
               _damageParam.push(108);
               super.a_4209(iRduceLifeValue);
               _damageParam.length = 0;
            }
            else
            {
               iOldLifeValue = iLifeValue;
               if(this._brokenTick >= 0 && this._iTimeNum - this._brokenTick < 200)
               {
                  iRduceLifeValue *= 2;
                  bDouble = true;
               }
               iRduceLifeValue = this.ReduceArmor(iRduceLifeValue);
               super.a_4209(iRduceLifeValue);
               this._ReduceLifeInNoShield += Math.max(iOldLifeValue - iLifeValue,0);
               if(this._ReduceLifeInNoShield >= this._Reduce2ShieldLifeValue)
               {
                  this.CreateShiled();
               }
            }
         }
         else
         {
            iRduceLifeValue = this.ReduceArmor(iRduceLifeValue);
            super.a_4209(iRduceLifeValue);
         }
         var iReduce:int = iOldLife - Math.max(iLifeValue,0);
         this.DispatchDamage(iReduce,bDouble);
         this.OnReduceLife(iReduce);
         if(iLifeValue < this._ReduceOneStepLifeValue * 5 && this._bossStep == 3)
         {
            a_1339 += this._ReduceOneStepLifeValue * 3;
         }
         this.UpdateBossBloodProgress();
         return true;
      }
      
      public function OnReduceLife(iReduce:int) : void
      {
      }
      
      protected function CreateShiled() : void
      {
         this.m_bHasShield = true;
         this._ReduceLifeInNoShield = 0;
         this._brokenTick = -1;
         this.UpdateBossBloodProgress();
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_433 == iEffectType || b_182.enm_shotEffectFreezeStop == iEffectType || b_182.a_434 == iEffectType)
         {
            if(this.m_bHasShield && HasTag(11))
            {
               ++this.m_iCount;
               if(this.m_iCount == 15)
               {
                  this.BrokenShiled();
               }
               this.UpdateBossBloodProgress();
            }
         }
         super.a_4208(iEffectType,iEffectTime,stBaseEffect);
      }
      
      private function BrokenShiled() : void
      {
         if(this.m_bHasShield)
         {
            this._brokenTick = this._iTimeNum;
            this.m_bHasShield = false;
            this.m_iCount = 0;
         }
      }
      
      override public function PowerfulBombReduceLifeRate(fRate:Number = 0.3, bIsIgnoreArmor:Boolean = false) : Boolean
      {
         if(a_1339 <= 0)
         {
            return false;
         }
         if(bIsIgnoreArmor)
         {
            this.a_4209(BOOM_INJURE_LIFE * fRate);
         }
         else
         {
            this.a_3969(BOOM_INJURE_LIFE * fRate);
         }
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         if(this.m_bHasShield && HasTag(13))
         {
            ++this.m_iCount;
            if(this.m_iCount == 3)
            {
               this.BrokenShiled();
            }
            this.UpdateBossBloodProgress();
         }
         return super.a_4210();
      }
      
      public function GetStep() : int
      {
         return this._bossStep;
      }
   }
}

