package a_4752
{
   import a_4781.a_4713;
   import flash.utils.Dictionary;
   
   public class a_2047
   {
      
      private static var _data:Dictionary;
      
      public function a_2047()
      {
         super();
      }
      
      public static function parseConfig(xml:XML) : void
      {
         var i:int = 0;
         var n:String = null;
         var obj:Object = null;
         var xmlList:XMLList = xml.children();
         var len:int = xmlList.length();
         _data = new Dictionary();
         if(len > 0)
         {
            for(i = 0; i < len; i++)
            {
               n = xmlList[i].name().toString();
               obj = a_4713.getNodeAttributes(xmlList[i]);
               _data[n] = obj;
            }
         }
      }
      
      public static function getConfigData(name:String) : Object
      {
         if(_data == null)
         {
            return null;
         }
         return _data[name];
      }
   }
}

