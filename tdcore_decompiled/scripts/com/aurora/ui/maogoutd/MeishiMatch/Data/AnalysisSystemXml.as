package com.aurora.ui.maogoutd.MeishiMatch.Data
{
   public class AnalysisSystemXml
   {
      
      private static var m_stAnalysisSystemXml:AnalysisSystemXml;
      
      public var m_SilenceStartTime:int;
      
      public var m_SilenceEndTime:int;
      
      public var m_SuspendStartTime:int;
      
      public var m_SuspendEndTime:int;
      
      public var m_RobotVerifyStartTime:int;
      
      public var m_RobotVerifyEndTime:int;
      
      public var m_RobotVerifyList:Array = new Array();
      
      public var m_RobotClientCreateRate:int = 0;
      
      public function AnalysisSystemXml()
      {
         super();
         if(m_stAnalysisSystemXml)
         {
            throw Error("RechargeActivityConfig 是单例模式 不能重复实例化！！！");
         }
      }
      
      public static function GetInstance() : AnalysisSystemXml
      {
         if(null == m_stAnalysisSystemXml)
         {
            m_stAnalysisSystemXml = new AnalysisSystemXml();
         }
         return m_stAnalysisSystemXml;
      }
      
      public function AnalysisTalkXML(stXML:XML) : void
      {
         var sOpen:Array = null;
         var i:int = 0;
         var data:XML = null;
         for each(data in stXML.Silence)
         {
            this.m_SilenceStartTime = data.@startTime;
            this.m_SilenceEndTime = data.@endTime;
         }
         for each(data in stXML.Suspend)
         {
            this.m_SuspendStartTime = data.@startTime;
            this.m_SuspendEndTime = data.@endTime;
         }
         for each(data in stXML.RobotVerify)
         {
            this.m_RobotVerifyStartTime = data.@startTime;
            this.m_RobotVerifyEndTime = data.@endTime;
            if(data.@openList)
            {
               sOpen = data.@openList.split("|");
               this.m_RobotVerifyList = new Array();
               for(i = 0; i < sOpen.length; i++)
               {
                  if(sOpen[i].length > 0)
                  {
                     this.m_RobotVerifyList.push(parseInt(sOpen[i]));
                  }
               }
            }
            if(data.@clientCreateRate)
            {
               this.m_RobotClientCreateRate = parseInt(data.@clientCreateRate);
            }
         }
      }
   }
}

