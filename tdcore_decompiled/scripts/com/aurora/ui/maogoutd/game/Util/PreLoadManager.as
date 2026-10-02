package com.aurora.ui.maogoutd.game.Util
{
   import flash.utils.Dictionary;
   
   public class PreLoadManager
   {
      
      private static var _instance:PreLoadManager;
      
      private var a_1183:Array = ["0x11370015","0x1137001E","0x1137001F","0x11131034","0x11111024","0x11140014","0x11130FF0","0x11110014","0x11000000","0x11000001","0x11000002","0x11000003","0x11000004","0x11370044","0x1137004E","0x1137004F","0x11370080","0x1137008E","0x1137008F","0x11700100","0x1170010E","0x1170010F","0x010001","0x010002","0x010009","0x010017","0x01001D","0x010027","0x010038","0x020001","0x020002","0x030001","0x040001","0x11130020","0x11130050","0x11130094","0x11131070","0x11130130","0x111300B0","0xF00001","0x11122730","0x1112273E","0x1112273F","0x11120890","0x1112089E","0x1112089F","0x010043","0x010042","0x010039","0x010040","0x010028","0x010025","0x020003"];
      
      private var _preLoadMap:Dictionary = new Dictionary();
      
      public function PreLoadManager()
      {
         super();
      }
      
      public static function getInstance() : PreLoadManager
      {
         if(_instance == null)
         {
            _instance = new PreLoadManager();
         }
         _instance.InitPreLoad();
         return _instance;
      }
      
      private function InitPreLoad() : void
      {
         this._preLoadMap["0x80045C"] = ["0x80045C1","0x80045C2","0x80045C3","0x80045C4","0x80045C5","0x80045CF"];
         this._preLoadMap["0x80045D"] = ["0x80045C1","0x80045C2","0x80045C3","0x80045C4","0x80045C5","0x80045CF"];
         this._preLoadMap["0x80045E"] = ["0x80045C1","0x80045C2","0x80045C3","0x80045C4","0x80045C5","0x80045CF"];
         this._preLoadMap["0xE00074"] = ["0x80045CF"];
         this._preLoadMap["0x800195"] = ["0x11122240"];
         this._preLoadMap["0x800066"] = ["0x800089","0x800097","0x8001F7","0x8001F8","0x8001F9"];
         this._preLoadMap["0x800016"] = ["0x010014"];
         this._preLoadMap["0x801016"] = ["0x010014"];
         this._preLoadMap["0x80000F"] = ["0x01000A"];
         this._preLoadMap["0x800075"] = ["0x01000A"];
         this._preLoadMap["0x800085"] = ["0x01000A"];
         this._preLoadMap["0xE0005F"] = ["0x800190"];
         this._preLoadMap["0xE00262"] = ["0x800190"];
         this._preLoadMap["0xE08011"] = ["0x800190"];
         this._preLoadMap["0xE08213"] = ["0x800190"];
         this._preLoadMap["0xE00A08"] = ["0x800190"];
         this._preLoadMap["0xE08A01"] = ["0x800190"];
         this._preLoadMap["0xE00127"] = ["0x800190"];
         this._preLoadMap["0xE0005E"] = ["0x800190"];
         this._preLoadMap["0xE00322"] = ["0x800190"];
         this._preLoadMap["0xE00261"] = ["0x800190"];
         this._preLoadMap["0x8001A9"] = ["0x800190"];
         this._preLoadMap["0xE00062"] = ["0x800207","0x1113005F"];
         this._preLoadMap["0xE00063"] = ["0x800207","0x1113005F"];
         this._preLoadMap["0xE00064"] = ["0x800207","0x1113005F"];
         this._preLoadMap["0xE08217"] = ["0x800207","0x1113005F"];
         this._preLoadMap["0xE00264"] = ["0x800207","0x1113005F"];
         this._preLoadMap["0xE000F1"] = ["0x800805","0x800807","0x800808","0x800089","0x80080D","0x80080E","0x01000B","0x01000C","0x010015"];
         this._preLoadMap["0xE001F1"] = ["0x800805","0x800807","0x800808","0x800089","0x80080D","0x80080E","0x01000B","0x01000C","0x010015"];
         this._preLoadMap["0xE002F1"] = ["0x800805","0x800807","0x800808","0x800089","0x80080D","0x80080E","0x01000B","0x01000C","0x010015"];
         this._preLoadMap["0xE003F1"] = ["0x800805","0x800807","0x800808","0x800089","0x80080D","0x80080E","0x01000B","0x01000C","0x010015"];
         this._preLoadMap["0xE000F2"] = ["0x800805","0x800807","0x800808","0x800089","0x80080D","0x80080E","0x01000B","0x01000C","0x010015"];
         this._preLoadMap["0xE002F2"] = ["0x800805","0x800807","0x800808","0x800089","0x80080D","0x80080E","0x01000B","0x01000C","0x010015"];
         this._preLoadMap["0xE0012D"] = ["0x8002190"];
         this._preLoadMap["0xE0012E"] = ["0x8002190"];
         this._preLoadMap["0xE00328"] = ["0x8002190"];
         this._preLoadMap["0xE00329"] = ["0x8002190"];
         this._preLoadMap["0xE0032A"] = ["0x8002190"];
         this._preLoadMap["0x800620"] = ["0x800606A"];
         this._preLoadMap["0x800621"] = ["0x800606A"];
         this._preLoadMap["0x800622"] = ["0x800606A"];
         this._preLoadMap["0x800601"] = ["0x800606A"];
         this._preLoadMap["0x800602"] = ["0x800606A"];
         this._preLoadMap["0x800603"] = ["0x800606A"];
         this._preLoadMap["0x800604"] = ["0x800606A"];
         this._preLoadMap["0x800605"] = ["0x800606A"];
         this._preLoadMap["0x800606"] = ["0x800606A"];
         this._preLoadMap["0x800607"] = ["0x800606A"];
         this._preLoadMap["0x800608"] = ["0x800606A"];
         this._preLoadMap["0x800609"] = ["0x800606A"];
         this._preLoadMap["0x80060A"] = ["0x800606A"];
      }
      
      public function GetMustPreLoad() : Array
      {
         return this.a_1183;
      }
      
      public function GetAllPreLoad(arr:Array, szMapIDStr:String) : Array
      {
         var partResArr:Array = null;
         var s:String = null;
         var allResArr:Array = arr.slice();
         for(var i:int = 0; i < arr.length; i++)
         {
            partResArr = this._preLoadMap[arr[i]];
            if(partResArr != null)
            {
               allResArr = allResArr.concat(partResArr);
            }
         }
         if(this._preLoadMap[szMapIDStr] != null)
         {
            allResArr = allResArr.concat(this._preLoadMap[szMapIDStr]);
         }
         var seen:Dictionary = new Dictionary();
         var uniq:Array = [];
         var k:int = 0;
         var n:int = int(allResArr.length);
         while(k < n)
         {
            s = allResArr[k];
            if(seen[s] === undefined)
            {
               seen[s] = true;
               uniq.push(s);
            }
            k++;
         }
         return uniq;
      }
   }
}

