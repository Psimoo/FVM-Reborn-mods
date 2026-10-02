package com.aurora.ui.maogoutd.vip
{
   import flash.utils.Dictionary;
   
   public class VipConfig
   {
      
      private static var _instance:VipConfig;
      
      private static var _index:int = 0;
      
      public var configData:Array;
      
      private var crystoneUpgradeDic:Dictionary;
      
      private var fusionUpgradeDic:Dictionary;
      
      public function VipConfig()
      {
         super();
         if(_index > 0)
         {
            throw new Error("VipConfig Failed");
         }
         ++_index;
      }
      
      public static function get Instance() : VipConfig
      {
         if(_instance == null)
         {
            _instance = new VipConfig();
         }
         return _instance;
      }
      
      public function getCrystoneUpgradeDic() : Dictionary
      {
         return this.crystoneUpgradeDic;
      }
      
      public function getFusionUpgradeDic() : Dictionary
      {
         return this.fusionUpgradeDic;
      }
      
      public function parseConfig(xml:XML) : void
      {
         var item:XML = null;
         var vipLevel:int = 0;
         var crystoneXml:XML = null;
         var fusionXml:XML = null;
         var obj:Object = null;
         if(this.configData == null)
         {
            this.configData = new Array();
         }
         this.configData.splice(0);
         for each(item in xml.vip_award.vip_level)
         {
            obj = {};
            obj.szVipContent = String(item.@content);
            obj.iVipDayAwardID = Number(item.@day_libao_id);
            obj.iVipGrowValue = Number(item.@growValue);
            obj.iVipLevel = Number(item.@level);
            obj.iVipLevelAwardID = Number(item.@vip_libao_id);
            this.configData[int(obj.iVipLevel)] = obj;
         }
         this.crystoneUpgradeDic = new Dictionary(true);
         for each(crystoneXml in xml.Vip_Extra.crystoneUpgrade.item)
         {
            vipLevel = int(crystoneXml.@vipLevel);
            this.crystoneUpgradeDic[vipLevel] = Number(crystoneXml.@addRate);
         }
         this.fusionUpgradeDic = new Dictionary(true);
         for each(fusionXml in xml.Vip_Extra.fusionUpgrade.item)
         {
            vipLevel = int(fusionXml.@vipLevel);
            this.fusionUpgradeDic[vipLevel] = Number(fusionXml.@addRate);
         }
      }
   }
}

