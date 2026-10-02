package a_4752
{
   import com.aurora.ui.maogoutd.scoreshop.ScoreShopStruct;
   
   public class ScoreShopAnalyze
   {
      
      private static var instance:ScoreShopAnalyze;
      
      public var m_iGroup:int;
      
      public var m_strDesc:String;
      
      public var m_vMysteryData:Vector.<Vector.<ScoreShopStruct>>;
      
      public var m_vBlackData:Vector.<Vector.<ScoreShopStruct>>;
      
      public function ScoreShopAnalyze()
      {
         super();
         this.m_vMysteryData = new Vector.<Vector.<ScoreShopStruct>>();
         this.m_vBlackData = new Vector.<Vector.<ScoreShopStruct>>();
      }
      
      public static function getinstance() : ScoreShopAnalyze
      {
         if(!instance)
         {
            instance = new ScoreShopAnalyze();
         }
         return instance;
      }
      
      public function ParseScoreShopXML(xml:XML) : void
      {
         var descList:XMLList = null;
         var mitem:XML = null;
         var bitem:XML = null;
         var minfo:ScoreShopStruct = null;
         var binfo:ScoreShopStruct = null;
         if(xml != null)
         {
            descList = xml.describe;
            this.m_strDesc = descList[0].toString();
            for each(mitem in xml.mysteryshop.item)
            {
               minfo = new ScoreShopStruct();
               minfo.m_iItemID = mitem.@id;
               minfo.m_iScoreNum = mitem.@num;
               minfo.m_iGroup = mitem.@group;
               minfo.m_iTime = mitem.@time;
               minfo.m_iDiscount = mitem.@discount;
               minfo.m_iShopType = 1;
               minfo.m_iBind = mitem.@isBind;
               while(this.m_vMysteryData.length < minfo.m_iGroup)
               {
                  this.m_vMysteryData.push(new Vector.<ScoreShopStruct>());
               }
               this.m_vMysteryData[minfo.m_iGroup - 1].push(minfo);
            }
            for each(bitem in xml.blackshop.item)
            {
               binfo = new ScoreShopStruct();
               binfo.m_iItemID = bitem.@id;
               binfo.m_iScoreNum = bitem.@num;
               binfo.m_iGroup = bitem.@group;
               binfo.m_iTime = bitem.@time;
               binfo.m_iDiscount = bitem.@discount;
               binfo.m_iShopType = 2;
               while(this.m_vBlackData.length < binfo.m_iGroup)
               {
                  this.m_vBlackData.push(new Vector.<ScoreShopStruct>());
               }
               this.m_vBlackData[binfo.m_iGroup - 1].push(binfo);
            }
         }
      }
   }
}

