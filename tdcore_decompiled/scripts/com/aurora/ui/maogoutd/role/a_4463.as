package com.aurora.ui.maogoutd.role
{
   import a_4715.EncrypIntEx;
   import a_4715.EncrypNumber;
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
      
      public var m_iGamePointEx:EncrypNumber = new EncrypNumber();
      
      public var m_iLogicServerID:int;
      
      public var m_iRoomID:int;
      
      public var m_iLastLoginTime:int;
      
      public var m_iVsExp:int;
      
      public var m_iVsScore:int;
      
      public var a_1082:int;
      
      public var m_cConsortiaBuy:int;
      
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
      
      public function get m_iGamePoint() : Number
      {
         return Math.round(this.m_iGamePointEx.Value);
      }
      
      public function set m_iGamePoint(value:Number) : void
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
         var isSuit:Boolean = false;
         this.m_iRoleDefense = 0;
         for each(avatarItem in this.m_arrHeroItemID)
         {
            this.m_iRoleDefense += avatarItem.m_iTypeValue;
            addLife = HandbookController.Get().AddRecipe(avatarItem.m_iItemID);
            if(Boolean(addLife) && addLife.m_aryAttrInfo != null && addLife.m_aryAttrInfo.length > 0)
            {
               if(addLife.m_aryAttrInfo[0].m_iAttrType == 2)
               {
                  isSuit = false;
                  if(addLife.m_aryAttrInfo[0].m_aryCardId != null && addLife.m_aryAttrInfo[0].m_aryCardId.length > 0)
                  {
                     isSuit = addLife.m_aryAttrInfo[0].m_aryCardId[0] == "0xF00001";
                  }
                  if(isSuit)
                  {
                     if(this.ShowEntiret == a_1749.enmGameRole_ShowEntiret)
                     {
                        this.m_iRoleDefense += addLife.m_aryAttrInfo[0].m_iValue;
                     }
                  }
                  else
                  {
                     this.m_iRoleDefense += addLife.m_aryAttrInfo[0].m_iValue;
                  }
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
         this.m_byShowCard = iShowCard | this.m_byShowCard & 0xFC;
      }
      
      public function get ShowEntiret() : int
      {
         return this.m_byShowCard & a_1749.enmGameRole_ShowEntiret;
      }
      
      public function set ShowEntiret(iShowEntiret:int) : void
      {
         this.m_byShowCard = this.m_byShowCard & 0xF3 | (iShowEntiret == 4 ? 4 : 0);
      }
      
      public function get ShowAnotherEntiret() : int
      {
         return this.m_byShowCard & 0x10;
      }
      
      public function set ShowAnotherEntiret(iShowAnotherEntiret:int) : void
      {
         this.m_byShowCard = this.m_byShowCard & 0xCF | (iShowAnotherEntiret == 16 ? 16 : 0);
      }
      
      public function get ShowGemoSuit() : int
      {
         return this.m_byShowCard & 0x40;
      }
      
      public function set ShowGemoSuit(iShowGemoSuit:int) : void
      {
         this.m_byShowCard = this.m_byShowCard & 0x3F | (iShowGemoSuit == 64 ? 64 : 0);
      }
      
      public function get SuitShowType() : int
      {
         if(this.m_byShowCard & 4)
         {
            return 1;
         }
         if(this.m_byShowCard & 0x40)
         {
            return 3;
         }
         if(this.m_byShowCard & 0x10)
         {
            return 2;
         }
         return 0;
      }
   }
}

