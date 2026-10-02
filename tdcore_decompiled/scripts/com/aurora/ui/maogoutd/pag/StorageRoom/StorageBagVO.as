package com.aurora.ui.maogoutd.pag.StorageRoom
{
   public class StorageBagVO
   {
      
      public var id:int;
      
      public var iStoreName:String;
      
      public var maxStoreRow:int;
      
      public var unlockItems:Array;
      
      public var expandItems:Array;
      
      public var isUnlocked:Boolean = false;
      
      private var m_iCurStoreCount:int;
      
      public var m_arrCardInfos:Array;
      
      public function StorageBagVO()
      {
         super();
         this.unlockItems = [];
         this.expandItems = [];
         this.m_arrCardInfos = [];
      }
      
      public function get iCurStoreCount() : int
      {
         return this.m_iCurStoreCount;
      }
      
      public function set iCurStoreCount(value:int) : void
      {
         this.m_iCurStoreCount = value;
         this.isUnlocked = Boolean(this.m_iCurStoreCount > 0);
      }
   }
}

