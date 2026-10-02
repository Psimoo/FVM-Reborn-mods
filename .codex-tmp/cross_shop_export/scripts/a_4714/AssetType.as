package a_4714
{
   public class AssetType
   {
      
      public static const SWF:int = 0;
      
      public static const JPG:int = 1;
      
      public static const PNG:int = 2;
      
      public static const GIF:int = 3;
      
      public static const ZIP:int = 4;
      
      public static const TXT:int = 5;
      
      public function AssetType()
      {
         super();
      }
      
      public static function typeCheck(type:int) : Boolean
      {
         if(type < 0 || type > 5)
         {
            return false;
         }
         return true;
      }
   }
}

