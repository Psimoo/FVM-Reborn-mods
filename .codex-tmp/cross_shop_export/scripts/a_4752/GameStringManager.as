package a_4752
{
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.utils.Dictionary;
   
   public class GameStringManager extends EventDispatcher implements IGameStringManager
   {
      
      private static var _instance:IGameStringManager;
      
      private static var sign:Boolean;
      
      private var holder:String = "&variable&";
      
      private var stringContent:Dictionary;
      
      public function GameStringManager(target:IEventDispatcher = null)
      {
         super(target);
         if(!sign)
         {
            throw new Error("GameStringManager不允许实例化，请通过getInstance()获取！");
         }
         this.init();
      }
      
      public static function getInstance() : IGameStringManager
      {
         if(_instance == null)
         {
            sign = true;
            _instance = new GameStringManager();
            sign = false;
         }
         return _instance;
      }
      
      public function getString(id:int, repString:Array = null) : String
      {
         if(this.stringContent == null)
         {
            return "配置文件没有加载，请检查！";
         }
         var str:String = this.stringContent[id];
         if(str == null)
         {
            str = this.stringContent[24579];
         }
         else
         {
            str = this.replaceString(str,repString);
         }
         return str;
      }
      
      public function GetServerCodeMessage(id:int) : String
      {
         return this.stringContent[id];
      }
      
      public function getHolder() : String
      {
         return this.holder;
      }
      
      public function replaceString(str:String, repString:Array = null, holder:String = null) : String
      {
         var i:int = 0;
         var n:int = 0;
         if(holder == null)
         {
            holder = this.holder;
         }
         if(repString != null && repString.length > 0)
         {
            i = 0;
            n = int(repString.length);
            while(i < n)
            {
               str = str.replace(holder,repString[i]);
               i++;
            }
         }
         return str;
      }
      
      public function setString(xml:XML) : void
      {
         this.parseXML(xml);
      }
      
      public function loadString(url:String) : void
      {
      }
      
      private function init() : void
      {
         trace("GameStringManager::init");
      }
      
      private function parseXML(xml:XML) : void
      {
         var i:int = 0;
         var n:int = 0;
         var id:int = 0;
         if(xml == null)
         {
            return;
         }
         if(xml.@holder != undefined)
         {
            this.holder = xml.@holder.toString();
         }
         var contentList:XMLList = xml..content;
         if(contentList)
         {
            this.stringContent = new Dictionary();
            i = 0;
            n = contentList.length();
            while(i < n)
            {
               id = parseInt(contentList[i].@id);
               this.stringContent[id] = contentList[i].toString();
               i++;
            }
         }
      }
   }
}

