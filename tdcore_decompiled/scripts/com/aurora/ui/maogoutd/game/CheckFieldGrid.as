package com.aurora.ui.maogoutd.game
{
   import a_4715.EncrypIntEx;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.defender.a_3959;
   import com.aurora.ui.maogoutd.resource.defender.a_3960;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.defender.a_3971;
   import com.aurora.ui.maogoutd.resource.defender.a_3975;
   import com.aurora.ui.maogoutd.resource.defender.a_3976;
   import com.aurora.ui.maogoutd.resource.defender.a_3977;
   
   public class CheckFieldGrid
   {
      
      public var m_stProtector:a_3975;
      
      public var m_stAttackFighter:a_3953;
      
      public var m_stTrayDefense:a_3977;
      
      public var m_stBoomDefense:a_3960;
      
      public var m_stFlowerDefense:a_3971;
      
      public var m_stBaseAuxiliaryFighter:a_3959;
      
      public var m_stBaseToolDefense:a_3976;
      
      public var m_stCurrentBattbleFieldView:BattleFieldView;
      
      private var m_iInitialXGridNoEx:EncrypIntEx;
      
      private var m_iInitialYGridNoEx:EncrypIntEx;
      
      private var m_iXGridNoEx:EncrypIntEx;
      
      private var m_iYGridNoEx:EncrypIntEx;
      
      public function CheckFieldGrid(stBattleFieldView:BattleFieldView, iXGridNo:int, iYGridNo:int)
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
      
      public function CheckDefense(stFieldGrid:a_3491) : void
      {
         if(stFieldGrid.m_stAttackFighter)
         {
            if(stFieldGrid.m_stAttackFighter != this.m_stAttackFighter)
            {
               stFieldGrid.m_stAttackFighter.a_3940();
            }
         }
         if(stFieldGrid.m_stTrayDefense)
         {
            if(stFieldGrid.m_stTrayDefense != this.m_stTrayDefense)
            {
               stFieldGrid.m_stTrayDefense.a_3940();
            }
         }
         if(stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            if(stFieldGrid.m_stBaseAuxiliaryFighter != this.m_stBaseAuxiliaryFighter)
            {
               stFieldGrid.m_stBaseAuxiliaryFighter.a_3940();
            }
         }
         if(stFieldGrid.m_stFlowerDefense)
         {
            if(stFieldGrid.m_stFlowerDefense != this.m_stFlowerDefense)
            {
               stFieldGrid.m_stFlowerDefense.a_3940();
            }
         }
         if(stFieldGrid.m_stProtector)
         {
            if(stFieldGrid.m_stProtector != this.m_stProtector)
            {
               stFieldGrid.m_stProtector.a_3940();
            }
         }
         if(stFieldGrid.m_stBaseToolDefense)
         {
            if(stFieldGrid.m_stBaseToolDefense != this.m_stBaseToolDefense)
            {
               stFieldGrid.m_stBaseToolDefense.a_3940();
            }
         }
      }
      
      public function a_3441(stBaseDefense:a_3962) : void
      {
         if(stBaseDefense is a_3975 && this.m_stProtector == null)
         {
            this.m_stProtector = stBaseDefense as a_3975;
         }
         else if(stBaseDefense is a_3953 && this.m_stAttackFighter == null)
         {
            this.m_stAttackFighter = stBaseDefense as a_3953;
         }
         else if(stBaseDefense is a_3977 && this.m_stTrayDefense == null)
         {
            this.m_stTrayDefense = stBaseDefense as a_3977;
         }
         else if(stBaseDefense is a_3960 && this.m_stBoomDefense == null)
         {
            this.m_stBoomDefense = stBaseDefense as a_3960;
         }
         else if(stBaseDefense is a_3971 && this.m_stFlowerDefense == null)
         {
            this.m_stFlowerDefense = stBaseDefense as a_3971;
         }
         else if(stBaseDefense is a_3959 && this.m_stBaseAuxiliaryFighter == null)
         {
            this.m_stBaseAuxiliaryFighter = stBaseDefense as a_3959;
         }
         else if(stBaseDefense is a_3976 && this.m_stBaseToolDefense == null)
         {
            this.m_stBaseToolDefense = stBaseDefense as a_3976;
         }
         else
         {
            trace("格子已有卡片，添加失败...");
         }
      }
      
      public function a_3436(iDefenseType:int) : Boolean
      {
         if(null != this.m_stAttackFighter && this.m_stAttackFighter.a_3512() == iDefenseType)
         {
            this.m_stAttackFighter = null;
         }
         if(null != this.m_stProtector && this.m_stProtector.a_3512() == iDefenseType)
         {
            this.m_stProtector = null;
         }
         if(null != this.m_stTrayDefense && this.m_stTrayDefense.a_3512() == iDefenseType)
         {
            this.m_stTrayDefense = null;
         }
         if(null != this.m_stBoomDefense && this.m_stBoomDefense.a_3512() == iDefenseType)
         {
            this.m_stBoomDefense = null;
         }
         if(null != this.m_stFlowerDefense && this.m_stFlowerDefense.a_3512() == iDefenseType)
         {
            this.m_stFlowerDefense = null;
         }
         if(null != this.m_stBaseAuxiliaryFighter && this.m_stBaseAuxiliaryFighter.a_3512() == iDefenseType)
         {
            this.m_stBaseAuxiliaryFighter = null;
         }
         return false;
      }
      
      public function a_3496(baseProtector:a_3975) : Boolean
      {
         if(null == baseProtector || null == this.m_stProtector || baseProtector != this.m_stProtector)
         {
            return false;
         }
         this.m_stProtector = null;
         return true;
      }
      
      public function a_3497(attackFighter:a_3953) : Boolean
      {
         if(null == attackFighter || null == this.m_stAttackFighter || attackFighter != this.m_stAttackFighter)
         {
            return false;
         }
         this.m_stAttackFighter = null;
         return true;
      }
      
      public function a_3498(stTrayDefense:a_3977) : Boolean
      {
         if(null == stTrayDefense || null == this.m_stTrayDefense || stTrayDefense != this.m_stTrayDefense)
         {
            return false;
         }
         this.m_stTrayDefense = null;
         return true;
      }
      
      public function a_3499(stBoomDefense:a_3960) : Boolean
      {
         if(null == stBoomDefense || null == this.m_stBoomDefense || stBoomDefense != this.m_stBoomDefense)
         {
            return false;
         }
         this.m_stBoomDefense = null;
         return true;
      }
      
      public function a_3500(stFlowerDefense:a_3971) : Boolean
      {
         if(null == stFlowerDefense || null == this.m_stFlowerDefense || stFlowerDefense != this.m_stFlowerDefense)
         {
            return false;
         }
         this.m_stFlowerDefense = null;
         return true;
      }
      
      public function a_3501(stAuxiliaryFighter:a_3959) : Boolean
      {
         if(null == stAuxiliaryFighter || null == this.m_stBaseAuxiliaryFighter || stAuxiliaryFighter != this.m_stBaseAuxiliaryFighter)
         {
            return false;
         }
         this.m_stBaseAuxiliaryFighter = null;
         return true;
      }
      
      public function RemoveToolDefense(stToolDefense:a_3976) : Boolean
      {
         if(null == stToolDefense || null == this.m_stBaseToolDefense || stToolDefense != this.m_stBaseToolDefense)
         {
            return false;
         }
         this.m_stBaseToolDefense = null;
         return true;
      }
      
      public function a_3502() : void
      {
         this.m_stProtector = null;
         this.m_stAttackFighter = null;
         this.m_stTrayDefense = null;
         this.m_stBoomDefense = null;
         this.m_stFlowerDefense = null;
         this.m_stBaseAuxiliaryFighter = null;
         this.m_stBaseToolDefense = null;
      }
   }
}

