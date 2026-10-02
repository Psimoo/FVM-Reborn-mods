package a_4752
{
   import com.aurora.ui.maogoutd.choujiang.CardInfoStruct;
   
   public class SuperAwardAnalyze
   {
      
      private static var instance:SuperAwardAnalyze;
      
      public var m_vAwards:Vector.<CardInfoStruct>;
      
      public function SuperAwardAnalyze()
      {
         super();
         this.m_vAwards = new Vector.<CardInfoStruct>();
      }
      
      public static function getinstance() : SuperAwardAnalyze
      {
         if(instance == null)
         {
            instance = new SuperAwardAnalyze();
         }
         return instance;
      }
      
      public function ParseSuperAwardXML(xml:XML) : void
      {
         var item:XML = null;
         var cardinfo:CardInfoStruct = null;
         if(xml != null)
         {
            for each(item in xml.item)
            {
               cardinfo = new CardInfoStruct();
               cardinfo.m_iItemID = item.@id;
               cardinfo.m_iAttr = item.@attr;
               cardinfo.m_iNum = item.@num;
               cardinfo.m_iTime = item.@time;
               cardinfo.m_iPool = item.@pool;
               cardinfo.m_iBind = item.@isBind;
               this.m_vAwards.push(cardinfo);
            }
         }
      }
   }
}

