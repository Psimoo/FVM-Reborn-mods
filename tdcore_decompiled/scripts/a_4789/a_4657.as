package a_4789
{
   import flash.utils.Dictionary;
   
   public class a_4657 implements IModulesBridge
   {
      
      private static var _instance:IModulesBridge;
      
      private static var sign:Boolean;
      
      private var dictListener:Dictionary;
      
      private var dictOnlyListener:Dictionary;
      
      public function a_4657()
      {
         super();
         if(!sign)
         {
            throw new Error("ModulesBridge不允许实例化，请通过getInstance()获取！");
         }
      }
      
      public static function getInstance() : IModulesBridge
      {
         if(_instance == null)
         {
            sign = true;
            _instance = new a_4657();
            sign = false;
         }
         return _instance;
      }
      
      public function addListener(listener:Object, isOnly:Boolean = false) : void
      {
         if(isOnly)
         {
            if(this.dictOnlyListener == null)
            {
               this.dictOnlyListener = new Dictionary();
            }
            this.dictOnlyListener[listener.toString()] = listener;
            return;
         }
         if(this.dictListener == null)
         {
            this.dictListener = new Dictionary();
         }
         this.dictListener[listener.toString()] = listener;
      }
      
      public function removeListener(listener:Object) : void
      {
         if(this.dictOnlyListener != null)
         {
            delete this.dictOnlyListener[listener.toString()];
         }
         if(this.dictListener != null)
         {
            delete this.dictListener[listener.toString()];
         }
      }
      
      public function removeAll() : void
      {
         this.removeHandle(this.dictListener);
         this.removeHandle(this.dictOnlyListener);
      }
      
      public function destroy() : void
      {
         this.removeAll();
         this.dictListener = null;
         this.dictOnlyListener = null;
      }
      
      public function execute(funName:String, caller:Object, ... args) : *
      {
         var params:Array = [this.dictOnlyListener,funName,caller];
         if(args != null && args.length > 0)
         {
            params = params.concat(args);
         }
         var values:Array = this.executeHandle.apply(this,params);
         if(values.length > 0)
         {
            return values[0];
         }
         params = [this.dictListener,funName,caller];
         if(args != null && args.length > 0)
         {
            params = params.concat(args);
         }
         values = this.executeHandle.apply(this,params);
         if(values.length > 0)
         {
            return values[0];
         }
         return null;
      }
      
      private function removeHandle(dict:Dictionary) : void
      {
         var listener:* = undefined;
         if(dict != null)
         {
            for(listener in dict)
            {
               delete dict[listener];
            }
         }
      }
      
      private function executeHandle(dict:Dictionary, funName:String, caller:Object, ... args) : Array
      {
         var listener:Object = null;
         var values:Array = [];
         if(dict != null)
         {
            for each(listener in dict)
            {
               if(!(listener == caller || !listener.hasOwnProperty(funName)))
               {
                  values.push(listener[funName].apply(listener,args));
               }
            }
         }
         return values;
      }
   }
}

