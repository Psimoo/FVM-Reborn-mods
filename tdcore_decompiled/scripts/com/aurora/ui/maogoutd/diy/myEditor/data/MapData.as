package com.aurora.ui.maogoutd.diy.myEditor.data
{
   import com.aurora.ui.maogoutd.compositemap.data.FieldGridData;
   
   public class MapData
   {
      
      public var iMapID:int;
      
      public var sMapName:String;
      
      public var strBGUrl:String;
      
      public var strInsideBGUrl:String;
      
      public var strShowBGUrl:String;
      
      public var strShowInsideBGUrl:String;
      
      public var strSoundBGUrl:String;
      
      public var strBossSoundBGUrl:String;
      
      public var iAirTime:int;
      
      public var iNight:int;
      
      public var iPrice:int;
      
      public var iWater:int;
      
      public var vGridData:Vector.<FieldGridData>;
      
      public function MapData()
      {
         super();
         this.vGridData = new Vector.<FieldGridData>();
      }
   }
}

