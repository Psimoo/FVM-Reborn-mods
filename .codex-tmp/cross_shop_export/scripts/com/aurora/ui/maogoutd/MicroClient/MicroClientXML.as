package com.aurora.ui.maogoutd.MicroClient
{
   import com.aurora.ui.maogoutd.dailyrecharge.GoodsVO;
   
   public class MicroClientXML
   {
      
      private static var _instance:MicroClientXML;
      
      public var dataVec:Vector.<GoodsVO> = new Vector.<GoodsVO>();
      
      public function MicroClientXML()
      {
         super();
      }
      
      public static function GetInstance() : MicroClientXML
      {
         if(!_instance)
         {
            _instance = new MicroClientXML();
         }
         return _instance;
      }
      
      public function a_2040(xml:XML) : void
      {
         var item:XML = null;
         var goods:GoodsVO = null;
         for each(item in xml.MicroClient_award.item)
         {
            goods = new GoodsVO();
            goods.itemID = item.@itemID;
            goods.level = item.@level;
            goods.num = item.@num;
            goods.time = item.@time;
            goods.isBind = item.@isBind;
            goods.sex = item.@sex;
            this.dataVec.push(goods);
         }
      }
   }
}

