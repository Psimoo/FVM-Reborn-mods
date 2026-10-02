package com.aurora.ui.maogoutd.handbook.model
{
   public class HandbookConfigData
   {
      
      private static var m_pInstance:HandbookConfigData;
      
      public var m_vCardHandbook:Vector.<CardHandbookData>;
      
      public var m_vSuitHandbook:Vector.<SuitHandbookData>;
      
      public var m_vAward:Vector.<HandbookDataAward>;
      
      public function HandbookConfigData()
      {
         super();
      }
      
      public static function Get() : HandbookConfigData
      {
         if(!m_pInstance)
         {
            m_pInstance = new HandbookConfigData();
         }
         return m_pInstance;
      }
      
      public function AnalysisSex(iSex:int) : void
      {
         var m_vSuitHandbookTemp:Vector.<SuitHandbookData> = new Vector.<SuitHandbookData>();
         for(var i:int = 0; i < this.m_vSuitHandbook.length; i++)
         {
            if(this.m_vSuitHandbook[i].iSex == 0 || this.m_vSuitHandbook[i].iSex == iSex)
            {
               m_vSuitHandbookTemp.push(this.m_vSuitHandbook[i]);
            }
         }
         this.m_vSuitHandbook = m_vSuitHandbookTemp;
      }
      
      public function a_2040(xml:XML) : void
      {
         var vCardHandbook:CardHandbookData = null;
         var vSuitHandbook:SuitHandbookData = null;
         var vAward:HandbookDataAward = null;
         if(!xml)
         {
            return;
         }
         var data:XML = null;
         this.m_vCardHandbook = new Vector.<CardHandbookData>();
         for each(data in xml.cardhandbook.item)
         {
            vCardHandbook = new CardHandbookData();
            vCardHandbook.iID = int(data.@id);
            vCardHandbook.iItemID = int(data.@itemid);
            vCardHandbook.sItemName = String(data.@itemname);
            vCardHandbook.iType = int(data.@type);
            vCardHandbook.iClassify = int(data.@classify);
            vCardHandbook.iTransID = int(data.@transid);
            vCardHandbook.iTransType = int(data.@transtype);
            vCardHandbook.iNeedNum = int(data.@neednum);
            vCardHandbook.iAddType = int(data.@addtype);
            vCardHandbook.iAddValue = Number(data.@addvalue);
            vCardHandbook.sTypeDesc = String(data.@typedesc);
            vCardHandbook.sEnergyDesc = String(data.@energydesc);
            vCardHandbook.sAreaDesc = String(data.@areadesc);
            vCardHandbook.sAddDesc = String(data.@adddesc);
            vCardHandbook.sAbilityDesc = String(data.@abilitydesc);
            vCardHandbook.sGetwayDesc = String(data.@getwaydesc);
            vCardHandbook.iTransID_1 = int(data.@transid_1);
            vCardHandbook.iTransType_1 = int(data.@transtype_1);
            this.m_vCardHandbook.push(vCardHandbook);
         }
         this.m_vSuitHandbook = new Vector.<SuitHandbookData>();
         for each(data in xml.suithandbook.item)
         {
            vSuitHandbook = new SuitHandbookData();
            vSuitHandbook.iID = int(data.@id);
            vSuitHandbook.iItemID = int(data.@itemid);
            vSuitHandbook.sItemName = String(data.@itemname);
            vSuitHandbook.iClassify = int(data.@classify);
            vSuitHandbook.iNeedNum = int(data.@neednum);
            vSuitHandbook.iAddType = int(data.@addtype);
            vSuitHandbook.iAddValue = int(data.@addvalue);
            vSuitHandbook.iSex = int(data.@sex);
            vSuitHandbook.sHPDesc = String(data.@hpdesc);
            vSuitHandbook.sUptimeDesc = String(data.@uptimedesc);
            vSuitHandbook.sSuitDesc = String(data.@suitdesc);
            vSuitHandbook.sGetWayDesc = String(data.@getwaydesc);
            this.m_vSuitHandbook.push(vSuitHandbook);
         }
         this.m_vAward = new Vector.<HandbookDataAward>();
         for each(data in xml.award.item)
         {
            vAward = new HandbookDataAward();
            vAward.iID = int(data.@id);
            vAward.iItemID = int(data.@itemid);
            vAward.iNeedNum = int(data.@neednum);
            vAward.iType = int(data.@type);
            vAward.iTime = int(data.@time);
            vAward.iIsBind = int(data.@isBind);
            vAward.iAddValue = int(data.@addvalue);
            vAward.iAddExp = int(data.@addpveexp);
            vAward.iAddDroprate = int(data.@adddroprate);
            vAward.iAddProficiency = int(data.@addproficiency);
            vAward.iAddPvPExp = int(data.@addpvpexp);
            this.m_vAward.push(vAward);
         }
      }
   }
}

