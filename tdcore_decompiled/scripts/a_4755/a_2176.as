package a_4755
{
   import a_4754.a_2161;
   import a_4782.a_4641;
   import a_4788.MyURLStream;
   import a_4789.AS2JSBridge;
   import com.adobe.serialization.json.JSON;
   import flash.utils.ByteArray;
   
   internal class a_2176 implements ITDGamePay
   {
      
      private var listener:Object;
      
      private var callbackFunction:String;
      
      private var loader:MyURLStream;
      
      private var isRuning:Boolean;
      
      public function a_2176()
      {
         super();
      }
      
      public function payRequest(pay_params:Object) : void
      {
         if(this.loader == null)
         {
            this.loader = new MyURLStream();
         }
         if(this.isRuning)
         {
            return;
         }
         this.isRuning = true;
         this.listener = pay_params.listener;
         this.callbackFunction = pay_params.callbackFunction;
         if(!this.loader.hasEventListener(a_4641.a_1124))
         {
            this.loader.addEventListener(a_4641.a_1124,this.loadCompleteHandler);
            this.loader.addEventListener(a_4641.LOAD_ERROR,this.loadErrorHandler);
         }
         var params:Object = {};
         params.signature = pay_params.signature;
         params.original_uin = pay_params.original_uin;
         params.group_id = pay_params.group_id;
         params.usr_exp = pay_params.usr_exp;
         params.open_id = pay_params.open_id;
         params.open_key = pay_params.open_key;
         var enterRoom:Object = a_2161.e.getEnterRoom();
         params.sitetype = enterRoom.m_iSiteType;
         params.pfkey = pay_params.pfkey;
         params.pf = pay_params.pf;
         params.value = pay_params.value;
         var url:String = pay_params.pay_cgi;
         if(url.indexOf("?") == -1)
         {
            url += "?r=" + Math.random();
         }
         else
         {
            url += "&r=" + Math.random();
         }
         this.loader.load(url,params);
      }
      
      private function loadCompleteHandler(a_4730:a_4641) : void
      {
         this.loader.removeEventListener(a_4641.a_1124,this.loadCompleteHandler);
         this.loader.removeEventListener(a_4641.LOAD_ERROR,this.loadErrorHandler);
         trace("PayManager::loadCompleteHandler>>支付请求返回！");
         var ba:ByteArray = a_4730.value as ByteArray;
         var data:* = this.parseJsonData(ba);
         if(data == null)
         {
            trace("PayManager::loadCompleteHandler>>JSON 解析失败！");
            data = {
               "ret":-1,
               "msg":"JSON 解析失败！"
            };
         }
         else if(data.ret * 1 != 0)
         {
            trace("PayManager::loadCompleteHandler>>支付失败(" + data.msg + ")");
         }
         else
         {
            trace("PayManager::loadCompleteHandler>>调用外部支付JS接口pay_to_game(" + data.url_params + ")");
            AS2JSBridge.callFunction("pay_to_game",data.url_params);
         }
         if(this.listener != null && this.callbackFunction != null)
         {
            if(this.listener.hasOwnProperty(this.callbackFunction))
            {
               this.listener[this.callbackFunction].apply(this,[data]);
            }
         }
         this.isRuning = false;
      }
      
      private function loadErrorHandler(a_4730:a_4641) : void
      {
         this.loader.removeEventListener(a_4641.a_1124,this.loadCompleteHandler);
         this.loader.removeEventListener(a_4641.LOAD_ERROR,this.loadErrorHandler);
         trace("PayManager::loadErrorHandler>>支付请求连接失败！");
         var data:Object = {
            "ret":-1,
            "msg":"支付请求连接失败！"
         };
         if(this.listener != null && this.callbackFunction != null)
         {
            if(this.listener.hasOwnProperty(this.callbackFunction))
            {
               this.listener[this.callbackFunction].apply(this,[data]);
            }
         }
         this.isRuning = false;
      }
      
      private function parseJsonData(orgData:ByteArray) : *
      {
         if(orgData == null)
         {
            return null;
         }
         orgData.position = 0;
         var str:String = orgData.readUTFBytes(orgData.bytesAvailable);
         return com.adobe.serialization.json.JSON.decode(str);
      }
   }
}

