package a_4760
{
   public class a_2248
   {
      
      private static var a_788:a_2248;
      
      private static var m_sign:Boolean = false;
      
      private var serverInfosArray:Array;
      
      public function a_2248()
      {
         super();
         if(!m_sign)
         {
            throw new Error("请通过getInstance()方法获取引用！");
         }
      }
      
      public static function getInstance() : a_2248
      {
         if(null == a_788)
         {
            m_sign = true;
            a_788 = new a_2248();
            m_sign = false;
         }
         return a_788;
      }
      
      public function a_2249(serverListXML:XML) : Boolean
      {
         var server:XML = null;
         this.serverInfosArray = [];
         for each(server in serverListXML.Server)
         {
            this.serverInfosArray.push({
               "ServerID":server.@ID,
               "IP":server.@IP,
               "Port":server.@Port,
               "DesIP":server.@DesIP,
               "DesPort":server.@DesPort
            });
         }
         if(this.serverInfosArray.length > 0)
         {
            return true;
         }
         return false;
      }
      
      public function a_2250() : Array
      {
         return this.serverInfosArray;
      }
   }
}

