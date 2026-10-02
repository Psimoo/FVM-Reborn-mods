package com.aurora.ui.maogoutd.worldBossLevel.vo
{
   public class WorldBossAllServerSortVO
   {
      
      public var sortId:int;
      
      public var userId:int;
      
      public var sex:int;
      
      public var plat:int;
      
      public var server:int;
      
      public var userName:String;
      
      public var userLevel:int;
      
      public var userDuanweiLevel:int;
      
      public var userDuanweiSubLevel:int;
      
      public var bossId:int;
      
      public var killBossBlood:int;
      
      public var avatars:Array;
      
      public var showAvatar:int;
      
      public function WorldBossAllServerSortVO()
      {
         super();
         this.showAvatar = 0;
      }
   }
}

