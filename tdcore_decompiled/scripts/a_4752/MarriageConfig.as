package a_4752
{
   import com.aurora.game.maogoutd.common.marriage.DirvoceData;
   import com.aurora.game.maogoutd.common.marriage.MarriageRegistrationXML;
   import com.aurora.game.maogoutd.common.marriage.WeddingRegistrationXML;
   import com.aurora.game.maogoutd.common.marriage.WeddingRoomXML;
   
   public class MarriageConfig
   {
      
      private static var m_pInstance:MarriageConfig;
      
      public var m_stMarriageRegistrationXML:MarriageRegistrationXML;
      
      public var m_stDirvoceData:DirvoceData;
      
      public var m_stWeddingRegistrationXML:WeddingRegistrationXML;
      
      public var m_stWeddingRoomXML:WeddingRoomXML;
      
      public function MarriageConfig()
      {
         super();
         if(null != m_pInstance)
         {
            throw Error("MarriageConfig 是单例模式 不能重复实例化！！！");
         }
         this.m_stMarriageRegistrationXML = new MarriageRegistrationXML();
         this.m_stDirvoceData = new DirvoceData();
         this.m_stWeddingRegistrationXML = new WeddingRegistrationXML();
         this.m_stWeddingRoomXML = new WeddingRoomXML();
      }
      
      public static function GetInstance() : MarriageConfig
      {
         if(null == m_pInstance)
         {
            m_pInstance = new MarriageConfig();
         }
         return m_pInstance;
      }
      
      public function AnalysisXML(stXML:XML) : void
      {
         this.m_stMarriageRegistrationXML.AnalysisXML(stXML.marriageRegisration[0]);
         this.m_stDirvoceData.AnalysisXML(stXML.divorce[0]);
         this.m_stWeddingRegistrationXML.AnalysisXML(stXML.weddingsRegistration[0]);
         this.m_stWeddingRoomXML.AnalysisXML(stXML.weddingRoom[0]);
      }
   }
}

