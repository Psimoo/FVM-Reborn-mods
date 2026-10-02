package a_4752
{
   import com.aurora.ui.maogoutd.ClientLog.CheckIDHandler;
   import com.aurora.ui.maogoutd.component.a_3306;
   import flash.utils.Dictionary;
   
   public class a_2027
   {
      
      private static var instance:a_2027;
      
      public var m_dictDesc:Dictionary;
      
      public var m_dictMouseDesc:Dictionary;
      
      public var m_xmlComposeConfig:XML;
      
      public var m_xmlTinyMarketGoodsConfig:XML;
      
      public var m_marketItemXML:XML;
      
      public var m_PackageImageDict:Dictionary;
      
      public function a_2027()
      {
         super();
      }
      
      public static function getInstance() : a_2027
      {
         if(instance == null)
         {
            instance = new a_2027();
         }
         return instance;
      }
      
      public function a_2028(descXML:XML) : Boolean
      {
         var item:XML = null;
         var dDesc:a_3306 = null;
         if(descXML != null)
         {
            if(this.m_dictDesc == null)
            {
               this.m_dictDesc = new Dictionary();
            }
            for each(item in descXML.item)
            {
               dDesc = new a_3306();
               dDesc.setCardDesc(item);
               this.m_dictDesc[dDesc.CardID] = dDesc;
               CheckIDHandler.Get().Push(dDesc.CardID);
            }
         }
         return true;
      }
      
      public function a_2029(mouseDescXML:XML) : Boolean
      {
         var item:XML = null;
         var dDesc:a_3306 = null;
         if(mouseDescXML != null)
         {
            if(this.m_dictMouseDesc == null)
            {
               this.m_dictMouseDesc = new Dictionary();
            }
            for each(item in mouseDescXML.item)
            {
               dDesc = new a_3306();
               dDesc.setMouseDesc(item);
               this.m_dictMouseDesc[dDesc.ID] = dDesc;
            }
         }
         return true;
      }
      
      public function a_2030(xmlData:XML) : void
      {
         this.m_xmlComposeConfig = xmlData;
      }
      
      public function a_2031(xmlData:XML) : void
      {
         this.m_xmlTinyMarketGoodsConfig = xmlData;
      }
      
      public function a_2032(marketItemXML:XML) : void
      {
         this.m_marketItemXML = marketItemXML;
      }
      
      public function get dictImage() : Dictionary
      {
         if(this.m_PackageImageDict == null)
         {
            this.m_PackageImageDict = new Dictionary();
         }
         return this.m_PackageImageDict;
      }
   }
}

