package com.aurora.ui.maogoutd.PayAward
{
   public class PayAwardConfig
   {
      
      private static var m_pInstance:PayAwardConfig = new PayAwardConfig();
      
      private var m_vDailyPay:Vector.<PayAwardStruct>;
      
      private var m_vTotalPay:Vector.<PayAwardStruct>;
      
      public function PayAwardConfig()
      {
         super();
         this.m_vDailyPay = new Vector.<PayAwardStruct>();
         this.m_vTotalPay = new Vector.<PayAwardStruct>();
      }
      
      public static function Get() : PayAwardConfig
      {
         return m_pInstance;
      }
      
      public function AnalyConfig(xml:XML) : void
      {
         var stPayAwardStruct:PayAwardStruct = null;
         var stPayElementStruct:PayAwardElementStruct = null;
         var stAward:XML = null;
         var stElement:XML = null;
         if(!xml)
         {
            return;
         }
         for each(stAward in xml.daily_pay.award)
         {
            stPayAwardStruct = new PayAwardStruct();
            stPayAwardStruct.m_iLevel = stAward.@level;
            stPayAwardStruct.m_iAmount = stAward.@amount;
            stPayAwardStruct.m_szDesc = stAward.@desc;
            stPayAwardStruct.m_szPic = stAward.@pic;
            for each(stElement in stAward.element)
            {
               stPayElementStruct = new PayAwardElementStruct();
               stPayElementStruct.m_iAwardID = stElement.@id;
               stPayElementStruct.m_iCount = stElement.@count;
               stPayElementStruct.m_iStar = stElement.@level;
               stPayAwardStruct.m_vAward.push(stPayElementStruct);
            }
            this.m_vDailyPay.push(stPayAwardStruct);
         }
         for each(stAward in xml.total_pay.award)
         {
            stPayAwardStruct = new PayAwardStruct();
            stPayAwardStruct.m_iLevel = stAward.@level;
            stPayAwardStruct.m_iAmount = stAward.@amount;
            stPayAwardStruct.m_szDesc = stAward.@desc;
            stPayAwardStruct.m_szPic = stAward.@pic;
            for each(stElement in stAward.element)
            {
               stPayElementStruct = new PayAwardElementStruct();
               stPayElementStruct.m_iAwardID = stElement.@id;
               stPayElementStruct.m_iCount = stElement.@count;
               stPayElementStruct.m_iStar = stElement.@level;
               stPayElementStruct.m_isBind = stElement.@isBind;
               stPayElementStruct.m_iTime = stElement.@time;
               stPayAwardStruct.m_vAward.push(stPayElementStruct);
            }
            this.m_vTotalPay.push(stPayAwardStruct);
         }
      }
      
      public function GetTotalPayCountLevel() : int
      {
         return this.m_vTotalPay.length;
      }
      
      public function GetDailyPayAward(iLevel:int) : PayAwardStruct
      {
         for(var i:int = 0; i < this.m_vDailyPay.length; i++)
         {
            if(this.m_vDailyPay[i].m_iLevel == iLevel)
            {
               return this.m_vDailyPay[i];
            }
         }
         return null;
      }
      
      public function GetTotalPayAward(iLevel:int) : PayAwardStruct
      {
         for(var i:int = 0; i < this.m_vTotalPay.length; i++)
         {
            if(this.m_vTotalPay[i].m_iLevel == iLevel)
            {
               return this.m_vTotalPay[i];
            }
         }
         return null;
      }
   }
}

