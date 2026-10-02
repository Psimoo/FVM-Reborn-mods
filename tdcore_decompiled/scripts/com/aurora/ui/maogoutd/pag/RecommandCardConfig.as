package com.aurora.ui.maogoutd.pag
{
   import flash.utils.Dictionary;
   
   public class RecommandCardConfig
   {
      
      private static var _instance:RecommandCardConfig;
      
      private static var _index:int = 0;
      
      private var recomCardConfig:Dictionary;
      
      public function RecommandCardConfig()
      {
         super();
         if(_index > 0)
         {
            throw new Error("RecomandCardConfig Failed");
         }
         ++_index;
      }
      
      public static function get Instance() : RecommandCardConfig
      {
         if(_instance == null)
         {
            _instance = new RecommandCardConfig();
         }
         return _instance;
      }
      
      public function parseRecomCardConfig(xml:XML) : void
      {
         if(this.recomCardConfig == null)
         {
            this.recomCardConfig = new Dictionary(true);
         }
         this.recomCardConfig["normal"] = xml.normal[0];
         this.recomCardConfig["mota"] = xml.mota[0];
         this.recomCardConfig["dizuo"] = xml.dizuo[0];
         this.recomCardConfig["huopen"] = xml.huopen[0];
         this.recomCardConfig["cafe"] = xml.cafe[0];
      }
      
      public function getRecommandCards(map_id:int) : Dictionary
      {
         var recomCardsDict:Dictionary = new Dictionary(true);
         if(!this.isMotaMap(map_id))
         {
            recomCardsDict["regular"] = this.getNormalRegularCards(map_id);
            recomCardsDict["option"] = this.getNormalOptionCards(map_id);
         }
         else
         {
            recomCardsDict["regular"] = this.getMotaRegularCards(map_id);
            recomCardsDict["option"] = this.getMotaOptionCards(map_id);
         }
         return recomCardsDict;
      }
      
      public function getNormalRegularCards(map_id:int) : Array
      {
         var regular:XML = null;
         var mapItem:XML = null;
         var mapArr:Array = null;
         var mapMatch:Boolean = false;
         var map:String = null;
         var mapCardArr:Array = null;
         var cardItem:XML = null;
         var cardIndex:int = 0;
         var cardIds:Array = null;
         var arr:Array = [];
         if(this.recomCardConfig["normal"] == null)
         {
            return arr;
         }
         regular = this.recomCardConfig["normal"].regular[0];
         if(regular == null)
         {
            return arr;
         }
         for each(mapItem in regular.map)
         {
            mapArr = String(mapItem.@map_arr).split(",");
            mapMatch = false;
            for each(map in mapArr)
            {
               if(Number(map) == map_id)
               {
                  mapMatch = true;
                  break;
               }
            }
            if(mapMatch)
            {
               mapCardArr = [];
               for each(cardItem in mapItem.card)
               {
                  cardIndex = int(cardItem.@index);
                  cardIds = String(cardItem.@card_arr).split(",");
                  mapCardArr = mapCardArr.concat({
                     "card_index":cardIndex,
                     "card_ids":cardIds
                  });
               }
               arr.push(mapCardArr);
            }
         }
         return arr;
      }
      
      public function getMotaRegularCards(map_id:int) : Array
      {
         var regular:XML = null;
         var mapItem:XML = null;
         var mapArr:Array = null;
         var mapMatch:Boolean = false;
         var map:String = null;
         var mapCardArr:Array = null;
         var cardItem:XML = null;
         var cardIndex:int = 0;
         var cardIds:Array = null;
         var arr:Array = [];
         if(this.recomCardConfig["mota"] == null)
         {
            return arr;
         }
         regular = this.recomCardConfig["mota"].regular[0];
         if(regular == null)
         {
            return arr;
         }
         map_id &= 65535;
         for each(mapItem in regular.map)
         {
            mapArr = String(mapItem.@map_arr).split(",");
            mapMatch = false;
            for each(map in mapArr)
            {
               if(Number(map) == map_id)
               {
                  mapMatch = true;
                  break;
               }
            }
            if(mapMatch)
            {
               mapCardArr = [];
               for each(cardItem in mapItem.card)
               {
                  cardIndex = int(cardItem.@index);
                  cardIds = String(cardItem.@card_arr).split(",");
                  mapCardArr = mapCardArr.concat({
                     "card_index":cardIndex,
                     "card_ids":cardIds
                  });
               }
               arr.push(mapCardArr);
            }
         }
         return arr;
      }
      
      public function getNormalOptionCards(map_id:int) : Array
      {
         var option:XML = null;
         var mapItem:XML = null;
         var mapIDs:Array = null;
         var mapID:String = null;
         var cardItem:XML = null;
         var cardIndex:int = 0;
         var cardsArr:Array = null;
         var arr:Array = [];
         if(this.recomCardConfig["normal"] == null)
         {
            return arr;
         }
         option = this.recomCardConfig["normal"].option[0];
         if(option == null)
         {
            return arr;
         }
         var mapMatch:Boolean = false;
         for each(mapItem in option.map)
         {
            mapIDs = String(mapItem.@map_arr).split(",");
            for each(mapID in mapIDs)
            {
               if(Number(mapID) == map_id)
               {
                  mapMatch = true;
                  break;
               }
            }
            if(mapMatch)
            {
               for each(cardItem in mapItem.card)
               {
                  cardIndex = int(cardItem.@index);
                  cardsArr = String(cardItem.@card_arr).split(",");
                  arr.push({
                     "card_index":cardIndex,
                     "card_ids":cardsArr
                  });
               }
               break;
            }
         }
         return arr;
      }
      
      public function getMotaOptionCards(map_id:int) : Array
      {
         var option:XML = null;
         var mapItem:XML = null;
         var mapIDs:Array = null;
         var mapID:String = null;
         var cardItem:XML = null;
         var cardIndex:int = 0;
         var cardsArr:Array = null;
         var arr:Array = [];
         if(this.recomCardConfig["mota"] == null)
         {
            return arr;
         }
         option = this.recomCardConfig["mota"].option[0];
         if(option == null)
         {
            return arr;
         }
         map_id &= 65535;
         var mapMatch:Boolean = false;
         for each(mapItem in option.map)
         {
            mapIDs = String(mapItem.@map_arr).split(",");
            for each(mapID in mapIDs)
            {
               if(Number(mapID) == map_id)
               {
                  mapMatch = true;
                  break;
               }
            }
            if(mapMatch)
            {
               for each(cardItem in mapItem.card)
               {
                  cardIndex = int(cardItem.@index);
                  cardsArr = String(cardItem.@card_arr).split(",");
                  arr.push({
                     "card_index":cardIndex,
                     "card_ids":cardsArr
                  });
               }
               break;
            }
         }
         return arr;
      }
      
      public function getDiZuo() : Dictionary
      {
         var basecards:XMLList = null;
         var basecardXml:XML = null;
         var tmpArr:Array = null;
         var card:XML = null;
         var cardsid:Array = null;
         var dict:Dictionary = new Dictionary();
         if(this.recomCardConfig["dizuo"] == null)
         {
            return dict;
         }
         basecards = this.recomCardConfig["dizuo"].basecard;
         if(basecards == null)
         {
            return dict;
         }
         for each(basecardXml in basecards)
         {
            tmpArr = [];
            for each(card in basecardXml.relatecard)
            {
               cardsid = String(card.@id).split(",");
               tmpArr = tmpArr.concat(cardsid);
            }
            dict[String(basecardXml.@id)] = tmpArr;
         }
         return dict;
      }
      
      public function getHuoPen() : Dictionary
      {
         var basecards:XMLList = null;
         var basecardXml:XML = null;
         var tmpArr:Array = null;
         var card:XML = null;
         var cardsid:Array = null;
         var dict:Dictionary = new Dictionary();
         if(this.recomCardConfig["huopen"] == null)
         {
            return dict;
         }
         basecards = this.recomCardConfig["huopen"].basecard;
         if(basecards == null)
         {
            return dict;
         }
         for each(basecardXml in basecards)
         {
            tmpArr = [];
            for each(card in basecardXml.relatecard)
            {
               cardsid = String(card.@id).split(",");
               tmpArr = tmpArr.concat(cardsid);
            }
            dict[String(basecardXml.@id)] = tmpArr;
         }
         return dict;
      }
      
      public function getCafe() : Dictionary
      {
         var basecards:XMLList = null;
         var basecardXml:XML = null;
         var tmpArr:Array = null;
         var card:XML = null;
         var cardsid:Array = null;
         var dict:Dictionary = new Dictionary();
         if(this.recomCardConfig["cafe"] == null)
         {
            return dict;
         }
         basecards = this.recomCardConfig["cafe"].basecard;
         if(basecards == null)
         {
            return dict;
         }
         for each(basecardXml in basecards)
         {
            tmpArr = [];
            for each(card in basecardXml.relatecard)
            {
               cardsid = String(card.@id).split(",");
               tmpArr = tmpArr.concat(cardsid);
            }
            dict[String(basecardXml.@id)] = tmpArr;
         }
         return dict;
      }
      
      private function isMotaMap(map_id:int) : Boolean
      {
         var iSortID:int = map_id & 0xFFFF0000;
         if(map_id > 65535 && map_id < 536870912)
         {
            return true;
         }
         return false;
      }
   }
}

