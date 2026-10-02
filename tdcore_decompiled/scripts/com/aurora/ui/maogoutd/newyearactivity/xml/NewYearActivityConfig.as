package com.aurora.ui.maogoutd.newyearactivity.xml
{
   import com.aurora.ui.maogoutd.newyearactivity.data.NewYearGiftInfo;
   import flash.utils.Dictionary;
   
   public class NewYearActivityConfig
   {
      
      private static var m_pInstance:NewYearActivityConfig;
      
      public var m_vNewYearLottery:Vector.<NewYearGiftInfo>;
      
      public var m_vNewYearTable:Vector.<NewYearGiftInfo>;
      
      public var m_vNewYearAdvancTable:Vector.<NewYearGiftInfo>;
      
      public var m_vDiscount:Vector.<Object>;
      
      public var m_vNewYearAdvancList:Array;
      
      public var m_vNewYearList:Array;
      
      public var m_vNewYearLotteryDisCount:Array;
      
      public var m_dBroad:Dictionary;
      
      public var m_dAdvancBroad:Dictionary;
      
      public var m_iNewYearGiftPrice:int;
      
      public var m_iPrice:int;
      
      public var m_iTenPrice:int;
      
      public var m_iUseItemID:int;
      
      public var m_iAdvancPrice:int;
      
      public var m_iAdvancTenPrice:int;
      
      public var m_sRedDes:String;
      
      public var m_sRedTime:String;
      
      public var m_iRedTabShowTime:int;
      
      public var m_iRedTabHideTime:int;
      
      public var m_sGiftDes:String;
      
      public var m_sTableDes:String;
      
      public var m_sAdvancTableDes:String;
      
      public var m_bShowShopBtn:Boolean;
      
      public var m_sInstanceDes:String;
      
      public var m_sTime:String;
      
      public var m_sInstanceThemeUrl:String;
      
      public var m_sInstanceBossUrl_1:String;
      
      public var m_sInstanceBossUrl_2:String;
      
      public var m_sInstanceBossUrl_3:String;
      
      public var m_sInstanceBossUrl_4:String;
      
      public var m_sInstanceThemeBtn1Url:String;
      
      public var m_sInstanceThemeBtn2Url:String;
      
      public var m_vTurnRules:Vector.<String>;
      
      public var m_vTaskRule:String;
      
      public var m_time1:int;
      
      public var m_num1:int;
      
      public var m_time2:int;
      
      public var m_num2:int;
      
      public var m_advancTime1:int;
      
      public var m_advancNum1:int;
      
      public var m_advancTime2:int;
      
      public var m_advancNum2:int;
      
      public var m_propLotteryItemID:int;
      
      private var m_dictImage:Dictionary;
      
      public var smallBaodi:int;
      
      public var bigBaodi:int;
      
      public function NewYearActivityConfig()
      {
         super();
      }
      
      public static function Get() : NewYearActivityConfig
      {
         if(!m_pInstance)
         {
            m_pInstance = new NewYearActivityConfig();
         }
         return m_pInstance;
      }
      
      public function get dictImage() : Dictionary
      {
         if(this.m_dictImage == null)
         {
            this.m_dictImage = new Dictionary();
         }
         return this.m_dictImage;
      }
      
      public function ParseLotteryXML(xml:XML) : void
      {
         var rule:String = null;
         var normalRuleXml:XML = null;
         var advancRuleXml:XML = null;
         var objs:Object = null;
         var obj:Object = null;
         var temp:NewYearGiftInfo = null;
         var tmp:Object = null;
         this.m_time1 = int(xml.choujiang.Table.@time1);
         this.m_num1 = int(xml.choujiang.Table.@num1);
         this.m_time2 = int(xml.choujiang.Table.@time2);
         this.m_num2 = int(xml.choujiang.Table.@num2);
         this.m_sTableDes = String(xml.choujiang.@tabledes);
         this.m_bShowShopBtn = Boolean(int(xml.choujiang.@show_shop_btn) != 0);
         var data:XML = null;
         var perdata:XML = null;
         this.m_vNewYearList = new Array();
         this.m_vNewYearAdvancList = new Array();
         this.m_vNewYearLottery = new Vector.<NewYearGiftInfo>();
         this.m_vNewYearTable = new Vector.<NewYearGiftInfo>();
         this.m_vNewYearAdvancTable = new Vector.<NewYearGiftInfo>();
         this.m_vDiscount = new Vector.<Object>();
         this.m_dBroad = new Dictionary();
         this.m_dAdvancBroad = new Dictionary();
         this.m_iUseItemID = int(xml.choujiang.@useItemID);
         this.m_iPrice = int(xml.choujiang.@price_one);
         this.m_iTenPrice = int(xml.choujiang.@price_all);
         this.m_propLotteryItemID = int(xml.choujiang.@buyitemid);
         for each(data in xml.choujiang.discount)
         {
            objs = {};
            objs.m_iStartTime = int(data.@startTime);
            objs.m_iEndTime = int(data.@endTime);
            objs.m_iValue = int(data.@value);
            this.m_vDiscount.push(objs);
         }
         for each(data in xml.choujiang.pool)
         {
            for each(perdata in data.item)
            {
               obj = {};
               obj.m_iID = int(perdata.@id);
               obj.m_iPoolID = int(data.@id);
               obj.m_iItemID = int(perdata.@itemid);
               obj.m_iName = String(perdata.@name);
               obj.m_iCount = int(perdata.@num);
               obj.m_isBind = int(perdata.@isBind);
               this.m_dBroad[obj.m_iItemID] = int(perdata.@broadcast);
               this.m_vNewYearList.push(obj);
            }
            if(data.@id == 3)
            {
               this.smallBaodi = data.@needConsume;
            }
            if(data.@id == 4)
            {
               this.bigBaodi = data.@needConsume;
            }
         }
         for each(data in xml.choujiang.ShowList.item)
         {
            temp = new NewYearGiftInfo();
            temp.m_iID = int(data.@id);
            temp.m_iItemID = int(data.@itemid);
            temp.m_iNum = int(data.@num);
            temp.m_iLevel = int(data.@level);
            temp.m_isBind = int(data.@isBind);
            temp.m_iTime = int(data.@time);
            this.m_vNewYearLottery.push(temp);
         }
         for each(data in xml.choujiang.TableList.item)
         {
            temp = new NewYearGiftInfo();
            temp.m_iID = int(data.@id);
            temp.m_iItemID = int(data.@itemid);
            temp.m_iNum = int(data.@num);
            temp.m_iLevel = int(data.@level);
            temp.m_isBind = int(data.@isBind);
            temp.m_iType = int(data.@type);
            temp.m_iTime = int(data.@time);
            this.m_vNewYearTable.push(temp);
         }
         this.m_advancTime1 = int(xml.super_choujiang.Table.@time1);
         this.m_advancNum1 = int(xml.super_choujiang.Table.@num1);
         this.m_advancTime2 = int(xml.super_choujiang.Table.@time2);
         this.m_advancNum2 = int(xml.super_choujiang.Table.@num2);
         this.m_sAdvancTableDes = String(xml.super_choujiang.@tabledes);
         this.m_iAdvancPrice = int(xml.super_choujiang.@price_one);
         this.m_iAdvancTenPrice = int(xml.super_choujiang.@price_all);
         for each(data in xml.super_choujiang.pool)
         {
            for each(perdata in data.item)
            {
               tmp = {};
               tmp.m_iID = int(perdata.@id);
               tmp.m_iItemID = int(perdata.@itemid);
               tmp.m_iName = String(perdata.@name);
               tmp.m_iCount = int(perdata.@num);
               tmp.m_isBind = int(perdata.@isBind);
               tmp.m_iTime = int(perdata.@time);
               this.m_dAdvancBroad[tmp.m_iItemID] = int(perdata.@broadcast);
               this.m_vNewYearAdvancList.push(tmp);
            }
         }
         for each(data in xml.super_choujiang.TableList.item)
         {
            temp = new NewYearGiftInfo();
            temp.m_iID = int(data.@id);
            temp.m_iItemID = int(data.@itemid);
            temp.m_iNum = int(data.@num);
            temp.m_iLevel = int(data.@level);
            temp.m_isBind = int(data.@isBind);
            temp.m_iType = int(data.@type);
            temp.m_iCost = int(data.@costLuckStar);
            temp.m_sItemName = String(data.@name);
            temp.m_iTime = int(data.@time);
            this.m_vNewYearAdvancTable.push(temp);
         }
         this.m_vTurnRules = new Vector.<String>();
         rule = "";
         normalRuleXml = xml.rules[0].normal[0];
         for each(data in normalRuleXml.row)
         {
            if(rule != "")
            {
               rule += "\n";
            }
            rule += data.toString();
         }
         this.m_vTurnRules.push(rule);
         rule = "";
         advancRuleXml = xml.rules[0].advanc[0];
         for each(data in advancRuleXml.row)
         {
            if(rule != "")
            {
               rule += "\n";
            }
            rule += data.toString();
         }
         this.m_vTurnRules.push(rule);
      }
      
      public function a_2040(xml:XML) : void
      {
         var li:XML = null;
         var ruleXml:XML = null;
         var data:XML = null;
         var rule:String = null;
         var endTime:int = 0;
         if(xml == null)
         {
            return;
         }
         this.m_sRedDes = xml.LuckyMoney.@reddes;
         this.m_sRedTime = xml.LuckyMoney.@stime;
         this.m_iRedTabShowTime = int(xml.LuckyMoney.@tabShowTime);
         this.m_iRedTabHideTime = -1;
         for each(li in xml.LuckyMoney.li)
         {
            endTime = int(li.@endTime);
            if(this.m_iRedTabHideTime < endTime)
            {
               this.m_iRedTabHideTime = endTime;
            }
         }
         this.m_sInstanceDes = xml.Instance.@instancedes;
         this.m_sTime = xml.Instance.@stime;
         this.m_sInstanceThemeUrl = xml.Instance.@themeUrl;
         this.m_sInstanceBossUrl_1 = xml.Instance.@bossUrl_1;
         this.m_sInstanceBossUrl_2 = xml.Instance.@bossUrl_2;
         this.m_sInstanceBossUrl_3 = xml.Instance.@bossUrl_3;
         this.m_sInstanceBossUrl_4 = xml.Instance.@bossUrl_4;
         this.m_sInstanceThemeBtn1Url = xml.Instance.@themeBtn1;
         this.m_sInstanceThemeBtn2Url = xml.Instance.@themeBtn2;
         ruleXml = xml.Instance.rule[0];
         rule = "";
         for each(data in ruleXml.row)
         {
            if(rule != "")
            {
               rule += "\n";
            }
            rule += data.toString();
         }
         this.m_vTaskRule = rule;
      }
   }
}

