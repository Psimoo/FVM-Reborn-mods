package a_4781
{
   import com.adobe.crypto.MD5;
   import flash.utils.ByteArray;
   
   public class b_214
   {
      
      public function b_214()
      {
         super();
      }
      
      public static function Check(bytes1:ByteArray, bytes2:ByteArray, value:int) : Boolean
      {
         var sum:int = GetSum(MD5.hashBinary(bytes1)) + GetSum(MD5.hashBinary(bytes2));
         return sum == value;
      }
      
      public static function GetSum(str:String) : int
      {
         str = str.toLocaleUpperCase();
         var sum:int = 0;
         for(var i:int = 0; i < str.length; i++)
         {
            sum += str.charCodeAt(i);
         }
         return sum;
      }
   }
}

