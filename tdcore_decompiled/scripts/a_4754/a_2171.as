package a_4754
{
   import a_4739.a_1828;
   
   public class a_2171 extends a_1828
   {
      
      public static var e:a_2171 = new a_2171();
      
      public function a_2171()
      {
         super();
      }
      
      public function RequestSendVow(data:Object) : void
      {
         notify("RequestSendVow",data);
      }
      
      public function OnResponseSendVow(data:Object) : void
      {
         notify("OnResponseSendVow",data);
      }
      
      public function RequestGetVowNews(data:Object) : void
      {
         notify("RequestGetVowNews",data);
      }
      
      public function OnResponseGetVowNews(data:Object) : void
      {
         notify("OnResponseGetVowNews",data);
      }
   }
}

