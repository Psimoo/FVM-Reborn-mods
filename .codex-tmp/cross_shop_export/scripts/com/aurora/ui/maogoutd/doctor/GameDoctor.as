package com.aurora.ui.maogoutd.doctor
{
   import flash.events.SecurityErrorEvent;
   import flash.events.StatusEvent;
   import flash.net.LocalConnection;
   import flash.net.SharedObject;
   
   public class GameDoctor
   {
      
      private static var _instance:GameDoctor;
      
      public static const FILE_LOADING:String = "DocLoading";
      
      public static const FILE_LOADCOMPLETE:String = "DocLoadComplete";
      
      public static const FILE_CHECK:String = "DocCheck";
      
      public static const FILE_LOADERROR:String = "DocLoadError";
      
      private var rconn:LocalConnection;
      
      private var conn:LocalConnection;
      
      public var loadDoctorCache:Object;
      
      public var connDoctorStatusCache:Array;
      
      public var isDoctorOpen:Boolean;
      
      public var hasRevMsg:Boolean;
      
      private var thisDoctorID:Number = 0;
      
      private var rIDObj:SharedObject;
      
      public function GameDoctor()
      {
         super();
         this.hasRevMsg = false;
         this.loadDoctorCache = new Object();
         this.connDoctorStatusCache = new Array();
         this.initConn();
      }
      
      public static function get instance() : GameDoctor
      {
         if(_instance == null)
         {
            _instance = new GameDoctor();
         }
         return _instance;
      }
      
      private function initConn() : void
      {
         this.conn = new LocalConnection();
         this.conn.allowDomain("*");
         this.conn.allowInsecureDomain("*");
         this.conn.client = this;
         this.rIDObj = SharedObject.getLocal("randomIDObj","/");
         this.rIDObj.data.connectionID = ConnectionRandomNumber.instance.randomID;
         this.rIDObj.flush();
         try
         {
            this.conn.connect("_noticeDoctorConnection" + this.rIDObj.data.connectionID);
         }
         catch(e:Error)
         {
         }
      }
      
      public function pushInCache(tObj:Object, showStr:String, hideStr:String, extInfo:Object) : void
      {
         var typeStr:String = null;
         var str:String = tObj.type as String;
         if(!this.isDoctorOpen)
         {
            switch(str.charAt(0))
            {
               case "l":
                  this.loadDoctorCache[showStr] = {
                     "id":showStr,
                     "hStr":hideStr,
                     "isCompleted":tObj.isCompleted,
                     "eInfo":extInfo
                  };
                  break;
               case "c":
                  typeStr = str.charAt(1);
                  this.connDoctorStatusCache.push({
                     "type":typeStr,
                     "id":showStr,
                     "hStr":hideStr,
                     "eInfo":extInfo
                  });
            }
         }
         else
         {
            switch(str.charAt(0))
            {
               case "l":
                  this.loadDoctorCache[showStr] = {
                     "id":showStr,
                     "hStr":hideStr,
                     "isCompleted":tObj.isCompleted,
                     "eInfo":extInfo
                  };
                  this.rconn.send("_debugDoctorConnection" + this.rIDObj.data.connectionID,"transTwoObject",{
                     "id":showStr,
                     "hStr":hideStr,
                     "isCompleted":tObj.isCompleted,
                     "eInfo":extInfo
                  });
                  break;
               case "c":
                  typeStr = str.charAt(1);
                  this.connDoctorStatusCache.push({
                     "type":typeStr,
                     "id":showStr,
                     "hStr":hideStr,
                     "eInfo":extInfo
                  });
                  this.rconn.send("_debugDoctorConnection" + this.rIDObj.data.connectionID,"transTwoObject",{
                     "type":typeStr,
                     "id":showStr,
                     "hStr":hideStr,
                     "eInfo":extInfo
                  });
            }
         }
      }
      
      public function noticeHandler(ranNum:Number) : void
      {
         if(ranNum != this.thisDoctorID)
         {
            this.hasRevMsg = false;
            this.thisDoctorID = ranNum;
         }
         if(!this.hasRevMsg)
         {
            this.hasRevMsg = true;
            if(this.rconn == null)
            {
               this.rconn = new LocalConnection();
               this.rconn.addEventListener(StatusEvent.STATUS,this.onGameDoctorStatus);
               this.rconn.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onSecError);
            }
            this.rconn.send("_debugDoctorConnection" + this.rIDObj.data.connectionID,"stopNotice");
         }
      }
      
      public function noticeCloseHandler() : void
      {
         this.isDoctorOpen = false;
         this.hasRevMsg = false;
      }
      
      public function hasStopNotice() : void
      {
         var key:String = null;
         var item:Object = null;
         for(key in this.loadDoctorCache)
         {
            this.rconn.send("_debugDoctorConnection" + this.rIDObj.data.connectionID,"transTwoObject",this.loadDoctorCache[key]);
         }
         for each(item in this.connDoctorStatusCache)
         {
            this.rconn.send("_debugDoctorConnection" + this.rIDObj.data.connectionID,"transTwoObject",item);
         }
         this.isDoctorOpen = true;
      }
      
      private function onGameDoctorStatus(e:StatusEvent) : void
      {
      }
      
      private function onSecError(e:SecurityErrorEvent) : void
      {
      }
   }
}

