package com.aurora.ui.maogoutd.pet
{
   import flash.utils.Dictionary;
   
   public class PetAttr
   {
      
      public var m_szName:String;
      
      public var m_iPetID:int;
      
      public var m_szGrade:String;
      
      public var m_ifire:int;
      
      public var m_iExp:int;
      
      public var m_szDesc:String;
      
      public var m_iLv:int;
      
      public var m_dictSkill:Dictionary;
      
      public function PetAttr()
      {
         super();
         this.init();
      }
      
      private function init() : void
      {
         this.m_dictSkill = new Dictionary();
      }
      
      public function skill() : void
      {
         var pet:PetSkill = new PetSkill();
         this.m_dictSkill["1"] = pet;
         this.m_dictSkill["2"] = pet;
         this.m_dictSkill["3"] = pet;
      }
   }
}

