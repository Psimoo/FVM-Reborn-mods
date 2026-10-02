package a_4752
{
   import com.aurora.ui.maogoutd.component.a_3258;
   import com.aurora.ui.maogoutd.store.a_4475;
   import flash.utils.Dictionary;
   
   public class a_2044
   {
      
      private static var instance:a_2044;
      
      public var a_1641:Dictionary;
      
      public var m_dictGoods:Dictionary;
      
      public var m_dictUnionStores:Dictionary;
      
      public var m_dictTuiJian:Dictionary;
      
      public var m_dictDiscount:Dictionary;
      
      public function a_2044()
      {
         super();
      }
      
      public static function getInstance() : a_2044
      {
         if(instance == null)
         {
            instance = new a_2044();
         }
         return instance;
      }
      
      public function a_2045(marketGoodsXML:XML) : void
      {
         var goods:XML = null;
         var g_id:int = 0;
         var goodsAttr:a_3258 = null;
         var arrMarketItem:Array = null;
         var item:XML = null;
         var itemID:int = 0;
         var itemCount:int = 0;
         var element:XML = null;
         var marketItem:a_4475 = null;
         var attr:XML = null;
         var mItem:a_4475 = null;
         if(marketGoodsXML != null)
         {
            this.m_dictGoods = new Dictionary(true);
            this.m_dictGoods.price_discount = marketGoodsXML.price.@discount * 1;
            if(isNaN(this.m_dictGoods.price_discount) || this.m_dictGoods.price_discount == 0)
            {
               this.m_dictGoods.price_discount = 100;
            }
            for each(goods in marketGoodsXML.goods)
            {
               g_id = int(goods.@g_id);
               goodsAttr = new a_3258();
               goodsAttr.CardID = g_id;
               goodsAttr.g_goodsID = g_id;
               goodsAttr.g_comm_currency_type = goods.@g_comm_currency_type;
               goodsAttr.g_comm_price = goods.@g_comm_price;
               goodsAttr.g_description = goods.@g_description;
               goodsAttr.g_discount_price = goods.@g_discount_price;
               goodsAttr.g_name = goods.@g_name;
               goodsAttr.g_renew_price = goods.@g_renew_price;
               goodsAttr.g_type = goods.@g_type;
               goodsAttr.g_vip_price = goods.@g_vip_price;
               goodsAttr.g_energy = goods.@g_energy;
               arrMarketItem = [];
               for each(item in goods.item)
               {
                  itemID = int(item.@id);
                  itemCount = 1;
                  goodsAttr.itemType = item.child("element").length();
                  for each(element in item.element)
                  {
                     marketItem = new a_4475();
                     marketItem.g_goodsID = g_id;
                     marketItem.itemCount = itemCount;
                     marketItem.itemCardID = itemID;
                     marketItem.i_buy_type = element.@i_buy_type;
                     marketItem.i_desc = element.@i_desc;
                     marketItem.i_expiry_date = element.@i_expiry_date;
                     marketItem.i_time_flag = element.@i_time_flag;
                     marketItem.i_is_bind = element.@i_is_bind;
                     marketItem.i_is_level = element.@i_is_level;
                     marketItem.i_used_count = element.@i_count;
                     marketItem.i_is_visible = element.@i_is_visible;
                     goodsAttr.g_expirydate = marketItem.i_expiry_date;
                     goodsAttr.g_buy_type = marketItem.i_buy_type;
                     goodsAttr.g_used_count = marketItem.i_used_count;
                     goodsAttr.g_is_visible = marketItem.i_is_visible;
                     for each(attr in element.attr)
                     {
                        marketItem.i_attr_type = attr.@i_attr_type;
                        marketItem.i_attr_value = attr.@i_attr_value;
                     }
                     if(goodsAttr.itemType >= 1)
                     {
                        marketItem.i_comm_currency_type = element.@i_comm_currency_type;
                        marketItem.i_comm_price = element.@i_comm_price;
                        marketItem.i_vip_price = element.@i_vip_price;
                        marketItem.i_discount_price = element.@i_discount_price;
                        marketItem.i_renew_price = element.@i_renew_price;
                     }
                     arrMarketItem.push(marketItem);
                  }
               }
               if(goodsAttr.itemType >= 1)
               {
                  mItem = arrMarketItem[0];
                  goodsAttr.i_desc = mItem.i_desc;
                  goodsAttr.g_comm_currency_type = mItem.i_comm_currency_type;
                  goodsAttr.g_comm_price = mItem.i_comm_price;
                  goodsAttr.g_discount_price = mItem.i_discount_price;
                  goodsAttr.g_renew_price = mItem.i_renew_price;
                  goodsAttr.g_vip_price = mItem.i_vip_price;
                  goodsAttr.g_expirydate = mItem.i_expiry_date;
                  goodsAttr.g_buy_type = mItem.i_buy_type;
                  goodsAttr.g_used_count = mItem.i_used_count;
                  goodsAttr.g_is_visible = mItem.i_is_visible;
               }
               if(goodsAttr.g_discount_price > 0)
               {
                  if(!this.m_dictDiscount)
                  {
                     this.m_dictDiscount = new Dictionary();
                  }
                  this.m_dictDiscount[goodsAttr.CardID] = {
                     "iGoodsID":goodsAttr.CardID,
                     "iMinLevel":0,
                     "iMaxLevel":100,
                     "iHot":0,
                     "order":0
                  };
               }
               goodsAttr.arrItems = arrMarketItem;
               this.m_dictGoods[g_id] = goodsAttr;
            }
         }
      }
      
      public function a_2046(storeXML:XML) : void
      {
         var tuijianType:XML = null;
         var type:XML = null;
         var unionsType:XML = null;
         var szTuiJianLevel:String = null;
         var dictTuijianGoods:Dictionary = null;
         var tuijianGoods:XML = null;
         var iTJGoodsID:int = 0;
         var iTJHot:int = 0;
         var tuijian:Object = null;
         var id:int = 0;
         var dictGoods:Dictionary = null;
         var iGoods:XML = null;
         var iGoodsID:int = 0;
         var iHot:int = 0;
         var szLevel:String = null;
         var iMaxLevel:int = 0;
         var iMinLevel:int = 0;
         var Goods:Object = null;
         var arrLevels:Array = null;
         var Level:int = 0;
         var dictUnionsGoods:Dictionary = null;
         var iUnionGoods:XML = null;
         var iUGoodsID:int = 0;
         var iUHot:int = 0;
         var unionGoods:Object = null;
         if(storeXML != null)
         {
            this.a_1641 = new Dictionary();
            this.m_dictUnionStores = new Dictionary();
            this.m_dictTuiJian = new Dictionary();
            for each(tuijianType in storeXML.recommend.type)
            {
               szTuiJianLevel = tuijianType.@Level;
               dictTuijianGoods = new Dictionary();
               for each(tuijianGoods in tuijianType.goods)
               {
                  iTJGoodsID = int(tuijianGoods.@ID);
                  iTJHot = int(tuijianGoods.@hot);
                  tuijian = new Object();
                  tuijian.iMinLevel = 0;
                  tuijian.iMaxLevel = 40;
                  tuijian.iGoodsID = iTJGoodsID;
                  tuijian.iHot = iTJHot;
                  tuijian.order = Number(tuijianGoods.@order);
                  dictTuijianGoods[iTJGoodsID] = tuijian;
               }
               this.m_dictTuiJian[szTuiJianLevel] = dictTuijianGoods;
            }
            for each(type in storeXML.marketGoods.type)
            {
               id = int(type.@ID);
               dictGoods = new Dictionary();
               for each(iGoods in type.goods)
               {
                  iGoodsID = int(iGoods.@ID);
                  iHot = int(iGoods.@hot);
                  szLevel = iGoods.@Level;
                  iMaxLevel = 40;
                  iMinLevel = 0;
                  if(szLevel != null && szLevel != "")
                  {
                     arrLevels = szLevel.split("_");
                     iMinLevel = int(arrLevels[0]);
                     iMaxLevel = int(arrLevels[1]);
                  }
                  Goods = new Object();
                  Goods.iGoodsID = iGoodsID;
                  Goods.iMinLevel = iMinLevel;
                  Goods.iMaxLevel = iMaxLevel;
                  Goods.iHot = iHot;
                  Goods.order = Number(iGoods.@order);
                  dictGoods[iGoodsID] = Goods;
               }
               this.a_1641[id] = dictGoods;
            }
            for each(unionsType in storeXML.unions.type)
            {
               Level = int(unionsType.@Level);
               dictUnionsGoods = new Dictionary();
               for each(iUnionGoods in unionsType.goods)
               {
                  iUGoodsID = int(iUnionGoods.@ID);
                  iUHot = int(iUnionGoods.@hot);
                  unionGoods = new Object();
                  unionGoods.iGoodsID = iUGoodsID;
                  unionGoods.iHot = iUHot;
                  unionGoods.order = Number(iGoods.@order);
                  dictUnionsGoods[iUGoodsID] = unionGoods;
               }
               this.m_dictUnionStores[Level] = dictUnionsGoods;
            }
         }
      }
   }
}

