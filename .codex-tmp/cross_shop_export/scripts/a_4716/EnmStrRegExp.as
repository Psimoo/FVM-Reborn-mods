package a_4716
{
   public class EnmStrRegExp
   {
      
      public static const RE_USER:String = "^\\w+$";
      
      public static const RE_EMAIL:String = "\\w+([-+.’]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";
      
      public static const RE_LRTRIM:String = "(^\\s*)|(\\s*$)";
      
      public static const RE_LTRIM:String = "^\\s*";
      
      public static const RE_RTRIM:String = "\\s*$";
      
      public static const a_390:String = "[^\\x00-\\xff]";
      
      public static const RE_CHINESE:String = "[一-龥]";
      
      public static const a_391:String = "\\n[s| ]*\\r";
      
      public function EnmStrRegExp()
      {
         super();
      }
   }
}

