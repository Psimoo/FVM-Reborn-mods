package com.aurora.ui.maogoutd.handbook.controller
{
   import a_4716.a_1730;
   import a_4728.a_1778;
   import a_4729.EventType;
   import a_4729.a_1789;
   import a_4752.GameStringManager;
   import a_4754.a_2161;
   import com.aurora.ui.maogoutd.ClientLog.MessageTipHandler;
   import com.aurora.ui.maogoutd.handbook.model.HandbookConfigData;
   import com.aurora.ui.maogoutd.recipes.datatype.RecipesAttrStruct;
   import com.aurora.ui.maogoutd.recipes.datatype.RecipesPostCardInfo;
   import com.aurora.ui.maogoutd.role.a_4463;
   import flash.utils.Dictionary;
   
   public class HandbookController
   {
      
      private static var m_pInstance:HandbookController;
      
      private var m_fUpdateBack:Function;
      
      private var m_fInitBack:Function;
      
      public var m_iCurrentTabIndex:int;
      
      public var m_iCurrentClassifyIndex:int;
      
      public var m_iSelectIndex:int;
      
      public var m_iConfigData:HandbookConfigData;
      
      public var m_arrAward:Array;
      
      public var m_arrProcess:Array;
      
      public var m_arrTotal:Array;
      
      public var m_dicCardGet:Dictionary;
      
      public var m_dicCardHave:Dictionary;
      
      public var m_stRole:a_4463;
      
      public var m_bUpdateList:Boolean;
      
      public var m_bCal:Boolean;
      
      public function HandbookController()
      {
         super();
         this.m_arrProcess = new Array();
         this.m_arrTotal = new Array();
         this.m_dicCardGet = new Dictionary();
         this.m_dicCardHave = new Dictionary();
         this.m_bCal = false;
      }
      
      public static function Get() : HandbookController
      {
         if(!m_pInstance)
         {
            m_pInstance = new HandbookController();
         }
         return m_pInstance;
      }
      
      public function a_3014() : void
      {
         a_1789.getInstance().addEventListener(EventType.HANDBOOK_AWARD,this.OnResponseHandbookAwardInfo);
         this.m_arrAward = new Array();
         this.m_bUpdateList = true;
         var i:int = 0;
         while(i < 4)
         {
            this.m_arrAward.push(0);
            i++;
         }
         i = 0;
         while(i < 4)
         {
            this.m_arrProcess.push(0);
            i++;
         }
         i = 0;
         while(i < 4)
         {
            this.m_arrTotal.push(0);
            i++;
         }
         this.m_iCurrentTabIndex = 0;
         this.m_iCurrentClassifyIndex = 0;
         this.m_iSelectIndex = 0;
         this.m_iConfigData = HandbookConfigData.Get();
         this.m_stRole = a_2161.e.GetCurrentRole() as a_4463;
         HandbookConfigData.Get().AnalysisSex(this.m_stRole.m_iUserSex);
         a_2161.e.RequestHandbookAward(this.m_stRole.m_iRoleUin,0,0);
         this.Calculate();
         this.m_fInitBack();
      }
      
      protected function OnResponseHandbookAwardInfo(e:a_1778) : void
      {
         var response:Object = e.dataObject;
         if(response.m_nResultID == 0)
         {
            if(response.m_OperatorType == 0)
            {
               this.m_arrAward[response.m_iType] = 1;
               this.m_fInitBack();
               MessageTipHandler.Get().a_3146("领取成功");
            }
            else
            {
               this.m_arrAward[response.m_iType] = response.m_iAwarded;
               this.m_fInitBack();
            }
         }
         else if(response.m_nResultID == 2096)
         {
            MessageTipHandler.Get().a_3146("重复领取");
         }
         else if(response.m_nResultID == 2097)
         {
            MessageTipHandler.Get().a_3146("卡片不足");
         }
      }
      
      public function Calculate() : void
      {
         var l:int = 0;
         var k:int = 0;
         this.m_iConfigData = HandbookConfigData.Get();
         this.m_stRole = a_2161.e.GetCurrentRole() as a_4463;
         var m_CurCards:Object = a_2161.e.GetTDCardsInfo();
         for(var i:int = 0; i < 4; i++)
         {
            this.m_arrProcess[i] = 0;
            this.m_arrTotal[i] = 0;
         }
         this.m_dicCardGet = new Dictionary();
         for(i = 0; i < this.m_iConfigData.m_vCardHandbook.length; i++)
         {
            ++this.m_arrTotal[this.m_iConfigData.m_vCardHandbook[i].iType - 1];
            l = 0;
            while(l < m_CurCards[0].length)
            {
               if(m_CurCards[0][l].CardID == this.m_iConfigData.m_vCardHandbook[i].iItemID)
               {
                  this.m_dicCardHave[this.m_iConfigData.m_vCardHandbook[i].iItemID] = true;
                  for(k = 1; k <= this.m_iConfigData.m_vCardHandbook[i].iTransType; k++)
                  {
                     this.m_dicCardHave[this.m_iConfigData.m_vCardHandbook[i - k].iItemID] = true;
                  }
                  if(this.m_iConfigData.m_vCardHandbook[i].iTransType_1 == 1)
                  {
                     for(k = 0; k < this.m_iConfigData.m_vCardHandbook.length; k++)
                     {
                        if(this.m_iConfigData.m_vCardHandbook[i].iTransID_1 == this.m_iConfigData.m_vCardHandbook[k].iTransID_1 && this.m_iConfigData.m_vCardHandbook[k].iTransType_1 == 2)
                        {
                           this.m_dicCardHave[this.m_iConfigData.m_vCardHandbook[k].iItemID] = true;
                        }
                     }
                  }
                  break;
               }
               l++;
            }
         }
         for(i = 0; i < this.m_iConfigData.m_vCardHandbook.length; i++)
         {
            if(this.m_dicCardHave[this.m_iConfigData.m_vCardHandbook[i].iItemID])
            {
               ++this.m_arrProcess[this.m_iConfigData.m_vCardHandbook[i].iType - 1];
            }
         }
         for(i = 0; i < this.m_iConfigData.m_vSuitHandbook.length; i++)
         {
            ++this.m_arrTotal[3];
            for(l = 0; l < this.m_stRole.a_951.length; l++)
            {
               if(this.m_stRole.a_951[l].CardID == this.m_iConfigData.m_vSuitHandbook[i].iItemID)
               {
                  this.m_dicCardHave[this.m_iConfigData.m_vSuitHandbook[i].iItemID] = true;
                  ++this.m_arrProcess[3];
                  break;
               }
            }
            for(l = 0; l < this.m_stRole.m_arrHeroItemID.length; l++)
            {
               if(this.m_stRole.m_arrHeroItemID[l].m_iItemID == this.m_iConfigData.m_vSuitHandbook[i].iItemID)
               {
                  this.m_dicCardHave[this.m_iConfigData.m_vSuitHandbook[i].iItemID] = true;
                  ++this.m_arrProcess[3];
                  break;
               }
            }
         }
      }
      
      public function SetBackCallUpdateView(funcUpdate:Function, funcInit:Function) : void
      {
         this.m_fUpdateBack = funcUpdate;
         this.m_fInitBack = funcInit;
      }
      
      public function SetIndex(iIndex:int) : void
      {
         this.m_iCurrentTabIndex = iIndex;
         if(this.m_iCurrentTabIndex == 0 || this.m_iCurrentTabIndex == 3)
         {
            this.m_iSelectIndex = 0;
         }
         else if(this.m_iCurrentTabIndex == 1)
         {
            this.m_iSelectIndex = this.m_arrTotal[0];
         }
         else if(this.m_iCurrentTabIndex == 2)
         {
            this.m_iSelectIndex = this.m_arrTotal[0] + this.m_arrTotal[1];
         }
         this.m_iCurrentClassifyIndex = 0;
         a_2161.e.RequestHandbookAward(this.m_stRole.m_iRoleUin,0,this.m_iCurrentTabIndex);
         this.a_3897();
      }
      
      public function SetClassifyIndex(iIndex:int) : void
      {
         this.m_iCurrentClassifyIndex = iIndex;
         this.a_3897();
      }
      
      public function SetSelectIndex(iIndex:int) : void
      {
         this.m_iSelectIndex = iIndex;
         this.m_bUpdateList = false;
         this.a_3897();
         this.m_bUpdateList = true;
      }
      
      public function AddString(iItemID:int) : String
      {
         this.Calculate();
         for(var i:int = 0; i < this.m_iConfigData.m_vCardHandbook.length; i++)
         {
            if(this.m_iConfigData.m_vCardHandbook[i].iItemID == iItemID && this.m_iConfigData.m_vCardHandbook[i].iNeedNum <= this.m_arrProcess[this.m_iConfigData.m_vCardHandbook[i].iType - 1])
            {
               if(this.m_iConfigData.m_vCardHandbook[i].iAddType == 1)
               {
                  return "攻速 +" + (this.m_iConfigData.m_vCardHandbook[i].iAddValue * 100).toString() + "%";
               }
               if(this.m_iConfigData.m_vCardHandbook[i].iAddType == 2)
               {
                  return "攻击力 +" + (this.m_iConfigData.m_vCardHandbook[i].iAddValue * 100).toString() + "%";
               }
               if(this.m_iConfigData.m_vCardHandbook[i].iAddType == 3)
               {
                  return "冷却 " + this.m_iConfigData.m_vCardHandbook[i].iAddValue.toString();
               }
               if(this.m_iConfigData.m_vCardHandbook[i].iAddType == 4)
               {
                  return "能耗 " + this.m_iConfigData.m_vCardHandbook[i].iAddValue.toString();
               }
               if(this.m_iConfigData.m_vCardHandbook[i].iAddType == 5)
               {
                  return "体力 +" + this.m_iConfigData.m_vCardHandbook[i].iAddValue.toString();
               }
               if(this.m_iConfigData.m_vCardHandbook[i].iAddType == 6)
               {
                  return "攻击力加成 +" + (this.m_iConfigData.m_vCardHandbook[i].iAddValue * 100).toString() + "%";
               }
            }
         }
         for(i = 0; i < this.m_iConfigData.m_vSuitHandbook.length; i++)
         {
            if(this.m_iConfigData.m_vSuitHandbook[i].iItemID == iItemID && this.m_iConfigData.m_vSuitHandbook[i].iNeedNum <= this.m_arrProcess[3])
            {
               return "体力 +" + this.m_iConfigData.m_vSuitHandbook[i].iAddValue.toString();
            }
         }
         return "无";
      }
      
      public function AddRecipe(iItemID:int) : RecipesPostCardInfo
      {
         var recipesPostInfo:RecipesPostCardInfo = null;
         var recipesAttrStruct:RecipesAttrStruct = null;
         if(this.m_bCal == false)
         {
            this.Calculate();
            this.m_bCal = true;
         }
         for(var i:int = 0; i < this.m_iConfigData.m_vCardHandbook.length; i++)
         {
            if(this.m_iConfigData.m_vCardHandbook[i].iItemID == iItemID && this.m_iConfigData.m_vCardHandbook[i].iNeedNum <= this.m_arrProcess[this.m_iConfigData.m_vCardHandbook[i].iType - 1])
            {
               if(this.m_iConfigData.m_vCardHandbook[i].iAddType == 1)
               {
                  recipesPostInfo = new RecipesPostCardInfo();
                  recipesPostInfo.m_aryAttrInfo = new Array();
                  recipesAttrStruct = new RecipesAttrStruct();
                  recipesAttrStruct.m_iAttrType = 6;
                  recipesAttrStruct.m_aryCardId = [iItemID.toString(16)];
                  recipesAttrStruct.m_iValue = this.m_iConfigData.m_vCardHandbook[i].iAddValue * 100;
                  recipesPostInfo.m_iRecipesId = 20000000 + i;
                  recipesPostInfo.m_aryAttrInfo.push(recipesAttrStruct);
                  return recipesPostInfo;
               }
               if(this.m_iConfigData.m_vCardHandbook[i].iAddType == 2)
               {
                  recipesPostInfo = new RecipesPostCardInfo();
                  recipesPostInfo.m_aryAttrInfo = new Array();
                  recipesAttrStruct = new RecipesAttrStruct();
                  recipesAttrStruct.m_iAttrType = 3;
                  recipesAttrStruct.m_aryCardId = [iItemID.toString(16)];
                  recipesAttrStruct.m_iValue = this.m_iConfigData.m_vCardHandbook[i].iAddValue * 100;
                  recipesPostInfo.m_iRecipesId = 20000000 + i;
                  recipesPostInfo.m_aryAttrInfo.push(recipesAttrStruct);
                  return recipesPostInfo;
               }
               if(this.m_iConfigData.m_vCardHandbook[i].iAddType == 3)
               {
                  recipesPostInfo = new RecipesPostCardInfo();
                  recipesPostInfo.m_aryAttrInfo = new Array();
                  recipesAttrStruct = new RecipesAttrStruct();
                  recipesAttrStruct.m_iAttrType = 8;
                  recipesAttrStruct.m_aryCardId = [iItemID.toString(16)];
                  recipesAttrStruct.m_iValue = -this.m_iConfigData.m_vCardHandbook[i].iAddValue * 10;
                  recipesPostInfo.m_iRecipesId = 20000000 + i;
                  recipesPostInfo.m_aryAttrInfo.push(recipesAttrStruct);
                  return recipesPostInfo;
               }
               if(this.m_iConfigData.m_vCardHandbook[i].iAddType == 4)
               {
                  recipesPostInfo = new RecipesPostCardInfo();
                  recipesPostInfo.m_aryAttrInfo = new Array();
                  recipesAttrStruct = new RecipesAttrStruct();
                  recipesAttrStruct.m_iAttrType = 10;
                  recipesAttrStruct.m_aryCardId = [iItemID.toString(16)];
                  recipesAttrStruct.m_iValue = -this.m_iConfigData.m_vCardHandbook[i].iAddValue;
                  recipesPostInfo.m_iRecipesId = 20000000 + i;
                  recipesPostInfo.m_aryAttrInfo.push(recipesAttrStruct);
                  return recipesPostInfo;
               }
               if(this.m_iConfigData.m_vCardHandbook[i].iAddType == 5)
               {
                  recipesPostInfo = new RecipesPostCardInfo();
                  recipesPostInfo.m_aryAttrInfo = new Array();
                  recipesAttrStruct = new RecipesAttrStruct();
                  recipesAttrStruct.m_iAttrType = 1;
                  recipesAttrStruct.m_aryCardId = [iItemID.toString(16)];
                  recipesAttrStruct.m_iValue = this.m_iConfigData.m_vSuitHandbook[i].iAddValue;
                  recipesPostInfo.m_iRecipesId = 20000000 + i;
                  recipesPostInfo.m_aryAttrInfo.push(recipesAttrStruct);
                  return recipesPostInfo;
               }
               if(this.m_iConfigData.m_vCardHandbook[i].iAddType == 6)
               {
                  recipesPostInfo = new RecipesPostCardInfo();
                  recipesPostInfo.m_aryAttrInfo = new Array();
                  recipesAttrStruct = new RecipesAttrStruct();
                  recipesAttrStruct.m_iAttrType = 9;
                  recipesAttrStruct.m_aryCardId = [iItemID.toString(16)];
                  recipesAttrStruct.m_iValue = this.m_iConfigData.m_vCardHandbook[i].iAddValue * 100;
                  recipesPostInfo.m_iRecipesId = 20000000 + i;
                  recipesPostInfo.m_aryAttrInfo.push(recipesAttrStruct);
                  return recipesPostInfo;
               }
            }
         }
         for(i = 0; i < this.m_iConfigData.m_vSuitHandbook.length; i++)
         {
            if(this.m_iConfigData.m_vSuitHandbook[i].iItemID == iItemID)
            {
               recipesPostInfo = new RecipesPostCardInfo();
               recipesPostInfo.m_aryAttrInfo = new Array();
               recipesAttrStruct = new RecipesAttrStruct();
               recipesAttrStruct.m_iAttrType = 2;
               recipesAttrStruct.m_aryCardId = ["0xF00001"];
               recipesAttrStruct.m_iValue = this.m_iConfigData.m_vSuitHandbook[i].iAddValue;
               recipesPostInfo.m_iRecipesId = 30000000 + i;
               recipesPostInfo.m_aryAttrInfo.push(recipesAttrStruct);
               return recipesPostInfo;
            }
         }
         return null;
      }
      
      public function CheckBag(iLimit:int) : Boolean
      {
         var openSize:int = int(a_2161.e.GetPackageOpenedNumByType(a_1730.card_slot_package_hero_item));
         var usedSize:int = int((a_2161.e.GetCardsByType(a_1730.card_slot_package_hero_item) as Array).length);
         usedSize += this.m_stRole.m_arrHeroItemID.length;
         if(openSize - usedSize < iLimit)
         {
            MessageTipHandler.Get().a_3146(GameStringManager.getInstance().getString(132106));
            return false;
         }
         openSize = int(a_2161.e.GetPackageOpenedNumByType(a_1730.card_slot_package_game_props));
         usedSize = int((a_2161.e.GetCardsByType(a_1730.card_slot_package_game_props) as Array).length);
         if(openSize - usedSize < iLimit)
         {
            MessageTipHandler.Get().a_3146(GameStringManager.getInstance().getString(132107));
            return false;
         }
         openSize = int(a_2161.e.GetPackageOpenedNumByType(a_1730.card_slot_package_game_card));
         usedSize = int((a_2161.e.GetCardsByType(a_1730.card_slot_package_game_card) as Array).length);
         if(openSize - usedSize < iLimit)
         {
            MessageTipHandler.Get().a_3146("防御卡背包空间不足");
            return false;
         }
         return true;
      }
      
      public function a_3897() : void
      {
         this.m_fUpdateBack();
      }
      
      public function Destory() : void
      {
         a_1789.getInstance().removeEventListener(EventType.HANDBOOK_AWARD,this.OnResponseHandbookAwardInfo);
      }
      
      public function GetAward() : void
      {
         if(this.CheckBag(2))
         {
            a_2161.e.RequestHandbookAward(this.m_stRole.m_iRoleUin,1,this.m_iCurrentTabIndex);
         }
      }
      
      public function GetNameByTransType(type:int) : String
      {
         switch(type)
         {
            case 0:
               return "基础卡";
            case 1:
               return "三转";
            case 2:
               return "四转";
            case 3:
               return "终极转职";
            default:
               return "";
         }
      }
   }
}

