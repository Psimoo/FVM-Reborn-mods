package a_4781
{
   import a_4716.EnmStrRegExp;
   import flash.utils.ByteArray;
   
   public class a_4654
   {
      
      public function a_4654()
      {
         super();
      }
      
      public static function trim(str:String) : String
      {
         var re:RegExp = new RegExp(EnmStrRegExp.RE_LRTRIM,"g");
         return str.replace(re,"");
      }
      
      public static function lTrim(str:String) : String
      {
         var re:RegExp = new RegExp(EnmStrRegExp.RE_LTRIM,"g");
         return str.replace(re,"");
      }
      
      public static function rTrim(str:String) : String
      {
         var re:RegExp = new RegExp(EnmStrRegExp.RE_RTRIM,"g");
         return str.replace(re,"");
      }
      
      public static function deleteNaNChars(str:String) : String
      {
         var reg:RegExp = /[^0-9]/ig;
         return str.replace(reg,"");
      }
      
      public static function deleteAllSpace(str:String) : String
      {
         return str.replace(/\s/g,"");
      }
      
      public static function getTextByteLength(str:String) : int
      {
         var ba:ByteArray = new ByteArray();
         ba.writeMultiByte(str,"utf-8");
         var len:int = int(ba.length);
         ba.clear();
         return len;
      }
      
      public static function matchLength(s:String) : String
      {
         return s.replace(new RegExp(/[^\x00-\xff]/g),"**");
      }
   }
}

