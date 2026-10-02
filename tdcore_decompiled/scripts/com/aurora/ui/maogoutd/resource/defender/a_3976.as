package com.aurora.ui.maogoutd.resource.defender
{
   import a_4715.EncrypNumber;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   
   public class a_3976 extends a_3962
   {
      
      public var m_isMyPlacedTool:Boolean = false;
      
      protected var m_iToolType:int = 0;
      
      public var m_iMoveByMap:Boolean = false;
      
      private var m_iRotateShotMultiplier:EncrypNumber;
      
      public function a_3976()
      {
         super();
      }
      
      public function get iToolType() : int
      {
         return this.m_iToolType;
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
      
      public function a_3957(iCurrentTime:int) : void
      {
         nextFrame();
         if(a_1273 == a_1274)
         {
            gotoAndStop(1);
         }
         this.ShowPlayOther(iCurrentTime);
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
         buffCom.UpdateBuff(2);
      }
      
      override public function a_3940() : Boolean
      {
         var stBattleFieldView:BattleFieldView = null;
         if(a_1334)
         {
            a_1334.RemoveToolDefense(this);
            a_1334.m_stCurrentBattbleFieldView.stCheckFieldGridsVector[a_1334.m_iYGridNo][a_1334.m_iXGridNo].RemoveToolDefense(this);
            stBattleFieldView = a_1334.m_stCurrentBattbleFieldView;
         }
         this.m_isMyPlacedTool = false;
         super.a_3940();
         if(stBattleFieldView)
         {
            stBattleFieldView.SortDisplayObject();
            if(stBattleFieldView.GetGameMoveMap())
            {
               stBattleFieldView.GetGameMoveMap().RemoveMoveDisplayObject(this);
            }
         }
         return true;
      }
      
      protected function get m_RotateShotMultiplier() : Number
      {
         if(!this.m_iRotateShotMultiplier)
         {
            this.m_iRotateShotMultiplier = new EncrypNumber(1);
         }
         return this.m_iRotateShotMultiplier.Value;
      }
      
      protected function set m_RotateShotMultiplier(value:Number) : void
      {
         if(!this.m_iRotateShotMultiplier)
         {
            this.m_iRotateShotMultiplier = new EncrypNumber(1);
         }
         this.m_iRotateShotMultiplier.Value = value;
      }
      
      public function get RotateShotMultiplier() : Number
      {
         return this.m_RotateShotMultiplier;
      }
      
      public function AddRotateShotMultiplier(numHotMultiplierEffectAdd:Number) : void
      {
         this.m_RotateShotMultiplier += numHotMultiplierEffectAdd;
      }
   }
}

