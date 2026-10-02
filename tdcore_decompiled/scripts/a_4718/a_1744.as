package a_4718
{
   public class a_1744
   {
      
      private static var allTypes:Array;
      
      public static const a_402:String = "0x0000";
      
      public static const VC_TIP:String = "0x0001";
      
      public static const VS_TIP:String = "0x0002";
      
      public static const COMPOSE_TIP:String = "0x0003";
      
      public static const STORE_TIP:String = "0x0004";
      
      public static const PRIMARYFUSION_TIP:String = "0x0005";
      
      public static const DEEPFUSION_TIP:String = "0x0006";
      
      public static const SOULFUSION_TIP:String = "0x0007";
      
      public static const UPGRADE_TIP:String = "0x0008";
      
      public function a_1744()
      {
         super();
         allTypes = [a_402,VC_TIP,VS_TIP,COMPOSE_TIP,STORE_TIP];
      }
      
      public static function isAvailableType(type:String) : Boolean
      {
         var i:int = 0;
         var len:int = int(allTypes.length);
         while(i < len)
         {
            if(type == allTypes[i])
            {
               return true;
            }
            i++;
         }
         return false;
      }
   }
}

