package com.aurora.ui.maogoutd.actions
{
   import a_4752.GameStringManager;
   import a_4754.a_2161;
   import com.aurora.ui.maogoutd.role.a_4463;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.utils.Dictionary;
   
   public class a_3182 extends EventDispatcher
   {
      
      private static var instance:a_3182;
      
      public static const PANEL_HOME:int = 256;
      
      public static const PANEL_ACTION:int = 512;
      
      public static const PANEL_NEWGIFT:int = 768;
      
      public var dictAwardperDay:Dictionary;
      
      public var arrAwardLoginCounts:Array;
      
      public var arrLongAwards:Array;
      
      public var dictActivity:Dictionary;
      
      public var arrActivityAwards:Array;
      
      public var arrFirstPayAward:Array;
      
      public var arrPayAwards:Array;
      
      public var arrTotalAwards:Array;
      
      public var arrUpdateNotices:Array;
      
      public var szActivityTime:String;
      
      public var m_iDefaultTabID:int = -1;
      
      public var arrTabs:Array;
      
      public var arrAds:Array;
      
      public function a_3182()
      {
         super();
         this.dictAwardperDay = new Dictionary();
         this.arrLongAwards = [];
         this.arrAwardLoginCounts = [];
         this.arrPayAwards = [];
         this.arrActivityAwards = [];
         this.arrUpdateNotices = [];
         this.arrTotalAwards = [];
         this.arrFirstPayAward = [];
         this.arrTabs = [];
         this.arrAds = [];
      }
      
      public static function getInstance() : a_3182
      {
         if(instance == null)
         {
            instance = new a_3182();
         }
         return instance;
      }
      
      public function requestActivityAward(platform:String = "") : void
      {
         var role:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         var params:Object = {};
         params.src_uin = role.m_iRoleUin;
         params.src_account = role.m_szRoleName;
         params.user_sex = role.m_iUserSex;
         params.award_type = -1;
         params.URLType = 0;
         params.platform = platform;
         a_3191.getInstance().sendRequest(this,params,this.requestActivityAwardBack);
      }
      
      public function requestActivityAwardBack(back_obj:Object) : void
      {
         var item:Object = null;
         var xml:Object = back_obj.data;
         if(xml == "")
         {
            return;
         }
         if(xml.result_id != 0)
         {
            return;
         }
         if(this.arrPayAwards.length > 0)
         {
            this.arrPayAwards.splice(0);
         }
         if(this.arrActivityAwards.length > 0)
         {
            this.arrActivityAwards.splice(0);
         }
         if(this.arrTotalAwards.length > 0)
         {
            this.arrTotalAwards.splice(0);
         }
         if(this.arrFirstPayAward.length > 0)
         {
            this.arrFirstPayAward.splice(0);
         }
         if(this.arrTabs.length > 0)
         {
            this.arrTabs.splice(0);
         }
         if(this.arrAds.length > 0)
         {
            this.arrAds.splice(0);
         }
         for each(item in xml.data.act_list)
         {
            switch(Number(item.award_type))
            {
               case 0:
                  this.addItemToPayArray(item);
                  break;
               case 1:
                  this.addItemToTotalArray(item);
                  break;
               case 2:
                  this.addItemToFirstArray(item);
                  break;
               case 3:
               case 4:
               case 5:
               case 6:
                  this.addItemToNormalArray(item);
            }
         }
         this.addItemToTabArray(xml);
         this.addItemToAdArray(xml);
         dispatchEvent(new Event("requestActivityConfig"));
      }
      
      private function addItemToTabArray(xml:Object) : void
      {
         var tmpTabArr:Array = null;
         var tabObj:Object = null;
         var tabItem:Object = null;
         if(xml.series != null && xml.series.series_list != null)
         {
            tmpTabArr = xml.series.series_list;
         }
         if(tmpTabArr == null)
         {
            tmpTabArr = [];
         }
         for each(tabItem in tmpTabArr)
         {
            tabObj = {};
            tabObj.act_desc = String(tabItem.con);
            tabObj.end_time = Number(tabItem.et);
            tabObj.start_time = Number(tabItem.st);
            tabObj.tab_type = 256 + (Number(tabItem.type) << 8);
            tabObj.tab_id = tabObj.tab_type + Number(tabItem.id);
            tabObj.left_title = String(tabItem.l_t);
            tabObj.right_title = String(tabItem.r_t);
            tabObj.main_title = String(tabItem.title);
            tabObj.tab_state = Number(tabItem.rec);
            tabObj.priority = 1;
            tabObj.szDisplay = String(tabItem.display);
            this.arrTabs.push(tabObj);
         }
         this.arrTabs.sortOn(["tab_id","tab_state","priority"],[Array.NUMERIC,Array.NUMERIC | Array.DESCENDING,Array.NUMERIC]);
         this.arrTabs.reverse();
         if(this.arrTabs.length > 0)
         {
            this.m_iDefaultTabID = this.arrTabs[0].tab_id;
         }
      }
      
      private function addItemToAdArray(xml:Object) : void
      {
         var tmpTabArr:Array = null;
         var adObj:Object = null;
         var adItem:Object = null;
         var colLen:int = 0;
         var rowLen:int = 0;
         var col:int = 0;
         var row:int = 0;
         if(xml.data != null && xml.data.series_con != null)
         {
            tmpTabArr = xml.data.series_con;
         }
         for each(adItem in tmpTabArr)
         {
            colLen = int(adItem.s_x) + int(adItem.w);
            rowLen = int(adItem.s_y) + int(adItem.h);
            for(col = int(adItem.s_x); col < colLen; col++)
            {
               for(row = int(adItem.s_y); row < rowLen; row++)
               {
                  adObj = {};
                  adObj.iTabID = PANEL_HOME + Number(adItem.sid);
                  adObj.tabID = adObj.iTabID;
                  adObj.fileURL = "./resource/ad/" + String(adItem.id) + ".swf";
                  if(int(adItem.l_t) == 1)
                  {
                     adObj.tabType = 256 + (Number(adItem.type) << 8);
                     adObj.tabID = adObj.tabType + Number(adItem.l_c);
                     adObj.pageURL = null;
                  }
                  else if(int(adItem.l_t) == 2)
                  {
                     adObj.pageURL = String(adItem.l_c);
                  }
                  else
                  {
                     adObj.pageURL = null;
                  }
                  adObj.gridRowID = row;
                  adObj.gridColID = col;
                  this.arrAds.push(adObj);
               }
            }
         }
      }
      
      private function addItemToPayArray(item:Object) : void
      {
         var payItem:Object = {};
         payItem.iID = Number(item.id);
         payItem.szAwardID = String(item.award_libao_id);
         payItem.iCoin = Number(item.award_gold);
         payItem.szCondition = String(item.award_condition);
         payItem.iMoney = Number(item.award_point);
         payItem.szName = String(item.condition_name);
         payItem.szType = GameStringManager.getInstance().getString(131878);
         payItem.szDuringTime = String(item.during_time);
         payItem.szActivityTime = String(item.activity_time);
         payItem.szDisplay = String(item.display);
         payItem.iCount = Number(item.award_counts);
         payItem.iVipLevel = Number(item.param2);
         payItem.iType = 5;
         payItem.iTabID = PANEL_ACTION + Number(item.sid);
         payItem.szAwardDesc = String(item.item);
         this.szActivityTime = String(item.activity_time);
         this.arrPayAwards.push(payItem);
      }
      
      private function addItemToFirstArray(item:Object) : void
      {
         var firstItem:Object = new Object();
         firstItem.iID = Number(item.id);
         firstItem.szAwardID = String(item.award_libao_id);
         firstItem.szCondition = String(item.award_condition);
         firstItem.szName = String(item.condition_name);
         firstItem.iTabID = PANEL_ACTION + Number(item.sid);
         firstItem.szAwardDesc = String(item.item);
         this.arrFirstPayAward.push(firstItem);
      }
      
      private function addItemToTotalArray(item:Object) : void
      {
         var totalItem:Object = {};
         totalItem.iID = Number(item.id);
         totalItem.szAwardID = String(item.award_libao_id);
         totalItem.iCoin = Number(item.award_gold);
         totalItem.szCondition = String(item.award_condition);
         totalItem.iMoney = Number(item.award_point);
         totalItem.szName = String(item.condition_name);
         totalItem.szType = GameStringManager.getInstance().getString(131879);
         totalItem.szDuringTime = String(item.during_time);
         totalItem.szActivityTime = String(item.activity_time);
         totalItem.szDisplay = String(item.display);
         totalItem.iCount = Number(item.award_counts);
         totalItem.iVipLevel = Number(item.param2);
         totalItem.iType = 33;
         totalItem.iTabID = PANEL_ACTION + Number(item.sid);
         totalItem.szAwardDesc = String(item.item);
         this.szActivityTime = String(item.activity_time);
         this.arrTotalAwards.push(totalItem);
      }
      
      private function addItemToNormalArray(item:Object) : void
      {
         var activityItem:Object = {};
         activityItem.iID = Number(item.id);
         activityItem.szAwardID = String(item.award_libao_id);
         activityItem.szCondition = String(item.award_condition);
         activityItem.szDesc = String(item.condition_name);
         activityItem.szName = String(item.condition_name);
         activityItem.iType = Number(item.award_type_id);
         activityItem.szDuringTime = String(item.during_time);
         activityItem.szActivityTime = String(item.activity_time);
         activityItem.szDisplay = String(item.display);
         activityItem.iCoin = Number(item.award_gold);
         activityItem.iMoney = Number(item.award_point);
         activityItem.iCount = Number(item.award_counts);
         activityItem.iVipLevel = Number(item.param2);
         activityItem.iTabID = PANEL_ACTION + Number(item.sid);
         activityItem.szAwardDesc = String(item.item);
         this.arrActivityAwards.push(activityItem);
      }
      
      public function a_3183(activityXML:XML) : Boolean
      {
         var activityXml:XML = null;
         var szTime:String = null;
         var szAward:String = null;
         var szContent:String = null;
         var szLink:String = null;
         var dictActivitys:Object = null;
         if(activityXML != null)
         {
            if(this.dictActivity == null)
            {
               this.dictActivity = new Dictionary();
            }
            for each(activityXml in activityXML.activitys.activity)
            {
               szTime = activityXml.@time;
               szAward = activityXml.@award;
               szContent = activityXml.@content;
               szLink = activityXml.@link;
               dictActivitys = {};
               dictActivitys.szAward = szAward;
               dictActivitys.szContent = szContent;
               dictActivitys.szLink = szLink;
               dictActivitys.szTime = szTime;
               this.dictActivity[szTime] = dictActivitys;
            }
         }
         return true;
      }
      
      public function a_3184(activityXML:XML) : Boolean
      {
         return true;
      }
      
      public function a_3185(xml:XML) : void
      {
         var longAward:XML = null;
         var loginCountsXml:XML = null;
         var long:Object = null;
         var szAwardID:String = null;
         var index:int = 0;
         var desc:String = null;
         var level:int = 0;
         var money:int = 0;
         var loginCounts:Object = null;
         var iCountGoodID:int = 0;
         var iCountIndex:int = 0;
         var iLoginCount:int = 0;
         if(this.arrLongAwards.length > 0)
         {
            this.arrLongAwards.splice(0);
         }
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
            this.arrLongAwards.push(long);
         }
         if(this.arrAwardLoginCounts.length > 0)
         {
            this.arrAwardLoginCounts.splice(0);
         }
         for each(loginCountsXml in xml.award_login_counts.award)
         {
            loginCounts = new Object();
            iCountGoodID = int(loginCountsXml.@g_id);
            iCountIndex = int(loginCountsXml.@item_idx);
            iLoginCount = int(loginCountsXml.@count);
            loginCounts.iCountGoodID = iCountGoodID;
            loginCounts.iCountIndex = iCountIndex;
            loginCounts.iLoginCount = iLoginCount;
            this.arrAwardLoginCounts.push(loginCounts);
         }
      }
      
      public function a_3186(xml:XML) : void
      {
         var updateNoticesXml:XML = null;
         var updateNoticesItem:Object = null;
         if(this.arrUpdateNotices.length > 0)
         {
            this.arrUpdateNotices.splice(0);
         }
         for each(updateNoticesXml in xml.notice)
         {
            updateNoticesItem = new Object();
            updateNoticesItem.iState = Number(updateNoticesXml.@state);
            updateNoticesItem.szContent = String(updateNoticesXml.@content);
            updateNoticesItem.szDate = String(updateNoticesXml.@date);
            updateNoticesItem.szVersion = String(updateNoticesXml.@version);
            this.arrUpdateNotices.push(updateNoticesItem);
         }
      }
   }
}

