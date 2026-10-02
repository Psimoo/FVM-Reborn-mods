package a_4754
{
   import a_4739.a_1828;
   import flash.display.DisplayObjectContainer;
   import flash.geom.Point;
   
   public class a_2157 extends a_1828
   {
      
      public static var e:a_2157 = new a_2157();
      
      public function a_2157()
      {
         super();
      }
      
      public function OnPlarInfo(data:Object) : void
      {
         notify("OnPlarInfo",data);
      }
      
      public function OnGetConsortiaBrief(data:Object) : void
      {
         notify("OnGetConsortiaBrief",data);
      }
      
      public function RequestMarginListData(data:Object) : void
      {
         notify("RequestMarginListData",data);
      }
      
      public function OnMarginListData(data:Object) : void
      {
         notify("OnMarginListData",data);
      }
      
      public function RequestMarginRegisterFriend(data:Object) : void
      {
         notify("RequestMarginRegisterFriend",data);
      }
      
      public function OnMarginRegisterFriend(data:Object) : void
      {
         notify("OnMarginRegisterFriend",data);
      }
      
      public function RequestMarginReverseRegister(data:Object) : void
      {
         notify("RequestMarginReverseRegister",data);
      }
      
      public function OnMarginReverseRegister(data:Object) : void
      {
         notify("OnMarginReverseRegister",data);
      }
      
      public function RequestMarginRegistAdvert(data:Object) : void
      {
         notify("RequestMarginRegistAdvert",data);
      }
      
      public function OnMarginRegistAdvert(data:Object) : void
      {
         notify("OnMarginRegistAdvert",data);
      }
      
      public function RequestMarginModifyAdvert(data:Object) : void
      {
         notify("RequestMarginModifyAdvert",data);
      }
      
      public function OnMarginModifyAdvert(data:Object) : void
      {
         notify("OnMarginModifyAdvert",data);
      }
      
      public function RequestMarginStar(data:Object) : void
      {
         notify("RequestMarginStar",data);
      }
      
      public function OnMarginStar(data:Object) : void
      {
         notify("OnMarginStar",data);
      }
      
      public function RequestMarginPlayerByUin(data:Object) : void
      {
         notify("RequestMarginPlayerByUin",data);
      }
      
      public function OnMarginPlayerByUin(data:Object) : void
      {
         notify("OnMarginPlayerByUin",data);
      }
      
      public function RequestMarginSearch(data:Object) : void
      {
         notify("RequestMarginSearch",data);
      }
      
      public function OnMarginSearch(data:Object) : void
      {
         notify("OnMarginSearch",data);
      }
      
      public function RequestChangeScreen() : void
      {
         notify("RequestChangeScreen");
      }
      
      public function RequestShowIM(ct:DisplayObjectContainer, imUIType:int, pst:Point = null) : void
      {
         notify("RequestShowIM",ct,imUIType,pst);
      }
   }
}

