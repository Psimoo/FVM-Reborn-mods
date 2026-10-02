package a_4754
{
   import a_4739.a_1828;
   
   public class a_2150 extends a_1828
   {
      
      public static var e:a_2150 = new a_2150();
      
      public function a_2150()
      {
         super();
      }
      
      public function RequestAddFriend(friendData:Object) : void
      {
         notify("RequestAddFriend",friendData);
      }
      
      public function RequestDelFriend(iRoleUin:int) : void
      {
         notify("RequestDelFriend",iRoleUin);
      }
      
      public function onDelFriendFaild(res:String) : void
      {
         notify("onDelFriendFaild",res);
      }
      
      public function onPositiveFriendsChange() : void
      {
         notify("onPositiveFriendsChange");
      }
      
      public function onCheckRoleName(obj:Object) : void
      {
         notify("onCheckRoleName",obj);
      }
   }
}

