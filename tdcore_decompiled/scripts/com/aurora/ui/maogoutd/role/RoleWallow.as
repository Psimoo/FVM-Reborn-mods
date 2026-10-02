package com.aurora.ui.maogoutd.role
{
   import a_4789.a_4657;
   import flash.utils.Dictionary;
   import flash.utils.setInterval;
   import flash.utils.setTimeout;
   
   public class RoleWallow
   {
      
      private static var instance:RoleWallow;
      
      private static const SET_INTERVAL:int = 60;
      
      private var m_dictTipMsg:Dictionary;
      
      private var id:int;
      
      private var a_1233:int;
      
      private var m_iCumulativeOffLine:int;
      
      private var m_iTimestamp:int;
      
      private var m_iDealTime:int;
      
      private var m_iFcm:int;
      
      private var m_bIsAddSetInterval:Boolean = false;
      
      private var m_iLastHours:int = -1;
      
      public function RoleWallow()
      {
         super();
         this.m_iDealTime = 0;
         this.m_dictTipMsg = new Dictionary();
         this.m_dictTipMsg[0] = {
            "msg":"抵制不良游戏 拒绝盗版游戏 注意自我保护 谨防受骗上当 适度游戏益脑 沉迷游戏伤身 合理安排时间 享受健康生活",
            "dealTime":60,
            "startTime":0,
            "endTime":0
         };
         this.m_dictTipMsg[1] = {
            "msg":"[防沉迷]您累计在线时间已满1小时,请您在2个小时后下线休息",
            "dealTime":3600,
            "startTime":0,
            "endTime":1
         };
         this.m_dictTipMsg[2] = {
            "msg":"[防沉迷]您累计在线时间已满2小时,请您在1个小时后下线休息",
            "dealTime":3600,
            "startTime":1,
            "endTime":2
         };
         this.m_dictTipMsg[3] = {
            "msg":"您的累计在线时间已满3小时,您的游戏收益将降为正常值的50％,请您下线休息，做适当身体活动",
            "dealTime":3600,
            "startTime":2,
            "endTime":3
         };
         this.m_dictTipMsg[4] = {
            "msg":"您已经进入疲劳游戏时间，您的游戏收益将降为正常值的50％，为了您的健康，请尽快下线休息，做适当身体活动，合理安排学习生活",
            "dealTime":1800,
            "startTime":3,
            "endTime":4
         };
         this.m_dictTipMsg[5] = {
            "msg":"您已进入不健康游戏时间，为了您的健康，请您立即下线休息。如不下线，您的身体将受到损害，您的收益已降为零，直到您的累计下线时间满5小时后，才能恢复正常。",
            "dealTime":900,
            "startTime":4,
            "endTime":24
         };
      }
      
      public static function getInstance() : RoleWallow
      {
         if(instance == null)
         {
            instance = new RoleWallow();
         }
         return instance;
      }
      
      public function setPlayerHealthData(iCumulativeOnLine:int, iCumulativeOffLine:int, iTimestamp:int) : void
      {
         this.m_iCumulativeOffLine = iCumulativeOffLine;
         this.a_1233 = iCumulativeOnLine;
         this.m_iTimestamp = iTimestamp;
         if((iCumulativeOffLine - 10) / 3600 >= 5)
         {
            this.a_1233 = 0;
         }
         this.dealWallow();
         if(!this.m_bIsAddSetInterval)
         {
            this.m_bIsAddSetInterval = true;
            this.id = setInterval(this.onSetOnLineTime,SET_INTERVAL * 1000);
         }
      }
      
      private function onSetOnLineTime() : void
      {
         this.m_iDealTime += SET_INTERVAL;
         this.a_1233 += SET_INTERVAL;
         trace("m_iCumulativeOnLine=" + this.a_1233);
         this.dealWallow();
      }
      
      public function set fcmValue(iValue:int) : void
      {
         this.m_iFcm = iValue;
      }
      
      public function isNotHealthTime() : Boolean
      {
         if(this.m_iFcm != 0 && this.a_1233 >= 3600 * 3)
         {
            return true;
         }
         return false;
      }
      
      public function dealWallow() : void
      {
         var iOnLineHours:int;
         var msgObj:Object = null;
         var obj:Object = null;
         var startTime:int = 0;
         var endTime:int = 0;
         var id:int = 0;
         msgObj = this.m_dictTipMsg[0];
         var fCalOnLine:Number = this.a_1233 - 50;
         if(fCalOnLine < 0)
         {
            fCalOnLine = 0;
         }
         iOnLineHours = int(fCalOnLine / 3600);
         for each(obj in this.m_dictTipMsg)
         {
            startTime = int(obj.startTime);
            endTime = int(obj.endTime);
            if(startTime < iOnLineHours && iOnLineHours <= endTime)
            {
               msgObj = obj;
            }
         }
         if(this.m_iLastHours != iOnLineHours || msgObj.endTime > 0 && this.m_iDealTime > msgObj.dealTime)
         {
            id = int(setTimeout(function():*
            {
               a_4657.getInstance().execute("onDealWallow",this,msgObj);
            },1000));
            trace("m_iDealTime=" + this.m_iDealTime);
            this.m_iDealTime = 0;
            this.m_iLastHours = iOnLineHours;
         }
      }
   }
}

