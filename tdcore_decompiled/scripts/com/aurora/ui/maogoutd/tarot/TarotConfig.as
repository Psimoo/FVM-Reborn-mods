package com.aurora.ui.maogoutd.tarot
{
   import com.aurora.ui.maogoutd.tarot.data.TarotItem;
   import flash.utils.Dictionary;
   
   public class TarotConfig
   {
      
      private static var m_pInstance:TarotConfig;
      
      public var m_iTenPrice:int;
      
      public var m_iPrice:int;
      
      public var m_iBuyItemID:int;
      
      public var m_iDescText:String;
      
      public var m_iDiscountTime:Array;
      
      public var m_iShowList:Vector.<TarotItem>;
      
      public var m_iCostAwardTime:Array;
      
      public var m_iCost:Array;
      
      public var m_iCostAward:Vector.<Vector.<TarotItem>>;
      
      public var m_iPool:Dictionary;
      
      public var m_iName:Dictionary;
      
      public function TarotConfig()
      {
         super();
      }
      
      public static function Get() : TarotConfig
      {
         if(!m_pInstance)
         {
            m_pInstance = new TarotConfig();
         }
         return m_pInstance;
      }
      
      public function ShowList() : Vector.<TarotItem>
      {
         return this.m_iShowList;
      }
      
      public function CostAward(iTime:int) : Vector.<TarotItem>
      {
         for(var i:int = 0; i < this.m_iCostAwardTime.length; i++)
         {
            if(this.m_iCostAwardTime[i].m_iStartTime <= iTime && iTime <= this.m_iCostAwardTime[i].m_iEndTime)
            {
               return this.m_iCostAward[i];
            }
         }
         return null;
      }
      
      public function CostLevel(iTime:int) : Array
      {
         for(var i:int = 0; i < this.m_iCostAwardTime.length; i++)
         {
            if(this.m_iCostAwardTime[i].m_iStartTime <= iTime && iTime <= this.m_iCostAwardTime[i].m_iEndTime)
            {
               return this.m_iCost[i];
            }
         }
         return null;
      }
      
      public function a_2040(xml:XML) : void
      {
         var obj:Object = null;
         var arr:Array = null;
         var stCostAward:Vector.<TarotItem> = null;
         var stTarot:TarotItem = null;
         if(xml == null)
         {
            return;
         }
         var data:XML = null;
         var perdata:XML = null;
         var peraward:XML = null;
         this.m_iTenPrice = int(xml.tarot.@ten_price);
         this.m_iPrice = int(xml.tarot.@price);
         this.m_iBuyItemID = int(xml.tarot.@buyitemid);
         this.m_iDescText = String(xml.tarot.@desc);
         this.m_iDiscountTime = [];
         this.m_iPool = new Dictionary();
         this.m_iName = new Dictionary();
         for each(data in xml.tarot.pool)
         {
            for each(perdata in data.item)
            {
               this.m_iPool[int(perdata.@itemid)] = int(data.@id);
               this.m_iName[int(perdata.@itemid)] = String(perdata.@name);
            }
         }
         for each(data in xml.tarot.discount)
         {
            obj = {};
            obj.m_iValue = int(data.@value);
            obj.m_iStartTime = int(data.@startTime);
            obj.m_iEndTime = int(data.@endTime);
            this.m_iDiscountTime.push(obj);
         }
         this.m_iCostAward = new Vector.<Vector.<TarotItem>>();
         this.m_iCostAwardTime = [];
         this.m_iCost = [];
         for each(data in xml.tarotaward.award)
         {
            obj = {};
            obj.m_iStartTime = int(data.@startTime);
            obj.m_iEndTime = int(data.@endTime);
            this.m_iCostAwardTime.push(obj);
            arr = [];
            stCostAward = new Vector.<TarotItem>();
            for each(perdata in data.step)
            {
               arr.push(int(perdata.@needConsume));
               for each(peraward in perdata.item)
               {
                  stTarot = new TarotItem();
                  stTarot.m_iItemID = int(peraward.@itemid);
                  stTarot.m_iTime = int(peraward.@time);
                  stTarot.m_iSex = int(peraward.@sex);
                  stTarot.m_isBind = int(peraward.@isBind);
                  stTarot.m_iLevel = int(peraward.@level);
                  stTarot.m_iNum = int(peraward.@num);
                  stTarot.m_iType = int(perdata.@id);
                  stCostAward.push(stTarot);
               }
            }
            this.m_iCostAward.push(stCostAward);
            this.m_iCost.push(arr);
         }
         this.m_iShowList = new Vector.<TarotItem>();
         for each(data in xml.showList.item)
         {
            stTarot = new TarotItem();
            stTarot.m_iItemID = int(data.@itemid);
            stTarot.m_iTime = int(data.@time);
            stTarot.m_isBind = int(data.@isBind);
            stTarot.m_iLevel = int(data.@level);
            stTarot.m_iNum = int(data.@num);
            stTarot.m_iType = int(data.@isSpecial);
            this.m_iShowList.push(stTarot);
         }
      }
   }
}

