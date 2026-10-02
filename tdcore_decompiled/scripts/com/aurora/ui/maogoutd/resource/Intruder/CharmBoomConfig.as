package com.aurora.ui.maogoutd.resource.Intruder
{
   public class CharmBoomConfig
   {
      
      public var isCharmed:Boolean = false;
      
      public var sourceDefenseId:int = 0;
      
      public var poisonRange:int = 0;
      
      public var poisonDamage:int = 0;
      
      public var boomRange:int = 1;
      
      public var boomDamage:int = 0;
      
      public var boomEffectClass:Class = null;
      
      public function CharmBoomConfig()
      {
         super();
      }
      
      public static function Create(sourceDefenseId:int, boomRange:int, boomDamage:int, poisonRange:int = 0, poisonDamage:int = 0, boomEffectClass:Class = null) : CharmBoomConfig
      {
         var c:CharmBoomConfig = new CharmBoomConfig();
         c.isCharmed = true;
         c.sourceDefenseId = sourceDefenseId;
         c.boomRange = boomRange;
         c.boomDamage = boomDamage;
         c.poisonRange = poisonRange;
         c.poisonDamage = poisonDamage;
         c.boomEffectClass = boomEffectClass;
         return c;
      }
      
      public function Reset() : void
      {
         this.isCharmed = false;
         this.sourceDefenseId = 0;
         this.boomRange = 1;
         this.poisonRange = 0;
         this.poisonDamage = 0;
         this.boomDamage = 0;
         this.boomEffectClass = null;
      }
      
      public function CopyFrom(st:CharmBoomConfig) : void
      {
         if(st == null)
         {
            this.Reset();
            return;
         }
         this.isCharmed = st.isCharmed;
         this.sourceDefenseId = st.sourceDefenseId;
         this.boomRange = st.boomRange;
         this.poisonRange = st.poisonRange;
         this.poisonDamage = st.poisonDamage;
         this.boomDamage = st.boomDamage;
         this.boomEffectClass = st.boomEffectClass;
      }
   }
}

