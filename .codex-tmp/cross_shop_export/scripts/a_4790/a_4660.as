package a_4790
{
   import flash.display.DisplayObject;
   import flash.display.SimpleButton;
   
   public class a_4660
   {
      
      public function a_4660()
      {
         super();
         throw new Error("ButtonFactory is a static class!");
      }
      
      public static function create(upState:DisplayObject = null, overState:DisplayObject = null, downState:DisplayObject = null, disabledState:DisplayObject = null) : a_4659
      {
         return new a_4659(new SimpleButton(upState,overState,downState,upState),disabledState);
      }
   }
}

