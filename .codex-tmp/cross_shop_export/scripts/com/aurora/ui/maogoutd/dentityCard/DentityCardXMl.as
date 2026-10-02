package com.aurora.ui.maogoutd.dentityCard
{
   import com.aurora.ui.maogoutd.dailyrecharge.GoodsVO;
   
   public class DentityCardXMl
   {
      
      private static var _instance:DentityCardXMl;
      
      public var dataVec:Vector.<GoodsVO> = new Vector.<GoodsVO>();
      
      public function DentityCardXMl()
      {
         super();
      }
      
      public static function GetInstance() : DentityCardXMl
      {
         if(!_instance)
         {
            _instance = new DentityCardXMl();
         }
         return _instance;
      }
      
      public function a_2040(xml:XML) : void
      {
         var item:XML = null;
         var goods:GoodsVO = null;
         for each(item in xml.dentityCard_award.item)
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

