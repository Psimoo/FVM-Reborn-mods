package com.aurora.ui.maogoutd.compositemap.data
{
   public class ComMapData
   {
      
      public var m_iMapID:int;
      
      public var m_strBGUrl:String;
      
      public var m_strInsideBGUrl:String;
      
      public var m_strShowBGUrl:String;
      
      public var m_strShowInsideBGUrl:String;
      
      public var m_strSoundBGUrl:String;
      
      public var m_strBossSoundBGUrl:String;
      
      public var m_iStageType:int;
      
      public var m_iBattleModeType:int;
      
      public var m_iWeatherType:int;
      
      public var m_iDropType:int;
      
      public var m_iAirTime:int;
      
      public var m_FrozenTime:int;
      
      public var m_FrozenCDTime:int;
      
      public var sandstorm_restore:int = -1;
      
      public var sandstorm_initial_col:int;
      
      public var sandstorm_time:int;
      
      public var sandstormCD_time:int;
      
      public var tornado_time:int = -1;
      
      public var tornado_num:int;
      
      public var m_vGridData:Vector.<FieldGridData>;
      
      public function ComMapData()
      {
         super();
         this.m_vGridData = new Vector.<FieldGridData>();
      }
   }
}

