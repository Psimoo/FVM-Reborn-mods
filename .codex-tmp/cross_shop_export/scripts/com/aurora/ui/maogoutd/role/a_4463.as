package com.aurora.ui.maogoutd.role
{
   import a_4715.EncrypIntEx;
   import a_4720.a_1749;
   import com.aurora.ui.maogoutd.handbook.controller.HandbookController;
   import com.aurora.ui.maogoutd.recipes.datatype.RecipesPostCardInfo;
   import flash.utils.Dictionary;
   
   public class a_4463
   {
      
      public var m_iRoleUin:int;
      
      public var m_iUserSex:int;
      
      public var m_szRoleName:String;
      
      public var m_cState:int;
      
      public var m_iRoleScoreEx:EncrypIntEx = new EncrypIntEx();
      
      public var m_szHeroItemString:String;
      
      public var m_arrHeroItemID:Array;
      
      public var a_951:Array;
      
      public var m_iRoleAttackEx:EncrypIntEx = new EncrypIntEx();
      
      public var m_iRoleDefense:int;
      
      public var m_byShowCard:int;
      
      public var m_nHeroItemCountEx:EncrypIntEx = new EncrypIntEx();
      
      public var m_dictHeroDetail:Dictionary;
      
      private var m_iGameScoreEx:EncrypIntEx = new EncrypIntEx();
      
      public var m_iGamePointEx:EncrypIntEx = new EncrypIntEx();
      
      public var m_iLogicServerID:int;
      
      public var m_iRoomID:int;
      
      public var m_iLastLoginTime:int;
      
      public var m_iVsExp:int;
      
      public var m_iVsScore:int;
      
      public function a_4463()
      {
         super();
         this.m_arrHeroItemID = [];
         this.a_951 = [];
         this.m_dictHeroDetail = new Dictionary();
         this.m_iGamePoint = -1;
         this.m_iRoleScore = -1;
      }
      
      public function get m_nHeroItemCount() : int
      {
         return this.m_nHeroItemCountEx.Value;
      }
      
      public function set m_nHeroItemCount(value:int) : void
      {
         this.m_nHeroItemCountEx.Value = value;
      }
      
      public function get m_iRoleAttack() : int
      {
         return this.m_iRoleAttackEx.Value;
      }
      
      public function set m_iRoleAttack(value:int) : void
      {
         this.m_iRoleAttackEx.Value = value;
      }
      
      public function get m_iRoleScore() : int
      {
         return this.m_iRoleScoreEx.Value;
      }
      
      public function set m_iRoleScore(value:int) : void
      {
         this.m_iRoleScoreEx.Value = value;
      }
      
      public function get m_iGameScore() : int
      {
         return this.m_iGameScoreEx.Value;
      }
      
      public function set m_iGameScore(value:int) : void
      {
         this.m_iGameScoreEx.Value = value;
      }
      
      public function get m_iGamePoint() : int
      {
         return this.m_iGamePointEx.Value;
      }
      
      public function set m_iGamePoint(value:int) : void
      {
         this.m_iGamePointEx.Value = value;
      }
      
      public function toAvatarContent() : String
      {
         var heroItem:a_4461 = null;
         var avatarID:String = "";
         if(this.m_arrHeroItemID != null)
         {
            for each(heroItem in this.m_arrHeroItemID)
            {
               avatarID += "|" + heroItem.toItemID();
            }
         }
         return avatarID;
      }
      
      public function formatItems(avatarItemsContent:String) : Array
      {
         var arrItemContent:Array = null;
         var itemContent:String = null;
         var heroItem:a_4461 = null;
         var arrHeroItemID:Array = [];
         if(avatarItemsContent != null)
         {
            arrItemContent = avatarItemsContent.split("|");
            for each(itemContent in arrItemContent)
            {
               if(itemContent != null && itemContent.length > 0)
               {
                  heroItem = new a_4461();
                  heroItem.format(itemContent);
                  arrHeroItemID.push(heroItem);
               }
            }
         }
         return arrHeroItemID;
      }
      
      public function get RoleDefense() : int
      {
         var avatarItem:a_4461 = null;
         var addLife:RecipesPostCardInfo = null;
         this.m_iRoleDefense = 0;
         for each(avatarItem in this.m_arrHeroItemID)
         {
            this.m_iRoleDefense += avatarItem.m_iTypeValue;
            addLife = HandbookController.Get().AddRecipe(avatarItem.m_iItemID);
            if(Boolean(addLife) && Boolean(addLife.m_aryAttrInfo != null) && addLife.m_aryAttrInfo.length > 0)
            {
               if(addLife.m_aryAttrInfo[0].m_iAttrType == 2)
               {
                  this.m_iRoleDefense += addLife.m_aryAttrInfo[0].m_iValue;
               }
            }
         }
         return this.m_iRoleDefense;
      }
      
      public function get ShowCard() : int
      {
         return this.m_byShowCard & a_1749.enmGameRole_ShowCard;
      }
      
      public function set ShowCard(iShowCard:int) : void
      {
         this.m_byShowCard = iShowCard | this.m_byShowCard & 0x3C;
      }
      
      public function get ShowEntiret() : int
      {
         return this.m_byShowCard & a_1749.enmGameRole_ShowEntiret;
      }
      
      public function set ShowEntiret(iShowEntiret:int) : void
      {
         this.m_byShowCard = iShowEntiret | this.m_byShowCard & 0x23;
      }
      
      public function get ShowAnotherEntiret() : int
      {
         return this.m_byShowCard & 0x10;
      }
      
      public function set ShowAnotherEntiret(iShowAnotherEntiret:int) : void
      {
         this.m_byShowCard = iShowAnotherEntiret | this.m_byShowCard & 0x0B;
      }
   }
}

