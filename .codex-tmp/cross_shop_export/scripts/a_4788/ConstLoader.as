package a_4788
{
   import flash.net.URLLoaderDataFormat;
   
   public class ConstLoader
   {
      
      public static const TYPE_LOADER:String = "Loader";
      
      public static const TYPE_URLSTREAM:String = "URLStream";
      
      public static const TYPE_TEXT:String = URLLoaderDataFormat.TEXT;
      
      public static const TYPE_BINARY:String = URLLoaderDataFormat.BINARY;
      
      public static const TYPE_VARIABLES:String = URLLoaderDataFormat.VARIABLES;
      
      public static const SYNC_LOAD:int = 0;
      
      public static const QUEUE_LOAD:int = 1;
      
      public function ConstLoader()
      {
         super();
      }
   }
}

