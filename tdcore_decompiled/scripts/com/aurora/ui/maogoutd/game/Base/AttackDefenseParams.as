package com.aurora.ui.maogoutd.game.Base
{
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   
   public class AttackDefenseParams
   {
      
      public var bCopyInit:Boolean = false;
      
      public var bHasAttacker:Boolean = false;
      
      public var attackDamage:int = 0;
      
      public var baseAttack:int = 0;
      
      public var flagAdd:Number = 0;
      
      public var iAttackAddend:int = 0;
      
      public function AttackDefenseParams()
      {
         super();
      }
      
      private function Reset() : void
      {
         this.bHasAttacker = false;
         this.attackDamage = 0;
         this.flagAdd = 0;
         this.iAttackAddend = 0;
      }
      
      public function InitAttacker(attacker:a_3953) : void
      {
         if(this.bCopyInit)
         {
            return;
         }
         this.iAttackAddend = 0;
         if(attacker == null)
         {
            this.Reset();
         }
         else
         {
            this.bHasAttacker = true;
            this.attackDamage = attacker.iAttackDamage;
            this.baseAttack = attacker.iBaseAttack;
            this.flagAdd = attacker.m_BattleFlagAddMul;
         }
      }
      
      public function Copy(other:AttackDefenseParams) : void
      {
         this.bHasAttacker = other.bHasAttacker;
         this.attackDamage = other.attackDamage;
         this.baseAttack = other.baseAttack;
         this.flagAdd = other.flagAdd;
         this.iAttackAddend = other.iAttackAddend;
      }
      
      public function CopyInit(other:AttackDefenseParams) : void
      {
         this.bCopyInit = true;
         this.Copy(other);
      }
   }
}

