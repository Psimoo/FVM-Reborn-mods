package a_4752
{
   import flash.utils.Dictionary;
   
   public class WhiteListConfig
   {
      
      private static var dictWhiteList:Dictionary;
      
      public function WhiteListConfig()
      {
         super();
      }
      
      public static function setWhiteList(xmlData:XML) : void
      {
         parseXML(xmlData);
      }
      
      public static function isPayPermissible(open_id:String) : Boolean
      {
         if(!dictWhiteList)
         {
            return true;
         }
         if(!dictWhiteList["paytest"])
         {
            return true;
         }
         var idList:Array = dictWhiteList["paytest"] as Array;
         return idList.indexOf(open_id) != -1;
      }
      
      private static function parseXML(xmlData:XML) : void
      {
         if(xmlData == null)
         {
            return;
         }
         if(dictWhiteList == null)
         {
            dictWhiteList = new Dictionary();
         }
         parsePaytest(xmlData..paytest);
      }
      
      private static function parsePaytest(xmlList:XMLList) : void
      {
         var strList:String = null;
         if(xmlList)
         {
            strList = xmlList[0];
            if(strList != null && strList != "")
            {
               dictWhiteList["paytest"] = strList.split(",");
            }
         }
      }
   }
}

