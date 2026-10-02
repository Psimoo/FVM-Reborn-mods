package com.aurora.ui.maogoutd.activityentrance
{
   import a_4752.GameStringManager;
   import a_4752.IGameStringManager;
   import a_4754.a_2161;
   import a_4789.a_4657;
   import com.aurora.ui.maogoutd.component.a_3228;
   
   public class ActivityEntranceModel
   {
      
      private static var _instance:ActivityEntranceModel;
      
      private static var _index:int = 0;
      
      private var _data:Object;
      
      private var _allMapID:Array = new Array();
      
      private var maxNumber:Array = [4,6,6,6,8,8,8,10,10,10,12,12,12,15,15,15,15,15,15];
      
      public function ActivityEntranceModel()
      {
         super();
         if(_index > 0)
         {
            throw new Error("ActivityEntranceModel Error!");
         }
         ++_index;
         this.initData();
      }
      
      public static function get Instance() : ActivityEntranceModel
      {
         if(_instance == null)
         {
            _instance = new ActivityEntranceModel();
         }
         return _instance;
      }
      
      public function get Data() : Object
      {
         return this._data;
      }
      
      public function checkMap(id:String) : void
      {
      }
      
      public function gotoGame(id:String) : void
      {
         var mapID:int = Number(id);
         a_4657.getInstance().execute("onSitDownMapID",this,mapID);
      }
      
      private function initData() : void
      {
         var obj:XML = null;
         var mapItem:Object = null;
         if(this._data == null)
         {
            this._data = {};
         }
         var mapData:Array = new Array();
         var iString:IGameStringManager = GameStringManager.getInstance();
         for each(obj in ActivityEntranceData.mapData.item)
         {
            mapItem = {};
            mapItem.mapID = String(obj.@map_id);
            mapItem.imageID = String(obj.@image_id);
            mapItem.bossName = String(obj.@boss_name);
            mapItem.mapName = String(obj.@map_name);
            mapItem.mapDesc = "<br><b><font size=\'13\'>" + mapItem.mapName + "</font></b>" + "<br>" + iString.getString(135504,[String(obj.@card_need)]);
            mapItem.mapUrl = "./" + ActivityEntranceData.mapData.@url + mapItem.imageID + ".jpg";
            mapItem.hobby = String(obj.@hobby);
            mapItem.mapLevel = Number(obj.@level_need);
            mapItem.manifesto = String(obj.@manifesto);
            mapItem.cardNeed = String(obj.@card_need);
            mapData.push(mapItem);
            this._allMapID.push(mapItem.mapID);
         }
         this._data.mapData = mapData;
      }
      
      public function getChallengeCardNumber() : int
      {
         var propsCards:Array = null;
         var card:a_3228 = null;
         var a_1684:Array = a_2161.e.GetTDCardsInfo() as Array;
         var count:int = 0;
         if(a_1684 != null && a_1684.length > 0)
         {
            propsCards = a_1684[1];
            for each(card in propsCards)
            {
               if(card.CardID == 307234080)
               {
                  count += card.CardCount;
               }
            }
         }
         return count;
      }
      
      public function getChallengeNumberStr() : String
      {
         var obj:Object = a_2161.e.GetPlayerCommon();
         if(obj == null)
         {
            return "0/0";
         }
         var level:int = int(obj.m_stVIP.getVipLevel());
         var leftNumber:int = this.getChallengeLeftNumber();
         return leftNumber + "/" + this.maxNumber[level];
      }
      
      public function getChallengeLeftNumber() : int
      {
         var obj:Object = a_2161.e.GetPlayerCommon();
         var level:int = int(obj.m_stVIP.getVipLevel());
         var leftNumber:int = this.maxNumber[level] - obj.m_arrGameData[0].m_iHeroCount;
         if(leftNumber < 0)
         {
            leftNumber = 0;
         }
         return leftNumber;
      }
      
      public function checkMapEnable(heroProcess:int, mapId:int) : Boolean
      {
         var num:int = 0;
         switch(mapId)
         {
            case parseInt("0x20000001",16):
               num = 0;
               break;
            case parseInt("0x20000301",16):
               num = 1;
               break;
            case parseInt("0x20000102",16):
               num = 2;
               break;
            case parseInt("0x20000701",16):
               num = 3;
               break;
            case parseInt("0x20000901",16):
               num = 4;
               break;
            case parseInt("0x20000104",16):
               num = 5;
               break;
            case parseInt("0x20000204",16):
               num = 6;
               break;
            case parseInt("0x20000b03",16):
               num = 7;
               break;
            case parseInt("0x20000105",16):
               num = 8;
               break;
            case parseInt("0x20000206",16):
               num = 9;
               break;
            case parseInt("0x20000805",16):
               num = 10;
               break;
            case parseInt("0x20001001",16):
               num = 11;
               break;
            case parseInt("0x20000207",16):
               num = 12;
               break;
            case parseInt("0x20000806",16):
               num = 13;
               break;
            case parseInt("0x20008001",16):
               num = 14;
               break;
            case parseInt("0x20008303",16):
               num = 15;
               break;
            case parseInt("0x20009006",16):
               num = 16;
               break;
            case parseInt("0x20009208",16):
               num = 17;
               break;
            case parseInt("0x2000820d",16):
               num = 18;
               break;
            case parseInt("0x2000820b",16):
               num = 19;
               break;
            case parseInt("0x2000880e",16):
               num = 20;
               break;
            case parseInt("0x20000809",16):
               num = 21;
               break;
            case parseInt("0x20000a04",16):
               num = 22;
               break;
            default:
               trace("map ID error!");
         }
         return heroProcess >= num;
      }
      
      public function getNeedDefeatHeroName(heroProcess:int) : String
      {
         if(this._data.mapData.length > heroProcess)
         {
            return this._data.mapData[heroProcess].bossName;
         }
         return "";
      }
      
      public function checkMapId(id:int) : Boolean
      {
         return this._allMapID.indexOf("0x" + id.toString(16)) != -1;
      }
      
      public function getLastBoss(heroProcess:int) : int
      {
         if(this._data.mapData.length > heroProcess)
         {
            return heroProcess;
         }
         return this._data.mapData.length - 1;
      }
   }
}

