package a_4752
{
   import flash.utils.Dictionary;
   
   public class a_2037
   {
      
      private static var instance:a_2037;
      
      public var m_dictMapMouse:Dictionary;
      
      public var m_dictDisplayMouseID:Dictionary;
      
      public var m_arrMapMouse:Array;
      
      public var m_arrMapMouse2:Array;
      
      public var m_arrConfig:Array;
      
      public var m_arrMapIdValid:Array;
      
      public var m_arrPetPataMapMouse:Array;
      
      public function a_2037()
      {
         super();
         this.m_dictDisplayMouseID = new Dictionary(true);
         this.m_arrMapMouse = [];
         this.m_arrMapMouse2 = [];
         this.m_arrMapIdValid = [];
         this.m_arrPetPataMapMouse = [];
      }
      
      public static function getInstance() : a_2037
      {
         if(instance == null)
         {
            instance = new a_2037();
         }
         return instance;
      }
      
      public function a_2038(mapMouseXML:XML, arrConfig:Array) : void
      {
         var item:XML = null;
         var map:Object = null;
         if(mapMouseXML != null)
         {
            this.m_dictMapMouse = new Dictionary();
            this.m_arrConfig = arrConfig;
            for each(item in mapMouseXML.item)
            {
               map = this.formateMap(item);
               map.vsImage = arrConfig[this.GetStrMapID(map.szMapID) + "vs"];
               map.vcImage = arrConfig[this.GetStrMapID(map.szMapID) + "vc"];
               this.m_dictMapMouse[map.iGameMapID] = map;
            }
            this.replaceMouseID();
         }
      }
      
      private function GetStrMapID(strGameMapID:String) : String
      {
         var iGameMapID:int = int(strGameMapID);
         if(iGameMapID >= 1073741824 && iGameMapID < 1140850688)
         {
            iGameMapID &= 65535;
            strGameMapID = strGameMapID.substring(0,2) + strGameMapID.substring(6);
         }
         return strGameMapID;
      }
      
      public function ParseDongMapMouseXML(mapMouseXML:XML) : void
      {
         var item:XML = null;
         var map:Object = null;
         var iGameMapID:int = 0;
         if(mapMouseXML != null)
         {
            for each(item in mapMouseXML.item)
            {
               map = this.formateMap(item);
               if(this.m_arrConfig != null)
               {
                  map.vsImage = this.m_arrConfig[this.GetStrMapID(map.szMapID) + "vs"];
                  map.vcImage = this.m_arrConfig[this.GetStrMapID(map.szMapID) + "vc"];
               }
               iGameMapID = map.iSortID << 16 | map.iGameMapID;
               map.iGameMapID = iGameMapID;
               if(this.m_dictMapMouse != null)
               {
                  this.m_dictMapMouse[map.iGameMapID] = map;
               }
               this.m_arrMapMouse.push(map);
            }
            this.m_arrMapMouse.sortOn("iSortID",Array.NUMERIC);
            this.replaceDongMouseID();
         }
      }
      
      public function ParseDongMapMouseXML2(mapMouseXML:XML) : void
      {
         var item:XML = null;
         var map:Object = null;
         var iGameMapID:int = 0;
         if(mapMouseXML != null)
         {
            for each(item in mapMouseXML.item)
            {
               map = this.formateMap(item);
               if(this.m_arrConfig != null)
               {
                  map.vsImage = this.m_arrConfig[this.GetStrMapID(map.szMapID) + "vs"];
                  map.vcImage = this.m_arrConfig[this.GetStrMapID(map.szMapID) + "vc"];
               }
               iGameMapID = map.iSortID << 16 | map.iGameMapID + 1409286144;
               map.iGameMapID = iGameMapID;
               if(this.m_dictMapMouse != null)
               {
                  this.m_dictMapMouse[map.iGameMapID] = map;
               }
               this.m_arrMapMouse2.push(map);
            }
            this.m_arrMapMouse2.sortOn("iSortID",Array.NUMERIC);
            this.replaceDongMouseID();
         }
      }
      
      public function ParsePetPataMapMouseXML(mapMouseXML:XML) : void
      {
         var item:XML = null;
         var map:Object = null;
         var iGameMapID:int = 0;
         if(mapMouseXML != null)
         {
            for each(item in mapMouseXML.item)
            {
               map = this.formateMap(item);
               if(this.m_arrConfig != null)
               {
                  map.vsImage = this.m_arrConfig[this.GetStrMapID(map.szMapID) + "vs"];
                  map.vcImage = this.m_arrConfig[this.GetStrMapID(map.szMapID) + "vc"];
               }
               iGameMapID = map.iSortID << 16 | map.iGameMapID + 805306368;
               map.iGameMapID = iGameMapID;
               if(this.m_dictMapMouse != null)
               {
                  this.m_dictMapMouse[map.iGameMapID] = map;
               }
               this.m_arrPetPataMapMouse.push(map);
            }
            this.m_arrPetPataMapMouse.sortOn("iSortID",Array.NUMERIC);
            this.replacePetPataMouseID();
         }
      }
      
      public function ParseSweetislandXML(sweetislandXML:XML) : void
      {
         var Achievement:XML = null;
         var item:XML = null;
         var szMapID:int = 0;
         if(sweetislandXML != null)
         {
            for each(Achievement in sweetislandXML.Achievement)
            {
               for each(item in Achievement.map)
               {
                  szMapID = int(item.@id);
                  this.m_arrMapIdValid.push(szMapID);
               }
            }
         }
      }
      
      private function formateMap(item:XML) : Object
      {
         var szMapID:String = item.@MapID;
         var szMapName:String = item.@MapName;
         var iMapOpenLV:int = int(item.@MapOpenLV);
         var iWeiWang:int = int(item.@Weiwang);
         var szMapKey:String = item.@MapKey;
         var iCount:int = int(item.@Count);
         var iSortID:int = int(item.@SortID);
         var iOpen:int = int(item.@Open);
         var iInfoOpen:int = int(item.@iInfoOpen);
         var szDefCardsID:String = item.@DefCardsID;
         var szPopPropsID:String = item.@PopPropsID;
         var szMouseID:String = item.@MouseID;
         var szMousePoint:String = item.@MousePoint;
         var szMouseGamePoint:String = item.@MouseGamePoint;
         var szBossName:String = item.@BossName;
         var iBossType:int = int(item.@BossType);
         var iMapTime:int = int(item.@MapTime);
         var szBossID:String = item.@BossID;
         var iGameMapID:int = Number(szMapID);
         var iGradeScore:int = int(item.@GradeScore);
         var map:Object = new Object();
         map.iGameMapID = iGameMapID;
         map.szMapID = szMapID;
         map.szMapName = szMapName;
         map.szBossName = szBossName;
         map.iBossType = iBossType;
         map.iMapTime = iMapTime;
         map.szBossID = szBossID;
         map.iMapOpenLV = iMapOpenLV;
         map.iWeiWang = iWeiWang;
         map.szMapKey = szMapKey;
         map.iCount = iCount;
         map.iSortID = iSortID;
         map.iOpen = iOpen;
         map.iInfoOpen = iInfoOpen;
         map.szPopPropsID = szPopPropsID;
         map.iGradeScore = iGradeScore;
         var arrMapMouseID:Array = szMouseID.split(",");
         var arrMousePoint:Array = szMousePoint.split(",");
         var arrMouseGamePoint:Array = szMouseGamePoint.split(",");
         var arrDefCardsID:Array = szDefCardsID.split(",");
         arrMapMouseID.forEach(this.replace);
         arrMousePoint.forEach(this.replace);
         arrMouseGamePoint.forEach(this.replace);
         arrDefCardsID.forEach(this.replace);
         if(-1 != arrMapMouseID.indexOf("0x0047") || -1 != arrMapMouseID.indexOf("0x0048"))
         {
            if(-1 == arrMapMouseID.indexOf("0x0093"))
            {
               arrMapMouseID.push("0x0093");
               arrMousePoint.push("0-0");
               arrMouseGamePoint.push("0-0");
            }
            if(-1 == arrMapMouseID.indexOf("0x0103"))
            {
               arrMapMouseID.push("0x0103");
               arrMousePoint.push("0-0");
               arrMouseGamePoint.push("0-0");
            }
         }
         map.arrMapMouseID = arrMapMouseID;
         map.arrMousePoint = arrMousePoint;
         map.arrMouseGamePoint = arrMouseGamePoint;
         map.arrDefCardsID = arrDefCardsID;
         return map;
      }
      
      private function FindMouseID(arrFindMouseID:Array, arrMapMouseID:Array) : int
      {
         var j:int = 0;
         var jLen:int = int(arrFindMouseID.length);
         var iLen:int = int(arrMapMouseID.length);
         loop0:
         for(var i:int = 0; i < iLen; )
         {
            j = 0;
            while(true)
            {
               if(j >= jLen)
               {
                  i++;
                  continue loop0;
               }
               if(arrFindMouseID[j] == arrMapMouseID[i])
               {
                  break;
               }
               j++;
            }
            return i;
         }
         return -1;
      }
      
      private function replaceMouseID() : void
      {
         var map:Object = null;
         for each(map in this.m_dictMapMouse)
         {
            this.replaceRule(map);
         }
      }
      
      private function replaceDongMouseID() : void
      {
         var map:Object = null;
         for each(map in this.m_arrMapMouse)
         {
            this.replaceRule(map);
         }
      }
      
      private function replacePetPataMouseID() : void
      {
         var map:Object = null;
         for each(map in this.m_arrPetPataMapMouse)
         {
            this.replaceRule(map);
         }
      }
      
      private function replaceRule(map:Object) : void
      {
         var arrMapMouseID:Array = null;
         var arrMousePoint:Array = null;
         var arrMouseGamePoint:Array = null;
         var size1:int = 0;
         var size2:int = 0;
         var size3:int = 0;
         var index:int = 0;
         var szPoint1:String = null;
         var szPoint2:String = null;
         var szMouseID:String = null;
         if(2048 != (map.iGameMapID & 0x0800) && map.iOpen == 1)
         {
            arrMapMouseID = map.arrMapMouseID;
            arrMousePoint = map.arrMousePoint;
            arrMouseGamePoint = map.arrMouseGamePoint;
            size1 = int(arrMapMouseID.length);
            size2 = int(arrMousePoint.length);
            size3 = int(arrMouseGamePoint.length);
            if(size1 != size2 || size1 != size3)
            {
               throw new Error("map_mouse.xml配置文件中地图名称为[" + map.szMapName + "]的老鼠位置配少了，请检查！");
            }
            for(index = 0; index < size1; index++)
            {
               szPoint1 = arrMousePoint[index];
               szPoint2 = arrMouseGamePoint[index];
               if(szPoint1 != "0-0" && szPoint2 != "0-0")
               {
                  szMouseID = arrMapMouseID[index];
                  this.m_dictDisplayMouseID[szMouseID] = szMouseID;
               }
            }
         }
      }
      
      private function replace(element:String, index:int, arr:Array) : void
      {
         element = element.replace(/\s/g,"");
      }
   }
}

