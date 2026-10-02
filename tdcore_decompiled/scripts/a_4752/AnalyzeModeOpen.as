package a_4752
{
   public class AnalyzeModeOpen
   {
      
      private static var m_Instance:AnalyzeModeOpen = new AnalyzeModeOpen();
      
      private var m_arrMedeOpen:Array;
      
      public function AnalyzeModeOpen()
      {
         super();
         if(null != m_Instance)
         {
            return;
         }
      }
      
      public static function GetInstance() : AnalyzeModeOpen
      {
         return m_Instance;
      }
      
      public function getArrModeOpen() : Array
      {
         return this.m_arrMedeOpen;
      }
      
      public function AnalyzeModeOpenXml(xml:XML) : void
      {
         var item:Object = null;
         var date:Date = null;
         var szTime:String = null;
         var itemXml:XML = null;
         if(null != xml)
         {
            if(null == this.m_arrMedeOpen)
            {
               this.m_arrMedeOpen = [];
            }
            for each(itemXml in xml.Item)
            {
               item = {};
               item.strName = String(itemXml.@strName);
               item.iOpen = int(itemXml.@iOpen);
               szTime = String(itemXml.@starttime);
               date = new Date(szTime);
               item.iStartTime = date.getTime();
               szTime = String(itemXml.@endtime);
               date = new Date(szTime);
               item.iEndTime = date.getTime();
               this.m_arrMedeOpen.push(item);
            }
         }
      }
   }
}

