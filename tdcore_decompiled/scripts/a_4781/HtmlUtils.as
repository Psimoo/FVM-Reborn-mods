package a_4781
{
   public class HtmlUtils
   {
      
      public function HtmlUtils()
      {
         super();
      }
      
      public static function GetHtmlText(strName:String, strColor:String = "#FFFFFF", size:int = 12, bIsBold:Boolean = false) : String
      {
         var strHtml:String = "<font color=\"" + strColor + "\" size=\"" + size + "\">" + strName + "</font>";
         if(bIsBold)
         {
            strHtml = "<b>" + strHtml + "</b>";
         }
         return strHtml;
      }
   }
}

