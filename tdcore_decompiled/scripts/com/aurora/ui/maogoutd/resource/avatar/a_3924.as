package com.aurora.ui.maogoutd.resource.avatar
{
   import a_4715.EncrypBooleanEx;
   import a_4715.EncrypIntEx;
   import a_4715.EncrypNumber;
   import a_4715.EncrypUintEx;
   import a_4724.AvatarDetailInfo;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.BitmapData;
   import flash.filters.ColorMatrixFilter;
   
   public class a_3924 extends a_3953
   {
      
      protected static const FIGURATION_STATE_NONE:int = 0;
      
      protected static const FIGURATION_STATE_PRIMARY:int = 1;
      
      protected static const FIGURATION_STATE_INTERMEDIATE:int = 2;
      
      protected static const FIGURATION_STATE_ADVANCED:int = 3;
      
      protected static const FIGURATION_STATE_GOD:int = 4;
      
      protected var m_iFigurationEffectState:int = 0;
      
      protected var m_iSexEx:int;
      
      protected var m_battleAnim:IBattleAnim;
      
      private var m_isStartShotEx:EncrypBooleanEx;
      
      private var m_isMyPlacedEx:EncrypBooleanEx;
      
      private var m_iOnceShotNumEx:EncrypIntEx;
      
      private var m_numSputteringHurtRateEx:EncrypNumber;
      
      private var m_iTransfigurationStatusEx:EncrypIntEx;
      
      private var m_iShotTransEnergyCountEx:EncrypIntEx;
      
      private var m_iShotBoundStopTimeEx:EncrypIntEx;
      
      private var m_iSuperShotTypeIDEx:EncrypUintEx;
      
      private var m_isSuperShotAllTheTimeEx:EncrypBooleanEx;
      
      private var m_isSuperDoubleShotEx:EncrypBooleanEx;
      
      private var m_isSuperFourShotEx:EncrypBooleanEx;
      
      protected var m_isSuperThreeRowShot:Boolean = false;
      
      protected var m_isSuperFiveRowShot:Boolean = false;
      
      protected var m_isSuperBothWayShot:Boolean = false;
      
      private var m_iSuperShotIntervalTimeNumEx:EncrypIntEx;
      
      private var m_iSuperShotDelayTimeNumEx:EncrypIntEx;
      
      private var m_iSuperShotHurtForEachEx:EncrypIntEx;
      
      private var m_iSuperShotMoveSpeedEx:EncrypIntEx;
      
      private var m_iSuperLastShotTimeNumEx:EncrypIntEx;
      
      private var m_iSuperContinueShotIntervalEx:EncrypIntEx;
      
      private var m_iSuperContinueShotTimesEx:EncrypIntEx;
      
      private var m_iSuperOnceShotNumEx:EncrypIntEx;
      
      private var m_iSuperFirstShotSequenceEx:EncrypIntEx;
      
      private var m_iSuperShotSlowTimeEx:EncrypIntEx;
      
      private var m_iSuperShotSlowRateEx:EncrypIntEx;
      
      protected var m_stSuperLastWaitShotArray:Array = [];
      
      public function a_3924()
      {
         super();
      }
      
      public function get m_iSex() : int
      {
         return this.m_iSexEx;
      }
      
      public function get battleAnim() : IBattleAnim
      {
         return this.m_battleAnim;
      }
      
      public function set battleAnim(value:IBattleAnim) : void
      {
         this.m_battleAnim = value;
      }
      
      protected function get a_1289() : Boolean
      {
         if(!this.m_isStartShotEx)
         {
            this.m_isStartShotEx = new EncrypBooleanEx(false);
         }
         return this.m_isStartShotEx.Value;
      }
      
      protected function set a_1289(value:Boolean) : void
      {
         if(!this.m_isStartShotEx)
         {
            this.m_isStartShotEx = new EncrypBooleanEx(false);
         }
         this.m_isStartShotEx.Value = value;
      }
      
      public function get m_isMyPlaced() : Boolean
      {
         if(!this.m_isMyPlacedEx)
         {
            this.m_isMyPlacedEx = new EncrypBooleanEx(false);
         }
         return this.m_isMyPlacedEx.Value;
      }
      
      public function set m_isMyPlaced(value:Boolean) : void
      {
         if(!this.m_isMyPlacedEx)
         {
            this.m_isMyPlacedEx = new EncrypBooleanEx(false);
         }
         this.m_isMyPlacedEx.Value = value;
      }
      
      protected function get m_iOnceShotNum() : int
      {
         if(!this.m_iOnceShotNumEx)
         {
            this.m_iOnceShotNumEx = new EncrypIntEx(0);
         }
         return this.m_iOnceShotNumEx.Value;
      }
      
      protected function set m_iOnceShotNum(value:int) : void
      {
         if(!this.m_iOnceShotNumEx)
         {
            this.m_iOnceShotNumEx = new EncrypIntEx(0);
         }
         this.m_iOnceShotNumEx.Value = value;
      }
      
      protected function get m_numSputteringHurtRate() : Number
      {
         if(!this.m_numSputteringHurtRateEx)
         {
            this.m_numSputteringHurtRateEx = new EncrypNumber(0);
         }
         return this.m_numSputteringHurtRateEx.Value;
      }
      
      protected function set m_numSputteringHurtRate(value:Number) : void
      {
         if(!this.m_numSputteringHurtRateEx)
         {
            this.m_numSputteringHurtRateEx = new EncrypNumber(0);
         }
         this.m_numSputteringHurtRateEx.Value = value;
      }
      
      protected function get m_iTransfigurationStatus() : int
      {
         if(!this.m_iTransfigurationStatusEx)
         {
            this.m_iTransfigurationStatusEx = new EncrypIntEx(0);
         }
         return this.m_iTransfigurationStatusEx.Value;
      }
      
      protected function set m_iTransfigurationStatus(value:int) : void
      {
         if(!this.m_iTransfigurationStatusEx)
         {
            this.m_iTransfigurationStatusEx = new EncrypIntEx(0);
         }
         this.m_iTransfigurationStatusEx.Value = value;
      }
      
      protected function get m_iShotTransEnergyCount() : int
      {
         if(!this.m_iShotTransEnergyCountEx)
         {
            this.m_iShotTransEnergyCountEx = new EncrypIntEx(0);
         }
         return this.m_iShotTransEnergyCountEx.Value;
      }
      
      protected function set m_iShotTransEnergyCount(value:int) : void
      {
         if(!this.m_iShotTransEnergyCountEx)
         {
            this.m_iShotTransEnergyCountEx = new EncrypIntEx(0);
         }
         this.m_iShotTransEnergyCountEx.Value = value;
      }
      
      protected function get m_iShotBoundStopTime() : int
      {
         if(!this.m_iShotBoundStopTimeEx)
         {
            this.m_iShotBoundStopTimeEx = new EncrypIntEx(0);
         }
         return this.m_iShotBoundStopTimeEx.Value;
      }
      
      protected function set m_iShotBoundStopTime(value:int) : void
      {
         if(!this.m_iShotBoundStopTimeEx)
         {
            this.m_iShotBoundStopTimeEx = new EncrypIntEx(0);
         }
         this.m_iShotBoundStopTimeEx.Value = value;
      }
      
      protected function get m_iSuperShotTypeID() : uint
      {
         if(!this.m_iSuperShotTypeIDEx)
         {
            this.m_iSuperShotTypeIDEx = new EncrypUintEx(0);
         }
         return this.m_iSuperShotTypeIDEx.Value;
      }
      
      protected function set m_iSuperShotTypeID(value:uint) : void
      {
         if(!this.m_iSuperShotTypeIDEx)
         {
            this.m_iSuperShotTypeIDEx = new EncrypUintEx(0);
         }
         this.m_iSuperShotTypeIDEx.Value = value;
      }
      
      protected function get m_isSuperShotAllTheTime() : Boolean
      {
         if(!this.m_isSuperShotAllTheTimeEx)
         {
            this.m_isSuperShotAllTheTimeEx = new EncrypBooleanEx();
         }
         return this.m_isSuperShotAllTheTimeEx.Value;
      }
      
      protected function set m_isSuperShotAllTheTime(value:Boolean) : void
      {
         if(!this.m_isSuperShotAllTheTimeEx)
         {
            this.m_isSuperShotAllTheTimeEx = new EncrypBooleanEx();
         }
         this.m_isSuperShotAllTheTimeEx.Value = value;
      }
      
      protected function get m_isSuperDoubleShot() : Boolean
      {
         if(!this.m_isSuperDoubleShotEx)
         {
            this.m_isSuperDoubleShotEx = new EncrypBooleanEx();
         }
         return this.m_isSuperDoubleShotEx.Value;
      }
      
      protected function set m_isSuperDoubleShot(value:Boolean) : void
      {
         if(!this.m_isSuperDoubleShotEx)
         {
            this.m_isSuperDoubleShotEx = new EncrypBooleanEx();
         }
         this.m_isSuperDoubleShotEx.Value = value;
      }
      
      protected function get m_isSuperFourShot() : Boolean
      {
         if(!this.m_isSuperFourShotEx)
         {
            this.m_isSuperFourShotEx = new EncrypBooleanEx();
         }
         return this.m_isSuperFourShotEx.Value;
      }
      
      protected function set m_isSuperFourShot(value:Boolean) : void
      {
         if(!this.m_isSuperFourShotEx)
         {
            this.m_isSuperFourShotEx = new EncrypBooleanEx();
         }
         this.m_isSuperFourShotEx.Value = value;
      }
      
      protected function get m_iSuperShotIntervalTimeNum() : int
      {
         if(!this.m_iSuperShotIntervalTimeNumEx)
         {
            this.m_iSuperShotIntervalTimeNumEx = new EncrypIntEx(400);
         }
         return this.m_iSuperShotIntervalTimeNumEx.Value;
      }
      
      protected function set m_iSuperShotIntervalTimeNum(value:int) : void
      {
         if(!this.m_iSuperShotIntervalTimeNumEx)
         {
            this.m_iSuperShotIntervalTimeNumEx = new EncrypIntEx(400);
         }
         this.m_iSuperShotIntervalTimeNumEx.Value = value;
      }
      
      protected function get m_iSuperShotDelayTimeNum() : int
      {
         if(!this.m_iSuperShotDelayTimeNumEx)
         {
            this.m_iSuperShotDelayTimeNumEx = new EncrypIntEx(0);
         }
         return this.m_iSuperShotDelayTimeNumEx.Value;
      }
      
      protected function set m_iSuperShotDelayTimeNum(value:int) : void
      {
         if(!this.m_iSuperShotDelayTimeNumEx)
         {
            this.m_iSuperShotDelayTimeNumEx = new EncrypIntEx(0);
         }
         this.m_iSuperShotDelayTimeNumEx.Value = value;
      }
      
      protected function get m_iSuperShotHurtForEach() : int
      {
         if(!this.m_iSuperShotHurtForEachEx)
         {
            this.m_iSuperShotHurtForEachEx = new EncrypIntEx(10);
         }
         return this.m_iSuperShotHurtForEachEx.Value;
      }
      
      protected function set m_iSuperShotHurtForEach(value:int) : void
      {
         if(!this.m_iSuperShotHurtForEachEx)
         {
            this.m_iSuperShotHurtForEachEx = new EncrypIntEx(10);
         }
         this.m_iSuperShotHurtForEachEx.Value = value;
      }
      
      protected function get m_iSuperShotMoveSpeed() : int
      {
         if(!this.m_iSuperShotMoveSpeedEx)
         {
            this.m_iSuperShotMoveSpeedEx = new EncrypIntEx(10);
         }
         return this.m_iSuperShotMoveSpeedEx.Value;
      }
      
      protected function set m_iSuperShotMoveSpeed(value:int) : void
      {
         if(!this.m_iSuperShotMoveSpeedEx)
         {
            this.m_iSuperShotMoveSpeedEx = new EncrypIntEx(10);
         }
         this.m_iSuperShotMoveSpeedEx.Value = value;
      }
      
      protected function get m_iSuperLastShotTimeNum() : int
      {
         if(!this.m_iSuperLastShotTimeNumEx)
         {
            this.m_iSuperLastShotTimeNumEx = new EncrypIntEx(0);
         }
         return this.m_iSuperLastShotTimeNumEx.Value;
      }
      
      protected function set m_iSuperLastShotTimeNum(value:int) : void
      {
         if(!this.m_iSuperLastShotTimeNumEx)
         {
            this.m_iSuperLastShotTimeNumEx = new EncrypIntEx(0);
         }
         this.m_iSuperLastShotTimeNumEx.Value = value;
      }
      
      protected function get m_iSuperContinueShotInterval() : int
      {
         if(!this.m_iSuperContinueShotIntervalEx)
         {
            this.m_iSuperContinueShotIntervalEx = new EncrypIntEx(0);
         }
         return this.m_iSuperContinueShotIntervalEx.Value;
      }
      
      protected function set m_iSuperContinueShotInterval(value:int) : void
      {
         if(!this.m_iSuperContinueShotIntervalEx)
         {
            this.m_iSuperContinueShotIntervalEx = new EncrypIntEx(0);
         }
         this.m_iSuperContinueShotIntervalEx.Value = value;
      }
      
      protected function get m_iSuperContinueShotTimes() : int
      {
         if(!this.m_iSuperContinueShotTimesEx)
         {
            this.m_iSuperContinueShotTimesEx = new EncrypIntEx(0);
         }
         return this.m_iSuperContinueShotTimesEx.Value;
      }
      
      protected function set m_iSuperContinueShotTimes(value:int) : void
      {
         if(!this.m_iSuperContinueShotTimesEx)
         {
            this.m_iSuperContinueShotTimesEx = new EncrypIntEx(0);
         }
         this.m_iSuperContinueShotTimesEx.Value = value;
      }
      
      protected function get m_iSuperOnceShotNum() : int
      {
         if(!this.m_iSuperOnceShotNumEx)
         {
            this.m_iSuperOnceShotNumEx = new EncrypIntEx();
         }
         return this.m_iSuperOnceShotNumEx.Value;
      }
      
      protected function set m_iSuperOnceShotNum(value:int) : void
      {
         if(!this.m_iSuperOnceShotNumEx)
         {
            this.m_iSuperOnceShotNumEx = new EncrypIntEx();
         }
         this.m_iSuperOnceShotNumEx.Value = value;
      }
      
      protected function get m_iSuperFirstShotSequence() : int
      {
         if(!this.m_iSuperFirstShotSequenceEx)
         {
            this.m_iSuperFirstShotSequenceEx = new EncrypIntEx();
         }
         return this.m_iSuperFirstShotSequenceEx.Value;
      }
      
      protected function set m_iSuperFirstShotSequence(value:int) : void
      {
         if(!this.m_iSuperFirstShotSequenceEx)
         {
            this.m_iSuperFirstShotSequenceEx = new EncrypIntEx();
         }
         this.m_iSuperFirstShotSequenceEx.Value = value;
      }
      
      protected function get m_iSuperShotSlowTime() : int
      {
         if(!this.m_iSuperShotSlowTimeEx)
         {
            this.m_iSuperShotSlowTimeEx = new EncrypIntEx();
         }
         return this.m_iSuperShotSlowTimeEx.Value;
      }
      
      protected function set m_iSuperShotSlowTime(value:int) : void
      {
         if(!this.m_iSuperShotSlowTimeEx)
         {
            this.m_iSuperShotSlowTimeEx = new EncrypIntEx();
         }
         this.m_iSuperShotSlowTimeEx.Value = value;
      }
      
      protected function get m_iSuperShotSlowRate() : Number
      {
         if(!this.m_iSuperShotSlowRateEx)
         {
            this.m_iSuperShotSlowRateEx = new EncrypIntEx();
         }
         return this.m_iSuperShotSlowRateEx.Value;
      }
      
      protected function set m_iSuperShotSlowRate(value:Number) : void
      {
         if(!this.m_iSuperShotSlowRateEx)
         {
            this.m_iSuperShotSlowRateEx = new EncrypIntEx();
         }
         this.m_iSuperShotSlowRateEx.Value = value;
      }
      
      public function a_3925(stAvatarDetailInfo:AvatarDetailInfo, stBattleAnim:IBattleAnim) : Boolean
      {
         return false;
      }
      
      protected function SetFigurationState(stAvatarDetailInfo:AvatarDetailInfo) : void
      {
         var iFigurationState:int = 0;
         if(346097664 == stAvatarDetailInfo.m_iShieldType)
         {
            iFigurationState = this.GetGodsShield(stAvatarDetailInfo);
         }
         this.m_iFigurationEffectState = iFigurationState;
      }
      
      private function GetGodsShield(stAvatarDetailInfo:AvatarDetailInfo) : int
      {
         var iSkillID:int = 0;
         var iGodsShieldState:int = 0;
         var iSkillLevel:int = 0;
         var arrSkillIDs:Array = [344154128,344158224,344162320];
         if(!this.IsExitSkill(arrSkillIDs,stAvatarDetailInfo.m_arrGenInfoArray))
         {
            return FIGURATION_STATE_NONE;
         }
         var iSumSkillLevel:int = 0;
         for each(iSkillID in arrSkillIDs)
         {
            iSkillLevel = this.GetGenDegree(iSkillID,stAvatarDetailInfo.m_arrGenInfoArray);
            iSumSkillLevel += iSkillLevel;
         }
         iGodsShieldState = FIGURATION_STATE_NONE;
         if(iSumSkillLevel >= 30)
         {
            iGodsShieldState = FIGURATION_STATE_ADVANCED;
         }
         else if(iSumSkillLevel >= 24)
         {
            iGodsShieldState = FIGURATION_STATE_INTERMEDIATE;
         }
         else
         {
            iGodsShieldState = FIGURATION_STATE_PRIMARY;
         }
         return iGodsShieldState;
      }
      
      protected function GetGenDegree(iSkillID:int, arrGenInfos:Array) : int
      {
         var stGenInfo:Array = null;
         var iSkillDegree:int = 0;
         for each(stGenInfo in arrGenInfos)
         {
            if(stGenInfo[0] == iSkillID)
            {
               iSkillDegree = int(stGenInfo[1]);
               break;
            }
         }
         return iSkillDegree;
      }
      
      protected function IsExitSkill(arrSkillIDInfos:Array, arrAllSkillInfos:Array) : Boolean
      {
         var arrSkillInfo:Array = null;
         var iSkillID:int = 0;
         var iCountID:int = 0;
         for each(arrSkillInfo in arrAllSkillInfos)
         {
            iSkillID = int(arrSkillInfo[0]);
            if(-1 != arrSkillIDInfos.indexOf(iSkillID))
            {
               if(++iCountID >= arrSkillIDInfos.length)
               {
                  break;
               }
            }
         }
         return Boolean(iCountID >= arrSkillIDInfos.length);
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         var stLastWaitShot:a_4348 = null;
         this.m_iTransfigurationStatus = 0;
         this.m_iSuperLastShotTimeNum = 0;
         super.a_1797(stFieldGrid);
         this.a_1289 = false;
         for each(stLastWaitShot in this.m_stSuperLastWaitShotArray)
         {
            stLastWaitShot.a_4350();
         }
         this.m_stSuperLastWaitShotArray.length = 0;
         return true;
      }
      
      public function SetAttackRate(numRate:Number) : void
      {
         a_1311 *= numRate;
      }
      
      public function SetAttackValue(numValue:Number) : void
      {
         a_1311 += numValue;
      }
      
      public function SetAttakDelaySpeedRate(numRate:Number) : void
      {
         a_1310 *= numRate;
      }
      
      public function SetSuperAttackRate(numRate:Number) : void
      {
         this.m_iSuperShotHurtForEach *= numRate;
      }
      
      public function SetSuperAddNumber(num:Number) : void
      {
         this.m_iSuperShotHurtForEach += num;
      }
      
      public function SetSuperAttakSpeedRate(numRate:Number) : void
      {
         this.m_iSuperShotIntervalTimeNum *= numRate;
      }
      
      public function SetAttakSpeedRate(numRate:Number) : void
      {
         a_1309 *= numRate;
      }
      
      public function SetOnceShotNum(iOnceShotNum:int) : void
      {
         this.m_iOnceShotNum = iOnceShotNum;
      }
      
      public function SetSuperOnceShotNum(iShotNum:int) : void
      {
         this.m_iSuperOnceShotNum = iShotNum;
      }
      
      public function SetSputteringHurtRate(numSputteringHurtRate:Number) : void
      {
         this.m_numSputteringHurtRate = numSputteringHurtRate;
      }
      
      public function SetSuperShotSlowRate(numSuperShotSlowRate:Number) : void
      {
         this.m_iSuperShotSlowRate = numSuperShotSlowRate;
      }
      
      public function SetSuperShotSlowTime(iSuperShotSlowTime:int) : void
      {
         this.m_iSuperShotSlowTime = iSuperShotSlowTime;
      }
      
      public function SetTransfigurationStatus(iTransfigurationStatus:int) : void
      {
         this.m_iTransfigurationStatus = iTransfigurationStatus;
      }
      
      public function SetShotTransEnergyCount(iShotTransEnergyCount:int) : void
      {
         this.m_iShotTransEnergyCount = iShotTransEnergyCount;
      }
      
      public function SetShotBoundStopTime(iShotBoundStopTime:int) : void
      {
         this.m_iShotBoundStopTime = iShotBoundStopTime;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var iCurrentTime:uint = 0;
         var stBattleFieldView:BattleFieldView = null;
         var isOwnBattleFiled:Boolean = false;
         var isMyPlaced:Boolean = false;
         var stBitmapData:BitmapData = null;
         var numOrigScaleX:Number = NaN;
         var numXpos:Number = NaN;
         var numYPos:Number = NaN;
         var arrGrayArray:Array = null;
         var tmpFieldGrid:a_3491 = null;
         if(a_1334)
         {
            iXGridNo = a_1334.m_iXGridNo;
            iYGridNo = a_1334.m_iYGridNo;
            iCurrentTime = uint(a_1334.m_stCurrentBattbleFieldView.iTimeIntervalNum);
            stBattleFieldView = a_1334.m_stCurrentBattbleFieldView;
            isOwnBattleFiled = a_1334.m_stCurrentBattbleFieldView.isOwnBattleField;
            isMyPlaced = this.m_isMyPlaced;
            stBitmapData = stDisplayBitmap.bitmapData;
            numOrigScaleX = stDisplayBitmap.scaleX;
            numXpos = x + stDisplayBitmap.x;
            numYPos = y + stDisplayBitmap.y;
            super.a_3969(iRduceLifeValue);
            if(a_1339 <= 0)
            {
               if(isOwnBattleFiled && isMyPlaced && (m_iDieType == 1 || m_iDieType == 0))
               {
                  a_1088.a_2063(iCurrentTime,iXGridNo,iYGridNo);
               }
               if(!isOwnBattleFiled && Boolean(BattleFieldView.a_1054))
               {
                  BattleFieldView.a_1054.a_3576(iXGridNo,iYGridNo);
               }
               arrGrayArray = [0.3086,0.6094,0.082,0,0,0.3086,0.6094,0.082,0,0,0.3086,0.6094,0.082,0,0,0,0,0,1,0];
               stBattleFieldView.m_stAvatarBreakDownBitmap.bitmapData = stBitmapData;
               stBattleFieldView.m_stAvatarBreakDownBitmap.scaleX = numOrigScaleX;
               stBattleFieldView.m_stAvatarBreakDownBitmap.filters = [new ColorMatrixFilter(arrGrayArray)];
               stBattleFieldView.m_stAvatarBreakDownBitmap.x = numXpos;
               stBattleFieldView.m_stAvatarBreakDownBitmap.y = numYPos;
               tmpFieldGrid = stBattleFieldView.a_3438(iXGridNo,iYGridNo);
               stBattleFieldView.AddToBattleView(stBattleFieldView.m_stAvatarBreakDownBitmap,BattleLayerDefine.DEFENSE_ATTACK_FIGHTER_TYPE,tmpFieldGrid);
               if(stBattleFieldView.GetGameMoveMap())
               {
                  stBattleFieldView.GetGameMoveMap().AddMoveDisplayObject(stBattleFieldView.m_stAvatarBreakDownBitmap,iXGridNo,iYGridNo);
               }
            }
         }
         return true;
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         this.m_isMyPlaced = false;
         a_1339 = 0;
         return true;
      }
   }
}

