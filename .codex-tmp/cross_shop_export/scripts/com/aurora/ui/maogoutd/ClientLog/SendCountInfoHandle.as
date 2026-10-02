package com.aurora.ui.maogoutd.ClientLog
{
   import com.adobe.crypto.MD5;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   
   public class SendCountInfoHandle
   {
      
      private static var m_iInstance:SendCountInfoHandle;
      
      private static const m_stURL:String = "http://td.joyyou.123u.com/stat_player.php";
      
      public var m_bIsFristPlay:Boolean = false;
      
      public var m_fStartTime:Number;
      
      public var m_stURLVariables:URLVariables;
      
      private var m_dictLog:Dictionary;
      
      private var encryption_key:String;
      
      public function SendCountInfoHandle()
      {
         super();
         this.m_stURLVariables = new URLVariables();
         this.m_dictLog = new Dictionary();
         this.m_fStartTime = getTimer();
      }
      
      public static function Get() : SendCountInfoHandle
      {
         return m_iInstance = m_iInstance || new SendCountInfoHandle();
      }
      
      public function set uin(value:int) : void
      {
         this.m_stURLVariables.role_uin = value;
      }
      
      public function set UserID(id:String) : void
      {
         this.m_stURLVariables.sig_user = id;
      }
      
      public function set SiteType(id:String) : void
      {
         this.m_stURLVariables.sitetype = id;
      }
      
      public function set GroupID(id:int) : void
      {
         this.m_stURLVariables.group_id = id;
      }
      
      public function SendLog(value_id:int) : void
      {
         if(!this.m_bIsFristPlay)
         {
            return;
         }
         if(null != this.m_dictLog[value_id])
         {
            return;
         }
         this.m_dictLog[value_id] = true;
         var m_uURLRequest:URLRequest = new URLRequest();
         m_uURLRequest.method = URLRequestMethod.GET;
         trace("send count request :" + value_id);
         m_uURLRequest.url = m_stURL;
         this.encryption_key = "3e7d5da21ef8d8813b43bfa7eb72c1c8";
         this.m_stURLVariables.time = (getTimer() - this.m_fStartTime) / 1000 >> 0;
         this.m_stURLVariables.stepid = value_id;
         this.m_stURLVariables.sign = MD5.hash(this.m_stURLVariables.time + this.encryption_key);
         m_uURLRequest.data = this.m_stURLVariables;
         var m_lURLLoader:URLLoader = new URLLoader();
         m_lURLLoader.load(m_uURLRequest);
      }
   }
}

