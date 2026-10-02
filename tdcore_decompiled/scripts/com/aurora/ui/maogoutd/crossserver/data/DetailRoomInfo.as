package com.aurora.ui.maogoutd.crossserver.data
{
   public class DetailRoomInfo
   {
      
      public var m_iRoomID:int;
      
      public var m_iMapID:int;
      
      public var m_iPlatformID:int;
      
      public var m_iGroupID:int;
      
      public var m_szName:String;
      
      public var m_bLock:Boolean;
      
      public var m_strPassword:String;
      
      public var m_iGameState:int;
      
      public var m_iTeamState:int;
      
      public var m_iCreateTime:int;
      
      public var m_iMapLevel:int;
      
      public var m_strPlatformName:String;
      
      public var m_strMapName:String;
      
      public var m_iStar:int;
      
      public var m_iCnt:int;
      
      public function DetailRoomInfo()
      {
         super();
         this.m_iMapLevel = 0;
         this.m_strPlatformName = "";
         this.m_strMapName = "";
         this.m_iStar = 1;
         this.m_iCnt = 1;
         this.m_iMapID = 0;
      }
   }
}

