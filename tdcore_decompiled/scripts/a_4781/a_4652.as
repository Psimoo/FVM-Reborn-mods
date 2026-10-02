package a_4781
{
   public class a_4652
   {
      
      private static var instance:a_4652;
      
      public static var C_EMPTY:String = "";
      
      public static var C_BLANK:String = " ";
      
      public static var C_NEW_LINE:String = "\n";
      
      public static var C_TAB:String = "\t";
      
      public static var C_BACKSAPCE:String = "\b";
      
      public static var C_NEXTPAGE:String = "\f";
      
      public static var C_RETURN:String = "\r";
      
      private var translateArray:Array = [["&","&amp;"],[" ","&nbsp;"],["<","&lt;"],[">","&gt;"],["\"","&quot;"],["\'","&apos;"],["","&szlig;"],["\"","&quot;"]];
      
      public function a_4652()
      {
         super();
      }
      
      public static function getInstance() : a_4652
      {
         if(instance == null)
         {
            instance = new a_4652();
         }
         return instance;
      }
      
      public function encodeXML(text:String) : String
      {
         var s:String = text;
         for(var i:int = 0; i < this.translateArray.length; i++)
         {
            s = this.replaceAll(s,this.translateArray[i][0],this.translateArray[i][1]);
         }
         return s;
      }
      
      public function decodeXML(text:String) : String
      {
         var s:String = text;
         for(var i:int = 0; i < this.translateArray.length; i++)
         {
            s = this.replaceAll(s,this.translateArray[i][1],this.translateArray[i][0]);
         }
         return s;
      }
      
      public function isEmpty(str:String) : Boolean
      {
         if(str == null)
         {
            return true;
         }
         if(str == null || str.length <= 0)
         {
            return true;
         }
         return false;
      }
      
      public function indexOf(src:String, str:String, index:int = 0) : int
      {
         return src.indexOf(str,index);
      }
      
      public function lastIndexOf(src:String, str:String, index:int = -1) : int
      {
         if(index == -1)
         {
            return src.lastIndexOf(str);
         }
         return src.lastIndexOf(str,index);
      }
      
      public function subString(src:String, index_start:int = 0, index_end:int = -1) : String
      {
         if(index_end == -1)
         {
            return src.substring(index_start);
         }
         return src.substring(index_start,index_end);
      }
      
      public function substr(src:String, start:int, length:int = -1) : String
      {
         if(length == -1)
         {
            return src.substr(start);
         }
         return src.substr(start,length);
      }
      
      public function toArray(src:String, ch:String) : Array
      {
         return src.split(ch);
      }
      
      public function replace(src:String, from_ch:String, to_ch:String, rp_all:Boolean = false) : String
      {
         while(src.indexOf(from_ch) != -1)
         {
            src = src.replace(from_ch,to_ch);
            if(!rp_all)
            {
               return src;
            }
         }
         return src;
      }
      
      public function replaceAll(src:String, from_ch:String, to_ch:String) : String
      {
         return src.split(from_ch).join(to_ch);
      }
      
      public function reverse(src:String) : String
      {
         var arr:Array = src.split("");
         arr = arr.reverse();
         return arr.join("");
      }
      
      public function charCodeAt(src:String, index:int) : int
      {
         return src.charCodeAt(index);
      }
      
      public function charAt(src:String, index:int) : String
      {
         return src.charAt(index);
      }
      
      public function toUpperCase(src:String) : String
      {
         return src.toUpperCase();
      }
      
      public function toLowerCase(src:String) : String
      {
         return src.toLowerCase();
      }
      
      public function booleanValue(src:String) : Boolean
      {
         var trimmed:String = src.toLowerCase();
         return trimmed == "true" || trimmed == "t" || trimmed == "yes" || trimmed == "1";
      }
      
      public function trimLeadingWhitespace(src:String) : String
      {
         var ch:String = null;
         var index:int = 0;
         while(true)
         {
            ch = src.charAt(index);
            if(ch != C_BLANK)
            {
               break;
            }
            index++;
         }
         return this.subString(src,index);
      }
      
      public function trimTrailingWhitespace(src:String) : String
      {
         var ch:String = null;
         var index:* = int(src.length - 1);
         while(true)
         {
            ch = src.charAt(index);
            if(ch != C_BLANK)
            {
               break;
            }
            index--;
         }
         return this.subString(src,0,index + 1);
      }
      
      public function startsWith(src:String, prefix:String) : Boolean
      {
         if(this.isEmpty(src) || this.isEmpty(prefix))
         {
            return false;
         }
         if(src.length < prefix.length)
         {
            return false;
         }
         return src.indexOf(prefix) == 0;
      }
      
      public function startsWithIgnoreCase(src:String, prefix:String) : Boolean
      {
         if(this.isEmpty(src) || this.isEmpty(prefix))
         {
            return false;
         }
         if(src.length < prefix.length)
         {
            return false;
         }
         var tmp:String = src.toLowerCase();
         var s:String = prefix.toLowerCase();
         return tmp.indexOf(s) == 0;
      }
      
      public function endsWith(src:String, suffix:String) : Boolean
      {
         if(this.isEmpty(src) || this.isEmpty(suffix))
         {
            return false;
         }
         if(src.length < suffix.length)
         {
            return false;
         }
         return src.lastIndexOf(suffix) == src.length - suffix.length;
      }
      
      public function endsWithIgnoreCase(src:String, suffix:String) : Boolean
      {
         if(this.isEmpty(src) || this.isEmpty(suffix))
         {
            return false;
         }
         if(src.length < suffix.length)
         {
            return false;
         }
         var tmp:String = src.toLowerCase();
         var s:String = suffix.toLowerCase();
         return tmp.lastIndexOf(s) == tmp.length - s.length;
      }
      
      public function isNumeric(src:String) : Boolean
      {
         if(this.isEmpty(src))
         {
            return false;
         }
         var regx:RegExp = /^[-+]?\d*\.?\d+(?:[eE][-+]?\d+)?$/;
         return regx.test(src);
      }
      
      public function equals(src:String, dest:String) : Boolean
      {
         return src == dest;
      }
      
      public function equalsIgnoreCase(src:String, dest:String) : Boolean
      {
         var t:String = src.toLowerCase();
         var s:String = dest.toLowerCase();
         return s == t;
      }
      
      public function split(src:String, flg:String) : Array
      {
         return src.split(flg);
      }
      
      public function contains(src:String, flg:String) : Boolean
      {
         return src.indexOf(flg) != -1;
      }
      
      public function encodeUTF(src:String) : String
      {
         return encodeURIComponent(src);
      }
      
      public function decodeUTF(src:String) : String
      {
         return decodeURIComponent(src);
      }
   }
}

