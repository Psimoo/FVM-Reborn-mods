package a_4781
{
   import flash.utils.Dictionary;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   
   public class TimeoutManager
   {
      
      private static var instance:TimeoutManager;
      
      private var timeouts:Dictionary;
      
      private var instanceId:int = 0;
      
      public function TimeoutManager()
      {
         super();
         if(instance)
         {
            throw new Error("Singleton class. Use getInstance() method to get an instance.");
         }
         this.timeouts = new Dictionary();
      }
      
      public static function getInstance() : TimeoutManager
      {
         if(!instance)
         {
            instance = new TimeoutManager();
         }
         return instance;
      }
      
      public function init() : void
      {
      }
      
      public function AddDelay(delay:Number, callback:Function, ... args) : String
      {
         var timeoutId:uint;
         var sID:String = null;
         ++this.instanceId;
         sID = "TimeoutManager_" + this.instanceId;
         timeoutId = setTimeout(function():void
         {
            callback.apply(null,args);
            removeTimeout(sID);
         },delay);
         this.timeouts[sID] = timeoutId;
         return sID;
      }
      
      public function addTimeout(id:String, delay:Number, callback:Function, ... args) : void
      {
         var timeoutId:uint;
         if(this.timeouts[id] != null)
         {
            clearTimeout(this.timeouts[id]);
         }
         timeoutId = setTimeout(function():void
         {
            callback.apply(null,args);
            removeTimeout(id);
         },delay);
         this.timeouts[id] = timeoutId;
      }
      
      public function removeTimeout(id:String) : void
      {
         if(this.timeouts[id] != null)
         {
            clearTimeout(this.timeouts[id]);
            delete this.timeouts[id];
         }
      }
      
      public function clearAllTimeouts() : void
      {
         var id:String = null;
         for(id in this.timeouts)
         {
            clearTimeout(this.timeouts[id]);
            delete this.timeouts[id];
         }
      }
   }
}

