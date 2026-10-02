package a_4752
{
   import flash.utils.ByteArray;
   
   public class Base64
   {
      
      private static const encodeChars:Array = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","0","1","2","3","4","5","6","7","8","9","+","/"];
      
      private static const decodeChars:Array = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,62,-1,-1,-1,63,52,53,54,55,56,57,58,59,60,61,-1,-1,-1,-1,-1,-1,-1,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,-1,-1,-1,-1,-1,-1,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,-1,-1,-1,-1,-1];
      
      public function Base64()
      {
         super();
      }
      
      public static function encode(data:ByteArray) : String
      {
         var c:int = 0;
         var out:Array = [];
         var i:* = 0;
         var j:* = 0;
         var r:int = data.length % 3;
         var len:int = data.length - r;
         while(i < len)
         {
            c = data[i++] << 16 | data[i++] << 8 | data[i++];
            var _loc8_:Number;
            out[_loc8_ = j++] = encodeChars[c >> 18] + encodeChars[c >> 12 & 0x3F] + encodeChars[c >> 6 & 0x3F] + encodeChars[c & 0x3F];
         }
         if(r == 1)
         {
            c = int(data[i++]);
            out[_loc8_ = j++] = encodeChars[c >> 2] + encodeChars[(c & 3) << 4] + "==";
         }
         else if(r == 2)
         {
            c = data[i++] << 8 | data[i++];
            out[_loc8_ = j++] = encodeChars[c >> 10] + encodeChars[c >> 4 & 0x3F] + encodeChars[(c & 0x0F) << 2] + "=";
         }
         return out.join("");
      }
      
      public static function decode(str:String) : ByteArray
      {
         var c1:int = 0;
         var c2:int = 0;
         var c3:int = 0;
         var c4:int = 0;
         var i:* = 0;
         var len:int = 0;
         var out:ByteArray = null;
         len = str.length;
         i = 0;
         out = new ByteArray();
         loop0:
         while(i < len)
         {
            do
            {
               c1 = int(decodeChars[str.charCodeAt(i++) & 0xFF]);
            }
            while(i < len && c1 == -1);
            if(c1 == -1)
            {
               break;
            }
            do
            {
               c2 = int(decodeChars[str.charCodeAt(i++) & 0xFF]);
            }
            while(i < len && c2 == -1);
            if(c2 == -1)
            {
               break;
            }
            out.writeByte(c1 << 2 | (c2 & 0x30) >> 4);
            while(true)
            {
               c3 = str.charCodeAt(i++) & 0xFF;
               if(c3 == 61)
               {
                  break;
               }
               c3 = int(decodeChars[c3]);
               if(!(i < len && c3 == -1))
               {
                  if(c3 == -1)
                  {
                     break loop0;
                  }
                  out.writeByte((c2 & 0x0F) << 4 | (c3 & 0x3C) >> 2);
                  while(true)
                  {
                     c4 = str.charCodeAt(i++) & 0xFF;
                     if(c4 == 61)
                     {
                        break;
                     }
                     c4 = int(decodeChars[c4]);
                     if(!(i < len && c4 == -1))
                     {
                        if(c4 == -1)
                        {
                           break loop0;
                        }
                        out.writeByte((c3 & 3) << 6 | c4);
                        continue loop0;
                     }
                  }
                  return out;
               }
            }
            return out;
         }
         return out;
      }
   }
}

