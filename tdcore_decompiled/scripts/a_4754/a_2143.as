package a_4754
{
   import a_4739.a_1828;
   
   public class a_2143 extends a_1828
   {
      
      public static var e:a_2143 = new a_2143();
      
      public function a_2143()
      {
         super();
      }
      
      public function OnChangeName(pData:Object) : void
      {
         notify("OnChangeName",pData);
      }
      
      public function RequestChangeName(pData:Object) : void
      {
         notify("RequestChangeName",pData);
      }
      
      public function ShowChangeName() : void
      {
         notify("ShowChangeName");
      }
   }
}

