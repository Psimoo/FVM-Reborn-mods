package com.aurora.ui.maogoutd.crossserver
{
   public final class CrossServerDefine
   {
      
      public static const MAP_LEVEL_COLOR_LIGHT_BLUE:String = "#dceeff";
      
      public static const MAP_LEVEL_COLOR_BLUE:String = "#44a9ff";
      
      public static const MAP_LEVEL_COLOR_PURPLE:String = "#ffb8fe";
      
      public static const MAP_LEVEL_COLOR_RED:String = "#ffbb63";
      
      public static const MAP_LEVEL_COLOR_ORANGE:String = "#ff0000";
      
      public static const ROOM_LEVEL_COLOR:Array = [MAP_LEVEL_COLOR_LIGHT_BLUE,MAP_LEVEL_COLOR_BLUE,MAP_LEVEL_COLOR_PURPLE,MAP_LEVEL_COLOR_RED,MAP_LEVEL_COLOR_ORANGE];
      
      public static var m_bSelfExit:Boolean = false;
      
      public static const CHAT_CONSORTIA:int = 1;
      
      public static const CHAT_COMMON:int = 2;
      
      public static const CHAT_PRIVATE:int = 3;
      
      public static const CHAT_TRUMPET:int = 4;
      
      public static const ROOM_LIST_RIGHT:int = 1;
      
      public static const ROOM_LIST_LEFT:int = 2;
      
      public static const ROOM_LIST_MAP_ID:int = 3;
      
      public static const ROOM_LIST_MAP_TYPE:int = 4;
      
      public static const ROOM_LIST_LEFT_TEMP:int = 5;
      
      public static const GAME_STATE_PDESTROY:int = 0;
      
      public static const GAME_STATE_WAITING:int = 1;
      
      public static const GAME_STATE_IN_GAME:int = 2;
      
      public static var m_isCrossServerUI:Boolean = false;
      
      public function CrossServerDefine()
      {
         super();
      }
      
      public static function GetMapColor(iLevel:int) : String
      {
         var color:String = null;
         if(iLevel < ROOM_LEVEL_COLOR.length)
         {
            color = CrossServerDefine.ROOM_LEVEL_COLOR[iLevel - 1];
         }
         else
         {
            color = CrossServerDefine.ROOM_LEVEL_COLOR[0];
         }
         return color;
      }
   }
}

