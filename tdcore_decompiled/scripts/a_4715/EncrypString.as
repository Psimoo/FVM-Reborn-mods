package a_4715
{
   public class EncrypString
   {
      
      private static const PREFIX:String = "@$^*)";
      
      private static const SUFFIX:String = "(&%#!";
      
      private static const EXTRALEN:int = PREFIX.length + SUFFIX.length;
      
      private var m_strValueLeft:String;
      
      private var m_strValueRight:String;
      
      public function EncrypString(strValue:String = "")
      {
         super();
         this.Value = strValue;
      }
      
      public function get EncrypValue() : String
      {
         return this.m_strValueLeft + this.m_strValueRight;
      }
      
      public function set EncrypValue(strValue:String) : void
      {
         var iLen:int = strValue.length;
         this.m_strValueLeft = strValue.slice(0,iLen >> 1);
         this.m_strValueRight = strValue.slice(iLen >> 1,iLen);
      }
      
      public function get Value() : String
      {
         if(null == this.m_strValueLeft)
         {
            return this.m_strValueLeft;
         }
         return this.m_strValueLeft.substr(PREFIX.length,this.m_strValueLeft.length - EXTRALEN) + this.m_strValueRight.substr(PREFIX.length,this.m_strValueRight.length - EXTRALEN);
      }
      
      public function set Value(strValue:String) : void
      {
         if(strValue == null)
         {
            this.m_strValueLeft = null;
            return;
         }
         var iLen:int = strValue.length;
         this.m_strValueLeft = PREFIX + strValue.slice(0,iLen >> 1) + SUFFIX;
         this.m_strValueRight = PREFIX + strValue.slice(iLen >> 1,iLen) + SUFFIX;
      }
   }
}

