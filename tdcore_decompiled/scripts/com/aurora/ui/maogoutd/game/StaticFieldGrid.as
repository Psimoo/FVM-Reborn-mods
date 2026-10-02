package com.aurora.ui.maogoutd.game
{
   import a_4715.EncrypIntEx;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   
   public class StaticFieldGrid
   {
      
      public var m_stSpecialBuffer:a_4108;
      
      public var m_stCurrentBattbleFieldView:BattleFieldView;
      
      private var m_iInitialXGridNoEx:EncrypIntEx;
      
      private var m_iInitialYGridNoEx:EncrypIntEx;
      
      private var m_iXGridNoEx:EncrypIntEx;
      
      private var m_iYGridNoEx:EncrypIntEx;
      
      public function StaticFieldGrid(stBattleFieldView:BattleFieldView, iXGridNo:int, iYGridNo:int)
      {
         super();
         this.m_stCurrentBattbleFieldView = stBattleFieldView;
         this.m_iXGridNo = iXGridNo;
         this.m_iYGridNo = iYGridNo;
         this.m_iInitialXGridNo = iXGridNo;
         this.m_iInitialYGridNo = iYGridNo;
      }
      
      public function get m_iInitialXGridNo() : int
      {
         if(!this.m_iInitialXGridNoEx)
         {
            this.m_iInitialXGridNoEx = new EncrypIntEx();
         }
         return this.m_iInitialXGridNoEx.Value;
      }
      
      public function set m_iInitialXGridNo(value:int) : void
      {
         if(!this.m_iInitialXGridNoEx)
         {
            this.m_iInitialXGridNoEx = new EncrypIntEx();
         }
         this.m_iInitialXGridNoEx.Value = value;
      }
      
      public function get m_iInitialYGridNo() : int
      {
         if(!this.m_iInitialYGridNoEx)
         {
            this.m_iInitialYGridNoEx = new EncrypIntEx();
         }
         return this.m_iInitialYGridNoEx.Value;
      }
      
      public function set m_iInitialYGridNo(value:int) : void
      {
         if(!this.m_iInitialYGridNoEx)
         {
            this.m_iInitialYGridNoEx = new EncrypIntEx();
         }
         this.m_iInitialYGridNoEx.Value = value;
      }
      
      public function get m_iXGridNo() : int
      {
         if(!this.m_iXGridNoEx)
         {
            this.m_iXGridNoEx = new EncrypIntEx();
         }
         return this.m_iXGridNoEx.Value;
      }
      
      public function set m_iXGridNo(value:int) : void
      {
         if(!this.m_iXGridNoEx)
         {
            this.m_iXGridNoEx = new EncrypIntEx();
         }
         this.m_iXGridNoEx.Value = value;
      }
      
      public function get m_iYGridNo() : int
      {
         if(!this.m_iYGridNoEx)
         {
            this.m_iYGridNoEx = new EncrypIntEx();
         }
         return this.m_iYGridNoEx.Value;
      }
      
      public function set m_iYGridNo(value:int) : void
      {
         if(!this.m_iYGridNoEx)
         {
            this.m_iYGridNoEx = new EncrypIntEx();
         }
         this.m_iYGridNoEx.Value = value;
      }
      
      public function a_3502() : void
      {
         if(null != this.m_stSpecialBuffer)
         {
            this.m_stSpecialBuffer.a_3940();
            this.m_stSpecialBuffer = null;
         }
      }
   }
}

