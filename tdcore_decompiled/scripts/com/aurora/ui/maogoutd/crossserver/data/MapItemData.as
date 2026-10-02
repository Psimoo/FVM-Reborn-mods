package com.aurora.ui.maogoutd.crossserver.data
{
   public class MapItemData
   {
      
      private var m_bOpenFlag:Boolean;
      
      private var m_iNextID:int;
      
      public var m_iID:int;
      
      public var m_iMapType:int;
      
      public var m_iMapID:int;
      
      public var m_strMapName:String;
      
      public var m_iMapLevel:int;
      
      public var m_iMinDefStar:int;
      
      public var m_iNeedCnt:int;
      
      public var m_iTeamMinDefStar:int;
      
      public var m_iTeamNeedCnt:int;
      
      public var m_iPreID:int;
      
      public var m_iPreMapID:int;
      
      public var m_arrDrops:Array;
      
      public function MapItemData()
      {
         super();
         this.m_iNextID = 0;
         this.m_bOpenFlag = false;
      }
      
      public function get IsOpenFlag() : Boolean
      {
         return this.m_bOpenFlag;
      }
      
      public function set IsOpenFlag(value:Boolean) : void
      {
         this.m_bOpenFlag = value;
      }
      
      public function get NextID() : int
      {
         return this.m_iNextID;
      }
      
      public function set NextID(value:int) : void
      {
         this.m_iNextID = value;
      }
   }
}

