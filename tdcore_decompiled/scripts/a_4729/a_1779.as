package a_4729
{
   import a_4732.TcpPackageEvent;
   import a_4757.a_2200;
   import a_4757.a_2220;
   import a_4759.b_169;
   import a_4771.a_2648;
   import flash.events.EventDispatcher;
   
   public class a_1779 extends EventDispatcher
   {
      
      protected static var baseProtocalHandler:a_2220;
      
      protected static var serverManager:a_2648;
      
      protected static var mapGameHandlerRoutine:Object = {};
      
      public function a_1779()
      {
         super();
         serverManager = a_2648.getInstance();
         this.initailize();
      }
      
      public function initailize() : void
      {
         addEventListener(EventType.a_561,this.a_1783);
         addEventListener(EventType.a_564,this.a_1784);
         addEventListener(EventType.a_563,this.a_1786);
         addEventListener(EventType.a_562,this.a_1785);
         addEventListener(EventType.a_566,this.a_1788);
      }
      
      public function a_1780(_baseHandler:b_169) : void
      {
         if(null != _baseHandler && _baseHandler is b_169)
         {
            baseProtocalHandler = _baseHandler as a_2220;
         }
         else
         {
            trace("Error: _baseHandler must be baseProtocal object.");
         }
      }
      
      public function a_1781(gameId:uint, gameHandler:Object) : void
      {
         if(gameId <= 0 || gameHandler == null)
         {
            trace("RegisterGameHandler failed");
            return;
         }
         if(null != mapGameHandlerRoutine[gameId])
         {
            trace("gameID:" + gameId + "exists in mapGameHandlerRoutine");
         }
         mapGameHandlerRoutine[gameId] = gameHandler;
      }
      
      public function a_1782(gameHandler:Object) : void
      {
         var property:Object = null;
         if(null == gameHandler)
         {
            trace("gameHandler is null, UnRegisterGameHandler failed");
            return;
         }
         for(property in mapGameHandlerRoutine)
         {
            if(mapGameHandlerRoutine[property] == gameHandler)
            {
               delete mapGameHandlerRoutine[property];
            }
         }
      }
      
      public function a_1783(a_4730:TcpPackageEvent) : void
      {
         if(null == baseProtocalHandler)
         {
            baseProtocalHandler = a_2220.getInstance();
         }
         a_4730.packageBytes.position = 0;
         baseProtocalHandler.a_2204(a_4730.a_787,a_4730.m_stKeyInfo,a_4730.packageBytes);
         a_4730 = null;
      }
      
      public function a_1784(a_4730:TcpPackageEvent) : void
      {
         a_4730.packageBytes.position = 0;
         a_2200.getInstance().a_2204(a_4730.packageBytes);
         a_4730 = null;
      }
      
      public function a_1785(a_4730:TcpPackageEvent) : void
      {
      }
      
      public function a_1786(a_4730:TcpPackageEvent) : void
      {
      }
      
      public function a_1787(a_4730:TcpPackageEvent) : void
      {
      }
      
      public function a_1788(a_4730:TcpPackageEvent) : void
      {
      }
   }
}

