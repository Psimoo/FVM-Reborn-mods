package com.aurora.game.maogoutd.common.marriage
{
   public class MarriageRegistrationXML
   {
      
      public var m_iMinGamePoint:Number;
      
      public var m_vCertificateLevel:Vector.<MarriageCertificateLevel>;
      
      public function MarriageRegistrationXML()
      {
         super();
         this.m_vCertificateLevel = new Vector.<MarriageCertificateLevel>();
      }
      
      public function GetMaxCertificateLevel() : int
      {
         return this.m_vCertificateLevel[this.m_vCertificateLevel.length - 1].m_iLevel;
      }
      
      public function AnalysisXML(stXML:XML) : void
      {
         var child:XML = null;
         var stMarriageCertificateLevel:MarriageCertificateLevel = null;
         this.m_iMinGamePoint = stXML.@minGamePoint;
         this.m_vCertificateLevel.length = 0;
         for each(child in stXML.certificate)
         {
            stMarriageCertificateLevel = new MarriageCertificateLevel();
            stMarriageCertificateLevel.AnalysisXML(child);
            this.m_vCertificateLevel.push(stMarriageCertificateLevel);
         }
         this.m_vCertificateLevel.sort(this.CompareCertificateByLevel);
      }
      
      private function CompareCertificateByLevel(a:MarriageCertificateLevel, b:MarriageCertificateLevel) : int
      {
         return a.m_iLevel - b.m_iLevel;
      }
      
      public function GetObtainByCertificateLevelSex(iCertificateLevel:int, iUseSex:int) : MarriageCertificateObtain
      {
         var stMarriageCertificateLevel:MarriageCertificateLevel = null;
         for each(stMarriageCertificateLevel in this.m_vCertificateLevel)
         {
            if(stMarriageCertificateLevel.m_iLevel == iCertificateLevel)
            {
               return stMarriageCertificateLevel.GetObtainBySex(iUseSex);
            }
         }
         return null;
      }
      
      public function GetObtainByCertificateIDSex(iCertificateID:int, iUseSex:int) : MarriageCertificateObtain
      {
         var stMarriageCertificateLevel:MarriageCertificateLevel = null;
         var stObtain:MarriageCertificateObtain = null;
         loop0:
         for each(stMarriageCertificateLevel in this.m_vCertificateLevel)
         {
            var _loc7_:int = 0;
            var _loc8_:* = stMarriageCertificateLevel.m_vObtain;
            do
            {
               for each(stObtain in _loc8_)
               {
               }
               continue loop0;
            }
            while(!(stObtain.m_iCertificateID == iCertificateID && stObtain.m_iSex == iUseSex));
            return stObtain;
         }
         return null;
      }
   }
}

