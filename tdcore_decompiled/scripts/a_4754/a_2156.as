package a_4754
{
   import a_4739.a_1828;
   
   public class a_2156 extends a_1828
   {
      
      public static var e:a_2156 = new a_2156();
      
      public function a_2156()
      {
         super();
      }
      
      public function onCheckRoleName(obj:Object) : void
      {
         notify("onCheckRoleName",obj);
      }
      
      public function a_2148(name:String) : void
      {
         notify("RequestCheckUserRoleName",name);
      }
      
      public function onResponseSendMailMsg(obj:Object) : void
      {
         notify("onResponseSendMailMsg",obj);
      }
      
      public function onResponseMailDataList(obj:Object) : void
      {
         notify("onResponseMailDataList",obj);
      }
      
      public function onResponseDeleteMailMsg(obj:Object) : void
      {
         notify("onResponseDeleteMailMsg",obj);
      }
      
      public function onResponseUpdateMailMsg(obj:Object) : void
      {
         notify("onResponseUpdateMailMsg",obj);
      }
      
      public function onResponseFatchMailMsg(obj:Object) : void
      {
         notify("onResponseFatchMailMsg",obj);
      }
      
      public function RequestUpdateMail(obj:Object) : void
      {
         notify("RequestUpdateMail",obj);
      }
   }
}

