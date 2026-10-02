package com.aurora.ui.maogoutd.PayAward
{
   import com.aurora.ui.maogoutd.MicroClient.MicroClientXML;
   import com.aurora.ui.maogoutd.dailyrecharge.DailyRechageXML;
   import com.aurora.ui.maogoutd.dentityCard.DentityCardXMl;
   
   public class RechargeActivityConfig
   {
      
      private static var m_pInstance:RechargeActivityConfig;
      
      public var m_stFirstRechargeXML:FirstRechargeXML;
      
      public var m_stCumulativeRechargeXML:CumulativeRechargeXML;
      
      private var m_vHolidayExchangeXML:HolidayExchangeXML;
      
      private var m_vHolidayAccumulateXML:Vector.<HolidayRechargeXML>;
      
      private var m_vHolidaySingleXML:Vector.<HolidayRechargeXML>;
      
      private var m_vMonthCardXML:MonthCardXML;
      
      public function RechargeActivityConfig()
      {
         super();
         if(null != m_pInstance)
         {
            throw Error("RechargeActivityConfig 是单例模式 不能重复实例化！！！");
         }
         this.m_stFirstRechargeXML = new FirstRechargeXML();
         this.m_stCumulativeRechargeXML = new CumulativeRechargeXML();
         this.m_vHolidayExchangeXML = new HolidayExchangeXML();
         this.m_vHolidayAccumulateXML = new Vector.<HolidayRechargeXML>();
         this.m_vHolidaySingleXML = new Vector.<HolidayRechargeXML>();
         this.m_vMonthCardXML = new MonthCardXML();
      }
      
      public static function GetInstance() : RechargeActivityConfig
      {
         if(null == m_pInstance)
         {
            m_pInstance = new RechargeActivityConfig();
         }
         return m_pInstance;
      }
      
      public function AnalysisXML(stXML:XML) : void
      {
         var item:XML = null;
         var stHolidayRechargeXML:HolidayRechargeXML = null;
         var stHolidaySingleXML:HolidayRechargeXML = null;
         DailyRechageXML.GetInstance().a_2040(stXML);
         DentityCardXMl.GetInstance().a_2040(stXML);
         MicroClientXML.GetInstance().a_2040(stXML);
         this.m_stFirstRechargeXML.AnalysisXML(stXML.FirstRechargeActivity[0]);
         this.m_stCumulativeRechargeXML.AnalysisXML(stXML.CumulativeRechargeActivity[0]);
         this.m_vHolidayExchangeXML.AnalysisXML(stXML.HolidayExchange[0]);
         this.m_vMonthCardXML.AnalysisXML(stXML.MonthCard[0]);
         this.m_vHolidayAccumulateXML.length = 0;
         for each(item in stXML.HolidayRechargeActivity)
         {
            stHolidayRechargeXML = new HolidayRechargeXML();
            stHolidayRechargeXML.AnalysisXML(item);
            this.m_vHolidayAccumulateXML.push(stHolidayRechargeXML);
         }
         this.m_vHolidaySingleXML.length = 0;
         for each(item in stXML.HoliSingleRechargeActivity)
         {
            stHolidaySingleXML = new HolidayRechargeXML();
            stHolidaySingleXML.AnalysisXML(item);
            this.m_vHolidaySingleXML.push(stHolidaySingleXML);
         }
      }
      
      public function GetHolidaySingleXML(iStampTime:int) : HolidayRechargeXML
      {
         return this.GetHolidayRechargeXML(iStampTime,this.m_vHolidaySingleXML);
      }
      
      public function GetHolidayAccumulateXML(iStampTime:int) : HolidayRechargeXML
      {
         return this.GetHolidayRechargeXML(iStampTime,this.m_vHolidayAccumulateXML);
      }
      
      public function GetHolidayExchangeXML() : HolidayExchangeXML
      {
         return this.m_vHolidayExchangeXML;
      }
      
      public function GetMonthCardXML() : MonthCardXML
      {
         return this.m_vMonthCardXML;
      }
      
      private function GetHolidayRechargeXML(iStampTime:int, vHolidayXML:Vector.<HolidayRechargeXML>) : HolidayRechargeXML
      {
         var stHolidayRechargeXML:HolidayRechargeXML = null;
         var i:int = 0;
         var iLen:int = int(vHolidayXML.length);
         while(i < iLen)
         {
            stHolidayRechargeXML = vHolidayXML[i];
            if(iStampTime >= stHolidayRechargeXML.m_iStartTime && iStampTime <= stHolidayRechargeXML.m_iEndTime)
            {
               break;
            }
            i++;
         }
         return stHolidayRechargeXML;
      }
   }
}

