package com.aurora.ui.maogoutd.resource.defender
{
   import a_4715.EncrypNumber;
   import com.aurora.ui.maogoutd.game.a_3491;
   
   public class a_3959 extends a_3962
   {
      
      private var m_iNumHotMultiplier:EncrypNumber;
      
      private var m_iParabolaPathMultiplier:EncrypNumber;
      
      private var m_iRotateShotMultiplier:EncrypNumber;
      
      private var m_iNumColdSlowMultiplier:EncrypNumber;
      
      private var m_iNumPoisonMultiplier:EncrypNumber;
      
      private var m_iNumAtackAddend:int;
      
      private var m_PoisonHurtPower:Number;
      
      private var m_iNumMoveSpeedMultiplier:EncrypNumber;
      
      public function a_3959()
      {
         super();
      }
      
      protected function set a_1325(value:Number) : void
      {
         if(!this.m_iNumHotMultiplier)
         {
            this.m_iNumHotMultiplier = new EncrypNumber(1);
         }
         this.m_iNumHotMultiplier.Value = value;
      }
      
      protected function get a_1325() : Number
      {
         if(!this.m_iNumHotMultiplier)
         {
            this.m_iNumHotMultiplier = new EncrypNumber(1);
         }
         return this.m_iNumHotMultiplier.Value;
      }
      
      protected function get m_ParabolaPathMultiplier() : Number
      {
         if(!this.m_iParabolaPathMultiplier)
         {
            this.m_iParabolaPathMultiplier = new EncrypNumber(1);
         }
         return this.m_iParabolaPathMultiplier.Value;
      }
      
      protected function set m_ParabolaPathMultiplier(value:Number) : void
      {
         if(!this.m_iParabolaPathMultiplier)
         {
            this.m_iParabolaPathMultiplier = new EncrypNumber(1);
         }
         this.m_iParabolaPathMultiplier.Value = value;
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
      
      protected function set a_1326(value:Number) : void
      {
         if(!this.m_iNumColdSlowMultiplier)
         {
            this.m_iNumColdSlowMultiplier = new EncrypNumber(1);
         }
         this.m_iNumColdSlowMultiplier.Value = value;
      }
      
      protected function get a_1326() : Number
      {
         if(!this.m_iNumColdSlowMultiplier)
         {
            this.m_iNumColdSlowMultiplier = new EncrypNumber(1);
         }
         return this.m_iNumColdSlowMultiplier.Value;
      }
      
      protected function get a_1327() : Number
      {
         if(!this.m_iNumPoisonMultiplier)
         {
            this.m_iNumPoisonMultiplier = new EncrypNumber(1);
         }
         return this.m_iNumPoisonMultiplier.Value;
      }
      
      protected function set a_1327(value:Number) : void
      {
         if(!this.m_iNumPoisonMultiplier)
         {
            this.m_iNumPoisonMultiplier = new EncrypNumber(1);
         }
         this.m_iNumPoisonMultiplier.Value = value;
      }
      
      protected function set m_numAttackAddend(value:int) : void
      {
         this.m_iNumAtackAddend = value;
      }
      
      protected function get m_numAttackAddend() : int
      {
         return this.m_iNumAtackAddend;
      }
      
      public function get numAtackAddend() : int
      {
         return this.m_numAttackAddend;
      }
      
      public function get PoisonHurtPower() : Number
      {
         return this.m_PoisonHurtPower;
      }
      
      public function set PoisonHurtPower(value:Number) : void
      {
         this.m_PoisonHurtPower = value;
      }
      
      protected function set m_numMoveSpeedMultiplier(value:Number) : void
      {
         if(!this.m_iNumMoveSpeedMultiplier)
         {
            this.m_iNumMoveSpeedMultiplier = new EncrypNumber(1);
         }
         this.m_iNumMoveSpeedMultiplier.Value = value;
      }
      
      protected function get m_numMoveSpeedMultiplier() : Number
      {
         if(!this.m_iNumMoveSpeedMultiplier)
         {
            this.m_iNumMoveSpeedMultiplier = new EncrypNumber(1);
         }
         return this.m_iNumMoveSpeedMultiplier.Value;
      }
      
      public function get numMoveSpeedMultiplier() : Number
      {
         return this.m_numMoveSpeedMultiplier;
      }
      
      public function get numPoisonMultiplier() : Number
      {
         return this.a_1327;
      }
      
      public function get numColdSlowMultiplier() : Number
      {
         return this.a_1326;
      }
      
      public function get numHotMultiplier() : Number
      {
         return this.a_1325;
      }
      
      public function get numParabolaPathMultiplier() : Number
      {
         return this.m_ParabolaPathMultiplier;
      }
      
      public function get RotateShotMultiplier() : Number
      {
         return this.m_RotateShotMultiplier;
      }
      
      public function AddHotMultiplierEffect(numHotMultiplierEffectAdd:Number) : void
      {
         this.a_1325 += numHotMultiplierEffectAdd;
      }
      
      public function AddParabolaPathMultiplier(numHotMultiplierEffectAdd:Number) : void
      {
         this.m_ParabolaPathMultiplier += numHotMultiplierEffectAdd;
      }
      
      public function AddRotateShotMultiplier(numHotMultiplierEffectAdd:Number) : void
      {
         this.m_RotateShotMultiplier += numHotMultiplierEffectAdd;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         this.PoisonHurtPower = 0;
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
      
      public function ShowAnimation() : void
      {
      }
      
      override public function a_3940() : Boolean
      {
         if(a_1334)
         {
            a_1334.a_3501(this);
            a_1334.m_stCurrentBattbleFieldView.stCheckFieldGridsVector[a_1334.m_iYGridNo][a_1334.m_iXGridNo].a_3501(this);
         }
         this.PoisonHurtPower = 0;
         super.a_3940();
         return true;
      }
   }
}

