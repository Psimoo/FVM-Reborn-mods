package com.aurora.ui.maogoutd.newyearactivity.limit
{
   import a_4723.a_1767;
   import com.aurora.ui.maogoutd.ClientLog.MessageTipHandler;
   import com.aurora.ui.maogoutd.PayAward.AwardData;
   import com.aurora.ui.maogoutd.newyearactivity.limit.data.LimitAwardData;
   import com.aurora.ui.maogoutd.newyearactivity.limit.data.LimitData;
   import flash.utils.Dictionary;
   
   public class LimitRewardXML
   {
      
      private static var m_pInstance:LimitRewardXML;
      
      private var m_vLimitData:Vector.<LimitData>;
      
      private var m_dictPageLimitData:Dictionary;
      
      public var m_limitDataWaveNum:int;
      
      private var m_iLastTime:int;
      
      private var m_vTempLimitData:Vector.<LimitData>;
      
      public var m_limitStartTime:int;
      
      public var m_limitEndTime:int;
      
      private var m_dictTempPageLimitData:Dictionary;
      
      public var m_PopularityAwart:Array;
      
      public var m_PopularityMapExp:Array;
      
      public var m_PopStartTime:int;
      
      public var m_PopEndTime:int;
      
      public var m_ReceiveEndTime:int;
      
      public var m_PopHideDes:String;
      
      public var m_PopReceiveDes:String;
      
      public var m_popularityAndAwardReceiveDes:String = "";
      
      public var m_sActivityDes:String;
      
      public var m_sActivityTime:String;
      
      private var m_dictCheckConfig:Dictionary;
      
      public function LimitRewardXML()
      {
         super();
         this.m_vLimitData = new Vector.<LimitData>();
         this.m_iLastTime = 0;
         this.m_vTempLimitData = new Vector.<LimitData>();
         this.m_dictPageLimitData = new Dictionary();
         this.m_dictTempPageLimitData = new Dictionary();
      }
      
      public static function Get() : LimitRewardXML
      {
         if(null == m_pInstance)
         {
            m_pInstance = new LimitRewardXML();
         }
         return m_pInstance;
      }
      
      public function GetLimitData() : Vector.<LimitData>
      {
         if(a_1767.getInstance().SystemTime - this.m_iLastTime > 60 * 1000)
         {
            this.m_iLastTime = a_1767.getInstance().SystemTime;
            this.RefreshLimitData();
         }
         return this.m_vTempLimitData;
      }
      
      public function GetIsShowLimitBtn() : Boolean
      {
         for(var tWaveId:int = 1; tWaveId <= this.m_limitDataWaveNum; tWaveId++)
         {
            if(this.GetLimitDataByWaveId(tWaveId).length > 0)
            {
               return true;
            }
         }
         return false;
      }
      
      public function GetLimitDataWaveNum() : int
      {
         return this.m_limitDataWaveNum;
      }
      
      public function GetLimitDataByWaveId(waveId:int) : Vector.<LimitData>
      {
         if(a_1767.getInstance().SystemTime - this.m_iLastTime > 60 * 1000)
         {
            this.m_iLastTime = a_1767.getInstance().SystemTime;
            this.RefreshLimitData();
         }
         return this.m_dictTempPageLimitData[waveId];
      }
      
      private function RefreshLimitData() : void
      {
         this.m_dictCheckConfig = new Dictionary();
         this.m_vTempLimitData.length = 0;
         var i:int = 0;
         var len:int = int(this.m_vLimitData.length);
         while(i < len)
         {
            if(this.m_vLimitData[i].m_iStartTime < this.m_iLastTime && this.m_iLastTime < this.m_vLimitData[i].m_iEndTime)
            {
               if(this.m_dictCheckConfig[this.m_vLimitData[i].m_iID])
               {
                  MessageTipHandler.Get().a_3146("限时送礼的配置错误！！");
               }
               else
               {
                  this.m_vTempLimitData.push(this.m_vLimitData[i]);
                  this.m_dictCheckConfig[this.m_vLimitData[i].m_iID] = this.m_vLimitData[i];
               }
            }
            i++;
         }
         for(var tWaveId:int = 1; tWaveId <= this.m_limitDataWaveNum; tWaveId++)
         {
            this.refreshWaveLimitData(tWaveId);
         }
      }
      
      private function refreshWaveLimitData(waveId:int) : void
      {
         var dataList:Vector.<LimitData> = this.m_dictPageLimitData[waveId];
         var dataTempList:Vector.<LimitData> = this.m_dictTempPageLimitData[waveId];
         dataTempList.length = 0;
         this.m_dictCheckConfig = new Dictionary();
         var i:int = 0;
         var len:int = int(dataList.length);
         while(i < len)
         {
            if(dataList[i].m_iStartTime < this.m_iLastTime && this.m_iLastTime < dataList[i].m_iEndTime)
            {
               if(this.m_dictCheckConfig[dataList[i].m_iID])
               {
                  MessageTipHandler.Get().a_3146("限时送礼的配置错误！！");
               }
               else
               {
                  dataTempList.push(dataList[i]);
                  this.m_dictCheckConfig[dataList[i].m_iID] = dataList[i];
               }
            }
            i++;
         }
      }
      
      public function a_2040(xml:XML) : void
      {
         var data:LimitData = null;
         var item:XML = null;
         var step:XML = null;
         var award:XML = null;
         var stAwardData:AwardData = null;
         var waveId:int = 0;
         var lDataList:Vector.<LimitData> = null;
         var awardData:LimitAwardData = null;
         var vo:Object = null;
         var map:Object = null;
         var startTime:int = int(xml.limit_reward.@startTime);
         var endTime:int = int(xml.limit_reward.@endTime);
         this.m_limitStartTime = startTime;
         this.m_limitEndTime = endTime;
         this.m_sActivityDes = xml.limit_reward.@reddes;
         this.m_sActivityTime = xml.limit_reward.@stime;
         var totalWave:int = int(xml.limit_reward.@totalwave);
         this.m_limitDataWaveNum = totalWave;
         for each(item in xml.limit_reward.award)
         {
            waveId = int(item.@id);
            if(waveId <= totalWave)
            {
               lDataList = new Vector.<LimitData>();
               for each(step in item.step)
               {
                  data = new LimitData();
                  data.m_iID = step.@id;
                  data.m_waveId = waveId;
                  data.m_iNeedConsume = step.@needConsume;
                  data.m_iStartTime = startTime;
                  data.m_iEndTime = endTime;
                  data.m_vAward = new Vector.<LimitAwardData>();
                  for each(award in step.item)
                  {
                     awardData = new LimitAwardData();
                     awardData.m_iItemID = award.@itemid;
                     awardData.m_iNum = award.@num;
                     awardData.m_iLevel = award.@level;
                     awardData.m_iTime = award.@time;
                     awardData.m_iIsBand = award.@isBind;
                     awardData.m_iSex = award.@sex;
                     data.m_vAward.push(awardData);
                  }
                  if(waveId <= 1)
                  {
                     this.m_vLimitData.push(data);
                  }
                  lDataList.push(data);
               }
               this.m_dictPageLimitData[waveId] = lDataList;
               this.m_dictTempPageLimitData[waveId] = new Vector.<LimitData>();
            }
         }
         if(xml.Popularity.receiveTimeDes)
         {
            this.m_popularityAndAwardReceiveDes = xml.Popularity.receiveTimeDes[0].toString();
         }
         for each(step in xml.Popularity.award)
         {
            this.m_PopStartTime = int(step.@startTime);
            this.m_PopEndTime = int(step.@endTime);
            this.m_ReceiveEndTime = int(step.@popularityEndTime);
            this.m_PopHideDes = step.@hideDes.toString();
            this.m_PopReceiveDes = step.@hideDes0.toString();
         }
         this.m_PopularityAwart = new Array();
         for each(step in xml.Popularity.YearAward.level)
         {
            vo = new Object();
            vo.m_iID = step.@id;
            vo.m_iExp = step.@exp;
            vo.m_iAwardData = new Vector.<AwardData>();
            for each(award in step.item)
            {
               stAwardData = new AwardData();
               stAwardData.AnalysisXML(award);
               vo.m_iAwardData.push(stAwardData);
            }
            this.m_PopularityAwart.push(vo);
         }
         this.m_PopularityAwart.sortOn(["m_iID"],[Array.DESCENDING | Array.NUMERIC]);
         this.m_PopularityAwart.reverse();
         this.m_PopularityMapExp = new Array();
         for each(step in xml.Popularity.PopularityExp.item)
         {
            map = new Object();
            map.m_iID = step.@id;
            map.m_iExp = step.@exp;
            this.m_PopularityMapExp.push(map);
         }
      }
   }
}

