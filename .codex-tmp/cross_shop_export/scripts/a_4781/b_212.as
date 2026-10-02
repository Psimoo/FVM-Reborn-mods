package a_4781
{
   import flash.display.Stage;
   import flash.events.MouseEvent;
   
   public class b_212
   {
      
      private static var m_stage:Stage;
      
      private static var b_204:int;
      
      private static var b_205:int;
      
      private static var b_206:int;
      
      private static var b_207:int;
      
      private static var b_208:int;
      
      private static var b_209:int;
      
      public function b_212()
      {
         super();
      }
      
      public static function a_3014(stage:Stage) : void
      {
         m_stage = stage;
      }
      
      public static function b_210() : void
      {
         if(m_stage == null)
         {
            return;
         }
         m_stage.addEventListener("click",a_4586);
         m_stage.addEventListener("mouseMove",a_4520);
         b_206 = 0;
         b_207 = 0;
         b_208 = 0;
         b_204 = 0;
         b_205 = 0;
         b_209 = 0;
      }
      
      public static function b_211() : int
      {
         if(m_stage == null)
         {
            return -1;
         }
         m_stage.removeEventListener("click",a_4586);
         m_stage.removeEventListener("mouseMove",a_4520);
         return b_209;
      }
      
      protected static function a_4586(e:MouseEvent) : void
      {
         if(0 != b_204 && 0 != b_205)
         {
            if(Math.abs(e.stageX - b_204) >= 200)
            {
               if(b_208 <= 1)
               {
                  if(!(b_204 >= 490 && b_204 <= 560 && e.stageX >= 790 && e.stageX <= 850))
                  {
                     if(!(b_204 >= 790 && b_204 <= 850 && e.stageX >= 490 && e.stageX <= 560))
                     {
                        ++b_209;
                     }
                  }
               }
            }
            else if(Math.abs(e.stageY - b_205) >= 200)
            {
               if(b_208 <= 1)
               {
                  ++b_209;
               }
            }
            b_208 = 0;
         }
         b_204 = e.stageX;
         b_205 = e.stageY;
      }
      
      protected static function a_4520(e:MouseEvent) : void
      {
         ++b_208;
      }
   }
}

