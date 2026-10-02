package a_4752
{
   import com.aurora.ui.maogoutd.choujiang.CardInfoStruct;
   import com.aurora.ui.maogoutd.choujiang.ChoujiangDiscount;
   import com.aurora.ui.maogoutd.choujiang.ExchangeInfoStruct;
   import com.aurora.ui.maogoutd.exchange.LuckInfoStruct;
   import flash.utils.Dictionary;
   
   public class ZhencangAnalyze
   {
      
      private static var instance:ZhencangAnalyze;
      
      public var m_arrNeed:Array;
      
      public var m_arrAwards:Array;
      
      public var m_vExchangeInfo:Vector.<ExchangeInfoStruct>;
      
      public var m_vStarShopInfo:Vector.<ExchangeInfoStruct>;
      
      public var m_dictDecompose:Dictionary;
      
      public var m_vLuckInfo:Vector.<LuckInfoStruct>;
      
      public var m_iSwitch:int;
      
      public var m_iStarPieceSwitch:int;
      
      public var m_iSinglePrice:int;
      
      public var m_iEightPrice:int;
      
      public var m_arrSend:Array;
      
      public var m_vDiscount:Vector.<ChoujiangDiscount>;
      
      public function ZhencangAnalyze()
      {
         super();
         this.m_arrNeed = new Array();
         this.m_arrAwards = new Array();
         this.m_vExchangeInfo = new Vector.<ExchangeInfoStruct>();
         this.m_vStarShopInfo = new Vector.<ExchangeInfoStruct>();
         this.m_dictDecompose = new Dictionary();
         this.m_vLuckInfo = new Vector.<LuckInfoStruct>();
         this.m_vDiscount = new Vector.<ChoujiangDiscount>();
      }
      
      public static function getInstance() : ZhencangAnalyze
      {
         if(!instance)
         {
            instance = new ZhencangAnalyze();
         }
         return instance;
      }
      
      public function ParseZhencangXML(xml:XML) : void
      {
         var discount:XML = null;
         var award:XML = null;
         var exchange:XML = null;
         var decompose:XML = null;
         var buff:XML = null;
         var exchangeswitch:XML = null;
         var starpieceswitch:XML = null;
         var staritem:XML = null;
         var stDiscount:ChoujiangDiscount = null;
         var id:int = 0;
         var need:int = 0;
         var vAwards:Vector.<CardInfoStruct> = null;
         var item:XML = null;
         var cardinfo:CardInfoStruct = null;
         var stExchangeInfo:ExchangeInfoStruct = null;
         var decomposeinfo:ExchangeInfoStruct = null;
         var luckinfo:LuckInfoStruct = null;
         var stItemInfo:ExchangeInfoStruct = null;
         if(xml != null)
         {
            this.m_iSinglePrice = xml.price.@price;
            this.m_iEightPrice = xml.price.@price_8;
            for each(discount in xml.price.discount)
            {
               stDiscount = new ChoujiangDiscount();
               stDiscount.m_iID = discount.@id;
               stDiscount.m_iStartTime = discount.@startTime;
               stDiscount.m_iEndTime = discount.@endTime;
               stDiscount.m_iValue = discount.@value;
               this.m_vDiscount.push(stDiscount);
            }
            for each(award in xml.awards.award)
            {
               id = int(award.@id);
               need = int(award.@need);
               this.m_arrNeed.push(need);
               vAwards = new Vector.<CardInfoStruct>();
               for each(item in award.item)
               {
                  cardinfo = new CardInfoStruct();
                  cardinfo.m_iItemID = item.@id;
                  cardinfo.m_iAttr = item.@attr;
                  cardinfo.m_iNum = item.@num;
                  cardinfo.m_iBind = item.@isBind;
                  cardinfo.m_iTime = item.@time;
                  vAwards.push(cardinfo);
               }
               this.m_arrAwards.push(vAwards);
            }
            for each(exchange in xml.exchange.item)
            {
               stExchangeInfo = new ExchangeInfoStruct();
               stExchangeInfo.m_iCardID = exchange.@id;
               stExchangeInfo.m_iFragmentNum = exchange.@num;
               stExchangeInfo.m_iCardType = exchange.@type;
               stExchangeInfo.m_iTime = exchange.@time;
               stExchangeInfo.m_isBind = exchange.@isBind;
               this.m_vExchangeInfo.push(stExchangeInfo);
            }
            for each(decompose in xml.decompose.item)
            {
               decomposeinfo = new ExchangeInfoStruct();
               decomposeinfo.m_iCardID = decompose.@id;
               decomposeinfo.m_iFragmentNum = decompose.@num;
               decomposeinfo.m_iCardType = decompose.@type;
               stExchangeInfo.m_iTime = exchange.@time;
               stExchangeInfo.m_isBind = exchange.@isBind;
               this.m_dictDecompose[decomposeinfo.m_iCardID] = decomposeinfo;
            }
            for each(buff in xml.luckbuff.buff)
            {
               luckinfo = new LuckInfoStruct();
               luckinfo.id = buff.@id;
               luckinfo.addition = buff.@addition;
               this.m_vLuckInfo.push(luckinfo);
            }
            for each(exchangeswitch in xml.exchangeswitch)
            {
               this.m_iSwitch = exchangeswitch.@open;
            }
            for each(starpieceswitch in xml.starpieceswitch)
            {
               this.m_iStarPieceSwitch = starpieceswitch.@open;
            }
            for each(staritem in xml.starpieceshop.item)
            {
               stItemInfo = new ExchangeInfoStruct();
               stItemInfo.m_iCardID = staritem.@id;
               stItemInfo.m_iFragmentNum = staritem.@num;
               stItemInfo.m_iCardType = staritem.@type;
               stItemInfo.m_iTime = staritem.@time;
               stItemInfo.m_isBind = staritem.@isBind;
               this.m_vStarShopInfo.push(stItemInfo);
            }
            this.m_arrSend = [];
            for each(staritem in xml.send.element)
            {
               this.m_arrSend.push(int(staritem.@itemid));
            }
         }
      }
   }
}

