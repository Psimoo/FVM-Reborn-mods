package a_4788
{
   import flash.events.StatusEvent;
   import flash.net.LocalConnection;
   
   public class a_4648
   {
      
      private static var conn:LocalConnection;
      
      public static var identity:String = "^-^无名氏^-^";
      
      public static var OmitTrace:Boolean = true;
      
      public function a_4648()
      {
         super();
         throw new Error("AS3Debugger 为静态类，不允许实例化");
      }
      
      public static function a_4649(msg:*, id:String = "") : void
      {
         if(!a_4648.OmitTrace)
         {
            return;
         }
         if(id == "")
         {
            id = a_4648.identity;
         }
         if(conn == null)
         {
            conn = new LocalConnection();
            conn.addEventListener(StatusEvent.STATUS,onStatus);
         }
         if(msg.toString() == "[object Object]")
         {
            msg = objectToString(msg);
         }
         else if(msg is Array)
         {
            msg = arrayToString(msg);
         }
         else if(msg is XML)
         {
            msg = msg.toXMLString();
         }
         else
         {
            msg = msg.toString();
         }
         msg = htmlFormat(msg);
         msg = "<font color=\'#ff0000\'>[" + getTime() + "]</font>" + "<font size=\'12\' color=\'#00ff00\' face=\'宋体\'>" + msg + "</font>";
         try
         {
            conn.send("_debugConnection","transMsg",msg,id);
         }
         catch(e:Error)
         {
         }
      }
      
      private static function htmlFormat(msg:String) : String
      {
         msg = msg.replace(/\&/g,"&amp;");
         msg = msg.replace(/\</g,"&lt;");
         msg = msg.replace(/\>/g,"&gt;");
         msg = msg.replace(/\"/g,"&quot;");
         return msg.replace(/\'/g,"&apos;");
      }
      
      private static function getTime() : String
      {
         var date:Date = new Date();
         return getFormatTime(date.getHours()) + ":" + getFormatTime(date.getMinutes()) + ":" + getFormatTime(date.getSeconds()) + "." + date.getMilliseconds();
      }
      
      private static function getFormatTime(t:uint) : String
      {
         return t < 10 ? "0" + t : "" + t;
      }
      
      private static function onStatus(a_4730:StatusEvent) : void
      {
         switch(a_4730.level)
         {
            case "status":
               trace("LocalConnection.send() succeeded");
               break;
            case "error":
         }
      }
      
      private static function objectToString(obj:Object) : String
      {
         var k:String = null;
         var str:String = "{";
         for(k in obj)
         {
            if(obj[k].toString() == "[object Object]")
            {
               str += k + ":" + objectToString(obj[k]) + ",";
            }
            else if(obj[k] is Array)
            {
               str += k + ":" + arrayToString(obj[k]) + ",";
            }
            else
            {
               str += k + ":" + obj[k] + ",";
            }
         }
         str = str.substr(0,str.length - 1);
         return str + "}";
      }
      
      private static function arrayToString(a:Array) : String
      {
         var len:uint = a.length;
         var str:String = "[";
         for(var i:uint = 0; i < len; i++)
         {
            if(a[i].toString() == "[object Object]")
            {
               str += objectToString(a[i]) + ",";
            }
            else if(a[i] is Array)
            {
               str += arrayToString(a[i]) + ",";
            }
            else
            {
               str += a[i] + ",";
            }
         }
         str = str.substr(0,str.length - 1);
         return str + "]";
      }
   }
}

