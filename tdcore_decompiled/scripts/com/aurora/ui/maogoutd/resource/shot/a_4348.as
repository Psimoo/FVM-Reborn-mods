package com.aurora.ui.maogoutd.resource.shot
{
   import a_4715.EncrypBooleanEx;
   import a_4715.EncrypNumber;
   import a_4718.b_182;
   import a_4718.b_183;
   import a_4752.TagComponent;
   import a_4752.a_2036;
   import com.aurora.ui.maogoutd.ClientLog.MessageTipHandler;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.Base.AttackDefenseParams;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import com.aurora.ui.maogoutd.resource.defender.SnakeYear.yinyangSnake.effect.IntruderBloodEffect;
   import com.aurora.ui.maogoutd.resource.defender.a_3959;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.shot.ShotTrigger.BaseShotTrigger;
   import flash.display.FrameLabel;
   import flash.geom.Point;
   import flash.utils.getTimer;
   
   public class a_4348 extends a_3909
   {
      
      public var m_bActive:EncrypBooleanEx = new EncrypBooleanEx(false);
      
      public var m_isSpecial:int = 0;
      
      public var m_SplitBulletCount:int = 0;
      
      public var m_SplitBulletMul:Number = 1;
      
      public var m_iSuperShotType:int = 0;
      
      public var m_iRandomArrOne:Array = new Array();
      
      public var m_iRandomArrTwo:Array = new Array();
      
      public var m_iShowBloodHot:Number = 0;
      
      public var m_iCopy:Boolean;
      
      public var m_iCrossFireAllGride:Boolean;
      
      public var m_iCanHitGostMouse:Boolean;
      
      private var m_iGlobalIDEx:int = 0;
      
      public var m_ShowAshEffectType:int;
      
      public var m_iBothWayShot:Boolean;
      
      private var s_GlobalShotID:int = 0;
      
      protected var _damageParams:Array = [];
      
      private var m_iShotTypeIDEx:int = 0;
      
      protected var m_iNumHotMultiplier:Number = 0;
      
      private var m_numColdSlowMultiplierEx:Number = 0;
      
      private var m_numPoisonMultiplierEx:EncrypNumber;
      
      private var m_numMoveSpeedMultiplierEx:EncrypNumber;
      
      private var m_iLastAuxiliaryFighterXGridNoEx:int = 0;
      
      private var m_PoisonHurtPower:Number = 0;
      
      private var m_iShotLightTimeEx:int = 0;
      
      protected var m_iColdSlowTimeEx:int = 0;
      
      private var m_isHurtIgnoreArmorEx:Boolean = false;
      
      private var m_isParabolaPathEx:Boolean = false;
      
      private var m_isCanAddAuxiliaryEx:Boolean = true;
      
      private var m_isCanBounceByAuxiliaryEx:Boolean = true;
      
      private var m_isCanCrossFireAuxiliaryEx:Boolean = true;
      
      private var m_isChangeYGridNoEx:Boolean = false;
      
      private var m_isFollowingShotEx:Boolean = false;
      
      private var m_isShotHighSkySpaceEx:Boolean = false;
      
      protected var m_iHurtPowerEx:int = 0;
      
      private var m_iShotSequenceNumEx:int = 0;
      
      private var m_iShotGroupIndexEx:int = 0;
      
      private var m_numXSpeedEx:EncrypNumber;
      
      private var m_numYSpeedEx:EncrypNumber;
      
      private var m_iStartMoveTimeEx:int = 0;
      
      private var m_iMoveTotalTimeEx:int = 0;
      
      private var m_iThreeRowShotTypeEx:int = 0;
      
      protected var a_1583:BattleFieldView;
      
      private var m_iYGridNoEx:int = 0;
      
      protected var a_1584:a_3491;
      
      private var m_iStartXPosEx:int = 0;
      
      private var m_iStartYPosEx:int = 0;
      
      public var m_HitMouseArray:Array = new Array();
      
      public var m_arrTempIntruderArray:Array = new Array();
      
      public var m_isShowColdSlow:Boolean = false;
      
      public var m_isShowPoisonGas:Boolean = false;
      
      private var m_isPenetrateEx:Boolean = false;
      
      private var m_iIsHited:int = 0;
      
      private var m_iHitFrameIndexEx:int = 0;
      
      private var m_isPlayMoveEx:Boolean = false;
      
      public var m_iInitTime:int = 0;
      
      public var attackParam:AttackDefenseParams;
      
      protected var m_iFollowingShotSpaceState:int;
      
      public var ms_iShotLen:int = 4;
      
      public var ms_iCritFrameLable:int = 0;
      
      protected var m_triggers:Vector.<BaseShotTrigger> = new Vector.<BaseShotTrigger>();
      
      protected var m_PTMoveIntruder:a_4206;
      
      protected var m_PTFieldGrid:a_3491;
      
      protected var m_PTPosition:Point;
      
      protected var m_ProtationRadian:Number = 1.0471975511965976;
      
      protected var m_PrealXSpeed:Number;
      
      protected var m_PbaseYDirection:Number;
      
      protected var m_PStartY:Number;
      
      protected var m_PStartX:Number;
      
      protected var m_PMoveTime:int;
      
      public var m_PTargetXGridNo:int = 0;
      
      public var m_PTargetYGridNo:int = 0;
      
      public var tagCom:TagComponent = new TagComponent();
      
      public function a_4348()
      {
         mouseEnabled = false;
         super();
      }
      
      protected function get GlobalShotID() : int
      {
         return this.s_GlobalShotID;
      }
      
      protected function get m_iGlobalID() : int
      {
         return this.m_iGlobalIDEx;
      }
      
      protected function set m_iGlobalID(value:int) : void
      {
         this.m_iGlobalIDEx = value;
      }
      
      protected function get a_1304() : int
      {
         return this.m_iShotTypeIDEx;
      }
      
      protected function set a_1304(value:int) : void
      {
         this.m_iShotTypeIDEx = value;
      }
      
      public function GetShotTypeID() : int
      {
         return this.a_1304;
      }
      
      private function NormalizeMulitplierValue(value:Number) : Number
      {
         value += 1e-7;
         return Math.floor(value * 10000) / 10000;
      }
      
      protected function set a_1325(value:Number) : void
      {
         this.m_iNumHotMultiplier = this.NormalizeMulitplierValue(value);
      }
      
      protected function get a_1325() : Number
      {
         return this.m_iNumHotMultiplier;
      }
      
      protected function get a_1326() : Number
      {
         return this.m_numColdSlowMultiplierEx;
      }
      
      protected function set a_1326(value:Number) : void
      {
         this.m_numColdSlowMultiplierEx = this.NormalizeMulitplierValue(value);
      }
      
      protected function get a_1327() : Number
      {
         if(!this.m_numPoisonMultiplierEx)
         {
            this.m_numPoisonMultiplierEx = new EncrypNumber();
         }
         return this.m_numPoisonMultiplierEx.Value;
      }
      
      protected function set a_1327(value:Number) : void
      {
         if(!this.m_numPoisonMultiplierEx)
         {
            this.m_numPoisonMultiplierEx = new EncrypNumber();
         }
         this.m_numPoisonMultiplierEx.Value = value;
      }
      
      protected function get m_numMoveSpeedMultiplier() : Number
      {
         if(!this.m_numMoveSpeedMultiplierEx)
         {
            this.m_numMoveSpeedMultiplierEx = new EncrypNumber();
         }
         return this.m_numMoveSpeedMultiplierEx.Value;
      }
      
      protected function set m_numMoveSpeedMultiplier(value:Number) : void
      {
         if(!this.m_numMoveSpeedMultiplierEx)
         {
            this.m_numMoveSpeedMultiplierEx = new EncrypNumber();
         }
         this.m_numMoveSpeedMultiplierEx.Value = value;
      }
      
      public function set m_MoveSpeedMultiplier(value:Number) : void
      {
         if(!this.m_numMoveSpeedMultiplierEx)
         {
            this.m_numMoveSpeedMultiplierEx = new EncrypNumber();
         }
         this.m_numMoveSpeedMultiplierEx.Value = value;
      }
      
      protected function get a_1571() : int
      {
         return this.m_iLastAuxiliaryFighterXGridNoEx;
      }
      
      protected function set a_1571(value:int) : void
      {
         this.m_iLastAuxiliaryFighterXGridNoEx = value;
      }
      
      public function get PoisonHurtPower() : Number
      {
         return this.m_PoisonHurtPower;
      }
      
      public function set PoisonHurtPower(value:Number) : void
      {
         this.m_PoisonHurtPower = value;
      }
      
      protected function get a_1573() : int
      {
         return this.m_iShotLightTimeEx;
      }
      
      protected function set a_1573(value:int) : void
      {
         this.m_iShotLightTimeEx = value;
      }
      
      protected function get a_1574() : int
      {
         return this.m_iColdSlowTimeEx;
      }
      
      protected function set a_1574(value:int) : void
      {
         this.m_iColdSlowTimeEx = value;
      }
      
      protected function get a_1575() : Boolean
      {
         return this.m_isHurtIgnoreArmorEx;
      }
      
      protected function set a_1575(value:Boolean) : void
      {
         this.m_isHurtIgnoreArmorEx = value;
      }
      
      protected function get a_1576() : Boolean
      {
         return this.m_isParabolaPathEx;
      }
      
      protected function set a_1576(value:Boolean) : void
      {
         this.m_isParabolaPathEx = value;
      }
      
      protected function get a_1577() : Boolean
      {
         return this.m_isCanAddAuxiliaryEx;
      }
      
      protected function set a_1577(value:Boolean) : void
      {
         this.m_isCanAddAuxiliaryEx = value;
      }
      
      protected function get m_isCanBounceByAuxiliary() : Boolean
      {
         return this.m_isCanBounceByAuxiliaryEx;
      }
      
      protected function set m_isCanBounceByAuxiliary(value:Boolean) : void
      {
         this.m_isCanBounceByAuxiliaryEx = value;
      }
      
      protected function get m_isCanCrossFireAuxiliary() : Boolean
      {
         return this.m_isCanCrossFireAuxiliaryEx;
      }
      
      protected function set m_isCanCrossFireAuxiliary(value:Boolean) : void
      {
         this.m_isCanCrossFireAuxiliaryEx = value;
      }
      
      public function GetCanCrossFireAuxiliary() : Boolean
      {
         return this.m_isCanCrossFireAuxiliary;
      }
      
      protected function get m_isChangeYGridNo() : Boolean
      {
         return this.m_isChangeYGridNoEx;
      }
      
      protected function set m_isChangeYGridNo(value:Boolean) : void
      {
         this.m_isChangeYGridNoEx = value;
      }
      
      protected function get a_1578() : Boolean
      {
         return this.m_isFollowingShotEx;
      }
      
      protected function set a_1578(value:Boolean) : void
      {
         this.m_isFollowingShotEx = value;
      }
      
      public function m_FollowingShot() : Boolean
      {
         return this.m_isFollowingShotEx;
      }
      
      public function get m_isShotHighSkySpace() : Boolean
      {
         return this.m_isShotHighSkySpaceEx;
      }
      
      public function set m_isShotHighSkySpace(value:Boolean) : void
      {
         this.m_isShotHighSkySpaceEx = value;
      }
      
      protected function get a_1579() : int
      {
         return this.m_iHurtPowerEx;
      }
      
      protected function set a_1579(value:int) : void
      {
         this.m_iHurtPowerEx = value;
      }
      
      public function get iHurtPower2() : int
      {
         return this.a_1579;
      }
      
      protected function get a_1580() : int
      {
         return this.m_iShotSequenceNumEx;
      }
      
      protected function set a_1580(value:int) : void
      {
         this.m_iShotSequenceNumEx = value;
      }
      
      protected function get m_iShotGroupIndex() : int
      {
         return this.m_iShotGroupIndexEx;
      }
      
      protected function set m_iShotGroupIndex(value:int) : void
      {
         this.m_iShotGroupIndexEx = value;
      }
      
      protected function get m_numXSpeed() : Number
      {
         if(!this.m_numXSpeedEx)
         {
            this.m_numXSpeedEx = new EncrypNumber();
         }
         return this.m_numXSpeedEx.Value;
      }
      
      protected function set m_numXSpeed(value:Number) : void
      {
         if(!this.m_numXSpeedEx)
         {
            this.m_numXSpeedEx = new EncrypNumber();
         }
         this.m_numXSpeedEx.Value = value;
      }
      
      protected function get m_numYSpeed() : Number
      {
         if(!this.m_numYSpeedEx)
         {
            this.m_numYSpeedEx = new EncrypNumber();
         }
         return this.m_numYSpeedEx.Value;
      }
      
      protected function set m_numYSpeed(value:Number) : void
      {
         if(!this.m_numYSpeedEx)
         {
            this.m_numYSpeedEx = new EncrypNumber();
         }
         this.m_numYSpeedEx.Value = value;
      }
      
      protected function get a_1447() : int
      {
         return this.m_iStartMoveTimeEx;
      }
      
      protected function set a_1447(value:int) : void
      {
         this.m_iStartMoveTimeEx = value;
      }
      
      protected function get a_1581() : int
      {
         return this.m_iMoveTotalTimeEx;
      }
      
      protected function set a_1581(value:int) : void
      {
         this.m_iMoveTotalTimeEx = value;
      }
      
      public function get a_1582() : int
      {
         return this.m_iThreeRowShotTypeEx;
      }
      
      public function set a_1582(value:int) : void
      {
         this.m_iThreeRowShotTypeEx = value;
      }
      
      protected function get m_iYGridNo() : int
      {
         return this.m_iYGridNoEx;
      }
      
      protected function set m_iYGridNo(value:int) : void
      {
         this.m_iYGridNoEx = value;
      }
      
      protected function get a_1585() : int
      {
         return this.m_iStartXPosEx;
      }
      
      protected function set a_1585(value:int) : void
      {
         this.m_iStartXPosEx = value;
      }
      
      protected function get a_1586() : int
      {
         return this.m_iStartYPosEx;
      }
      
      protected function set a_1586(value:int) : void
      {
         this.m_iStartYPosEx = value;
      }
      
      public function get m_isPenetrate() : Boolean
      {
         return this.m_isPenetrateEx;
      }
      
      public function set m_isPenetrate(value:Boolean) : void
      {
         this.m_isPenetrateEx = value;
      }
      
      protected function get m_isHited() : Boolean
      {
         return this.m_iIsHited != 0;
      }
      
      protected function set m_isHited(value:Boolean) : void
      {
         if(value)
         {
            this.m_iIsHited = Math.random() * 1000 + 1;
         }
         else
         {
            this.m_iIsHited = 0;
         }
      }
      
      protected function get a_1587() : int
      {
         return this.m_iHitFrameIndexEx;
      }
      
      protected function set a_1587(value:int) : void
      {
         this.m_iHitFrameIndexEx = value;
      }
      
      protected function get a_1588() : Boolean
      {
         return this.m_isPlayMoveEx;
      }
      
      protected function set a_1588(value:Boolean) : void
      {
         this.m_isPlayMoveEx = value;
      }
      
      public function get isParabolaPath() : Boolean
      {
         return this.a_1576;
      }
      
      public function set iShotSequenceNum(value:int) : void
      {
         this.a_1580 = value;
      }
      
      public function set iShotGroupIndex(value:int) : void
      {
         this.m_iShotGroupIndex = value;
      }
      
      public function get globalID() : int
      {
         return this.m_iGlobalID;
      }
      
      public function GetCurrentBattleFieldView() : BattleFieldView
      {
         return this.a_1583;
      }
      
      public function addPowerForParabolaPath() : void
      {
         var stFieldGrid:a_3491 = null;
         var assist:a_3959 = null;
         var id:uint = 0;
         var multiplier:Number = NaN;
         if(this.a_1584 == null)
         {
            return;
         }
         var iYGridNo:int = this.a_1584.m_iYGridNo;
         for(var i:int = 0; i < BattleFieldView.a_1011; i++)
         {
            stFieldGrid = this.a_1583.a_3438(i,iYGridNo);
            if(this.isValidAssistGrid(stFieldGrid,i))
            {
               assist = stFieldGrid.m_stBaseAuxiliaryFighter;
               id = uint(assist.a_3512());
               multiplier = 1;
               if(this.isOldHotMultiplierTower(id))
               {
                  multiplier = assist.numHotMultiplier;
               }
               else if(this.isParabolaTower(id))
               {
                  multiplier = assist.numParabolaPathMultiplier;
               }
               if(multiplier > this.a_1325)
               {
                  this.a_1325 = multiplier;
               }
            }
         }
         var finalAuroraAdd:Number = this.calculateFinalAuroraAddValue();
         if(finalAuroraAdd > this.a_1325)
         {
            this.a_1325 = finalAuroraAdd;
         }
         this.a_1571 = i;
         if(this.a_1584.m_stAttackFighter != null)
         {
            this.a_1579 /= this.a_1584.m_stAttackFighter.a_1325;
            this.attackParam.attackDamage /= this.a_1584.m_stAttackFighter.a_1325;
            this.a_1325 = this.a_1584.m_stAttackFighter.a_1325 > this.a_1325 ? this.a_1584.m_stAttackFighter.a_1325 : this.a_1325;
         }
         if(this.a_1325 > 1 && a_2036.getInstance().isShowIntruderLife)
         {
            MessageTipHandler.Get().a_3146("攻击力加成:" + this.a_1325 + "倍");
         }
      }
      
      private function isValidAssistGrid(grid:a_3491, iXGridNo:int) : Boolean
      {
         return grid != null && this.a_1576 && this.a_1577 && iXGridNo != this.a_1571 && grid.m_stBaseAuxiliaryFighter != null && !grid.m_stBaseAuxiliaryFighter.m_isShowFrozen;
      }
      
      private function isOldHotMultiplierTower(id:uint) : Boolean
      {
         return id == 286392592 || id == 286392606 || id == 286392607 || id == 286393376;
      }
      
      private function isParabolaTower(id:uint) : Boolean
      {
         return id == 286851668 || id == 286851678 || id == 286851679 || id == 286394112 || id == 286394126 || id == 286394127 || id == 286394458 || id == 286394459 || id == 286394460;
      }
      
      private function isAuroraFinalTower(id:uint) : Boolean
      {
         return id == 286394461;
      }
      
      private function calculateFinalAuroraAddValue() : Number
      {
         var y:int = 0;
         var maxMultiplier:Number = NaN;
         var x:int = 0;
         var field:a_3491 = null;
         var assist:a_3959 = null;
         if(this.a_1584 == null)
         {
            return 0;
         }
         var iYGridNo:int = this.a_1584.m_iYGridNo;
         var centerAdd:Array = [];
         var otherAdd:Array = [];
         for(var dy:int = -1; dy <= 1; dy++)
         {
            y = iYGridNo + dy;
            if(!(y < 0 || y >= BattleFieldView.a_1012))
            {
               maxMultiplier = 0;
               for(x = 0; x < BattleFieldView.a_1011; x++)
               {
                  field = this.a_1583.a_3438(x,y);
                  if(this.isValidAssistGrid(field,x))
                  {
                     assist = field.m_stBaseAuxiliaryFighter;
                     if(this.isAuroraFinalTower(assist.a_3512()))
                     {
                        if(dy == 0)
                        {
                           centerAdd.push(assist.numParabolaPathMultiplier);
                        }
                        else
                        {
                           otherAdd.push(assist.numParabolaPathMultiplier * 0.2);
                        }
                     }
                  }
               }
            }
         }
         centerAdd.sort(Array.NUMERIC | Array.DESCENDING);
         otherAdd.sort(Array.NUMERIC | Array.DESCENDING);
         var totalAdd:Number = 0;
         var usedWeight:Number = 1.4;
         if(centerAdd.length >= 2)
         {
            totalAdd = centerAdd[0] * 1.4;
            usedWeight = 0;
         }
         else if(centerAdd.length == 1)
         {
            totalAdd = centerAdd[0] * 1;
            usedWeight = 0.4;
         }
         var j:int = 0;
         while(j < otherAdd.length && usedWeight > 0)
         {
            totalAdd += otherAdd[j];
            usedWeight -= 0.2;
            j++;
         }
         return totalAdd;
      }
      
      protected function GetFinalDamage() : int
      {
         var damage:int = 0;
         if(this.attackParam.bHasAttacker)
         {
            return int((this.attackParam.attackDamage + this.attackParam.iAttackAddend) * this.a_1325 + this.attackParam.baseAttack * this.attackParam.flagAdd);
         }
         return this.a_1579 * this.a_1325;
      }
      
      public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         if(this.attackParam == null)
         {
            this.attackParam = new AttackDefenseParams();
         }
         this.attackParam.InitAttacker(BattleFieldView.lastAttacker);
         this.m_iInitTime = getTimer();
         this.m_bActive.Value = true;
         this.m_iGlobalID = iGlobalID;
         this.a_1447 = 0;
         this.m_numYSpeed = 0;
         this.m_numXSpeed = numSpeed;
         if(stCurrentBattleView.iIntruderMoveDirection > 0)
         {
            this.m_numXSpeed *= -1;
            a_1283 = true;
         }
         else
         {
            a_1283 = false;
         }
         if(isBothWayShot)
         {
            this.m_numXSpeed *= -1;
         }
         this.m_iBothWayShot = isBothWayShot;
         this.a_1325 = numHotMultiplier;
         this.a_1326 = 1;
         this.a_1327 = 1;
         this.m_numMoveSpeedMultiplier = 1;
         this.a_1571 = -1;
         this.m_iFollowingShotSpaceState = -1;
         this.a_1579 = iHurtPower;
         x = iXpos;
         y = iYpos;
         this.a_1585 = iXpos;
         this.a_1586 = iYpos;
         this.a_1583 = stCurrentBattleView;
         if(stStartFieldGrid == null)
         {
            this.a_3940();
            return false;
         }
         this.s_GlobalShotID = stStartFieldGrid.m_stCurrentBattbleFieldView.GetGlobalShotID();
         this.m_iYGridNo = stStartFieldGrid.m_iYGridNo;
         this.a_1584 = stStartFieldGrid;
         this.a_1582 = iThreeRowShotType;
         this.PoisonHurtPower = 0;
         gotoAndStop(1);
         visible = true;
         this.m_isHited = false;
         this.m_isShowColdSlow = false;
         this.m_isShowPoisonGas = false;
         this.m_ShowAshEffectType = 0;
         this.m_isPenetrate = false;
         this.m_HitMouseArray = [];
         this.a_1583.m_stBaseShotVector[this.m_iYGridNo].push(this);
         if(this.a_1576)
         {
            this.addPowerForParabolaPath();
            this.a_4349();
         }
         if(2 == this.a_1582)
         {
            this.m_numYSpeed = -2 * Math.abs(this.m_numXSpeed);
            this.a_1577 = false;
         }
         else if(3 == this.a_1582)
         {
            this.m_numYSpeed = 2 * Math.abs(this.m_numXSpeed);
            this.a_1577 = false;
         }
         else if(5 == this.a_1582)
         {
            this.m_numYSpeed = -1 * Math.abs(this.m_numXSpeed);
            this.m_numXSpeed = 0;
            this.a_1577 = false;
         }
         else if(6 == this.a_1582)
         {
            this.m_numYSpeed = 1 * Math.abs(this.m_numXSpeed);
            this.m_numXSpeed = 0;
            this.a_1577 = false;
         }
         else if(7 == this.a_1582)
         {
            this.m_numYSpeed = -3 * Math.abs(this.m_numXSpeed);
            this.a_1577 = false;
         }
         else if(8 == this.a_1582)
         {
            this.m_numYSpeed = 3 * Math.abs(this.m_numXSpeed);
            this.a_1577 = false;
         }
         if(Boolean(this.a_1583) && this.a_1583.isOwnBattleField)
         {
            BattleFieldView.a_1028.play();
         }
         this.m_isCanCrossFireAuxiliary = true;
         this.m_isCanBounceByAuxiliary = true;
         this.m_isChangeYGridNo = false;
         return true;
      }
      
      protected function a_4349() : Boolean
      {
         var iXGridNo:int = 0;
         var stFieldGrid:a_3491 = null;
         var stMoveIntrude:a_4206 = null;
         var arrMoveIntruder:Array = null;
         var iIntruderIndex:int = 0;
         var numDistance:Number = NaN;
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
         }
         else
         {
            iXGridNo = int(x / a_3491.a_1080);
         }
         for(var i:int = iXGridNo; i < BattleFieldView.a_1011; i++)
         {
            stFieldGrid = this.a_1583.a_3438(i,this.m_iYGridNo);
            if(Boolean(stFieldGrid) && stFieldGrid.a_1511.length > 0)
            {
               arrMoveIntruder = this.GetIntruderArrayField(stFieldGrid);
               for(iIntruderIndex = 0; iIntruderIndex < stFieldGrid.a_1511.length; iIntruderIndex++)
               {
                  if((arrMoveIntruder[iIntruderIndex] as a_4206).iSpaceState == 0)
                  {
                     stMoveIntrude = arrMoveIntruder[0];
                     break;
                  }
               }
            }
            if(stMoveIntrude)
            {
               break;
            }
         }
         if(stMoveIntrude)
         {
            numDistance = Math.abs(stMoveIntrude.x - x) - 0.2 * stMoveIntrude.width;
            this.a_1581 = Math.abs(int(numDistance / this.m_numXSpeed));
            if(numDistance < 2 * a_3491.a_1080)
            {
               if(this.a_1581 < 4)
               {
                  this.a_1581 = 4;
               }
               this.m_numYSpeed = a_3491.a_1081 * (this.m_iYGridNo + 0.6) / this.a_1581;
            }
            else
            {
               this.m_numYSpeed = 3 * a_3491.a_1081 / this.a_1581;
            }
         }
         return true;
      }
      
      protected function a_3940() : Boolean
      {
         var stVector:Array = null;
         this.ClearTriggers();
         this.tagCom.ClearAll();
         this.m_iRandomArrOne.length = this.m_iRandomArrTwo.length = this.m_HitMouseArray.length = 0;
         if(this.a_1583)
         {
            stVector = this.a_1583.m_stBaseShotVector[this.m_iYGridNo];
            if(-1 != stVector.indexOf(this))
            {
               stVector.splice(stVector.indexOf(this),1);
            }
         }
         this.m_iSuperShotType = 0;
         this.m_SplitBulletCount = 0;
         this.m_SplitBulletMul = 1;
         this.m_iShotGroupIndex = 0;
         this.PoisonHurtPower = 0;
         this.m_PTMoveIntruder = null;
         this.m_PTFieldGrid = null;
         this.m_iCrossFireAllGride = false;
         this.m_iCanHitGostMouse = false;
         this.m_iCopy = false;
         this.m_iShowBloodHot = 0;
         var success:Boolean = PoolManager.getInstance().CheckInOne(this);
         if(!success)
         {
            if(parent)
            {
               parent.removeChild(this);
            }
            visible = false;
         }
         gotoAndStop(1);
         return true;
      }
      
      public function a_4350() : Boolean
      {
         return this.a_3940();
      }
      
      protected function FollowingShotHandle() : Boolean
      {
         var numXDistance:Number = NaN;
         var numYDistance:Number = NaN;
         var numMaxDistance:Number = NaN;
         var iMaxConstTime:int = 0;
         var numXSpeed:Number = NaN;
         var numYSpeed:Number = NaN;
         var iModNum:int = 0;
         var stMoveIntruder:a_4206 = this.a_1583.a_3431(this.m_iFollowingShotSpaceState);
         if(null != stMoveIntruder)
         {
            numXDistance = stMoveIntruder.x - x;
            numYDistance = stMoveIntruder.y - y;
            numMaxDistance = Math.abs(numXDistance) > Math.abs(numYDistance) ? Math.abs(numXDistance) : Math.abs(numYDistance);
            if(numMaxDistance > BattleFieldView.a_1013 && numMaxDistance > BattleFieldView.a_1014)
            {
               this.a_3940();
               return false;
            }
            iMaxConstTime = numMaxDistance / 10;
            if(iMaxConstTime < 1)
            {
               iMaxConstTime = 1;
            }
            numXSpeed = numXDistance / iMaxConstTime;
            numYSpeed = numYDistance / iMaxConstTime;
            if(this.m_numXSpeed != numXSpeed)
            {
               iModNum = Math.abs(int(numXSpeed - this.m_numXSpeed)) > 5 ? int(Math.abs(int(numXSpeed - this.m_numXSpeed))) : 5;
               this.m_numXSpeed += (numXSpeed - this.m_numXSpeed) % (iModNum + 1);
            }
            if(this.m_numYSpeed != numYSpeed)
            {
               iModNum = Math.abs(int(numYSpeed - this.m_numYSpeed)) > 5 ? int(Math.abs(int(numYSpeed - this.m_numYSpeed))) : 5;
               this.m_numYSpeed += (numYSpeed - this.m_numYSpeed) % (iModNum + 1);
            }
         }
         y += this.m_numYSpeed;
         return true;
      }
      
      public function a_4216(iCurrentTime:int) : void
      {
         var numYMove:Number = NaN;
         if(this.m_isHited && !this.m_isPenetrate)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               this.m_bActive.Value = false;
               this.a_3940();
            }
            return;
         }
         if(this.a_1588)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
         }
         if(0 == this.a_1447)
         {
            this.a_1447 = iCurrentTime;
         }
         this.a_4351();
         if(this.a_1578)
         {
            if(!this.FollowingShotHandle())
            {
               return;
            }
         }
         x += this.m_numXSpeed;
         if(2 == this.a_1582 && y > this.a_1586 - a_3491.a_1081 * 0.9)
         {
            y += this.m_numYSpeed;
         }
         else if(3 == this.a_1582 && y < this.a_1586 + a_3491.a_1081 * 0.9)
         {
            y += this.m_numYSpeed;
         }
         else if(5 == this.a_1582 || 6 == this.a_1582)
         {
            y += this.m_numYSpeed;
         }
         if(7 == this.a_1582 && y > this.a_1586 - a_3491.a_1081 * 1.9)
         {
            y += this.m_numYSpeed;
         }
         else if(8 == this.a_1582 && y < this.a_1586 + a_3491.a_1081 * 1.9)
         {
            y += this.m_numYSpeed;
         }
         else if(this.a_1582 > 1)
         {
            this.a_1577 = true;
         }
         if(this.a_1576)
         {
            numYMove = 2 * this.m_numYSpeed * (iCurrentTime - this.a_1447) / this.a_1581 - this.m_numYSpeed;
            y += numYMove > 30 ? 30 : numYMove;
         }
      }
      
      protected function a_4351() : void
      {
         var iXGridNo:int = 0;
         var stLastWaitShot:a_4348 = null;
         var arrMoveIntruder:Array = null;
         var iArrMoveIntruderLength:int = 0;
         var stMoveIntruder:a_4206 = null;
         var numHotMultiplier:Number = NaN;
         var numColdSlowMultiplier:Number = NaN;
         var numMoveSpeedMultiplier:Number = NaN;
         var iNewShotXpos:int = 0;
         var i:int = 0;
         if(!this.m_bActive.Value)
         {
            this.a_3940();
            return;
         }
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
         }
         else
         {
            iXGridNo = int(x / a_3491.a_1080);
         }
         var iYGridNo:int = this.m_isChangeYGridNo ? int(y / a_3491.a_1081) : this.m_iYGridNo;
         if(5 == this.a_1582 || 6 == this.a_1582)
         {
            iYGridNo = int(y / a_3491.a_1081);
            if(y <= 0 || y >= BattleFieldView.a_1014)
            {
               this.m_bActive.Value = false;
               this.a_3940();
               return;
            }
         }
         if(this.CalculationBoundary())
         {
            return;
         }
         var stFieldGrid:a_3491 = this.a_1583.a_3438(iXGridNo,iYGridNo);
         if(stFieldGrid == null)
         {
            this.m_bActive.Value = false;
            this.a_3940();
            return;
         }
         if(!this.a_1576 && this.a_1577 && this.a_1571 != iXGridNo && (this.m_iCrossFireAllGride || this.a_1584 != stFieldGrid) && null != stFieldGrid.m_stBaseAuxiliaryFighter && !stFieldGrid.m_stBaseAuxiliaryFighter.m_isShowFrozen)
         {
            this.a_1571 = iXGridNo;
            numHotMultiplier = stFieldGrid.m_stBaseAuxiliaryFighter.numHotMultiplier;
            if(numHotMultiplier > 1 && this.m_isCanCrossFireAuxiliary)
            {
               if(this.a_1574 * this.a_1326 > 0)
               {
                  this.a_1326 = 0;
                  numHotMultiplier = 1;
                  stLastWaitShot = a_4388.getInstance().a_4389(b_183.b_184);
                  if(null != stLastWaitShot)
                  {
                     iNewShotXpos = x + (a_1283 ? -30 : 30);
                     stLastWaitShot.a_1797(0,15,this.a_1579,iNewShotXpos,y,this.a_1583,stFieldGrid,false,this.a_1325);
                     parent.addChild(stLastWaitShot);
                     this.m_bActive.Value = false;
                     this.a_3940();
                  }
               }
               else if(numHotMultiplier > this.a_1325)
               {
                  stLastWaitShot = this.JudgePassFireTower(stFieldGrid,numHotMultiplier);
                  if(this.addFireShot(stLastWaitShot,stFieldGrid))
                  {
                     return;
                  }
               }
            }
            numColdSlowMultiplier = stFieldGrid.m_stBaseAuxiliaryFighter.numColdSlowMultiplier;
            if(numColdSlowMultiplier > 1)
            {
               if(this.a_1325 > 1)
               {
                  this.a_1326 = 0;
                  numHotMultiplier = 1;
               }
               else if(numColdSlowMultiplier >= this.a_1326)
               {
                  this.a_1326 = numColdSlowMultiplier;
               }
            }
            numMoveSpeedMultiplier = stFieldGrid.m_stBaseAuxiliaryFighter.numMoveSpeedMultiplier;
            if(numMoveSpeedMultiplier != 1 && this.m_numMoveSpeedMultiplier == 1 && this.m_isCanBounceByAuxiliary)
            {
               this.m_numMoveSpeedMultiplier = numMoveSpeedMultiplier;
               this.m_numXSpeed *= this.m_numMoveSpeedMultiplier;
               this.m_numYSpeed *= this.m_numMoveSpeedMultiplier;
               this.ReboundHandler();
               this.JudgeAddPowerByAuxiliaryFighter(stFieldGrid);
            }
         }
         if(!this.a_1576 && !this.m_isShotHighSkySpace && (1 == stFieldGrid.m_iFieldGridType || 4 == stFieldGrid.m_iFieldGridType) && !this.m_isPenetrate)
         {
            this.m_isHited = true;
            if(a_1276.length > 0)
            {
               gotoAndStop((a_1276[this.a_1587] as FrameLabel).frame);
            }
            return;
         }
         if(stFieldGrid.m_isOccupy)
         {
            arrMoveIntruder = this.GetIntruderArrayField(stFieldGrid);
            iArrMoveIntruderLength = int(arrMoveIntruder.length);
            for(i = 0; i < iArrMoveIntruderLength; i++)
            {
               stMoveIntruder = arrMoveIntruder[i];
               if(this.CaclueHitMouse(stFieldGrid,stMoveIntruder))
               {
                  return;
               }
            }
         }
         if(a_1283)
         {
            stFieldGrid = this.a_1583.a_3438(iXGridNo + 1,iYGridNo);
         }
         else
         {
            stFieldGrid = this.a_1583.a_3438(iXGridNo - 1,iYGridNo);
         }
         if(null != stFieldGrid && stFieldGrid.m_isOccupy)
         {
            arrMoveIntruder = this.GetIntruderArrayField(stFieldGrid);
            iArrMoveIntruderLength = int(arrMoveIntruder.length);
            iArrMoveIntruderLength = int(arrMoveIntruder.length);
            for(i = 0; i < iArrMoveIntruderLength; i++)
            {
               stMoveIntruder = arrMoveIntruder[i];
               if(this.CaclueHitMouse(stFieldGrid,stMoveIntruder))
               {
                  return;
               }
            }
         }
      }
      
      public function HitMoveIntruder2(baseMoveIntruder:a_4206, damageparams:Array) : Boolean
      {
         if(!this.m_isPenetrate)
         {
            this.m_bActive.Value = false;
         }
         if(this.m_SplitBulletCount > 0)
         {
            this.SplitBullet(baseMoveIntruder.m_stCurrentFieldGrid,this.m_SplitBulletCount);
         }
         var finalHurt:Number = this.GetFinalDamage();
         if(this.m_ShowAshEffectType > 0)
         {
            baseMoveIntruder.PowerfulBombReduceLifeRate3(finalHurt / 900,this.m_ShowAshEffectType == 1,damageparams);
         }
         else if(this.a_1576 || this.a_1575)
         {
            baseMoveIntruder.ReduceLifeIgnoreArmor2(finalHurt,damageparams);
         }
         else
         {
            baseMoveIntruder.ReduceLife2(finalHurt,damageparams);
         }
         if(baseMoveIntruder.m_stCurrentFieldGrid == null || baseMoveIntruder.iLifeValue <= 0 || baseMoveIntruder.parent == null)
         {
            return false;
         }
         if(this.a_1573 > 0)
         {
            baseMoveIntruder.a_4208(b_182.a_432,this.a_1573);
         }
         if(this.a_1574 > 0)
         {
            if(baseMoveIntruder.iArmorLifeValue <= 0 || this.a_1576)
            {
               baseMoveIntruder.a_4208(b_182.a_433,this.a_1574 * this.a_1326);
            }
         }
         if(this.a_1325 > 5)
         {
            baseMoveIntruder.a_4208(b_182.a_433,0);
         }
         if(this.m_isShowColdSlow)
         {
            baseMoveIntruder.a_4208(b_182.a_433,150);
         }
         if(this.m_isShowPoisonGas)
         {
            baseMoveIntruder.PoisonHurtPower = this.m_PoisonHurtPower;
            baseMoveIntruder.a_4208(b_182.enm_shotEffectPoisonGas,3);
         }
         return true;
      }
      
      public function AddTrigger(trigger:BaseShotTrigger) : void
      {
         this.m_triggers.push(trigger);
      }
      
      protected function ExecuteTriggers(target:a_4206) : void
      {
         var trigger:BaseShotTrigger = null;
         for each(trigger in this.m_triggers)
         {
            trigger.a_3014(this,target);
            trigger.Execute();
         }
      }
      
      protected function ClearTriggers() : void
      {
         var trigger:BaseShotTrigger = null;
         for each(trigger in this.m_triggers)
         {
            trigger.Dispose();
         }
         this.m_triggers.length = 0;
      }
      
      public function a_4352(baseMoveIntruder:a_4206) : Boolean
      {
         var effect:a_4108 = null;
         if(!this.m_isPenetrate)
         {
            this.m_bActive.Value = false;
         }
         if(this.m_SplitBulletCount > 0)
         {
            this.SplitBullet(baseMoveIntruder.m_stCurrentFieldGrid,this.m_SplitBulletCount);
         }
         var finalHurt:Number = this.GetFinalDamage();
         if(this.m_ShowAshEffectType > 0)
         {
            baseMoveIntruder.PowerfulBombReduceLifeRate(finalHurt / 900,this.m_ShowAshEffectType == 1);
         }
         else if(this.a_1576 || this.a_1575)
         {
            baseMoveIntruder.a_4209(finalHurt);
         }
         else
         {
            baseMoveIntruder.a_3969(finalHurt);
         }
         if(baseMoveIntruder.m_stCurrentFieldGrid == null || baseMoveIntruder.iLifeValue <= 0 || baseMoveIntruder.parent == null)
         {
            return false;
         }
         if(this.a_1573 > 0)
         {
            baseMoveIntruder.a_4208(b_182.a_432,this.a_1573);
         }
         if(this.a_1574 > 0)
         {
            if(baseMoveIntruder.iArmorLifeValue <= 0 || this.a_1576)
            {
               baseMoveIntruder.a_4208(b_182.a_433,this.a_1574 * this.a_1326);
            }
         }
         if(this.a_1325 > 5)
         {
            baseMoveIntruder.a_4208(b_182.a_433,0);
         }
         if(this.m_isShowColdSlow)
         {
            baseMoveIntruder.a_4208(b_182.a_433,150);
         }
         if(this.m_isShowPoisonGas)
         {
            baseMoveIntruder.PoisonHurtPower = this.m_PoisonHurtPower;
            baseMoveIntruder.a_4208(b_182.enm_shotEffectPoisonGas,3);
         }
         if(this.m_iShowBloodHot > 0)
         {
            effect = IntruderBloodEffect.a_3926();
            baseMoveIntruder.addBleedingEffect(effect,21,this.GetFinalDamage() * this.m_iShowBloodHot);
         }
         return true;
      }
      
      protected function CalculationBoundary() : Boolean
      {
         if(x < 0 || x >= BattleFieldView.a_1013 || this.a_1576 && y > a_3491.a_1081 * (this.m_iYGridNo + 1))
         {
            this.m_bActive.Value = false;
            this.a_3940();
            return true;
         }
         return false;
      }
      
      protected function ReboundHandler() : void
      {
      }
      
      public function getMoveSpeedMultiplier() : Number
      {
         return this.m_numMoveSpeedMultiplier;
      }
      
      public function setMoveSpeedMultiplier(value:Number) : void
      {
         if(!this.m_numMoveSpeedMultiplierEx)
         {
            this.m_numMoveSpeedMultiplierEx = new EncrypNumber();
         }
         this.m_numMoveSpeedMultiplierEx.Value = value;
         this.m_numXSpeed *= this.m_numMoveSpeedMultiplier;
         this.m_numYSpeed *= this.m_numMoveSpeedMultiplier;
         rotationY = rotationY == -180 ? 0 : -180;
      }
      
      public function getCanAddAuxiliary() : Boolean
      {
         return this.m_isCanAddAuxiliaryEx;
      }
      
      public function setNumHotMultiplier(value:Number) : void
      {
         this.m_iNumHotMultiplier = this.NormalizeMulitplierValue(value);
      }
      
      public function getLastAuxiliaryFighterXGridNo() : int
      {
         return this.m_iLastAuxiliaryFighterXGridNoEx;
      }
      
      public function setLastAuxiliaryFighterXGridNo(value:int) : void
      {
         this.m_iLastAuxiliaryFighterXGridNoEx = value;
      }
      
      public function getNumXSpeed() : Number
      {
         if(!this.m_numXSpeedEx)
         {
            this.m_numXSpeedEx = new EncrypNumber();
         }
         return this.m_numXSpeedEx.Value;
      }
      
      public function setNumXSpeed(value:Number) : void
      {
         if(!this.m_numXSpeedEx)
         {
            this.m_numXSpeedEx = new EncrypNumber();
         }
         this.m_numXSpeedEx.Value = value;
      }
      
      public function iStartField() : a_3491
      {
         return this.a_1584;
      }
      
      public function iHurtPower() : int
      {
         return this.m_iHurtPowerEx;
      }
      
      public function get iNumYSpeed() : int
      {
         if(!this.m_numYSpeedEx)
         {
            this.m_numYSpeedEx = new EncrypNumber();
         }
         return this.m_numYSpeedEx.Value;
      }
      
      protected function SputterHurt(stHitenFieldGrid:a_3491, stHitenMouseIntruder:a_4206) : void
      {
      }
      
      protected function CaclueHitMouse(stFieldGrid:a_3491, stMoveIntruder:a_4206) : Boolean
      {
         if(!this.checkCanHit(stMoveIntruder))
         {
            return false;
         }
         if(!hitTestObject(stMoveIntruder))
         {
            return false;
         }
         if(this.m_isPenetrate)
         {
            if(this.m_HitMouseArray.indexOf(stMoveIntruder) != -1)
            {
               return false;
            }
            this.m_HitMouseArray.push(stMoveIntruder);
            this.onHitHandler(stFieldGrid,stMoveIntruder);
            return true;
         }
         this.onHitHandler(stFieldGrid,stMoveIntruder);
         return true;
      }
      
      protected function onHitHandler(stFieldGrid:a_3491, stMoveIntruder:a_4206) : void
      {
         if(Boolean(this.a_1583) && this.a_1583.isOwnBattleField)
         {
            BattleFieldView.a_1045.play();
         }
         this.a_4352(stMoveIntruder);
         this.SputterHurt(stFieldGrid,stMoveIntruder);
         this.m_isHited = true;
         if(a_1276.length > 0)
         {
            gotoAndStop((a_1276[this.a_1587] as FrameLabel).frame);
         }
         this.ExecuteTriggers(stMoveIntruder);
      }
      
      protected function checkCanHit(stMoveIntruder:a_4206) : Boolean
      {
         if(this.m_iCanHitGostMouse && BattleFieldView.m_GostMouse.indexOf(stMoveIntruder.m_stMoveIntruderTypeID) != -1)
         {
            return true;
         }
         if(stMoveIntruder.isCannotSeeByFighter)
         {
            return false;
         }
         var space:int = stMoveIntruder.iSpaceState;
         if(!this.m_isShotHighSkySpace)
         {
            if(space == 0)
            {
               return true;
            }
            if(space == 2 && this.a_1576)
            {
               return true;
            }
         }
         else if(space == 3)
         {
            return true;
         }
         return false;
      }
      
      protected function SplitBullet(gride:a_3491, count:int) : void
      {
         var newShot:a_4348 = null;
         var dx:Number = NaN;
         var dy:Number = NaN;
         if(!gride || count <= 0)
         {
            return;
         }
         for(var i:int = 0; i < count; )
         {
            newShot = this.CreateSplitShot();
            if(newShot)
            {
               newShot.m_isSpecial = i;
               dx = (gride.m_iXGridNo + 0.5) * a_3491.a_1080;
               dy = (gride.m_iYGridNo + 0.5) * a_3491.a_1081;
               newShot.a_1797(0,this.m_numXSpeed,this.a_1579 * this.m_SplitBulletMul,dx,dy,this.a_1583,gride,this.m_iBothWayShot,this.a_1325,this.a_1582);
               gride.m_stCurrentBattbleFieldView.AddToBattleView(newShot,BattleLayerDefine.SHOT_TYPE);
            }
            i++;
         }
      }
      
      protected function CreateSplitShot() : a_4348
      {
         return a_4388.getInstance().a_4389(b_183.enm_AnnihilationHorseBaseSamllShot);
      }
      
      public function GetIntruderArrayField(stFieldGrid:a_3491) : Array
      {
         var stIntruder:a_4206 = null;
         var bIsRightward:Boolean = false;
         this.m_arrTempIntruderArray.length = 0;
         if(stFieldGrid == null || !stFieldGrid.m_isOccupy)
         {
            return this.m_arrTempIntruderArray;
         }
         for each(stIntruder in stFieldGrid.a_1511)
         {
            this.m_arrTempIntruderArray.push(stIntruder);
         }
         bIsRightward = stFieldGrid.m_stCurrentBattbleFieldView.iIntruderMoveDirection > 0;
         this.m_arrTempIntruderArray.sortOn("x",(bIsRightward ? Array.DESCENDING : 0) | Array.NUMERIC);
         return this.m_arrTempIntruderArray;
      }
      
      protected function JudgePassFireTower(stFieldGrid:a_3491, numHotMultiplier:Number) : a_4348
      {
         var i:int = 0;
         if(this.GetShotTypeID() == b_183.enm_FireGrailShot)
         {
            return null;
         }
         var stLastWaitShot:a_4348 = null;
         if(stFieldGrid.m_stBaseAuxiliaryFighter.a_3512() == 286851418 || stFieldGrid.m_stBaseAuxiliaryFighter.a_3512() == 286851419 || stFieldGrid.m_stBaseAuxiliaryFighter.a_3512() == 286851420 || stFieldGrid.m_stBaseAuxiliaryFighter.a_3512() == 286851421)
         {
            this.a_1325 = numHotMultiplier;
            stLastWaitShot = a_4388.getInstance().a_4389(b_183.enm_HighFireShot);
            switch(stFieldGrid.m_stBaseAuxiliaryFighter.a_3512())
            {
               case 286851418:
                  stLastWaitShot.iShotSequenceNum = 1;
                  break;
               case 286851419:
                  stLastWaitShot.iShotSequenceNum = 2;
                  break;
               case 286851420:
                  stLastWaitShot.iShotSequenceNum = 3;
                  break;
               case 286851421:
                  stLastWaitShot.iShotSequenceNum = 4;
                  break;
               default:
                  stLastWaitShot.iShotSequenceNum = 0;
            }
         }
         else if(stFieldGrid.m_stBaseAuxiliaryFighter.a_3512() == 286401904 || stFieldGrid.m_stBaseAuxiliaryFighter.a_3512() == 286401918 || stFieldGrid.m_stBaseAuxiliaryFighter.a_3512() == 286401919)
         {
            this.a_1325 = numHotMultiplier;
            stLastWaitShot = a_4388.getInstance().a_4389(b_183.enm_CrucibleSnakeFireTowerShot);
            if(stFieldGrid.m_stBaseAuxiliaryFighter.a_3512() == 286401904)
            {
               stLastWaitShot.m_isSpecial = 1;
            }
            else if(stFieldGrid.m_stBaseAuxiliaryFighter.a_3512() == 286401918)
            {
               stLastWaitShot.m_isSpecial = 2;
            }
            else if(stFieldGrid.m_stBaseAuxiliaryFighter.a_3512() == 286401919)
            {
               stLastWaitShot.m_isSpecial = 3;
            }
            stLastWaitShot.m_iRandomArrOne.length = 0;
            stLastWaitShot.m_iRandomArrTwo.length = 0;
            for(i = 0; i < 30; i++)
            {
               stLastWaitShot.m_iRandomArrOne.push(stFieldGrid.m_stBaseAuxiliaryFighter.m_iDefenseRandomSeed.nextInt(101));
               stLastWaitShot.m_iRandomArrTwo.push(stFieldGrid.m_stBaseAuxiliaryFighter.m_iDefenseRandomSeed.nextInt(101));
            }
         }
         else if(stFieldGrid.m_stBaseAuxiliaryFighter.a_3512() == 292552847)
         {
            this.a_1325 = numHotMultiplier;
            stLastWaitShot = a_4388.getInstance().a_4389(b_183.enm_RockFireTowerIceColdShot);
         }
         else if(stFieldGrid.m_stBaseAuxiliaryFighter.a_3512() == 286392592 || stFieldGrid.m_stBaseAuxiliaryFighter.a_3512() == 286392606 || stFieldGrid.m_stBaseAuxiliaryFighter.a_3512() == 286392607 || stFieldGrid.m_stBaseAuxiliaryFighter.a_3512() == 286393376)
         {
            trace("猪猪加强器不过火盆");
         }
         else
         {
            this.a_1325 = numHotMultiplier;
            stLastWaitShot = this.GetBaseFireShot();
         }
         if(stLastWaitShot)
         {
            stLastWaitShot.m_iShowBloodHot = this.m_iShowBloodHot;
            stLastWaitShot.m_iCanHitGostMouse = this.m_iCanHitGostMouse;
         }
         return stLastWaitShot;
      }
      
      public function GetBaseFireShot() : a_4348
      {
         return a_4388.getInstance().a_4389(b_183.b_189);
      }
      
      protected function addFireShot(stLastWaitShot:a_4348, stFieldGrid:a_3491) : Boolean
      {
         var isBothWayShot:Boolean = false;
         if(null != stLastWaitShot)
         {
            isBothWayShot = false;
            if(a_1283 && this.m_numXSpeed > 0 || !a_1283 && this.m_numXSpeed < 0)
            {
               isBothWayShot = true;
            }
            stLastWaitShot.a_1797(0,15,this.a_1579,x,y,this.a_1583,stFieldGrid,isBothWayShot,this.a_1325);
            this.ApplyFireShotExtraProperty(stLastWaitShot);
            parent.addChild(stLastWaitShot);
            this.m_bActive.Value = false;
            this.a_3940();
            if(Boolean(this.a_1583) && this.a_1583.isOwnBattleField)
            {
               BattleFieldView.a_1029.play();
            }
            return true;
         }
         return false;
      }
      
      protected function ApplyFireShotExtraProperty(stShot:a_4348) : void
      {
         var trigger:BaseShotTrigger = null;
         stShot.m_isPenetrate = this.m_isPenetrate;
         stShot.m_isShowPoisonGas = this.m_isShowPoisonGas;
         stShot.PoisonHurtPower = this.PoisonHurtPower;
         stShot.m_ShowAshEffectType = this.m_ShowAshEffectType;
         stShot.m_numMoveSpeedMultiplier = this.m_numMoveSpeedMultiplier;
         stShot.m_SplitBulletCount = this.m_SplitBulletCount;
         stShot.m_SplitBulletMul = this.m_SplitBulletMul;
         stShot.attackParam.Copy(this.attackParam);
         for each(trigger in this.m_triggers)
         {
            stShot.AddTrigger(trigger.a_4451());
         }
      }
      
      public function addFireShot2(stLastWaitShot:a_4348, stFieldGrid:a_3491) : Boolean
      {
         return this.addFireShot(stLastWaitShot,stFieldGrid);
      }
      
      protected function JudgeAddPowerByAuxiliaryFighter(stFieldGrid:a_3491) : void
      {
         var iAttackAddend:int = 0;
         var randomNum:int = 0;
         var typeID:int = stFieldGrid.m_stBaseAuxiliaryFighter.a_3512();
         if(stFieldGrid.m_stBaseAuxiliaryFighter.a_3512() == 286855632 || typeID == 286855646 || typeID == 286855647 || typeID == 286855648 || typeID == 286393120 || typeID == 286393134 || typeID == 286393135 || typeID == 286400634 || typeID == 286400635 || typeID == 286400636 || typeID == 286400637 || typeID == 286855631)
         {
            iAttackAddend = stFieldGrid.m_stBaseAuxiliaryFighter.numAtackAddend;
            this.attackParam.iAttackAddend = iAttackAddend;
            this.m_iHurtPowerEx += iAttackAddend;
            stFieldGrid.m_stBaseAuxiliaryFighter.ShowAnimation();
         }
         if(typeID == 286393134 || typeID == 286393135)
         {
            this.m_isShowColdSlow = true;
         }
         else if(typeID == 286400634)
         {
            randomNum = BattleFieldView.m_stRandomSeed.nextInt(100) + 1;
            if(randomNum <= 5)
            {
               this.m_isShowPoisonGas = true;
               this.PoisonHurtPower = stFieldGrid.m_stBaseAuxiliaryFighter.PoisonHurtPower;
            }
         }
         else if(typeID == 286400635 || typeID == 286400636)
         {
            this.m_isShowPoisonGas = true;
            this.PoisonHurtPower = stFieldGrid.m_stBaseAuxiliaryFighter.PoisonHurtPower;
         }
         else if(typeID == 286400637)
         {
            this.addReboundShot(this.a_1584);
            this.m_isShowPoisonGas = true;
            this.PoisonHurtPower = stFieldGrid.m_stBaseAuxiliaryFighter.PoisonHurtPower;
         }
      }
      
      protected function addReboundShot(stFieldGrid:a_3491) : Boolean
      {
         var offect:int = 0;
         var stLastWaitShot:a_4348 = this.GetReboundShot();
         if(Boolean(stLastWaitShot) && Boolean(stFieldGrid))
         {
            offect = this.m_numXSpeed < 0 ? 10 : -10;
            stLastWaitShot.m_isSpecial = this.m_isSpecial;
            stLastWaitShot.m_iSuperShotType = this.m_iSuperShotType;
            stLastWaitShot.m_iCopy = true;
            stLastWaitShot.ms_iCritFrameLable = this.ms_iCritFrameLable;
            stLastWaitShot.a_1797(this.s_GlobalShotID,-this.m_numXSpeed,this.a_1579,x,y + 4,this.a_1583,stFieldGrid,this.m_iBothWayShot,this.a_1325,this.a_1582);
            stLastWaitShot.CopyFrom(this);
            stLastWaitShot.ReboundHandler();
            parent.addChild(stLastWaitShot);
            return true;
         }
         return false;
      }
      
      public function GetReboundShot() : a_4348
      {
         var getFreeShotFunc:Function = null;
         var classConstructor:Class = Object(this).constructor as Class;
         if(classConstructor.hasOwnProperty("GetFreeShot1"))
         {
            return PoolManager.getInstance().CheckOutOne(this,getBindMovie()) as a_4348;
         }
         if(classConstructor.hasOwnProperty("a_4344"))
         {
            getFreeShotFunc = classConstructor["a_4344"] as Function;
            return getFreeShotFunc();
         }
         return null;
      }
      
      public function CopyFrom(src:a_4348) : void
      {
         var trigger:BaseShotTrigger = null;
         this.m_isPenetrate = src.m_isPenetrate;
         this.m_isShowPoisonGas = src.m_isShowPoisonGas;
         this.PoisonHurtPower = src.PoisonHurtPower;
         this.m_ShowAshEffectType = src.m_ShowAshEffectType;
         this.m_numMoveSpeedMultiplier = src.m_numMoveSpeedMultiplier;
         this.m_numXSpeed = src.m_numXSpeed;
         this.m_numYSpeed = src.m_numYSpeed;
         this.m_isSpecial = src.m_isSpecial;
         this.m_iSuperShotType = src.m_iSuperShotType;
         this.m_SplitBulletCount = src.m_SplitBulletCount;
         this.m_SplitBulletMul = src.m_SplitBulletMul;
         this.m_iRandomArrOne = src.m_iRandomArrOne;
         this.m_iRandomArrTwo = src.m_iRandomArrTwo;
         this.m_iShowBloodHot = src.m_iShowBloodHot;
         this.m_iCanHitGostMouse = src.m_iCanHitGostMouse;
         this.a_1580 = src.a_1580;
         this.a_1571 = src.a_1571;
         this.m_iCrossFireAllGride = src.m_iCrossFireAllGride;
         this.a_1576 = src.a_1576;
         this.a_1577 = src.a_1577;
         this.a_1326 = src.a_1326;
         this.m_isCanCrossFireAuxiliary = src.m_isCanCrossFireAuxiliary;
         this.ms_iCritFrameLable = src.ms_iCritFrameLable;
         this.s_GlobalShotID = src.s_GlobalShotID;
         for each(trigger in this.m_triggers)
         {
            src.AddTrigger(trigger.a_4451());
         }
      }
      
      public function AvaterAttack() : void
      {
      }
      
      public function CheckHitTest(stMoveIntruder:a_4206, stFieldGrid:a_3491) : Boolean
      {
         var m_OffsetX:int = 0;
         if(stMoveIntruder == null || stFieldGrid == null)
         {
            return false;
         }
         if(hitTestObject(stMoveIntruder))
         {
            return true;
         }
         if(stFieldGrid.m_isNeedTray && stFieldGrid.m_stTrayDefense != null && this.m_numXSpeed == 0 && this.m_numYSpeed != 0)
         {
            m_OffsetX = a_1283 ? -20 : 20;
            this.x += m_OffsetX;
            if(hitTestObject(stMoveIntruder))
            {
               this.x -= m_OffsetX;
               return true;
            }
            this.x -= m_OffsetX;
            return false;
         }
         return false;
      }
      
      protected function CaculateParabolaSpeed() : void
      {
         var iXGridNo:int = 0;
         var numDistance:Number = NaN;
         var stFieldGrid:a_3491 = null;
         var targetX:Number = NaN;
         var targetY:Number = NaN;
         var stMoveIntrude:a_4206 = null;
         var arrMoveIntruder:Array = null;
         var iIntruderIndex:int = 0;
         this.m_PTPosition = new Point();
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
         }
         else
         {
            iXGridNo = int(x / a_3491.a_1080);
         }
         for(var i:int = iXGridNo; i < BattleFieldView.a_1011; i++)
         {
            stFieldGrid = this.a_1583.a_3438(i,this.m_iYGridNo);
            if(Boolean(stFieldGrid) && stFieldGrid.a_1511.length > 0)
            {
               arrMoveIntruder = this.GetIntruderArrayField(stFieldGrid);
               for(iIntruderIndex = 0; iIntruderIndex < stFieldGrid.a_1511.length; iIntruderIndex++)
               {
                  stMoveIntrude = arrMoveIntruder[iIntruderIndex];
                  if(this.IsMeetParabolaMouse(stMoveIntrude))
                  {
                     this.m_PTMoveIntruder = stMoveIntrude;
                     break;
                  }
               }
            }
            if(this.m_PTMoveIntruder)
            {
               break;
            }
         }
         if(this.m_PTMoveIntruder)
         {
            numDistance = Math.abs(this.m_PTMoveIntruder.x + this.m_PTMoveIntruder.stDisplayBitmap.x + this.m_PTMoveIntruder.width / 2 - x);
            this.m_PTFieldGrid = this.m_PTMoveIntruder.m_stCurrentFieldGrid;
            targetX = this.m_PTMoveIntruder.x + this.m_PTMoveIntruder.stDisplayBitmap.x + this.m_PTMoveIntruder.width / 2;
            targetY = this.m_PTMoveIntruder.y + this.m_PTMoveIntruder.stDisplayBitmap.y + this.m_PTMoveIntruder.height / 2;
         }
         else
         {
            this.m_PTFieldGrid = a_1283 ? this.a_1583.a_3438(0,this.m_iYGridNo) : this.a_1583.a_3438(BattleFieldView.a_1011 - 1,this.m_iYGridNo);
            targetX = (this.m_PTFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
            targetY = (this.m_PTFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081;
         }
         this.m_PTPosition.x = targetX;
         this.m_PTPosition.y = targetY;
         var dx:Number = this.m_PTPosition.x - x;
         var dy:Number = this.m_PTPosition.y - y;
         var distance:Number = Math.abs(dx);
         this.m_ProtationRadian = Math.atan2(dy,dx);
         this.m_PStartY = y;
         this.m_PStartX = x;
         this.a_1581 = int(Math.sqrt(dx * dx + dy * dy) / this.m_numXSpeed);
         if(this.a_1581 < 2)
         {
            this.a_1581 = 2;
         }
         this.m_numYSpeed = distance < 2 * a_3491.a_1080 ? a_3491.a_1081 * 0.6 / this.a_1581 : 3 * a_3491.a_1081 / this.a_1581;
         this.m_PrealXSpeed = this.m_numXSpeed * Math.cos(this.m_ProtationRadian);
         this.m_PbaseYDirection = this.m_numXSpeed * Math.sin(this.m_ProtationRadian);
      }
      
      protected function IsMeetParabolaMouse(base:a_4206) : Boolean
      {
         return base && base.iSpaceState == 0 && base.iLifeValue > 0 && Boolean(base.m_stCurrentFieldGrid);
      }
      
      protected function UpdateParabolaPosition(iCurrentTime:int) : void
      {
         var curMouseX:Number = NaN;
         this.m_PMoveTime = iCurrentTime - this.a_1447;
         var t:Number = this.m_PMoveTime / this.a_1581;
         if(t > 1)
         {
            t = 1;
         }
         var startX:Number = this.m_PStartX;
         var startY:Number = this.m_PStartY;
         if(Boolean(this.m_PTMoveIntruder) && Boolean(this.m_PTMoveIntruder.m_stCurrentFieldGrid))
         {
            curMouseX = this.m_PTMoveIntruder.x + this.m_PTMoveIntruder.stDisplayBitmap.x + this.m_PTMoveIntruder.width / 2;
            this.m_PTPosition.x += (curMouseX - this.m_PTPosition.x) * 0.25;
         }
         var endX:Number = this.m_PTPosition.x;
         var endY:Number = this.m_PTPosition.y;
         var dist:Number = Math.abs(endX - startX);
         var heightFactor:Number = Math.min(2,Math.max(0.5,dist / (a_3491.a_1080 * 3)));
         var topY:Number = Math.min(startY,endY) - a_3491.a_1081 * heightFactor;
         var topX:Number = (startX + endX) / 2;
         x = (1 - t) * (1 - t) * startX + 2 * (1 - t) * t * topX + t * t * endX;
         y = (1 - t) * (1 - t) * startY + 2 * (1 - t) * t * topY + t * t * endY;
         if(t >= 1)
         {
            this.HitParabolaTest();
         }
      }
      
      protected function HitParabolaTest() : void
      {
         if(null != this.m_PTMoveIntruder && Boolean(this.m_PTMoveIntruder.m_stCurrentFieldGrid))
         {
            if(hitTestObject(this.m_PTMoveIntruder))
            {
               this.m_isHited = true;
               if(a_1276.length > 0)
               {
                  gotoAndStop((a_1276[this.a_1587] as FrameLabel).frame);
               }
               this.a_4352(this.m_PTMoveIntruder);
               this.SputterHurt(this.m_PTMoveIntruder.m_stCurrentFieldGrid,this.m_PTMoveIntruder);
            }
         }
         else if(Math.abs(x - this.m_PTPosition.x) <= 0.5 && Boolean(this.m_PTFieldGrid))
         {
            this.m_isHited = true;
            if(a_1276.length > 0)
            {
               gotoAndStop((a_1276[this.a_1587] as FrameLabel).frame);
            }
            this.SputterHurt(this.m_PTFieldGrid,null);
         }
      }
   }
}

