package com.aurora.ui.maogoutd.pag
{
   public class CrystalLevelAdditionConfig
   {
      
      public var m_iCryID:int;
      
      public var m_iType:int;
      
      public var m_sDec:String;
      
      public var m_iAddition:Array;
      
      public var m_iShowAdd:Array;
      
      public function CrystalLevelAdditionConfig()
      {
         super();
         this.m_sDec = new String();
         this.m_iAddition = new Array();
         this.m_iShowAdd = new Array();
      }
   }
}

