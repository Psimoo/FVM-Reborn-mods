package com.aurora.ui.maogoutd.worldBossLevel.vo
{
   import com.aurora.ui.maogoutd.component.award.GridItemData;
   
   public class WorldBossLevelDivideMemberVO
   {
      
      public var roleId:int;
      
      public var roleName:String;
      
      public var roleSex:int;
      
      public var roleRank:int;
      
      public var isLeader:Boolean;
      
      public var cards:Vector.<GridItemData>;
      
      public function WorldBossLevelDivideMemberVO()
      {
         super();
         this.cards = new Vector.<GridItemData>();
      }
   }
}

