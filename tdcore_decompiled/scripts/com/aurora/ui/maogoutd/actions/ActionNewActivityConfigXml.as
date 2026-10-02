package com.aurora.ui.maogoutd.actions
{
   import flash.utils.Dictionary;
   
   public class ActionNewActivityConfigXml
   {
      
      private static var instance:ActionNewActivityConfigXml = new ActionNewActivityConfigXml();
      
      public var m_ConfigXmlDataList:Array;
      
      public var m_configXmlIconList:Array;
      
      public var m_configXmlIcomListQQgame:Array;
      
      public var m_OpenMenulist:Dictionary;
      
      public function ActionNewActivityConfigXml()
      {
         super();
         if(instance)
         {
            return;
         }
      }
      
      public static function getInstance() : ActionNewActivityConfigXml
      {
         return instance;
      }
      
      public function getXmlData(xml:XML) : Boolean
      {
         var longAward:XML = null;
         var icon:MenuIconStruct = null;
         var iconList:XML = null;
         var long:Object = null;
         var szAwardID:String = null;
         var index:int = 0;
         var desc:String = null;
         var level:int = 0;
         var money:int = 0;
         this.m_ConfigXmlDataList = [];
         this.m_configXmlIconList = [];
         this.m_configXmlIcomListQQgame = [];
         this.m_OpenMenulist = new Dictionary();
         if(xml != null)
         {
            for each(longAward in xml.long_award.award)
            {
               long = new Object();
               szAwardID = longAward.@award_id;
               index = int(longAward.@index);
               desc = longAward.@desc;
               level = int(longAward.@level);
               money = int(longAward.@money);
               long.szAwardID = szAwardID;
               long.index = index;
               long.level = level;
               long.desc = desc;
               long.money = money;
               long.iType = Number(longAward.@type);
               this.m_ConfigXmlDataList.push(long);
            }
            for each(iconList in xml.icon_list.icon)
            {
               icon = new MenuIconStruct();
               icon.m_iID = iconList.@id;
               icon.m_szName = iconList.@name;
               icon.m_szDesc = iconList.@desc;
               icon.m_szOpen = iconList.@open;
               icon.m_szTime = iconList.@time;
               icon.m_szType = iconList.@type;
               icon.m_iLight = iconList.@light;
               icon.m_szFlatfrom = iconList.@platfrom;
               this.m_configXmlIconList.push(icon);
            }
            for each(iconList in xml.icon_list_qqgame.icon)
            {
               icon = new MenuIconStruct();
               icon.m_iID = iconList.@id;
               icon.m_szName = iconList.@name;
               icon.m_szDesc = iconList.@desc;
               icon.m_szOpen = iconList.@open;
               icon.m_szTime = iconList.@time;
               icon.m_szType = iconList.@type;
               icon.m_iLight = iconList.@light;
               icon.m_szFlatfrom = iconList.@platfrom;
               this.m_configXmlIcomListQQgame.push(icon);
            }
         }
         return true;
      }
   }
}

