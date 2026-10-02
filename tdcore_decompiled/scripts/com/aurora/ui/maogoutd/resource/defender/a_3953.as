package com.aurora.ui.maogoutd.resource.defender
{
   import a_4715.EncrypBooleanEx;
   import a_4715.EncrypIntEx;
   import a_4715.EncrypNumber;
   import a_4715.EncrypUintEx;
   import a_4752.a_2036;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Buff.BattleBuffData;
   import com.aurora.ui.maogoutd.game.Buff.BattleBuffParams;
   import com.aurora.ui.maogoutd.game.Buff.BuffComponent;
   import com.aurora.ui.maogoutd.game.Util.BattleVOUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.SleepingEffectMovie;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import com.aurora.ui.maogoutd.resource.shot.a_4388;
   import flash.display.FrameLabel;
   
   public class a_3953 extends a_3962
   {
      
      protected var m_dicAttackBuffs:Object = {};
      
      protected var m_AttackBuffsTotalRate:Number = 1;
      
      protected var m_hightHurtPower:Number;
      
      protected var m_LowHurtPower:Number;
      
      protected var m_SecondExtraSlotType:int = 0;
      
      private var m_iShotTypeIDEx:EncrypUintEx;
      
      private var m_isCanAddAttackBuffEx:EncrypBooleanEx;
      
      private var m_isSleepEx:EncrypBooleanEx;
      
      private var m_isCanInWaterEx:EncrypBooleanEx;
      
      private var m_isOnlyOnTrayEx:EncrypBooleanEx;
      
      private var m_iLastBeforeShotFrameEx:EncrypIntEx;
      
      private var m_iPlacedShotDelayTimeNumEx:EncrypIntEx;
      
      private var m_iShotIntervalTimeNumEx:EncrypIntEx;
      
      private var m_iShotDelayTimeNumEx:EncrypIntEx;
      
      private var m_iShotHurtForEachEx:EncrypIntEx;
      
      private var m_iNumHotMultiplier:EncrypNumber;
      
      private var m_SecondHotMultiplierEx:EncrypNumber;
      
      private var m_ThirdHotMultiplierEx:EncrypNumber;
      
      private var m_hotSlotMulAEx:EncrypNumber;
      
      private var m_hotSlotMulBEx:EncrypNumber;
      
      private var m_iNumAddPower:EncrypNumber;
      
      private var m_iBattleFlagAddMul:EncrypNumber;
      
      private var m_BaseAuxiliaryMultiplierEx:EncrypNumber;
      
      private var m_iShotMoveSpeedEx:EncrypIntEx;
      
      private var m_isShotAllTheTimeEx:EncrypBooleanEx;
      
      private var m_isDoubleShotEx:EncrypBooleanEx;
      
      private var m_isFourShotEx:EncrypBooleanEx;
      
      private var m_isFiveShotEx:EncrypBooleanEx;
      
      private var m_isThreeRowShotEx:EncrypBooleanEx;
      
      private var m_isFiveRowShotEx:EncrypBooleanEx;
      
      private var m_iContinueShotIntervalEx:EncrypIntEx;
      
      private var m_isBothWayShotEx:EncrypBooleanEx;
      
      private var m_iBreadFighterTypeEx:EncrypIntEx;
      
      private var m_iBattleFighterTypeEx:EncrypIntEx;
      
      private var m_iLastShotTimeNumEx:EncrypIntEx;
      
      private var m_iFirstShotSequenceEx:EncrypIntEx;
      
      private var m_iContinueShotTimesEx:EncrypIntEx;
      
      protected var a_1324:Array = [];
      
      public var m_stAddHurtEffect:a_4108;
      
      public var m_stRosesHeartAddHurtEffect:a_4108;
      
      public var m_stLigthEffect:a_4108;
      
      private var m_iLastShotTime:EncrypIntEx = new EncrypIntEx();
      
      private var m_iTimeNum:int = 0;
      
      public function a_3953()
      {
         a_1275 = 0;
         super();
      }
      
      public function get secondExtraSlotType() : int
      {
         return this.m_SecondExtraSlotType;
      }
      
      protected function get a_1304() : uint
      {
         if(!this.m_iShotTypeIDEx)
         {
            this.m_iShotTypeIDEx = new EncrypUintEx(0);
         }
         return this.m_iShotTypeIDEx.Value;
      }
      
      protected function set a_1304(value:uint) : void
      {
         if(!this.m_iShotTypeIDEx)
         {
            this.m_iShotTypeIDEx = new EncrypUintEx(0);
         }
         this.m_iShotTypeIDEx.Value = value;
      }
      
      public function get canReceiveAttackBuff() : Boolean
      {
         if(!this.m_isCanAddAttackBuffEx)
         {
            this.m_isCanAddAttackBuffEx = new EncrypBooleanEx(false);
         }
         return this.m_isCanAddAttackBuffEx.Value;
      }
      
      public function set canReceiveAttackBuff(value:Boolean) : void
      {
         if(!this.m_isCanAddAttackBuffEx)
         {
            this.m_isCanAddAttackBuffEx = new EncrypBooleanEx(false);
         }
         this.m_isCanAddAttackBuffEx.Value = value;
      }
      
      public function get m_isSleep() : Boolean
      {
         if(!this.m_isSleepEx)
         {
            this.m_isSleepEx = new EncrypBooleanEx(false);
         }
         return this.m_isSleepEx.Value;
      }
      
      public function set m_isSleep(value:Boolean) : void
      {
         if(!this.m_isSleepEx)
         {
            this.m_isSleepEx = new EncrypBooleanEx(false);
         }
         this.m_isSleepEx.Value = value;
      }
      
      protected function get a_1305() : Boolean
      {
         if(!this.m_isCanInWaterEx)
         {
            this.m_isCanInWaterEx = new EncrypBooleanEx(false);
         }
         return this.m_isCanInWaterEx.Value;
      }
      
      protected function set a_1305(value:Boolean) : void
      {
         if(!this.m_isCanInWaterEx)
         {
            this.m_isCanInWaterEx = new EncrypBooleanEx(false);
         }
         this.m_isCanInWaterEx.Value = value;
      }
      
      protected function get a_1306() : Boolean
      {
         if(!this.m_isOnlyOnTrayEx)
         {
            this.m_isOnlyOnTrayEx = new EncrypBooleanEx(false);
         }
         return this.m_isOnlyOnTrayEx.Value;
      }
      
      protected function set a_1306(value:Boolean) : void
      {
         if(!this.m_isOnlyOnTrayEx)
         {
            this.m_isOnlyOnTrayEx = new EncrypBooleanEx(false);
         }
         this.m_isOnlyOnTrayEx.Value = value;
      }
      
      protected function get a_1307() : int
      {
         if(!this.m_iLastBeforeShotFrameEx)
         {
            this.m_iLastBeforeShotFrameEx = new EncrypIntEx();
         }
         return this.m_iLastBeforeShotFrameEx.Value;
      }
      
      protected function set a_1307(value:int) : void
      {
         if(!this.m_iLastBeforeShotFrameEx)
         {
            this.m_iLastBeforeShotFrameEx = new EncrypIntEx();
         }
         this.m_iLastBeforeShotFrameEx.Value = value;
      }
      
      protected function get a_1308() : int
      {
         if(!this.m_iPlacedShotDelayTimeNumEx)
         {
            this.m_iPlacedShotDelayTimeNumEx = new EncrypIntEx(20);
         }
         return this.m_iPlacedShotDelayTimeNumEx.Value;
      }
      
      protected function set a_1308(value:int) : void
      {
         if(!this.m_iPlacedShotDelayTimeNumEx)
         {
            this.m_iPlacedShotDelayTimeNumEx = new EncrypIntEx(20);
         }
         this.m_iPlacedShotDelayTimeNumEx.Value = value;
      }
      
      protected function get a_1309() : int
      {
         if(!this.m_iShotIntervalTimeNumEx)
         {
            this.m_iShotIntervalTimeNumEx = new EncrypIntEx(26);
         }
         var v:int = this.m_iShotIntervalTimeNumEx.Value;
         if(tagCom.HasTag(30033))
         {
            if(v <= 40)
            {
               return 40;
            }
            return v * 2;
         }
         return v;
      }
      
      protected function set a_1309(value:int) : void
      {
         if(!this.m_iShotIntervalTimeNumEx)
         {
            this.m_iShotIntervalTimeNumEx = new EncrypIntEx(26);
         }
         this.m_iShotIntervalTimeNumEx.Value = value;
      }
      
      protected function get a_1310() : int
      {
         if(!this.m_iShotDelayTimeNumEx)
         {
            this.m_iShotDelayTimeNumEx = new EncrypIntEx(0);
         }
         return this.m_iShotDelayTimeNumEx.Value;
      }
      
      protected function set a_1310(value:int) : void
      {
         if(!this.m_iShotDelayTimeNumEx)
         {
            this.m_iShotDelayTimeNumEx = new EncrypIntEx(0);
         }
         this.m_iShotDelayTimeNumEx.Value = value;
      }
      
      protected function set a_1311(value:int) : void
      {
         if(!this.m_iShotHurtForEachEx)
         {
            this.m_iShotHurtForEachEx = new EncrypIntEx(10);
         }
         this.m_iShotHurtForEachEx.Value = value;
      }
      
      protected function get a_1311() : int
      {
         if(this.m_BattleFlagAddMul == 0)
         {
            return this.iAttackDamage;
         }
         return this.iAttackDamage + this.iBaseAttack * this.m_BattleFlagAddMul;
      }
      
      public function get iAttackDamage() : int
      {
         var value:int = this.iBaseAttack * this.m_numAddPower * (this.a_1325 + this.m_SecondHotMultiplier + this.m_ThirdHotMultiplier);
         var iBuffId:int = a_4206.m_iViewBuffId;
         if(iBuffId == 320012336)
         {
            value += 100;
         }
         else if(iBuffId == 320012432)
         {
            if(BattleFieldView.m_lTraceCard.indexOf(a_3512()) != -1)
            {
               value *= 1 + 0.4 * a_2036.getInstance().tagCom.GetSum("炸丸子Buff伤害叠加");
            }
         }
         else if(iBuffId == 320012448)
         {
            if((a_3512() & 0xFFFF0000) == 292552704)
            {
               value *= 1.3;
            }
         }
         return value;
      }
      
      public function get iBaseAttack() : int
      {
         var key:int = 0;
         if(!this.m_iShotHurtForEachEx)
         {
            this.m_iShotHurtForEachEx = new EncrypIntEx(10);
         }
         var buffData:BattleBuffData = buffCom.GetFirstBuff([30032,30036]);
         var addAttack:int = 0;
         if(buffData != null)
         {
            key = buffData.tag - BuffComponent.BUFF_TAG_BEGIN;
            if(key == 30032)
            {
               addAttack = buffData.value * 333;
            }
            else
            {
               addAttack = buffData.value * 666;
            }
         }
         return (this.m_iShotHurtForEachEx.Value + addAttack) * this.m_AttackBuffsTotalRate;
      }
      
      public function set a_1325(value:Number) : void
      {
         if(!this.m_iNumHotMultiplier)
         {
            this.m_iNumHotMultiplier = new EncrypNumber(1);
         }
         this.m_iNumHotMultiplier.Value = value;
      }
      
      public function get a_1325() : Number
      {
         if(!this.m_iNumHotMultiplier)
         {
            this.m_iNumHotMultiplier = new EncrypNumber(1);
         }
         return this.m_iNumHotMultiplier.Value;
      }
      
      public function set m_SecondHotMultiplier(value:Number) : void
      {
         if(!this.m_SecondHotMultiplierEx)
         {
            this.m_SecondHotMultiplierEx = new EncrypNumber(0);
         }
         this.m_SecondHotMultiplierEx.Value = value;
      }
      
      public function get m_SecondHotMultiplier() : Number
      {
         if(!this.m_SecondHotMultiplierEx)
         {
            this.m_SecondHotMultiplierEx = new EncrypNumber(1);
         }
         return this.m_SecondHotMultiplierEx.Value;
      }
      
      public function set m_ThirdHotMultiplier(value:Number) : void
      {
         if(!this.m_ThirdHotMultiplierEx)
         {
            this.m_ThirdHotMultiplierEx = new EncrypNumber(0);
         }
         this.m_ThirdHotMultiplierEx.Value = value;
      }
      
      public function get m_ThirdHotMultiplier() : Number
      {
         if(!this.m_ThirdHotMultiplierEx)
         {
            this.m_ThirdHotMultiplierEx = new EncrypNumber(1);
         }
         return this.m_ThirdHotMultiplierEx.Value;
      }
      
      public function set m_hotSlotMulA(value:Number) : void
      {
         if(!this.m_hotSlotMulAEx)
         {
            this.m_hotSlotMulAEx = new EncrypNumber(0);
         }
         this.m_hotSlotMulAEx.Value = value;
      }
      
      public function get m_hotSlotMulA() : Number
      {
         if(!this.m_hotSlotMulAEx)
         {
            this.m_hotSlotMulAEx = new EncrypNumber(0);
         }
         return this.m_hotSlotMulAEx.Value;
      }
      
      public function set m_hotSlotMulB(value:Number) : void
      {
         if(!this.m_hotSlotMulBEx)
         {
            this.m_hotSlotMulBEx = new EncrypNumber(0);
         }
         this.m_hotSlotMulBEx.Value = value;
      }
      
      public function get m_hotSlotMulB() : Number
      {
         if(!this.m_hotSlotMulBEx)
         {
            this.m_hotSlotMulBEx = new EncrypNumber(0);
         }
         return this.m_hotSlotMulBEx.Value;
      }
      
      public function set m_numAddPower(value:Number) : void
      {
         if(!this.m_iNumAddPower)
         {
            this.m_iNumAddPower = new EncrypNumber(1);
         }
         this.m_iNumAddPower.Value = value;
      }
      
      public function get m_numAddPower() : Number
      {
         if(!this.m_iNumAddPower)
         {
            this.m_iNumAddPower = new EncrypNumber(1);
         }
         return this.m_iNumAddPower.Value;
      }
      
      public function set m_BattleFlagAddMul(value:Number) : void
      {
         if(!this.m_iBattleFlagAddMul)
         {
            this.m_iBattleFlagAddMul = new EncrypNumber(0);
         }
         this.m_iBattleFlagAddMul.Value = value;
      }
      
      public function get m_BattleFlagAddMul() : Number
      {
         if(!this.m_iBattleFlagAddMul)
         {
            this.m_iBattleFlagAddMul = new EncrypNumber(0);
         }
         return this.m_iBattleFlagAddMul.Value;
      }
      
      public function set m_BaseAuxiliaryMultiplier(value:Number) : void
      {
         if(!this.m_BaseAuxiliaryMultiplierEx)
         {
            this.m_BaseAuxiliaryMultiplierEx = new EncrypNumber(0);
         }
         this.m_BaseAuxiliaryMultiplierEx.Value = value;
      }
      
      public function get m_BaseAuxiliaryMultiplier() : Number
      {
         if(!this.m_BaseAuxiliaryMultiplierEx)
         {
            this.m_BaseAuxiliaryMultiplierEx = new EncrypNumber(1);
         }
         return this.m_BaseAuxiliaryMultiplierEx.Value;
      }
      
      public function AddBaseAuxiliaryMultiplier(numHotMultiplierEffectAdd:Number) : void
      {
         this.m_BaseAuxiliaryMultiplier += numHotMultiplierEffectAdd;
      }
      
      protected function set a_1312(value:int) : void
      {
         if(!this.m_iShotMoveSpeedEx)
         {
            this.m_iShotMoveSpeedEx = new EncrypIntEx(10);
         }
         this.m_iShotMoveSpeedEx.Value = value;
      }
      
      protected function get a_1312() : int
      {
         if(!this.m_iShotMoveSpeedEx)
         {
            this.m_iShotMoveSpeedEx = new EncrypIntEx(10);
         }
         return this.m_iShotMoveSpeedEx.Value;
      }
      
      protected function get a_1313() : Boolean
      {
         if(!this.m_isShotAllTheTimeEx)
         {
            this.m_isShotAllTheTimeEx = new EncrypBooleanEx();
         }
         return this.m_isShotAllTheTimeEx.Value;
      }
      
      protected function set a_1313(value:Boolean) : void
      {
         if(!this.m_isShotAllTheTimeEx)
         {
            this.m_isShotAllTheTimeEx = new EncrypBooleanEx();
         }
         this.m_isShotAllTheTimeEx.Value = value;
      }
      
      protected function get a_1314() : Boolean
      {
         if(!this.m_isDoubleShotEx)
         {
            this.m_isDoubleShotEx = new EncrypBooleanEx(false);
         }
         return this.m_isDoubleShotEx.Value;
      }
      
      protected function set a_1314(value:Boolean) : void
      {
         if(!this.m_isDoubleShotEx)
         {
            this.m_isDoubleShotEx = new EncrypBooleanEx(false);
         }
         this.m_isDoubleShotEx.Value = value;
      }
      
      protected function get a_1315() : Boolean
      {
         if(!this.m_isFourShotEx)
         {
            this.m_isFourShotEx = new EncrypBooleanEx(false);
         }
         return this.m_isFourShotEx.Value;
      }
      
      protected function set a_1315(value:Boolean) : void
      {
         if(!this.m_isFourShotEx)
         {
            this.m_isFourShotEx = new EncrypBooleanEx(false);
         }
         this.m_isFourShotEx.Value = value;
      }
      
      protected function get m_isFiveShot() : Boolean
      {
         if(!this.m_isFiveShotEx)
         {
            this.m_isFiveShotEx = new EncrypBooleanEx(false);
         }
         return this.m_isFiveShotEx.Value;
      }
      
      protected function set m_isFiveShot(value:Boolean) : void
      {
         if(!this.m_isFiveShotEx)
         {
            this.m_isFiveShotEx = new EncrypBooleanEx(false);
         }
         this.m_isFiveShotEx.Value = value;
      }
      
      protected function get a_1316() : Boolean
      {
         if(!this.m_isThreeRowShotEx)
         {
            this.m_isThreeRowShotEx = new EncrypBooleanEx(false);
         }
         return this.m_isThreeRowShotEx.Value;
      }
      
      protected function set a_1316(value:Boolean) : void
      {
         if(!this.m_isThreeRowShotEx)
         {
            this.m_isThreeRowShotEx = new EncrypBooleanEx(false);
         }
         this.m_isThreeRowShotEx.Value = value;
      }
      
      protected function get m_isFiveRowShot() : Boolean
      {
         if(!this.m_isFiveRowShotEx)
         {
            this.m_isFiveRowShotEx = new EncrypBooleanEx(false);
         }
         return this.m_isFiveRowShotEx.Value;
      }
      
      protected function set m_isFiveRowShot(value:Boolean) : void
      {
         if(!this.m_isFiveRowShotEx)
         {
            this.m_isFiveRowShotEx = new EncrypBooleanEx(false);
         }
         this.m_isFiveRowShotEx.Value = value;
      }
      
      protected function set a_1317(value:int) : void
      {
         if(!this.m_iContinueShotIntervalEx)
         {
            this.m_iContinueShotIntervalEx = new EncrypIntEx(0);
         }
         this.m_iContinueShotIntervalEx.Value = value;
      }
      
      protected function get a_1317() : int
      {
         if(!this.m_iContinueShotIntervalEx)
         {
            this.m_iContinueShotIntervalEx = new EncrypIntEx(0);
         }
         return this.m_iContinueShotIntervalEx.Value;
      }
      
      protected function get a_1318() : Boolean
      {
         if(!this.m_isBothWayShotEx)
         {
            this.m_isBothWayShotEx = new EncrypBooleanEx(false);
         }
         return this.m_isBothWayShotEx.Value;
      }
      
      protected function set a_1318(value:Boolean) : void
      {
         if(!this.m_isBothWayShotEx)
         {
            this.m_isBothWayShotEx = new EncrypBooleanEx(false);
         }
         this.m_isBothWayShotEx.Value = value;
      }
      
      protected function get a_1319() : int
      {
         if(!this.m_iBreadFighterTypeEx)
         {
            this.m_iBreadFighterTypeEx = new EncrypIntEx(-1);
         }
         return this.m_iBreadFighterTypeEx.Value;
      }
      
      protected function set a_1319(value:int) : void
      {
         if(!this.m_iBreadFighterTypeEx)
         {
            this.m_iBreadFighterTypeEx = new EncrypIntEx(-1);
         }
         this.m_iBreadFighterTypeEx.Value = value;
      }
      
      protected function get a_1320() : int
      {
         if(!this.m_iBattleFighterTypeEx)
         {
            this.m_iBattleFighterTypeEx = new EncrypIntEx(1);
         }
         return this.m_iBattleFighterTypeEx.Value;
      }
      
      protected function set a_1320(value:int) : void
      {
         if(!this.m_iBattleFighterTypeEx)
         {
            this.m_iBattleFighterTypeEx = new EncrypIntEx(1);
         }
         this.m_iBattleFighterTypeEx.Value = value;
      }
      
      protected function set a_1321(value:int) : void
      {
         if(!this.m_iLastShotTimeNumEx)
         {
            this.m_iLastShotTimeNumEx = new EncrypIntEx(0);
         }
         this.m_iLastShotTimeNumEx.Value = value;
      }
      
      protected function get a_1321() : int
      {
         if(!this.m_iLastShotTimeNumEx)
         {
            this.m_iLastShotTimeNumEx = new EncrypIntEx(0);
         }
         return this.m_iLastShotTimeNumEx.Value;
      }
      
      protected function set a_1322(value:int) : void
      {
         if(!this.m_iFirstShotSequenceEx)
         {
            this.m_iFirstShotSequenceEx = new EncrypIntEx(0);
         }
         this.m_iFirstShotSequenceEx.Value = value;
      }
      
      protected function get a_1322() : int
      {
         if(!this.m_iFirstShotSequenceEx)
         {
            this.m_iFirstShotSequenceEx = new EncrypIntEx(0);
         }
         return this.m_iFirstShotSequenceEx.Value;
      }
      
      protected function set a_1323(value:int) : void
      {
         if(!this.m_iContinueShotTimesEx)
         {
            this.m_iContinueShotTimesEx = new EncrypIntEx(0);
         }
         this.m_iContinueShotTimesEx.Value = value;
      }
      
      protected function get a_1323() : int
      {
         if(!this.m_iContinueShotTimesEx)
         {
            this.m_iContinueShotTimesEx = new EncrypIntEx(0);
         }
         return this.m_iContinueShotTimesEx.Value;
      }
      
      public function get iBattleFighterType() : int
      {
         return this.a_1320;
      }
      
      public function get iBreadFighterType() : int
      {
         return this.a_1319;
      }
      
      public function get isShotAllTheTime() : Boolean
      {
         return this.a_1313;
      }
      
      public function get isCanInWater() : Boolean
      {
         return this.a_1305;
      }
      
      public function get isOnlyOnTray() : Boolean
      {
         return this.a_1306;
      }
      
      public function get iShotHurtForEach() : int
      {
         if(!this.m_iShotHurtForEachEx)
         {
            this.m_iShotHurtForEachEx = new EncrypIntEx(10);
         }
         return this.m_iShotHurtForEachEx.Value * this.m_AttackBuffsTotalRate;
      }
      
      public function set iShotHurtForEach(value:int) : void
      {
         if(!this.m_iShotHurtForEachEx)
         {
            this.m_iShotHurtForEachEx = new EncrypIntEx(10);
         }
         this.m_iShotHurtForEachEx.Value = value;
      }
      
      public function get iShotIntervalTimeNum() : int
      {
         return this.a_1309;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         this.m_iLastShotTime.Value = 0;
         this.a_1321 = 0;
         this.a_1311 = 10 + this.a_3965();
         this.a_1309 = 26 - this.a_3966();
         this.canReceiveAttackBuff = true;
         this.m_isSleep = false;
         this.a_1325 = 1;
         this.m_SecondHotMultiplier = 0;
         this.m_ThirdHotMultiplier = 0;
         this.m_hotSlotMulA = 0;
         this.m_hotSlotMulB = 0;
         this.m_numAddPower = 1;
         this.m_BattleFlagAddMul = 0;
         this.m_BaseAuxiliaryMultiplier = 1;
         this.m_AttackBuffsTotalRate = 1;
         this.m_iTimeNum = 0;
         var isInit:Boolean = super.a_1797(stFieldGrid);
         if(a_4206.m_iViewBuffId == 320012336)
         {
            this.SleepTime2(10 * 20);
         }
         return isInit;
      }
      
      public function AddShotHurtForEach(iAddHurtValue:int) : void
      {
         if(!this.m_iShotHurtForEachEx)
         {
            this.m_iShotHurtForEachEx = new EncrypIntEx(10);
         }
         this.m_iShotHurtForEachEx.Value += iAddHurtValue;
      }
      
      public function AddShotHurtRate(iAddRate:Number) : void
      {
         if(!this.m_iShotHurtForEachEx)
         {
            this.m_iShotHurtForEachEx = new EncrypIntEx(10);
         }
         this.m_iShotHurtForEachEx.Value *= 1 + iAddRate;
      }
      
      public function ReduceShotIntervalTime(iReduceShotInterval:int) : void
      {
         this.a_1309 -= iReduceShotInterval;
      }
      
      public function a_3954(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:a_4348 = null;
         var stNewShot:a_4348 = null;
         var numShotXpos:Number = NaN;
         var i:int = 0;
         var stStartField:a_3491 = null;
         var iShotNum:int = 0;
         if(iCurrentTime > m_iPlaceTimeIntervals + this.a_1308 && iCurrentTime >= this.a_1321 + this.a_1309)
         {
            if(this.a_1316 && a_1334.m_stCurrentBattbleFieldView.a_3430(a_1334.m_iYGridNo) <= 0)
            {
               return true;
            }
            if(this.m_isFiveRowShot && a_1334.m_stCurrentBattbleFieldView.GetFieldRowIntruderNumForFiveRow(a_1334.m_iYGridNo) <= 0)
            {
               return true;
            }
            this.a_1321 = iCurrentTime;
            stNewShot = a_4388.getInstance().a_4389(this.a_1304);
            if(null == stNewShot)
            {
               return false;
            }
            this.a_1323 = 1;
            this.a_1324.push(stNewShot);
            if(this.a_1314)
            {
               stNewShot = a_4388.getInstance().a_4389(this.a_1304);
               if(null == stNewShot)
               {
                  return false;
               }
               this.a_1324.push(stNewShot);
            }
            else if(this.a_1316)
            {
               if(a_1334.m_iYGridNo > 0)
               {
                  stNewShot = a_4388.getInstance().a_4389(this.a_1304);
                  if(null == stNewShot)
                  {
                     return false;
                  }
                  this.a_1324.push(stNewShot);
               }
               if(a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1)
               {
                  stNewShot = a_4388.getInstance().a_4389(this.a_1304);
                  if(null == stNewShot)
                  {
                     return false;
                  }
                  this.a_1324.push(stNewShot);
               }
            }
            else if(this.m_isFiveRowShot)
            {
               if(a_1334.m_iYGridNo > 0)
               {
                  stNewShot = a_4388.getInstance().a_4389(this.a_1304);
                  if(null == stNewShot)
                  {
                     return false;
                  }
                  this.a_1324.push(stNewShot);
               }
               if(a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1)
               {
                  stNewShot = a_4388.getInstance().a_4389(this.a_1304);
                  if(null == stNewShot)
                  {
                     return false;
                  }
                  this.a_1324.push(stNewShot);
               }
               if(a_1334.m_iYGridNo > 1)
               {
                  stNewShot = a_4388.getInstance().a_4389(this.a_1304);
                  if(null == stNewShot)
                  {
                     return false;
                  }
                  this.a_1324.push(stNewShot);
               }
               if(a_1334.m_iYGridNo < BattleFieldView.a_1012 - 2)
               {
                  stNewShot = a_4388.getInstance().a_4389(this.a_1304);
                  if(null == stNewShot)
                  {
                     return false;
                  }
                  this.a_1324.push(stNewShot);
               }
            }
            else if(this.a_1318)
            {
               for(i = 0; i < 2; i++)
               {
                  stNewShot = a_4388.getInstance().a_4389(this.a_1304);
                  if(null == stNewShot)
                  {
                     return false;
                  }
                  this.a_1324.push(stNewShot);
               }
            }
            else if(this.a_1315 || this.m_isFiveShot)
            {
               iShotNum = 3;
               if(this.m_isFiveShot)
               {
                  iShotNum = 4;
               }
               i = 0;
               while(true)
               {
                  if(i < iShotNum)
                  {
                     stNewShot = a_4388.getInstance().a_4389(this.a_1304);
                     if(null == stNewShot)
                     {
                        break;
                     }
                     this.a_1324.push(stNewShot);
                     i++;
                     continue;
                  }
               }
               return false;
            }
            this.a_1307 = a_1273;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - this.a_1321 == this.a_1310 && this.a_1324.length > 0)
         {
            numShotXpos = this.a_3955();
            if(a_1283)
            {
               numShotXpos = -numShotXpos;
            }
            stLastWaitShot = this.a_1324.pop();
            stLastWaitShot.iShotSequenceNum = this.a_1322;
            stLastWaitShot.m_isSpecial = this.a_1322;
            stLastWaitShot.a_1797(0,this.a_1312,this.a_1311,x + numShotXpos,y + this.a_3956(),a_1334.m_stCurrentBattbleFieldView,a_1334);
            parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
         }
         if(this.a_1314 && iCurrentTime - this.a_1321 == this.a_1310 + this.a_1317 && this.a_1324.length > 0)
         {
            numShotXpos = this.a_3955();
            if(a_1283)
            {
               numShotXpos = -numShotXpos;
            }
            stLastWaitShot = this.a_1324.pop();
            stLastWaitShot.iShotSequenceNum = 1;
            stLastWaitShot.m_isSpecial = this.a_1322;
            stLastWaitShot.a_1797(0,this.a_1312,this.a_1311,x + numShotXpos,y + this.a_3956(),a_1334.m_stCurrentBattbleFieldView,a_1334);
            parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
         }
         if(this.a_1316 && iCurrentTime - this.a_1321 == this.a_1310 + this.a_1317 * this.a_1323 && this.a_1324.length > 0)
         {
            numShotXpos = this.a_3955();
            if(a_1283)
            {
               numShotXpos = -numShotXpos;
            }
            if(1 == this.a_1323 && a_1334.m_iYGridNo > 0)
            {
               stLastWaitShot = this.a_1324.pop();
               stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo,a_1334.m_iYGridNo - 1);
               stLastWaitShot.iShotSequenceNum = this.a_1323;
               stLastWaitShot.a_1797(0,this.a_1312,this.a_1311,x + numShotXpos,y + this.a_3956() - 5,a_1334.m_stCurrentBattbleFieldView,stStartField,false,1,2);
               parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
            }
            else if(2 == this.a_1323 && a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1)
            {
               stLastWaitShot = this.a_1324.pop();
               stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo,a_1334.m_iYGridNo + 1);
               stLastWaitShot.iShotSequenceNum = this.a_1323;
               stLastWaitShot.a_1797(0,this.a_1312,this.a_1311,x + numShotXpos,y + this.a_3956() + 5,a_1334.m_stCurrentBattbleFieldView,stStartField,false,1,3);
               parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
            }
            if(this.a_1324.length > 0)
            {
               ++this.a_1323;
            }
         }
         if(this.m_isFiveRowShot && iCurrentTime - this.a_1321 == this.a_1310 + this.a_1317 * this.a_1323 && this.a_1324.length > 0)
         {
            numShotXpos = this.a_3955();
            if(a_1283)
            {
               numShotXpos = -numShotXpos;
            }
            if(1 == this.a_1323 && a_1334.m_iYGridNo > 0)
            {
               stLastWaitShot = this.a_1324.pop();
               stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo,a_1334.m_iYGridNo - 1);
               stLastWaitShot.iShotSequenceNum = this.a_1323;
               stLastWaitShot.a_1797(0,this.a_1312,this.a_1311,x + numShotXpos,y + this.a_3956() - 5,a_1334.m_stCurrentBattbleFieldView,stStartField,false,1,2);
               parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
            }
            else if(2 == this.a_1323 && a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1)
            {
               stLastWaitShot = this.a_1324.pop();
               stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo,a_1334.m_iYGridNo + 1);
               stLastWaitShot.iShotSequenceNum = this.a_1323;
               stLastWaitShot.a_1797(0,this.a_1312,this.a_1311,x + numShotXpos,y + this.a_3956() + 5,a_1334.m_stCurrentBattbleFieldView,stStartField,false,1,3);
               parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
            }
            if(3 == this.a_1323 && a_1334.m_iYGridNo > 1)
            {
               stLastWaitShot = this.a_1324.pop();
               stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo,a_1334.m_iYGridNo - 2);
               stLastWaitShot.iShotSequenceNum = this.a_1323;
               stLastWaitShot.a_1797(0,this.a_1312,this.a_1311,x + numShotXpos,y + this.a_3956() - 5,a_1334.m_stCurrentBattbleFieldView,stStartField,false,1,6);
               parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
            }
            else if(4 == this.a_1323 && a_1334.m_iYGridNo < BattleFieldView.a_1012 - 2)
            {
               stLastWaitShot = this.a_1324.pop();
               stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo,a_1334.m_iYGridNo + 2);
               stLastWaitShot.iShotSequenceNum = this.a_1323;
               stLastWaitShot.a_1797(0,this.a_1312,this.a_1311,x + numShotXpos,y + this.a_3956() + 5,a_1334.m_stCurrentBattbleFieldView,stStartField,false,1,7);
               parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
            }
            if(this.a_1324.length > 0)
            {
               ++this.a_1323;
            }
         }
         if((this.a_1315 || this.m_isFiveShot) && iCurrentTime - this.a_1321 == this.a_1310 + this.a_1317 * this.a_1323 && this.a_1324.length > 0)
         {
            numShotXpos = this.a_3955();
            if(a_1283)
            {
               numShotXpos = -numShotXpos;
            }
            stLastWaitShot = this.a_1324.pop();
            stLastWaitShot.iShotSequenceNum = this.a_1323;
            stLastWaitShot.a_1797(0,this.a_1312,this.a_1311,x + numShotXpos,y + this.a_3956(),a_1334.m_stCurrentBattbleFieldView,a_1334);
            parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
            if(this.a_1324.length > 0)
            {
               ++this.a_1323;
            }
         }
         if(this.a_1318 && iCurrentTime - this.a_1321 == this.a_1310 + this.a_1317 * this.a_1323 && this.a_1324.length > 0)
         {
            numShotXpos = this.a_3955();
            if(a_1283)
            {
               numShotXpos = -numShotXpos;
            }
            numShotXpos = width - numShotXpos;
            stLastWaitShot = this.a_1324.pop();
            stLastWaitShot.iShotSequenceNum = this.a_1323;
            stLastWaitShot.a_1797(0,this.a_1312,this.a_1311,x + numShotXpos,y + this.a_3956() + 10,a_1334.m_stCurrentBattbleFieldView,a_1334,true);
            parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
            if(this.a_1324.length > 0)
            {
               ++this.a_1323;
            }
         }
         if(stNewShot)
         {
            if(iCurrentTime - this.m_iLastShotTime.Value < 5)
            {
            }
            this.m_iLastShotTime.Value = iCurrentTime;
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         if(a_1339 <= 0)
         {
            this.a_3940();
         }
         return true;
      }
      
      protected function a_3955() : Number
      {
         return width * 0.8;
      }
      
      protected function a_3956() : Number
      {
         return 0.25 * height;
      }
      
      override protected function a_3965() : int
      {
         var iStarDegreeEffect:int = 0;
         if(a_1094 <= 3)
         {
            iStarDegreeEffect = 2 * a_1094;
         }
         else if(a_1094 > 3 && a_1094 <= 6)
         {
            iStarDegreeEffect = 2 * 3 + 2 * (a_1094 - 3);
         }
         else if(a_1094 > 6 && a_1094 <= 7)
         {
            iStarDegreeEffect = 2 * 3 + 2 * (6 - 3) + 4 * (a_1094 - 6);
         }
         else if(a_1094 > 7 && a_1094 <= 8)
         {
            iStarDegreeEffect = 2 * 3 + 2 * (6 - 3) + 4 * (7 - 6) + 6 * (a_1094 - 7);
         }
         else if(a_1094 > 8 && a_1094 <= 9)
         {
            iStarDegreeEffect = 2 * 3 + 2 * (6 - 3) + 4 + 6 + 8 * (a_1094 - 8);
         }
         else if(a_1094 > 9)
         {
            iStarDegreeEffect = 2 * 3 + 2 * (6 - 3) + 4 + 6 + 8 + 15 * (a_1094 - 9);
         }
         return iStarDegreeEffect;
      }
      
      override protected function a_3966() : int
      {
         return 1 * m_iSkillDegree;
      }
      
      public function a_3957(iCurrentTime:int) : void
      {
         nextFrame();
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(a_1273 == a_1274)
         {
            gotoAndStop(this.a_1307);
         }
         this.ShowPlayOther(iCurrentTime);
      }
      
      public function ShowPlayOther(iCurrentTime:int) : void
      {
         this.m_iTimeNum = iCurrentTime;
         if(a_1336)
         {
            a_1336.a_3957(iCurrentTime);
         }
         if(m_stFrozenCardEffect)
         {
            m_stFrozenCardEffect.a_3957(iCurrentTime);
         }
         if(m_stShiHuaEffect)
         {
            m_stShiHuaEffect.a_3957(iCurrentTime);
         }
         buffCom.UpdateBuff(2);
      }
      
      override public function a_3940() : Boolean
      {
         if(this.m_stAddHurtEffect)
         {
            this.m_stAddHurtEffect.a_3940();
            this.m_stAddHurtEffect = null;
         }
         if(this.m_stRosesHeartAddHurtEffect)
         {
            this.m_stRosesHeartAddHurtEffect.a_3940();
            this.m_stRosesHeartAddHurtEffect = null;
         }
         if(this.m_stLigthEffect)
         {
            this.m_stLigthEffect.a_3940();
            this.m_stLigthEffect = null;
         }
         if(a_1334)
         {
            a_1334.a_3497(this);
            a_1334.m_stCurrentBattbleFieldView.stCheckFieldGridsVector[a_1334.m_iYGridNo][a_1334.m_iXGridNo].a_3497(this);
         }
         this.RemoveSleepEffect();
         this.ClearAllAttackBuff();
         super.a_3940();
         return true;
      }
      
      public function ClearAllAttackBuff() : void
      {
         var sourceID:String = null;
         var id:String = null;
         var keys:Array = [];
         for(sourceID in this.m_dicAttackBuffs)
         {
            keys.push(sourceID);
         }
         for each(id in keys)
         {
            AttackBuffManager.instance.RemoveBuffTarget(id,m_iDefenseGlobalID);
         }
      }
      
      override public function a_3970() : Boolean
      {
         if(tagCom.HasTag(30021))
         {
            return false;
         }
         buffCom.RemoveBuff(30001);
         buffCom.RemoveBuff(30020);
         this.RemoveSleepEffect();
         return true;
      }
      
      public function CanBeUpGrade() : Boolean
      {
         if(tagCom.HasTag(30020) || tagCom.HasTag(30021))
         {
            return false;
         }
         return true;
      }
      
      public function SleepTime2(iSleepTime:int) : Boolean
      {
         if(tagCom.HasTag(30002) || tagCom.HasTag(30003))
         {
            return true;
         }
         this.SleepTimeByParam(30001,iSleepTime,SleepingEffectMovie);
         return true;
      }
      
      public function SleepTimeByParam(buffID:int, iSleepTime:int, moveClipClass:Class) : Boolean
      {
         if(a_1334 == null)
         {
            return false;
         }
         var battleView:BattleFieldView = a_1334.m_stCurrentBattbleFieldView;
         if(battleView == null)
         {
            return false;
         }
         var iTimeNum:int = battleView.iTimeIntervalNum;
         this.a_1321 = iTimeNum + iSleepTime;
         var params:BattleBuffParams = new BattleBuffParams();
         params.x = 36;
         params.y = 0;
         params.endCallBack = this.RemoveSleepEffect;
         params.gameMoveClipClass = moveClipClass;
         var buffData:BattleBuffData = buffCom.AddBuff(buffID,iSleepTime,params);
         if(buffData != null && buffData.stEffect != null)
         {
            battleView.AddToBattleView(buffData.stEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,a_1334);
         }
         return true;
      }
      
      private function RemoveSleepEffect() : void
      {
         this.a_1321 = this.m_iTimeNum;
      }
      
      public function a_3958(iSleepTime:int) : Boolean
      {
         this.a_1321 += iSleepTime;
         return true;
      }
      
      public function setLastShotTimeNum(iSleepTime:int) : Boolean
      {
         this.a_1321 = iSleepTime;
         return true;
      }
      
      public function GetAttackBuffRate(sourceID:String) : Number
      {
         if(this.m_dicAttackBuffs[sourceID] == null)
         {
            return 0;
         }
         return this.m_dicAttackBuffs[sourceID];
      }
      
      public function AddAttackBuffFromSource(sourceID:String, rate:Number) : void
      {
         this.m_dicAttackBuffs[sourceID] = rate;
         this.UpdateTotalAttackBuff();
      }
      
      public function RemoveAttackBuffFromSource(sourceID:String) : void
      {
         if(this.m_dicAttackBuffs[sourceID] == null)
         {
            return;
         }
         delete this.m_dicAttackBuffs[sourceID];
         this.UpdateTotalAttackBuff();
      }
      
      public function UpdateTotalAttackBuff() : void
      {
         var sourceID:String = null;
         var rate:Number = NaN;
         var groupPrefix:String = null;
         var maxRate:Number = NaN;
         this.m_AttackBuffsTotalRate = 1;
         var groupMaxRate:Object = {};
         for(sourceID in this.m_dicAttackBuffs)
         {
            rate = Number(this.m_dicAttackBuffs[sourceID]);
            groupPrefix = BattleVOUtil.GetAttackBuffMaxGroupPrefix(sourceID);
            if(groupPrefix != "")
            {
               maxRate = Number(groupMaxRate[groupPrefix]);
               if(isNaN(maxRate) || rate > maxRate)
               {
                  groupMaxRate[groupPrefix] = rate;
               }
            }
            else
            {
               this.m_AttackBuffsTotalRate *= 1 + rate;
            }
         }
         for(groupPrefix in groupMaxRate)
         {
            this.m_AttackBuffsTotalRate *= 1 + groupMaxRate[groupPrefix];
         }
      }
   }
}

