package com.aurora.ui.maogoutd.onepiece.xml
{
   import a_4752.a_2027;
   import com.aurora.ui.maogoutd.component.a_3228;
   import com.aurora.ui.maogoutd.component.a_3306;
   import com.aurora.ui.maogoutd.compose.PackagesManager;
   import com.aurora.ui.maogoutd.onepiece.data.CardEvolutionItem;
   import com.aurora.ui.maogoutd.onepiece.data.OnePieceItem;
   import com.aurora.ui.maogoutd.onepiece.shop.LuckInfoStruct;
   import com.aurora.ui.maogoutd.onepiece.shop.xml.DecomposeItemInfo;
   import flash.display.Sprite;
   import flash.utils.Dictionary;
   
   public class OnePieceConfig
   {
      
      private static var m_pInstance:OnePieceConfig;
      
      public static const COMPOSE_TAB_GOLDCARD:uint = 1;
      
      public static const COMPOSE_TAB_ARTIFACT:uint = 2;
      
      public static const COMPOSE_TAB_GEM:uint = 3;
      
      public var m_iAllPrice:int;
      
      public var m_iAllCount:int;
      
      public var m_iPrice:int;
      
      public var m_iBuyItemID:int;
      
      public var m_iDiscountTime:Array;
      
      public var m_iShowList:Vector.<OnePieceItem>;
      
      public var m_dicComposeCfgByTabID:Dictionary;
      
      public var m_iPool:Dictionary;
      
      public var m_iName:Dictionary;
      
      public var m_iBroad:Dictionary;
      
      public var m_iCostAwardTime:Array;
      
      public var m_iCost:Array;
      
      public var m_iCostAward:Vector.<OnePieceItem>;
      
      public var m_dictDecompose:Dictionary;
      
      public var m_vLuckInfo:Vector.<LuckInfoStruct>;
      
      public var m_iFortuneMoney:int;
      
      public var m_iCoinItemID:int;
      
      public function OnePieceConfig()
      {
         super();
      }
      
      public static function Get() : OnePieceConfig
      {
         if(!m_pInstance)
         {
            m_pInstance = new OnePieceConfig();
         }
         return m_pInstance;
      }
      
      public function init() : void
      {
      }
      
      public function CostAward() : Vector.<OnePieceItem>
      {
         return this.m_iCostAward;
      }
      
      public function CostLevel() : Array
      {
         return this.m_iCost;
      }
      
      public function ShowList() : Vector.<OnePieceItem>
      {
         return this.m_iShowList;
      }
      
      public function GetEvolution(reel:int, tabID:int = 1, lev:int = 0) : CardEvolutionItem
      {
         var j:int = 0;
         var i:int = 0;
         var vCardEvolution:Vector.<CardEvolutionItem> = this.m_dicComposeCfgByTabID[tabID];
         if(vCardEvolution == null)
         {
            return null;
         }
         if(tabID != COMPOSE_TAB_GEM)
         {
            i = 0;
            while(true)
            {
               if(i < vCardEvolution.length)
               {
                  if(reel == vCardEvolution[i].m_iReel)
                  {
                     break;
                  }
                  i++;
                  continue;
               }
            }
            return vCardEvolution[i];
         }
         for(j = 0; j < vCardEvolution.length; j++)
         {
            if(reel == vCardEvolution[j].m_iReel && lev == vCardEvolution[j].m_cost_gem_level)
            {
               return vCardEvolution[j];
            }
         }
         return null;
      }
      
      public function GetEvolutionType(cardID:int, tabID:int = 1) : int
      {
         var j:int = 0;
         var vCardEvolution:Vector.<CardEvolutionItem> = this.m_dicComposeCfgByTabID[tabID];
         if(vCardEvolution == null)
         {
            return 0;
         }
         loop0:
         for(var i:int = 0; i < vCardEvolution.length; )
         {
            if(cardID == vCardEvolution[i].m_iObtainID)
            {
               return 3;
            }
            j = 0;
            while(true)
            {
               if(j >= vCardEvolution[i].m_vCostItemID.length)
               {
                  i++;
                  continue loop0;
               }
               if(cardID == vCardEvolution[i].m_vCostItemID[j])
               {
                  break;
               }
               j++;
            }
            return j + 1;
         }
         return 0;
      }
      
      public function a_2040(xml:XML) : void
      {
         var stOnePiece:OnePieceItem = null;
         var buff:XML = null;
         var iTabID:int = 0;
         var vCardEvolution:Vector.<CardEvolutionItem> = null;
         var i:int = 0;
         var element:XML = null;
         var cost:XML = null;
         var goods:XML = null;
         var attr:a_3228 = null;
         var m_dictDesc:Dictionary = null;
         var gemDesc:a_3306 = null;
         var propsCard:Sprite = null;
         var obj:Object = null;
         var stTarot:OnePieceItem = null;
         var tempa:DecomposeItemInfo = null;
         var luckinfo:LuckInfoStruct = null;
         if(xml == null)
         {
            return;
         }
         var data:XML = null;
         var perdata:XML = null;
         var peraward:XML = null;
         this.m_iAllPrice = int(xml.choujiang.@price_all);
         this.m_iPrice = int(xml.choujiang.@price_one);
         this.m_iAllCount = int(xml.choujiang.@all_count);
         this.m_iBuyItemID = int(xml.choujiang.@buyitemid);
         this.m_iDiscountTime = [];
         this.m_iPool = new Dictionary();
         this.m_iName = new Dictionary();
         this.m_iBroad = new Dictionary();
         this.m_dicComposeCfgByTabID = new Dictionary();
         for each(data in xml.evolution.compose_tab)
         {
            iTabID = int(data.@id);
            vCardEvolution = new Vector.<CardEvolutionItem>();
            this.m_dicComposeCfgByTabID[iTabID] = vCardEvolution;
            i = 0;
            for each(element in data.element)
            {
               vCardEvolution[i] = new CardEvolutionItem();
               vCardEvolution[i].m_iObtainID = int(element.@obtain_id);
               vCardEvolution[i].m_iReel = int(element.@reel);
               vCardEvolution[i].m_cost_gem_level = int(element.@cost_gem_level);
               for each(cost in element.cost.item)
               {
                  vCardEvolution[i].m_vCostItemID.push(int(cost.@item_id));
               }
               for each(goods in element.obtain_ext.item)
               {
                  attr = new a_3228();
                  attr.CardCount = int(goods.@count);
                  attr.CardID = int(goods.@item_id);
                  attr.CardPositionID = -1;
                  attr.CardSeq = 0;
                  attr.IsBind = 1;
                  attr.ExpiredTime = -2;
                  attr.Type = 10;
                  attr.DeltaTime = -1;
                  m_dictDesc = a_2027.getInstance().m_dictDesc;
                  gemDesc = m_dictDesc[attr.CardID];
                  attr.Name = gemDesc.Name;
                  attr.DictExtraAttr = new Dictionary();
                  propsCard = PackagesManager.createCard(attr,true);
                  vCardEvolution[i].m_obtain_ext.push(propsCard);
               }
               i++;
            }
         }
         for each(data in xml.choujiang.pool)
         {
            for each(perdata in data.item)
            {
               this.m_iPool[int(perdata.@itemid)] = int(data.@id);
               this.m_iName[int(perdata.@itemid)] = String(perdata.@name);
               this.m_iBroad[int(perdata.@itemid)] = int(perdata.@broadcast);
            }
         }
         for each(data in xml.choujiang.discount)
         {
            obj = {};
            obj.m_iValue = int(data.@value);
            obj.m_iStartTime = int(data.@startTime);
            obj.m_iEndTime = int(data.@endTime);
            this.m_iDiscountTime.push(obj);
         }
         this.m_iShowList = new Vector.<OnePieceItem>();
         for each(data in xml.choujiang.showList.item)
         {
            stOnePiece = new OnePieceItem();
            stOnePiece.m_iItemID = int(data.@itemid);
            stOnePiece.m_iTime = int(data.@time);
            stOnePiece.m_isBind = int(data.@isBind);
            stOnePiece.m_iLevel = int(data.@level);
            stOnePiece.m_iNum = int(data.@num);
            stOnePiece.m_iBroadcast = int(data.@broadcast);
            this.m_iShowList.push(stOnePiece);
         }
         this.m_iCostAward = new Vector.<OnePieceItem>();
         this.m_iCostAwardTime = [];
         this.m_iCost = [];
         for each(data in xml.godcardaward.step)
         {
            this.m_iCost.push(int(data.@needConsume));
            for each(peraward in data.item)
            {
               stTarot = new OnePieceItem();
               stTarot.m_iItemID = int(peraward.@itemid);
               stTarot.m_iTime = int(peraward.@time);
               stTarot.m_iSex = int(peraward.@sex);
               stTarot.m_isBind = int(peraward.@isBind);
               stTarot.m_iLevel = int(peraward.@level);
               stTarot.m_iNum = int(peraward.@num);
               stTarot.m_iType = int(data.@id);
               this.m_iCostAward.push(stTarot);
            }
         }
         this.m_dictDecompose = new Dictionary();
         this.m_vLuckInfo = new Vector.<LuckInfoStruct>();
         for each(data in xml.decompose.item)
         {
            tempa = new DecomposeItemInfo();
            tempa.m_iItemID = int(data.@itemid);
            tempa.m_iNum = int(data.@num);
            this.m_dictDecompose[tempa.m_iItemID] = tempa;
         }
         for each(buff in xml.luckbuff.buff)
         {
            luckinfo = new LuckInfoStruct();
            luckinfo.id = buff.@id;
            luckinfo.addition = buff.@addition;
            this.m_vLuckInfo.push(luckinfo);
         }
         this.m_iFortuneMoney = int(xml.luckbuff.@price);
         this.m_iCoinItemID = int(xml.decompose.@itemid);
      }
   }
}

