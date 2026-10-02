package com.aurora.ui.maogoutd.resource.skill
{
   import a_4715.EncrypUintEx;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   
   public class BaseSkill
   {
      
      public var m_uiSkillID:uint = 0;
      
      public var m_stBattleFieldView:BattleFieldView;
      
      public var m_stBaseAvatar:a_3924;
      
      public var m_iSkillDegree:int = 0;
      
      protected var sourceID:String = "";
      
      protected var m_isSkillCoolingFinished:Boolean;
      
      private var m_uiSkillCoolingTimeEx:EncrypUintEx;
      
      private var m_uiStartCoolingTimeEx:EncrypUintEx;
      
      private var hasInit:Boolean = false;
      
      public function BaseSkill()
      {
         super();
      }
      
      protected function get m_uiSkillCoolingTime() : uint
      {
         if(null == this.m_uiSkillCoolingTimeEx)
         {
            this.m_uiSkillCoolingTimeEx = new EncrypUintEx(6000);
         }
         return this.m_uiSkillCoolingTimeEx.Value;
      }
      
      protected function set m_uiSkillCoolingTime(iValue:uint) : void
      {
         if(null == this.m_uiSkillCoolingTimeEx)
         {
            this.m_uiSkillCoolingTimeEx = new EncrypUintEx(6000);
         }
         this.m_uiSkillCoolingTimeEx.Value = iValue;
      }
      
      protected function get m_uiStartCoolingTime() : uint
      {
         if(null == this.m_uiStartCoolingTimeEx)
         {
            this.m_uiStartCoolingTimeEx = new EncrypUintEx(0);
         }
         return this.m_uiStartCoolingTimeEx.Value;
      }
      
      protected function set m_uiStartCoolingTime(iValue:uint) : void
      {
         if(null == this.m_uiStartCoolingTimeEx)
         {
            this.m_uiStartCoolingTimeEx = new EncrypUintEx(0);
         }
         this.m_uiStartCoolingTimeEx.Value = iValue;
      }
      
      public function a_1797() : void
      {
         if(this.hasInit == true)
         {
            return;
         }
         this.hasInit = true;
         this.m_isSkillCoolingFinished = false;
         this.m_uiStartCoolingTime = this.m_stBattleFieldView.iTimeIntervalNum;
      }
      
      public function OnTimeInterval(iTimeNum:uint) : void
      {
         if(iTimeNum - this.m_uiStartCoolingTime > this.m_uiSkillCoolingTime)
         {
            this.m_isSkillCoolingFinished = true;
         }
      }
      
      public function GetSkillCoolingTime() : uint
      {
         return this.m_uiSkillCoolingTime;
      }
      
      public function GetSkillCostCoolingTime() : uint
      {
         return this.m_stBattleFieldView.iTimeIntervalNum - this.m_uiStartCoolingTime;
      }
      
      public function UseSkill(iRandomNum:int) : void
      {
         this.m_uiStartCoolingTime = this.m_stBattleFieldView.iTimeIntervalNum;
         this.m_isSkillCoolingFinished = false;
      }
      
      public function PreUseSkill() : void
      {
         this.m_uiStartCoolingTime = this.m_stBattleFieldView.iTimeIntervalNum;
         this.m_isSkillCoolingFinished = false;
      }
      
      public function a_4330() : void
      {
         this.m_stBattleFieldView = null;
         this.m_stBaseAvatar = null;
         this.m_iSkillDegree = 0;
         this.m_isSkillCoolingFinished = false;
         this.m_uiSkillCoolingTime = 6000;
         this.m_uiStartCoolingTime = 0;
         this.hasInit = false;
         PoolManager.getInstance().CheckInOne(this);
         this.sourceID = "";
      }
      
      protected function get AvatarIsOk() : Boolean
      {
         return Boolean(null != this.m_stBaseAvatar && null != this.m_stBaseAvatar.stFieldGrid);
      }
   }
}

