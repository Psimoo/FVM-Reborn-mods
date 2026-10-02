package a_4754
{
   import a_4739.a_1828;
   
   public class a_2170 extends a_1828
   {
      
      public static var e:a_2170 = new a_2170();
      
      public function a_2170()
      {
         super();
      }
      
      public function init(w:int = 425, isClose:Boolean = false) : void
      {
         notify("init",w,isClose);
      }
      
      public function onInitRoleDetail(role:Object, isDetail:Boolean) : void
      {
         notify("onInitRoleDetail",role,isDetail);
      }
      
      public function showDefPackageDataProvider(iRoleUin:int, arrDefCards:Array) : void
      {
         notify("showDefPackageDataProvider",iRoleUin,arrDefCards);
      }
      
      public function showCardPackageCards(arrCardPackageCards:Array) : void
      {
         notify("showCardPackageCards",arrCardPackageCards);
      }
      
      public function showSkillBookDataProvider(arrSkillBooks:Array, isLocal:Boolean = true) : void
      {
         notify("showSkillBookDataProvider",arrSkillBooks,isLocal);
      }
      
      public function showOtherAvatar(data:Object) : void
      {
         notify("showOtherAvatar",data);
      }
      
      public function showWin(data:Object) : void
      {
         notify("showWin",data);
      }
      
      public function showAchievements(arrAchieves:Array) : void
      {
         notify("showAchievements",arrAchieves);
      }
      
      public function showOnlyRoleDateilBtn() : void
      {
         notify("showOnlyRoleDateilBtn");
      }
   }
}

