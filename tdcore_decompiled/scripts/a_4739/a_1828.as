package a_4739
{
   import flash.utils.Dictionary;
   
   public class a_1828
   {
      
      private var dictNotifys:Dictionary;
      
      private var dictIsNotifys:Dictionary;
      
      public function a_1828()
      {
         super();
         this.dictNotifys = new Dictionary();
         this.dictIsNotifys = new Dictionary();
      }
      
      public function register(_register:Object) : void
      {
         this.dictNotifys[_register.toString()] = _register;
         this.dictIsNotifys[_register.toString()] = true;
      }
      
      public function remove(_remover:Object) : void
      {
         delete this.dictNotifys[_remover.toString()];
         delete this.dictIsNotifys[_remover.toString()];
      }
      
      public function removeAll() : void
      {
         var notifier:Object = null;
         for each(notifier in this.dictNotifys)
         {
            delete this.dictNotifys[notifier.toString()];
            delete this.dictIsNotifys[notifier.toString()];
         }
      }
      
      public function onlyRegister(_register:Object, onlyNotify:Boolean) : void
      {
         var notifier:Object = null;
         for each(notifier in this.dictNotifys)
         {
            this.dictIsNotifys[notifier.toString()] = !onlyNotify;
         }
         if(onlyNotify)
         {
            this.register(_register);
         }
         else
         {
            this.remove(_register);
         }
      }
      
      public function notify(notify:String, ... args) : void
      {
         var notifier:Object = null;
         var isNotify:Boolean = false;
         for each(notifier in this.dictNotifys)
         {
            isNotify = Boolean(this.dictIsNotifys[notifier.toString()]);
            if(isNotify && notifier.hasOwnProperty(notify))
            {
               notifier[notify].apply(notifier,args);
            }
         }
      }
      
      public function notifyData(notify:String, ... args) : Object
      {
         var notifier:Object = null;
         var fun:Function = null;
         var value:Object = null;
         var isNotify:Boolean = false;
         if(notify == "onRequestVerifyInGameResult")
         {
            return null;
         }
         for each(notifier in this.dictNotifys)
         {
            isNotify = Boolean(this.dictIsNotifys[notifier.toString()]);
            if(isNotify && notifier.hasOwnProperty(notify))
            {
               fun = notifier[notify];
               break;
            }
         }
         if(fun != null)
         {
            value = fun.apply(null,args);
         }
         return value;
      }
      
      public function notifyer() : Object
      {
         var notifier:Object = null;
         var isNotify:Boolean = false;
         for each(notifier in this.dictNotifys)
         {
            isNotify = Boolean(this.dictIsNotifys[notifier.toString()]);
            if(isNotify)
            {
               break;
            }
         }
         return notifier;
      }
   }
}

