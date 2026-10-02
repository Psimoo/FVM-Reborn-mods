package com.aurora.ui.maogoutd.game.Util
{
   import a_4714.AssetType;
   import a_4714.AssetsItemData;
   import a_4714.AssetsLoader;
   import com.aurora.ui.maogoutd.resource.bitmap.MouseScareBitmapdata;
   import com.aurora.ui.maogoutd.resource.bitmap.RedDangerFieldAlarmBitmapData;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.utils.Dictionary;
   
   public class BitMapManager
   {
      
      private static var _instance:BitMapManager;
      
      private static var a_1631:BitmapData = null;
      
      private var dictBitMap:Dictionary = new Dictionary();
      
      private var dictMapPreLoad:Dictionary = new Dictionary();
      
      private var dictNextLoad:Dictionary = new Dictionary();
      
      private var ms_stMouseScareBitmapData:BitmapData = null;
      
      public var lastMapID:String;
      
      public function BitMapManager()
      {
         super();
      }
      
      public static function getInstance() : BitMapManager
      {
         if(_instance == null)
         {
            _instance = new BitMapManager();
            _instance.nextLoadRegister();
            _instance.a_3014();
         }
         return _instance;
      }
      
      public function GetMouseScareBitmapData() : BitmapData
      {
         if(this.ms_stMouseScareBitmapData == null)
         {
            this.ms_stMouseScareBitmapData = new MouseScareBitmapdata(55,55);
         }
         return this.ms_stMouseScareBitmapData;
      }
      
      public function GetRedDangerFieldAlarmBitmapData() : BitmapData
      {
         if(a_1631 == null)
         {
            a_1631 = new RedDangerFieldAlarmBitmapData(59,59);
         }
         return a_1631;
      }
      
      private function nextLoadRegister() : void
      {
         var arr:Array = null;
         var i:int = 0;
         var dict:Dictionary = new Dictionary();
         dict["0xE00213"] = ["0xE00213","0xE00214","0xE00215","0xE00216","0xE00217","0xE00218","0xE00219"];
         dict["0xE0021C"] = ["0xE0021C","0xE0021D","0xE0021E","0xE0021F","0xE00220","0xE00221","0xE00222"];
         dict["0xE00226"] = ["0xE00226","0xE00227","0xE00228","0xE00229","0xE0022A","0xE0022B","0xE0022C"];
         dict["0xE000F1"] = ["0xE000F1","0xE000F2"];
         dict["0xE002F1"] = ["0xE002F1","0xE002F2"];
         dict["0xE01203"] = ["0xE01203","0xE01204","0xE01205","0xE01206"];
         for each(arr in dict)
         {
            for(i = 0; i < arr.length; i++)
            {
               this.dictNextLoad[arr[i]] = arr[0];
            }
         }
      }
      
      private function a_3014() : void
      {
         this.dictMapPreLoad["0xE0012D"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0012E"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00328"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00329"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0032A"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0x20000A04"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0x2000809"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0x2000820B"] = ["BattleFieldBackgroudBitmapData","MoveBlockBitmapData_0","MoveBlockBitmapData_1","MoveBlockBitmapData_2","MoveBlockBitmapData_3","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0x2000820D"] = ["BattleFieldBackgroudBitmapData","MoveBlockBitmapData_0","MoveBlockBitmapData_1","MoveBlockBitmapData_2","MoveBlockBitmapData_3","MoveBlockBitmapData_4","MoveBlockBitmapData_5","MoveBlockBitmapData_6","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0x2000880E"] = ["BattleFieldBackgroudBitmapData","MoveBlockBitmapData_0","MoveBlockBitmapData_1","MoveBlockBitmapData_2","MoveBlockBitmapData_3","MoveBlockBitmapData_4","MoveBlockBitmapData_5","MoveBlockBitmapData_6","MoveBlockBitmapData_7","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00001"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData","SevenRightBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00001_2"] = ["BattleFieldBackgroudBitmapData","MoveBlockBitmapData_0","MoveBlockBitmapData_1","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00002"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00002_1"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData","SevenRightBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00003"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00003_1"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData","SevenRightBattleFiledBitmapData","SevenRowMiddleBitmapData"];
         this.dictMapPreLoad["0xE00004"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00005"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00006"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00007"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0000A"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0000B"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0000C"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0000D"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0000E"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0000F"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00010"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00011"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00021"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00022"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00023"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00024"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00025"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00026"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00027"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0002C"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0002D"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0002E"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0002F"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00030"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00031"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00032"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00033"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00034"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00035"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00036"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00037"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00038"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00039"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0003A"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0003B"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0003C"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0003E"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0003F"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0003F_1"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00040"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00041"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00042"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00043"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00044"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00045"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00046"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00047"] = ["BattleFieldBackgroudBitmapData","MoveBlockBitmapData_0","MoveBlockBitmapData_1","MoveBlockBitmapData_10","MoveBlockBitmapData_2","MoveBlockBitmapData_3","MoveBlockBitmapData_4","MoveBlockBitmapData_5","MoveBlockBitmapData_6","MoveBlockBitmapData_7","MoveBlockBitmapData_8","MoveBlockBitmapData_9","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00048"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00049"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0004A"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0004B"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0004C"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0004E"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0004F"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00050"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00051"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00052"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00053"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00054"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00055"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00056"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00057"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00058"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00059"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0005A"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0005B"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0005C"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0005D"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0005E"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0005F"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00060"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00061"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00062"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00063"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00064"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00066"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00067"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00068"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00069"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0006A"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0006B"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0006C"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0006D"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0006E"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0006F"] = ["BattleFieldBackgroud2BitmapData","BattleFieldBackgroudBitmapData","SevenLeft2BattleFiledBitmapData","SevenLeft3BattleFiledBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00070"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00071"] = ["BattleFieldBackgroud2BitmapData","BattleFieldBackgroud3BitmapData","BattleFieldBackgroudBitmapData","SevenLeft2BattleFiledBitmapData","SevenLeft3BattleFiledBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00074"] = ["BattleFieldBackgroud2BitmapData","BattleFieldBackgroud3BitmapData","BattleFieldBackgroudBitmapData","SevenLeft2BattleFiledBitmapData","SevenLeft3BattleFiledBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00072"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00073"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE000F1"] = ["BattleFieldBackgroudBitmapData"];
         this.dictMapPreLoad["0xE00101"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00101_1"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData","SevenRightBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00102"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00102_1"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData","SevenRightBattleFiledBitmapData","SevenRowMiddleBitmapData"];
         this.dictMapPreLoad["0xE00103"] = ["BattleFieldBackgroudBitmapData","IrregularCirlceFogBitmapdata","RegularCirlceFogBitmapData","SevenLeftBattleFiledBitmapData","SevenRightBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00104"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00105"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00106"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00107"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00108"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0010A"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0010B"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0010C"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0010D"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0010E"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0010F"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00110"] = ["BattleFieldBackgroudBitmapData","NightHighAirCloudBitmapData","NightLowAirCloudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00111"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00114"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00115"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00116"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00117"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00118"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00119"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00120"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00121"] = ["BattleFieldBackgroudBitmapData","IrregularCirlceFogBitmapdata","RegularCirlceFogBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00122"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00123"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00124"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00125"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00126"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00127"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00128"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00129"] = ["BattleArea0BitmapData","BattleArea1BitmapData","BattleBackground0BitmapData","BattleBackground1BitmapData","BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0012A"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0012B"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0012C"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE001F1"] = ["BattleFieldBackgroudBitmapData"];
         this.dictMapPreLoad["0xE00201"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00202"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00203"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00204"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00205"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00206"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00207"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00209"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00210"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00211"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00212"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00213"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0021C"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00226"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00233"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00234"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00235"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00236"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00237"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00238"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00239"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0023A"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0023B"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0023C"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0023D"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0023E"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0023F"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00240"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00241"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00242"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00243"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00244"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00245"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00246"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00248"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00249"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0024A"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0024B"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0024C"] = ["BattleFieldBackgroudBitmapData","MoveBlockBitmapData_0","MoveBlockBitmapData_1","MoveBlockBitmapData_10","MoveBlockBitmapData_2","MoveBlockBitmapData_3","MoveBlockBitmapData_4","MoveBlockBitmapData_5","MoveBlockBitmapData_6","MoveBlockBitmapData_7","MoveBlockBitmapData_8","MoveBlockBitmapData_9","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0024D"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0024E"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0024F"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00250"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00251"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00252"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00253"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00254"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00255"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00256"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00257"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00258"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00259"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0025A"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0025B"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0025C"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0025D"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0025E"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0025F"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00260"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00261"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00262"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00263"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00264"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00265"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00266"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00267"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00268"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00269"] = ["BattleFieldBackgroudBitmapData","MoveBlockBitmapData_0","SevenLeft2BattleFiledBitmapData","SevenLeft3BattleFiledBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0026A"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0026B"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0026C"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0026D"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE002F1"] = ["BattleFieldBackgroudBitmapData"];
         this.dictMapPreLoad["0xE00301"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00301_1"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData","SevenRightBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00302"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00302_1"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData","SevenRightBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00304"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00305"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00306"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00307"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00308"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00309"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0030A"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0030C"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0030D"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0030E"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0030F"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00310"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00311"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00312"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00313"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00314"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00315"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00316"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00317"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00318"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00319"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0031A"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0031B"] = ["BattleFieldBackgroudBitmapData","IrregularCirlceFogBitmapdata","RegularCirlceFogBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0031C"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0031D"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0031E"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0031F"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00320"] = ["BattleFieldBackgroudBitmapData","IrregularCirlceFogBitmapdata","RegularCirlceFogBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00321"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00322"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00323"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00324"] = ["BattleArea0BitmapData","BattleArea1BitmapData","BattleArea2BitmapData","BattleBackground0BitmapData","BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00325"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00326"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00327"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE003F1"] = ["BattleFieldBackgroudBitmapData"];
         this.dictMapPreLoad["0xE00401"] = ["BattleFieldBackgroudBitmapData","IrregularCirlceFogBitmapdata","RegularCirlceFogBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00404"] = ["BattleFieldBackgroudBitmapData","IrregularCirlceFogBitmapdata","RegularCirlceFogBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00701"] = ["BattleFieldBackgroudBitmapData","IrregularCirlceFogBitmapdata","RegularCirlceFogBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00805"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00806"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00807"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00808"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00809"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0080B"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0080C"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0080D"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00901"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00902"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00904"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00A02"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00A03"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00A04"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00A05"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00A06"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00A07"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00A08"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00B03"] = ["BattleArea0BitmapData","BattleArea1BitmapData","BattleArea2BitmapData","BattleBackground0BitmapData","BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00B04"] = ["BattleArea0BitmapData","BattleArea1BitmapData","BattleArea2BitmapData","BattleBackground0BitmapData","BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE01001"] = ["BattleFieldBackgroudBitmapData","DayHighAirCloudBitmapData","DayLowAirCloudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE01001_1"] = ["BattleFieldBackgroudBitmapData","DayHighAirCloudBitmapData","DayLowAirCloudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE01002"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData","SevenRightBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE01003"] = ["BattleFieldBackgroudBitmapData","DayHighAirCloudBitmapData","DayLowAirCloudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE01004"] = ["BattleFieldBackgroudBitmapData","DayHighAirCloudBitmapData","DayLowAirCloudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE01005"] = ["BattleFieldBackgroudBitmapData","DayHighAirCloudBitmapData","DayLowAirCloudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE01201"] = ["BattleFieldBackgroudBitmapData","DayHighAirCloudBitmapData","DayLowAirCloudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE01203"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData","ValentineActiveABitmapData","ValentineActiveBBitmapData","ValentineActiveCBitmapData","ValentineActiveDBitmapData","ValentineHighAirCloudBitmapData","ValentineLowAirCloudBitmapData"];
         this.dictMapPreLoad["0xE01207"] = ["BattleFieldBackgroudBitmapData","NightHighAirCloudBitmapData","NightLowAirCloudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE01208"] = ["BattleFieldBackgroudBitmapData","DayHighAirCloudBitmapData","DayLowAirCloudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE01209"] = ["BattleFieldBackgroudBitmapData","DayHighAirCloudBitmapData","DayLowAirCloudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0120A"] = ["BattleFieldBackgroudBitmapData","NightHighAirCloudBitmapData","NightLowAirCloudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0120B"] = ["BattleFieldBackgroudBitmapData","MoveBlockBitmapData_9","NightHighAirCloudBitmapData","NightLowAirCloudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0120C"] = ["BattleFieldBackgroud2BitmapData","BattleFieldBackgroud3BitmapData","BattleFieldBackgroudBitmapData","MoveBlockBitmapData_8","MoveBlockBitmapData_9","NightHighAirCloudBitmapData","NightLowAirCloudBitmapData","SevenLeft2BattleFiledBitmapData","SevenLeft3BattleFiledBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0120D"] = ["BattleFieldBackgroudBitmapData","DayHighAirCloudBitmapData","DayLowAirCloudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0120E"] = ["BattleFieldBackgroudBitmapData","DayHighAirCloudBitmapData","DayLowAirCloudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE01301"] = ["BattleFieldBackgroudBitmapData","NightHighAirCloudBitmapData","NightLowAirCloudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE01A01"] = ["BattleFieldBackgroudBitmapData","NightHighAirCloudBitmapData","NightLowAirCloudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE08001"] = ["BattleFieldBackgroudBitmapData","MoveBlockBitmapData_0","MoveBlockBitmapData_1","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE08004"] = ["BattleFieldBackgroudBitmapData","MoveBlockBitmapData_0","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE08005"] = ["BattleFieldBackgroudBitmapData","MoveBlockBitmapData_0","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE08006"] = ["BattleFieldBackgroudBitmapData","MoveBlockBitmapData_0","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE08007"] = ["BattleFieldBackgroudBitmapData","MoveBlockBitmapData_0","MoveBlockBitmapData_1","MoveBlockBitmapData_10","MoveBlockBitmapData_2","MoveBlockBitmapData_3","MoveBlockBitmapData_4","MoveBlockBitmapData_5","MoveBlockBitmapData_6","MoveBlockBitmapData_7","MoveBlockBitmapData_8","MoveBlockBitmapData_9","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0800A"] = ["BattleFieldBackgroudBitmapData","MoveBlockBitmapData_0","MoveBlockBitmapData_1","MoveBlockBitmapData_2","MoveBlockBitmapData_3","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0800C"] = ["BattleFieldBackgroudBitmapData","MoveBlockBitmapData_0","MoveBlockBitmapData_1","MoveBlockBitmapData_2","MoveBlockBitmapData_3","MoveBlockBitmapData_4","MoveBlockBitmapData_5","MoveBlockBitmapData_6","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0800F"] = ["BattleFieldBackgroudBitmapData","MoveBlockBitmapData_0","MoveBlockBitmapData_1","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE08010"] = ["BattleFieldBackgroudBitmapData","MoveBlockBitmapData_0","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE08011"] = ["BattleFieldBackgroudBitmapData","MoveBlockBitmapData_0","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE08103"] = ["BattleFieldBackgroudBitmapData","MoveBlockBitmapData_0","MoveBlockBitmapData_1","MoveBlockBitmapData_2","MoveBlockBitmapData_3","MoveBlockBitmapData_4","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE08202"] = ["BattleFieldBackgroudBitmapData","MoveBlockBitmapData_0","MoveBlockBitmapData_1","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE08205"] = ["BattleFieldBackgroudBitmapData","MoveBlockBitmapData_0","MoveBlockBitmapData_1","MoveBlockBitmapData_10","MoveBlockBitmapData_2","MoveBlockBitmapData_3","MoveBlockBitmapData_4","MoveBlockBitmapData_5","MoveBlockBitmapData_6","MoveBlockBitmapData_7","MoveBlockBitmapData_8","MoveBlockBitmapData_9","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0820B"] = ["BattleFieldBackgroudBitmapData","MoveBlockBitmapData_0","MoveBlockBitmapData_1","MoveBlockBitmapData_2","MoveBlockBitmapData_3","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0820D"] = ["BattleFieldBackgroudBitmapData","MoveBlockBitmapData_0","MoveBlockBitmapData_1","MoveBlockBitmapData_2","MoveBlockBitmapData_3","MoveBlockBitmapData_4","MoveBlockBitmapData_5","MoveBlockBitmapData_6","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0820E"] = ["BattleFieldBackgroudBitmapData","MoveBlockBitmapData_0","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0820F"] = ["BattleFieldBackgroudBitmapData","MoveBlockBitmapData_0","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE08210"] = ["BattleFieldBackgroudBitmapData","MoveBlockBitmapData_0","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE08211"] = ["BattleFieldBackgroudBitmapData","MoveBlockBitmapData_0","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE08213"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE08214"] = ["BattleFieldBackgroudBitmapData","MoveBlockBitmapData_0","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE08215"] = ["BattleFieldBackgroudBitmapData","MoveBlockBitmapData_0","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE08216"] = ["BattleFieldBackgroudBitmapData","MoveBlockBitmapData_0","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE08217"] = ["BattleFieldBackgroudBitmapData","MoveBlockBitmapData_0","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE08218"] = ["BattleFieldBackgroudBitmapData","MoveBlockBitmapData_0","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE08219"] = ["BattleFieldBackgroudBitmapData","MoveBlockBitmapData_0","MoveBlockBitmapData_1","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0821A"] = ["BattleFieldBackgroudBitmapData","MoveBlockBitmapData_0","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0821B"] = ["BattleFieldBackgroudBitmapData","MoveBlockBitmapData_0","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE08303"] = ["BattleFieldBackgroudBitmapData","MoveBlockBitmapData_0","MoveBlockBitmapData_1","MoveBlockBitmapData_2","MoveBlockBitmapData_3","MoveBlockBitmapData_4","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE08304"] = ["BattleFieldBackgroudBitmapData","MoveBlockBitmapData_0","MoveBlockBitmapData_1","MoveBlockBitmapData_2","MoveBlockBitmapData_3","MoveBlockBitmapData_4","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE08306"] = ["BattleFieldBackgroudBitmapData","MoveBlockBitmapData_0","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE08805"] = ["BattleFieldBackgroudBitmapData","MoveBlockBitmapData_0","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0880E"] = ["BattleFieldBackgroudBitmapData","MoveBlockBitmapData_0","MoveBlockBitmapData_1","MoveBlockBitmapData_2","MoveBlockBitmapData_3","MoveBlockBitmapData_4","MoveBlockBitmapData_5","MoveBlockBitmapData_6","MoveBlockBitmapData_7","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE08A01"] = ["BattleFieldBackgroudBitmapData","MoveBlockBitmapData_0","MoveBlockBitmapData_1","MoveBlockBitmapData_2","MoveBlockBitmapData_3","MoveBlockBitmapData_4","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE09006"] = ["BattleFieldBackgroudBitmapData","DayHighAirCloudBitmapData","DayLowAirCloudBitmapData","MoveBlockBitmapData_0","MoveBlockBitmapData_1","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE09008"] = ["BattleFieldBackgroudBitmapData","DayHighAirCloudBitmapData","DayLowAirCloudBitmapData","MoveBlockBitmapData_0","MoveBlockBitmapData_1","MoveBlockBitmapData_2","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE09207"] = ["BattleFieldBackgroudBitmapData","MoveBlockBitmapData_0","MoveBlockBitmapData_1","NightHighAirCloudBitmapData","NightLowAirCloudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE09208"] = ["BattleFieldBackgroudBitmapData","MoveBlockBitmapData_0","MoveBlockBitmapData_1","MoveBlockBitmapData_2","NightHighAirCloudBitmapData","NightLowAirCloudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE09A09"] = ["BattleFieldBackgroudBitmapData","MoveBlockBitmapData_0","NightHighAirCloudBitmapData","NightLowAirCloudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE09A09_1"] = ["BattleFieldBackgroudBitmapData","DayHighAirCloudBitmapData","DayLowAirCloudBitmapData","MoveBlockBitmapData_0","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00075"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE0032B"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
         this.dictMapPreLoad["0xE00B05"] = ["BattleFieldBackgroudBitmapData","SevenLeftBattleFiledBitmapData"];
      }
      
      public function GetMapPreLoadList(szMapIDStr:String) : Array
      {
         this.lastMapID = szMapIDStr;
         var realMapID:String = this.GetRealLoadMapID(szMapIDStr);
         var preLoads:Array = this.dictMapPreLoad[realMapID];
         if(preLoads == null)
         {
            preLoads = [];
         }
         var listPreLoad:Array = [];
         for(var i:int = 0; i < preLoads.length; i++)
         {
            listPreLoad.push("map/battleScene/" + realMapID + "/" + preLoads[i] + ".png");
         }
         return listPreLoad;
      }
      
      public function GetBitMap(resPath:String) : BitmapData
      {
         return this.dictBitMap[resPath];
      }
      
      private function GetRealLoadMapID(sMapID:String) : String
      {
         if(this.dictNextLoad[sMapID] != null)
         {
            return this.dictNextLoad[sMapID];
         }
         return sMapID;
      }
      
      public function GetGameMapBit(sMapID:String, name:String) : BitmapData
      {
         return this.GetBitMap("map/battleScene/" + this.GetRealLoadMapID(sMapID) + "/" + name + ".png");
      }
      
      public function ReleaseBitMap(resPath:String) : void
      {
         var data:BitmapData = this.dictBitMap[resPath];
         if(data == null)
         {
            return;
         }
         data.dispose();
         delete this.dictBitMap[resPath];
      }
      
      public function LoadImages(resPaths:Array, endCallBack:Function) : void
      {
         var i:int = 0;
         var resPath:String = null;
         var loadObject:Object = null;
         var dic:Dictionary = null;
         var assetType:int = 0;
         var loader:AssetsLoader = null;
         var loadList:Array = [];
         for(i = 0; i < resPaths.length; i++)
         {
            resPath = resPaths[i];
            if(this.dictBitMap[resPath] == null)
            {
               loadList.push(resPath);
            }
         }
         if(loadList.length == 0)
         {
            endCallBack();
         }
         else
         {
            loadObject = new Object();
            loadObject.now = 0;
            loadObject.max = loadList.length;
            for(i = 0; i < loadList.length; i++)
            {
               dic = new Dictionary();
               resPath = loadList[i];
               assetType = resPath.indexOf(".jpg") != -1 ? AssetType.JPG : AssetType.PNG;
               dic[resPath] = new AssetsItemData("./images/" + resPath,assetType,resPath);
               loader = new AssetsLoader();
               loader.load(dic,{
                  "onComplete":this.onImagesLoadComplete,
                  "onCompleteParms":[resPath,loadObject,endCallBack]
               },1);
            }
         }
      }
      
      public function a_4629(imageBitmapData:Bitmap, resPath:String) : void
      {
         var assetType:int = 0;
         var dic:Dictionary = null;
         var loader:AssetsLoader = null;
         if(this.dictBitMap[resPath] != null)
         {
            imageBitmapData.bitmapData = this.dictBitMap[resPath];
         }
         else
         {
            assetType = resPath.indexOf(".jpg") != -1 ? AssetType.JPG : AssetType.PNG;
            dic = new Dictionary();
            dic[resPath] = new AssetsItemData("./images/" + resPath,assetType,resPath);
            loader = new AssetsLoader();
            loader.load(dic,{
               "onComplete":this.onImageLoadComplete,
               "onCompleteParms":[resPath,imageBitmapData]
            },1);
         }
      }
      
      private function onImagesLoadComplete(dic:Dictionary, key:String, loadObject:Object, endCallBack:Function) : void
      {
         if(dic[key])
         {
            this.dictBitMap[key] = dic[key].data.bitmapData;
            ++loadObject.now;
            if(loadObject.now >= loadObject.max)
            {
               endCallBack();
            }
         }
      }
      
      private function onImageLoadComplete(dic:Dictionary, key:String, imageBitmapData:Bitmap) : void
      {
         if(dic[key])
         {
            imageBitmapData.bitmapData = this.dictBitMap[key] = dic[key].data.bitmapData;
         }
      }
   }
}

