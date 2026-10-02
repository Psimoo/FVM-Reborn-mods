package a_4715
{
   import flash.net.getClassByAlias;
   import flash.utils.getDefinitionByName;
   
   public class AurUtility
   {
      
      public function AurUtility()
      {
         super();
      }
      
      public static function a_1727(szClassName:String) : Class
      {
         try
         {
            return getDefinitionByName(szClassName) as Class;
         }
         catch(e:ReferenceError)
         {
            try
            {
               return getClassByAlias(szClassName);
            }
            catch(e2:ReferenceError)
            {
               trace("Class Not exist:<" + szClassName + ">.");
               return null;
            }
         }
      }
   }
}

