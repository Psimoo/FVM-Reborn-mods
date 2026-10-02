package com.aurora.ui.maogoutd.im
{
   import a_4716.a_1742;
   import a_4720.EnmGameIM;
   import a_4752.GameStringManager;
   import a_4752.IGameStringManager;
   
   public class IMConfig
   {
      
      private static var gsManager:IGameStringManager = GameStringManager.getInstance();
      
      public function IMConfig()
      {
         super();
      }
      
      public static function getMsgColor(type:int) : String
      {
         var color:String = "#d3e9f8";
         switch(type)
         {
            case EnmGameIM.a_507:
               color = "#0cff00";
               break;
            case EnmGameIM.a_506:
               color = "#ff7feb";
               break;
            case EnmGameIM.a_508:
               color = "#fff600";
               break;
            case EnmGameIM.a_509:
               color = "#00ccff";
               break;
            default:
               color = "#d3e9f8";
         }
         return color;
      }
      
      public static function getDefaultFontSize() : int
      {
         return 12;
      }
      
      public static function getUserFlagDisplay(flag:int) : String
      {
         var str:String = "";
         var colors:Array = ["00ff42","00baff","db7bff","ffd100"];
         if(flag >= a_1742.enmPlatformService_vip_talkShow)
         {
            str = "<font color=\'#" + colors[int(flag / 3.1)] + "\'>*VIP" + flag + "*</font>";
         }
         return str;
      }
      
      public static function getUserNameColor() : String
      {
         return "#ff7feb";
      }
      
      public static function getPrivateColor(toOther:Boolean) : String
      {
         return "#ff7feb";
      }
      
      public static function getMsgGroupName(type:int) : String
      {
         var gn:String = gsManager.getString(133123);
         switch(type)
         {
            case EnmGameIM.a_507:
               gn = gsManager.getString(133124);
               break;
            case EnmGameIM.a_506:
               gn = gsManager.getString(133125);
               break;
            case EnmGameIM.a_508:
               gn = gsManager.getString(133126);
               break;
            case EnmGameIM.a_509:
               gn = gsManager.getString(133127);
               break;
            case EnmGameIM.MSG_TYPE_TIP:
               gn = gsManager.getString(133122);
         }
         return gn;
      }
   }
}

