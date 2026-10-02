package com.aurora.ui.maogoutd.onepiece.data
{
   import flash.display.Sprite;
   
   public class CardEvolutionItem
   {
      
      public var m_iObtainID:int;
      
      public var m_iReel:int;
      
      public var m_cost_gem_level:int;
      
      public var m_vCostItemID:Vector.<int>;
      
      public var m_obtain_ext:Vector.<Sprite>;
      
      public function CardEvolutionItem()
      {
         super();
         this.m_vCostItemID = new Vector.<int>();
         this.m_obtain_ext = new Vector.<Sprite>();
      }
   }
}

