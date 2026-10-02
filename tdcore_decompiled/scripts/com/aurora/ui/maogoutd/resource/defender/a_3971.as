package com.aurora.ui.maogoutd.resource.defender
{
   import a_4715.EncrypBooleanEx;
   import a_4715.EncrypIntEx;
   import a_4715.EncrypNumber;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.energy.a_4157;
   import com.aurora.ui.maogoutd.resource.energy.a_4162;
   import com.aurora.ui.maogoutd.resource.props.IBaseProp;
   import flash.display.FrameLabel;
   import flash.display.MovieClip;
   import flash.utils.getTimer;
   
   public class a_3971 extends a_3962
   {
      
      private static var ms_numEnergyProduceRateEx:EncrypNumber;
      
      private static var ms_addEnergyRateEx:EncrypNumber;
      
      private var m_LockedBySkillEx:EncrypBooleanEx = new EncrypBooleanEx(false);
      
      private var m_EnergyRateEx:EncrypNumber;
      
      private var m_iLastProduceEnergyTimeEx:EncrypIntEx;
      
      private var m_iProduceEnergyTimeIntervalEx:EncrypIntEx;
      
      private var m_iEnergyTypeIDEx:EncrypIntEx;
      
      private var m_iEnergyValueEachTimeEx:EncrypIntEx;
      
      private var m_iProduceEnergyFrameLableIndexEx:EncrypIntEx;
      
      private var m_iProduceEnergyCountEx:EncrypIntEx;
      
      public var m_arrEnergyAddValueProp:Array = [];
      
      private var a_4808:EncrypIntEx = new EncrypIntEx();
      
      public function a_3971()
      {
         super();
      }
      
      public static function get a_1341() : Number
      {
         if(!ms_numEnergyProduceRateEx)
         {
            ms_numEnergyProduceRateEx = new EncrypNumber(1);
         }
         return ms_numEnergyProduceRateEx.Value + ms_addEnergyRate;
      }
      
      public static function set a_1341(value:Number) : void
      {
         if(!ms_numEnergyProduceRateEx)
         {
            ms_numEnergyProduceRateEx = new EncrypNumber(1);
         }
         ms_numEnergyProduceRateEx.Value = value;
      }
      
      public static function get ms_addEnergyRate() : Number
      {
         if(!ms_addEnergyRateEx)
         {
            ms_addEnergyRateEx = new EncrypNumber(0);
         }
         return ms_addEnergyRateEx.Value;
      }
      
      public static function set ms_addEnergyRate(value:Number) : void
      {
         if(!ms_addEnergyRateEx)
         {
            ms_addEnergyRateEx = new EncrypNumber(0);
         }
         ms_addEnergyRateEx.Value = value;
      }
      
      public function get m_LockedBySkill() : Boolean
      {
         return this.m_LockedBySkillEx.Value;
      }
      
      public function set m_LockedBySkill(value:Boolean) : void
      {
         this.m_LockedBySkillEx.Value = value;
      }
      
      public function get EnergyRate() : Number
      {
         if(!this.m_EnergyRateEx)
         {
            this.m_EnergyRateEx = new EncrypNumber(1);
         }
         return this.m_EnergyRateEx.Value;
      }
      
      public function set EnergyRate(value:Number) : void
      {
         if(!this.m_EnergyRateEx)
         {
            this.m_EnergyRateEx = new EncrypNumber(1);
         }
         this.m_EnergyRateEx.Value = value;
      }
      
      protected function get a_1342() : int
      {
         if(!this.m_iLastProduceEnergyTimeEx)
         {
            this.m_iLastProduceEnergyTimeEx = new EncrypIntEx(0);
         }
         return this.m_iLastProduceEnergyTimeEx.Value;
      }
      
      protected function set a_1342(value:int) : void
      {
         if(!this.m_iLastProduceEnergyTimeEx)
         {
            this.m_iLastProduceEnergyTimeEx = new EncrypIntEx(0);
         }
         this.m_iLastProduceEnergyTimeEx.Value = value;
      }
      
      protected function get a_1343() : int
      {
         if(!this.m_iProduceEnergyTimeIntervalEx)
         {
            this.m_iProduceEnergyTimeIntervalEx = new EncrypIntEx(0);
         }
         return this.m_iProduceEnergyTimeIntervalEx.Value;
      }
      
      protected function set a_1343(value:int) : void
      {
         if(!this.m_iProduceEnergyTimeIntervalEx)
         {
            this.m_iProduceEnergyTimeIntervalEx = new EncrypIntEx(0);
         }
         this.m_iProduceEnergyTimeIntervalEx.Value = value;
      }
      
      protected function get a_1344() : int
      {
         if(!this.m_iEnergyTypeIDEx)
         {
            this.m_iEnergyTypeIDEx = new EncrypIntEx();
         }
         return this.m_iEnergyTypeIDEx.Value;
      }
      
      protected function set a_1344(value:int) : void
      {
         if(!this.m_iEnergyTypeIDEx)
         {
            this.m_iEnergyTypeIDEx = new EncrypIntEx();
         }
         this.m_iEnergyTypeIDEx.Value = value;
      }
      
      protected function get a_1345() : int
      {
         if(!this.m_iEnergyValueEachTimeEx)
         {
            this.m_iEnergyValueEachTimeEx = new EncrypIntEx(25);
         }
         return this.m_iEnergyValueEachTimeEx.Value * this.EnergyRate;
      }
      
      protected function set a_1345(value:int) : void
      {
         if(!this.m_iEnergyValueEachTimeEx)
         {
            this.m_iEnergyValueEachTimeEx = new EncrypIntEx(25);
         }
         this.m_iEnergyValueEachTimeEx.Value = value;
      }
      
      protected function get a_1346() : int
      {
         if(!this.m_iProduceEnergyFrameLableIndexEx)
         {
            this.m_iProduceEnergyFrameLableIndexEx = new EncrypIntEx(1);
         }
         return this.m_iProduceEnergyFrameLableIndexEx.Value;
      }
      
      protected function set a_1346(value:int) : void
      {
         if(!this.m_iProduceEnergyFrameLableIndexEx)
         {
            this.m_iProduceEnergyFrameLableIndexEx = new EncrypIntEx(1);
         }
         this.m_iProduceEnergyFrameLableIndexEx.Value = value;
      }
      
      protected function get a_1347() : int
      {
         if(!this.m_iProduceEnergyCountEx)
         {
            this.m_iProduceEnergyCountEx = new EncrypIntEx(1);
         }
         return this.m_iProduceEnergyCountEx.Value;
      }
      
      protected function set a_1347(value:int) : void
      {
         if(!this.m_iProduceEnergyCountEx)
         {
            this.m_iProduceEnergyCountEx = new EncrypIntEx(1);
         }
         this.m_iProduceEnergyCountEx.Value = value;
      }
      
      public function get iEnergyTypeID() : int
      {
         return this.a_1344;
      }
      
      public function ReduceProduceEnergyTimeInterval(iProduceEnergyTimeIntervalReduce:int) : void
      {
         this.a_1343 -= iProduceEnergyTimeIntervalReduce;
      }
      
      public function AddEnergyValueEachTime(iEnergyValueEachTimeAdd:int) : void
      {
         this.a_1345 += iEnergyValueEachTimeAdd;
      }
      
      public function AddEnergyRate(rate:Number) : void
      {
         ms_addEnergyRate += rate;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         this.a_4808.Value = 0;
         super.a_1797(stFieldGrid);
         this.a_1342 = 0;
         this.a_1345 = 25 + this.a_3966();
         this.EnergyRate = 1;
         ms_addEnergyRate = 0;
         this.m_LockedBySkill = false;
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
         return width * 0.1;
      }
      
      protected function a_3956() : Number
      {
         return 0.25 * height;
      }
      
      public function ShowPlayOther(iCurrentTime:int) : void
      {
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
      }
      
      public function a_3957(iCurrentTime:int) : void
      {
         var iIndex:int = 0;
         var stFreeEnergy:a_4157 = null;
         var iProduceEnergy:int = 0;
         var iEnergyValue:int = 0;
         var stGameBasePop:IBaseProp = null;
         var stPropDisplayEffect:MovieClip = null;
         var iTime:int = 0;
         if(0 == this.a_1342)
         {
            this.a_1342 = iCurrentTime;
         }
         this.nextFrame();
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         this.ShowPlayOther(iCurrentTime);
         var arrEnergy:Array = [];
         if(a_1273 == a_1274 && !m_isShowFrozen || !m_isShowFrozen && iCurrentTime > this.a_1343 && iCurrentTime - this.a_1342 < 60 && a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            if(!stFieldGrid.m_isSilent)
            {
               for(iIndex = 0; iIndex < this.a_1347; iIndex++)
               {
                  stFreeEnergy = a_4162.getInstance().a_4163(this.a_1344);
                  if(null != stFreeEnergy && null != a_1334)
                  {
                     iProduceEnergy = int(a_1341 * this.a_1345);
                     iEnergyValue = a_1334.m_stCurrentBattbleFieldView.isOwnBattleField ? iProduceEnergy : 5;
                     stGameBasePop = this.m_arrEnergyAddValueProp.pop();
                     if(stGameBasePop)
                     {
                        iEnergyValue += stGameBasePop.a_4328().m_iEffectValue;
                     }
                     stFreeEnergy.m_stCurrentBattleField = a_1334.m_stCurrentBattbleFieldView;
                     stFreeEnergy.a_1797(0,iEnergyValue,x + this.a_3955() - 10 * iIndex,y + this.a_3956());
                     if(stGameBasePop)
                     {
                        stPropDisplayEffect = stGameBasePop.a_4327();
                        stPropDisplayEffect.x = stFreeEnergy.width;
                        stPropDisplayEffect.y = -20;
                        stFreeEnergy.addChild(stPropDisplayEffect);
                     }
                     arrEnergy.push(stFreeEnergy);
                  }
               }
            }
         }
         if(stFreeEnergy)
         {
            iTime = getTimer() % 100000000;
            if(!(this.a_4808.Value > 0 && Math.abs(iTime - this.a_4808.Value) < 5000))
            {
               while(arrEnergy.length > 0)
               {
                  stFreeEnergy = arrEnergy.pop();
                  stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stFreeEnergy,BattleLayerDefine.EFFECTS_TOP_TYPE);
               }
            }
            this.a_4808.Value = getTimer() % 100000000;
         }
         if(iCurrentTime > this.a_1342 + this.a_1343 && !stFieldGrid.m_isSilent)
         {
            this.a_1342 = iCurrentTime;
            gotoAndStop((a_1276[this.a_1346] as FrameLabel).frame);
         }
         buffCom.UpdateBuff(2);
      }
      
      override public function nextFrame() : void
      {
         super.nextFrame();
      }
      
      override public function a_3940() : Boolean
      {
         if(a_1334)
         {
            a_1334.a_3500(this);
            a_1334.m_stCurrentBattbleFieldView.stCheckFieldGridsVector[a_1334.m_iYGridNo][a_1334.m_iXGridNo].a_3500(this);
         }
         this.EnergyRate = 1;
         ms_addEnergyRate = 0;
         this.m_LockedBySkill = false;
         super.a_3940();
         return true;
      }
      
      override protected function a_3966() : int
      {
         var iSkillDegreeEffect:int = 0;
         if(m_iSkillDegree <= 3)
         {
            iSkillDegreeEffect = 2 * m_iSkillDegree;
         }
         else if(m_iSkillDegree > 3 && m_iSkillDegree <= 6)
         {
            iSkillDegreeEffect = 2 * 3 + 3 * (m_iSkillDegree - 3);
         }
         else if(m_iSkillDegree > 6)
         {
            iSkillDegreeEffect = 2 * 3 + 3 * (6 - 3) + 4 * (m_iSkillDegree - 6);
         }
         return iSkillDegreeEffect;
      }
   }
}

