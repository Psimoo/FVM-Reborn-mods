package com.aurora.ui.maogoutd.dailyrecharge
{
   import a_4723.a_1767;
   
   public class DailyRechageXML
   {
      
      private static var _instance:DailyRechageXML;
      
      public var dataVec:Vector.<DailyVO> = new Vector.<DailyVO>();
      
      public function DailyRechageXML()
      {
         super();
      }
      
      public static function GetInstance() : DailyRechageXML
      {
         if(!_instance)
         {
            _instance = new DailyRechageXML();
         }
         return _instance;
      }
      
      public function a_2040(xml:XML) : void
      {
         var child:XML = null;
         var dy:DailyVO = null;
         var step:XML = null;
         var gl:GoodsListVO = null;
         var item:XML = null;
         var goods:GoodsVO = null;
         for each(child in xml.daily_pay)
         {
            dy = new DailyVO();
            dy.id = child.@id;
            dy.startday = child.@startday;
            dy.endday = child.@endday;
            for each(step in child.step)
            {
               gl = new GoodsListVO();
               gl.posID = step.@posID;
               gl.rechargePoint = step.@rechargePoint;
               for each(item in step.item)
               {
                  goods = new GoodsVO();
                  goods.itemID = item.@itemID;
                  goods.level = item.@level;
                  goods.num = item.@num;
                  goods.time = item.@time;
                  goods.isBind = item.@isBind;
                  goods.sex = item.@sex;
                  gl.goodsList.push(goods);
               }
               dy.childList.push(gl);
            }
            this.dataVec.push(dy);
         }
      }
      
      public function GetDailyPayAward() : DailyVO
      {
         var vo:DailyVO = null;
         var data:DailyVO = null;
         var m_iServerTime:int = a_1767.getInstance().SystemTime;
         var m_stDate:Date = new Date(m_iServerTime * 1000);
         var m_iCurrentMonth:int = m_stDate.month + 1;
         var m_iCurrentDay:int = m_stDate.fullYear * 10000 + m_iCurrentMonth * 100 + m_stDate.date;
         for(var i:int = 0; i < this.dataVec.length; i++)
         {
            vo = this.dataVec[i] as DailyVO;
            if(vo.startday <= m_iCurrentDay && vo.endday >= m_iCurrentDay)
            {
               return this.dataVec[i];
            }
         }
         for(var j:int = 0; j < this.dataVec.length; j++)
         {
            data = this.dataVec[j] as DailyVO;
            if(data.startday == 0 && data.endday == 0)
            {
               return this.dataVec[j];
            }
         }
         return null;
      }
   }
}

