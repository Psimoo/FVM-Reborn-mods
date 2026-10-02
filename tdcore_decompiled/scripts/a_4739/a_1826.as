package a_4739
{
   import flash.utils.*;
   
   public class a_1826
   {
      
      protected var mHandlerMap:Dictionary;
      
      private var mContext:Object;
      
      public function a_1826(context:Object)
      {
         super();
         this.mContext = context;
         this.mHandlerMap = new Dictionary();
      }
      
      public function findHandler(key:int) : Function
      {
         return this.mHandlerMap[key];
      }
      
      public function register(key:int, _Function:Function, isFlast:Boolean = true) : Boolean
      {
         if(this.mHandlerMap[key] != null && !isFlast)
         {
            return false;
         }
         this.mHandlerMap[key] = _Function;
         return true;
      }
      
      public function excute(key:int, ... args) : *
      {
         var _Function:Function = this.findHandler(key);
         if(_Function != null)
         {
            return _Function.apply(this.mContext,args);
         }
      }
   }
}

