package a_4725
{
   import flash.display.Loader;
   import flash.net.URLLoader;
   import flash.system.ApplicationDomain;
   import flash.system.SecurityDomain;
   
   public class AurLoadTask
   {
      
      public var name:String;
      
      public var type:int;
      
      public var url:String;
      
      public var loader:Loader;
      
      public var stUrlLoader:URLLoader;
      
      public var iTryLoadTimes:int;
      
      public var isCheckPolicyFile:Boolean;
      
      public var isAddToCurrentAppDomain:Boolean;
      
      public var isAddToCurrentSecurityDomain:Boolean;
      
      public var stUserDefineAppDoman:ApplicationDomain;
      
      public var stUserDefineSecurityDomain:SecurityDomain;
      
      public function AurLoadTask()
      {
         super();
      }
   }
}

