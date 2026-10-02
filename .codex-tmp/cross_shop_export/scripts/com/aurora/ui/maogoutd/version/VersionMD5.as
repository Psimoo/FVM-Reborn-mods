package com.aurora.ui.maogoutd.version
{
   import flash.utils.Dictionary;
   
   public class VersionMD5
   {
      
      private static var m_pInstance:VersionMD5 = new VersionMD5();
      
      public var a_1203:Dictionary;
      
      public function VersionMD5()
      {
         super();
         this.a_1203 = new Dictionary();
      }
      
      public static function Get() : VersionMD5
      {
         return m_pInstance;
      }
      
      public function a_2040(xml:XML) : void
      {
         var item:XML = null;
         var strPath:String = null;
         var strMD5:String = null;
         for each(item in xml.file)
         {
            strPath = item.@path;
            if(strPath.substring(0,8) != "resource")
            {
               strPath = "resource/".concat(strPath);
            }
            strMD5 = item.@MD5;
            this.a_1203[strPath] = strMD5;
         }
      }
      
      public function GetVersion(strPath:String) : String
      {
         var strVersion:String = "";
         if(this.a_1203[strPath])
         {
            strVersion = this.a_1203[strPath];
         }
         return strVersion;
      }
   }
}

