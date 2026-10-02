package com.aurora.ui.maogoutd.handbook.model.vo
{
   public class HandbookItemVo
   {
      
      public static const COLLECT_FLAG_CARD:int = 1 << 0;
      
      public static const COLLECT_FLAG_SKILL:int = 1 << 1;
      
      public static const COLLECT_FLAG_CRYSTONE:int = 1 << 2;
      
      public static const COLLECT_FLAG_FUSION:int = 1 << 3;
      
      public var itemID:int;
      
      public var type:int;
      
      public var classify:int;
      
      public var collectTime:Number;
      
      public var collectPt:int;
      
      public var collectState:int;
      
      public var skillCurrentLevel:int;
      
      public var crystoneCurrentLevel:int;
      
      public var fusionQualityCurrentLevel:int;
      
      public var cardHasCollect:int;
      
      public var skillHasCollect:int;
      
      public var crystoneHasCollect:int;
      
      public var fusionQualityHasCollect:int;
      
      public function HandbookItemVo()
      {
         super();
         this.skillCurrentLevel = 0;
         this.crystoneCurrentLevel = 0;
         this.fusionQualityCurrentLevel = 0;
         this.skillHasCollect = 0;
         this.crystoneHasCollect = 0;
         this.fusionQualityHasCollect = 0;
      }
      
      public function parseData() : void
      {
         this.cardHasCollect = this.isCardCollected() ? 1 : 0;
         this.skillHasCollect = this.isSkillCollected() ? 1 : 0;
         this.crystoneHasCollect = this.isCrystoneCollected() ? 1 : 0;
         this.fusionQualityHasCollect = this.isFusionQualityCollected() ? 1 : 0;
      }
      
      public function isCardCollected() : Boolean
      {
         return (this.collectState & COLLECT_FLAG_CARD) != 0;
      }
      
      public function isSkillCollected() : Boolean
      {
         return (this.collectState & COLLECT_FLAG_SKILL) != 0;
      }
      
      public function isCrystoneCollected() : Boolean
      {
         return (this.collectState & COLLECT_FLAG_CRYSTONE) != 0;
      }
      
      public function isFusionQualityCollected() : Boolean
      {
         return (this.collectState & COLLECT_FLAG_FUSION) != 0;
      }
      
      public function setCardCollected(col:Boolean) : void
      {
         if(col)
         {
            this.collectState |= COLLECT_FLAG_CARD;
         }
         else
         {
            this.collectState &= ~COLLECT_FLAG_CARD;
         }
      }
      
      public function setSkillCollected(col:Boolean) : void
      {
         if(col)
         {
            this.collectState |= COLLECT_FLAG_SKILL;
         }
         else
         {
            this.collectState &= ~COLLECT_FLAG_SKILL;
         }
      }
      
      public function setCrystoneCollected(col:Boolean) : void
      {
         if(col)
         {
            this.collectState |= COLLECT_FLAG_CRYSTONE;
         }
         else
         {
            this.collectState &= ~COLLECT_FLAG_CRYSTONE;
         }
      }
      
      public function setFusionQualityCollected(col:Boolean) : void
      {
         if(col)
         {
            this.collectState |= COLLECT_FLAG_FUSION;
         }
         else
         {
            this.collectState &= ~COLLECT_FLAG_FUSION;
         }
      }
   }
}

