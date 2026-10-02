package com.aurora.game.maogoutd.common.marriage
{
   public class MarriageCertificateLevel
   {
      
      public var m_iLevel:int;
      
      public var m_vObtain:Vector.<MarriageCertificateObtain>;
      
      public function MarriageCertificateLevel()
      {
         super();
         this.m_vObtain = new Vector.<MarriageCertificateObtain>();
      }
      
      public function GetObtainBySex(iUseSex:int) : MarriageCertificateObtain
      {
         var stMarriageCertificateObtain:MarriageCertificateObtain = null;
         for each(stMarriageCertificateObtain in this.m_vObtain)
         {
            if(stMarriageCertificateObtain.m_iSex == iUseSex)
            {
               return stMarriageCertificateObtain;
            }
         }
         return null;
      }
      
      public function AnalysisXML(stXML:XML) : void
      {
         var child:XML = null;
         var stMarriageCertificateObtain:MarriageCertificateObtain = null;
         this.m_iLevel = stXML.@marriageLevel;
         this.m_vObtain.length = 0;
         for each(child in stXML.obtain)
         {
            stMarriageCertificateObtain = new MarriageCertificateObtain();
            stMarriageCertificateObtain.AnalysisXML(child);
            this.m_vObtain.push(stMarriageCertificateObtain);
         }
      }
   }
}

