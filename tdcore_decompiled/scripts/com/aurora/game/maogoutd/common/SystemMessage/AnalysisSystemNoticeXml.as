package com.aurora.game.maogoutd.common.SystemMessage
{
   import flash.utils.Dictionary;
   
   public class AnalysisSystemNoticeXml
   {
      
      private static var m_stAnalysisSystemNoticeXml:AnalysisSystemNoticeXml;
      
      public var m_SystemMessageDic:Dictionary;
      
      public var m_format:String;
      
      public function AnalysisSystemNoticeXml()
      {
         super();
      }
      
      public static function GetInstance() : AnalysisSystemNoticeXml
      {
         if(null == m_stAnalysisSystemNoticeXml)
         {
            m_stAnalysisSystemNoticeXml = new AnalysisSystemNoticeXml();
         }
         return m_stAnalysisSystemNoticeXml;
      }
      
      public function get SystemMessage() : Dictionary
      {
         if(this.m_SystemMessageDic == null)
         {
            this.m_SystemMessageDic = new Dictionary();
         }
         return this.m_SystemMessageDic;
      }
      
      public function AnalysisSystemMessageXML(stXML:XML) : void
      {
         var vo:UpgradeMessageVO = null;
         var item:XML = null;
         var dic:Dictionary = null;
         var data:XML = null;
         this.m_SystemMessageDic = new Dictionary();
         for each(data in stXML.format.common)
         {
            this.m_format = stXML.format.common.toString();
         }
         dic = new Dictionary();
         for each(data in stXML.crystone.item)
         {
            vo = new UpgradeMessageVO();
            vo.m_iIndex = int(data.@level);
            vo.m_iImportance = int(data.@importance);
            vo.m_iCount = int(data.@count);
            vo.m_iInterval = int(data.@interval);
            vo.m_iMessage = data.message.toString();
            dic[vo.m_iIndex] = vo;
         }
         this.m_SystemMessageDic[1] = dic;
         dic = new Dictionary();
         for each(data in stXML.tarot.item)
         {
            vo = new UpgradeMessageVO();
            vo.m_iIndex = int(data.@level);
            vo.m_iImportance = int(data.@importance);
            vo.m_iCount = int(data.@count);
            vo.m_iInterval = int(data.@interval);
            vo.m_iMessage = data.message.toString();
            dic[vo.m_iIndex] = vo;
         }
         this.m_SystemMessageDic[2] = dic;
         dic = new Dictionary();
         for each(data in stXML.upgrade.item)
         {
            vo = new UpgradeMessageVO();
            vo.m_iIndex = int(data.@level);
            vo.m_iImportance = int(data.@importance);
            vo.m_iCount = int(data.@count);
            vo.m_iInterval = int(data.@interval);
            vo.m_iMessage = data.message.toString();
            dic[vo.m_iIndex] = vo;
         }
         this.m_SystemMessageDic[3] = dic;
         dic = new Dictionary();
         for each(data in stXML.lottery.item)
         {
            vo = new UpgradeMessageVO();
            vo.m_iIndex = int(data.@level);
            vo.m_iImportance = int(data.@importance);
            vo.m_iCount = int(data.@count);
            vo.m_iInterval = int(data.@interval);
            vo.m_iMessage = data.message.toString();
            dic[vo.m_iIndex] = vo;
         }
         this.m_SystemMessageDic[4] = dic;
         dic = new Dictionary();
         for each(data in stXML.welfare.item)
         {
            vo = new UpgradeMessageVO();
            vo.m_iIndex = int(data.@level);
            vo.m_iImportance = int(data.@importance);
            vo.m_iCount = int(data.@count);
            vo.m_iInterval = int(data.@interval);
            vo.m_iMessage = data.message.toString();
            dic[vo.m_iIndex] = vo;
         }
         this.m_SystemMessageDic[5] = dic;
         dic = new Dictionary();
         for each(data in stXML.wedding.item)
         {
            vo = new UpgradeMessageVO();
            vo.m_iIndex = int(data.@level);
            vo.m_iImportance = int(data.@importance);
            vo.m_iCount = int(data.@count);
            vo.m_iInterval = int(data.@interval);
            vo.m_iMessage = data.message.toString();
            dic[vo.m_iIndex] = vo;
         }
         this.m_SystemMessageDic[6] = dic;
         dic = new Dictionary();
         for each(data in stXML.marriage.item)
         {
            vo = new UpgradeMessageVO();
            vo.m_iIndex = int(data.@level);
            vo.m_iImportance = int(data.@importance);
            vo.m_iCount = int(data.@count);
            vo.m_iInterval = int(data.@interval);
            vo.m_iMessage = data.message.toString();
            dic[vo.m_iIndex] = vo;
         }
         this.m_SystemMessageDic[7] = dic;
         dic = new Dictionary();
         for each(data in stXML.luckyMoney.item)
         {
            vo = new UpgradeMessageVO();
            vo.m_iIndex = int(data.@level);
            vo.m_iImportance = int(data.@importance);
            vo.m_iCount = int(data.@count);
            vo.m_iInterval = int(data.@interval);
            vo.m_iMessage = data.message.toString();
            dic[vo.m_iIndex] = vo;
         }
         this.m_SystemMessageDic[8] = dic;
         dic = new Dictionary();
         for each(data in stXML.turntable.item)
         {
            vo = new UpgradeMessageVO();
            vo.m_iIndex = int(data.@level);
            vo.m_iImportance = int(data.@importance);
            vo.m_iCount = int(data.@count);
            vo.m_iInterval = int(data.@interval);
            vo.m_iMessage = data.message.toString();
            dic[vo.m_iIndex] = vo;
         }
         this.m_SystemMessageDic[9] = dic;
         dic = new Dictionary();
         for each(data in stXML.sweetIsland.item)
         {
            vo = new UpgradeMessageVO();
            vo.m_iIndex = int(data.@level);
            vo.m_iImportance = int(data.@importance);
            vo.m_iCount = int(data.@count);
            vo.m_iInterval = int(data.@interval);
            vo.m_iMessage = data.message.toString();
            dic[vo.m_iIndex] = vo;
         }
         this.m_SystemMessageDic[10] = dic;
         dic = new Dictionary();
         for each(data in stXML.animalscard.item)
         {
            vo = new UpgradeMessageVO();
            vo.m_iIndex = int(data.@level);
            vo.m_iImportance = int(data.@importance);
            vo.m_iCount = int(data.@count);
            vo.m_iInterval = int(data.@interval);
            vo.m_iMessage = data.message.toString();
            dic[vo.m_iIndex] = vo;
         }
         this.m_SystemMessageDic[11] = dic;
         dic = new Dictionary();
         for each(data in stXML.consben.item)
         {
            vo = new UpgradeMessageVO();
            vo.m_iIndex = int(data.@level);
            vo.m_iImportance = int(data.@importance);
            vo.m_iCount = int(data.@count);
            vo.m_iInterval = int(data.@interval);
            vo.m_iMessage = data.message.toString();
            dic[vo.m_iIndex] = vo;
         }
         this.m_SystemMessageDic[12] = dic;
         dic = new Dictionary();
         for each(data in stXML.evolution.item)
         {
            vo = new UpgradeMessageVO();
            vo.m_iIndex = int(data.@level);
            vo.m_iImportance = int(data.@importance);
            vo.m_iCount = int(data.@count);
            vo.m_iInterval = int(data.@interval);
            vo.m_iMessage = data.message.toString();
            dic[vo.m_iIndex] = vo;
         }
         this.m_SystemMessageDic[13] = dic;
         dic = new Dictionary();
         for each(data in stXML.prizedraw.item)
         {
            vo = new UpgradeMessageVO();
            vo.m_iIndex = int(data.@level);
            vo.m_iImportance = int(data.@importance);
            vo.m_iCount = int(data.@count);
            vo.m_iInterval = int(data.@interval);
            vo.m_iMessage = data.message.toString();
            dic[vo.m_iIndex] = vo;
         }
         this.m_SystemMessageDic[14] = dic;
         dic = new Dictionary();
         for each(data in stXML.gem_upgrade.item)
         {
            vo = new UpgradeMessageVO();
            vo.m_iIndex = int(data.@level);
            vo.m_iImportance = int(data.@importance);
            vo.m_iCount = int(data.@count);
            vo.m_iInterval = int(data.@interval);
            vo.m_iMessage = data.message.toString();
            dic[vo.m_iIndex] = vo;
         }
         this.m_SystemMessageDic[15] = dic;
         dic = new Dictionary();
         for each(data in stXML.card_translate.item)
         {
            vo = new UpgradeMessageVO();
            vo.m_iIndex = int(data.@level);
            vo.m_iMessage = data.message.toString();
            dic[vo.m_iIndex] = vo;
         }
         this.m_SystemMessageDic[16] = dic;
         dic = new Dictionary();
         for each(data in stXML.battle.p1vscomputer.item)
         {
            vo = new UpgradeMessageVO();
            vo.m_iIndex = int(data.@mapid);
            vo.m_iStep = int(data.@step);
            vo.m_iMinscore = int(data.@minscore);
            vo.m_iImportance = int(data.@importance);
            vo.m_iInterval = int(data.@interval);
            vo.m_iMessage = data.message.toString();
            dic[vo.m_iIndex] = vo;
         }
         this.m_SystemMessageDic[17] = dic;
         dic = new Dictionary();
         for each(data in stXML.battle.p2vscomputer.item)
         {
            vo = new UpgradeMessageVO();
            vo.m_iIndex = int(data.@mapid);
            vo.m_iStep = int(data.@step);
            vo.m_iMinscore = int(data.@minscore);
            vo.m_iImportance = int(data.@importance);
            vo.m_iInterval = int(data.@interval);
            vo.m_iMessage = data.message.toString();
            dic[vo.m_iIndex] = vo;
         }
         this.m_SystemMessageDic[18] = dic;
         dic = new Dictionary();
         for each(data in stXML.battle.normalmatch1vsp.item)
         {
            vo = new UpgradeMessageVO();
            vo.m_iIndex = int(data.@win);
            vo.m_iop = data.@op.toString();
            vo.m_iImportance = int(data.@importance);
            vo.m_iMessage = data.message.toString();
            dic[vo.m_iIndex] = vo;
         }
         this.m_SystemMessageDic[19] = dic;
         dic = new Dictionary();
         for each(data in stXML.battle.consortiamatch1vsp.item)
         {
            vo = new UpgradeMessageVO();
            vo.m_iIndex = int(data.@win);
            vo.m_iop = data.@op.toString();
            vo.m_iImportance = int(data.@importance);
            vo.m_iMessage = data.message.toString();
            dic[vo.m_iIndex] = vo;
         }
         this.m_SystemMessageDic[20] = dic;
         dic = new Dictionary();
         for each(data in stXML.honor.item)
         {
            vo = new UpgradeMessageVO();
            vo.m_iIndex = int(data.@id);
            vo.m_iImportance = int(data.@importance);
            vo.m_iMessage = data.message.toString();
            dic[vo.m_iIndex] = vo;
         }
         this.m_SystemMessageDic[21] = dic;
         dic = new Dictionary();
         for each(data in stXML.jiaoyou.item)
         {
            vo = new UpgradeMessageVO();
            vo.m_iIndex = int(data.@m_iGender);
            vo.m_iGold = int(data.@gold);
            vo.m_iop = data.@op.toString();
            vo.m_iMessage = data.message.toString();
            dic[vo.m_iIndex] = vo;
         }
         this.m_SystemMessageDic[22] = dic;
         dic = new Dictionary();
         for each(data in stXML.open_box.item)
         {
            vo = new UpgradeMessageVO();
            vo.m_iIndex = int(data.@level);
            vo.m_iImportance = int(data.@importance);
            vo.m_iCount = int(data.@count);
            vo.m_iInterval = int(data.@interval);
            vo.m_iMessage = data.message.toString();
            dic[vo.m_iIndex] = vo;
         }
         this.m_SystemMessageDic[23] = dic;
      }
      
      public function getMsg(m_type:int, m_iIndex:int, repString:Array = null, holder:Array = null) : String
      {
         var returnStr:String = null;
         var msg:String = null;
         var pattern:RegExp = null;
         if(this.m_SystemMessageDic[m_type] != null && this.m_SystemMessageDic[m_type][m_iIndex] != null)
         {
            msg = this.m_SystemMessageDic[m_type][m_iIndex].m_iMessage;
            returnStr = this.replaceString(msg,repString,holder);
            returnStr = "<![CDATA[" + returnStr + "]]>";
            pattern = /<%param%>/g;
            returnStr = this.m_format.replace(pattern,returnStr);
         }
         return returnStr;
      }
      
      public function replaceString(str:String, repString:Array = null, holder:Array = null) : String
      {
         var pattern:RegExp = null;
         var j:int = 0;
         var returnStr:String = str;
         if(repString != null && repString.length > 0)
         {
            if(holder != null && holder.length > 0)
            {
               for(j = 0; j < holder.length; j++)
               {
                  pattern = new RegExp(holder[j],"g");
                  returnStr = returnStr.replace(pattern,repString[j]);
               }
            }
         }
         return returnStr;
      }
   }
}

