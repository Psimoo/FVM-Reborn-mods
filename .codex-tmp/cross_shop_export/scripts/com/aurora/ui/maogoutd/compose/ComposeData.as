package com.aurora.ui.maogoutd.compose
{
   import a_4723.a_1767;
   import a_4752.a_2027;
   import a_4754.a_2161;
   import a_4781.Tool;
   import com.aurora.ui.maogoutd.component.a_3228;
   import com.aurora.ui.maogoutd.role.a_4461;
   import com.aurora.ui.maogoutd.role.a_4463;
   import flash.events.EventDispatcher;
   import flash.utils.Dictionary;
   
   public class ComposeData extends EventDispatcher
   {
      
      private static var _instance:ComposeData;
      
      private var _propsCardData:Array;
      
      private var _defCardData:Array;
      
      private var _equipmentCardData:Array;
      
      private var _specialCardData:Array;
      
      private var _dictPropsCardCount:Dictionary;
      
      public function ComposeData(v:PrivateClass)
      {
         super(null);
      }
      
      public static function getInstance() : ComposeData
      {
         if(!_instance)
         {
            _instance = new ComposeData(new PrivateClass());
         }
         return _instance;
      }
      
      public function initData() : void
      {
         var roleData:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         var cardsData:Array = a_2161.e.GetTDCardsInfo() as Array;
         if(!roleData || !cardsData)
         {
            return;
         }
         this.freeData();
         this.setDefCardData(cardsData[0]);
         this.setPropsCardData(cardsData[1]);
         this.setSpecialCardData(cardsData[2]);
         this.setEquipmentCardData(roleData.m_dictHeroDetail);
         this.setDictPropsCardCount();
      }
      
      public function freeData() : void
      {
         var k:* = undefined;
         if(Boolean(this._propsCardData) && this._propsCardData.length > 0)
         {
            this._propsCardData.splice(0);
         }
         if(Boolean(this._defCardData) && this._defCardData.length > 0)
         {
            this._defCardData.splice(0);
         }
         if(Boolean(this._equipmentCardData) && this._equipmentCardData.length > 0)
         {
            this._equipmentCardData.splice(0);
         }
         if(this._dictPropsCardCount)
         {
            for(k in this._dictPropsCardCount)
            {
               delete this._dictPropsCardCount[k];
            }
         }
      }
      
      public function resetCardCount() : void
      {
         var cardAttr:a_3228 = null;
         if(!this._dictPropsCardCount)
         {
            return;
         }
         if(!this._propsCardData || this._propsCardData.length == 0)
         {
            return;
         }
         var i:int = 0;
         var n:int = int(this._propsCardData.length);
         while(i < n)
         {
            cardAttr = this._propsCardData[i] as a_3228;
            if(cardAttr)
            {
               if(this._dictPropsCardCount[cardAttr.CardID] != null)
               {
                  cardAttr.CardCount = this._dictPropsCardCount[cardAttr.CardID];
               }
            }
            i++;
         }
      }
      
      public function GetPropCardCount(iCardID:int) : int
      {
         var cardAttr:a_3228 = null;
         var iCnt:int = 0;
         var i:int = 0;
         var n:int = int(this._propsCardData.length);
         while(i < n)
         {
            cardAttr = this._propsCardData[i] as a_3228;
            if(Boolean(cardAttr) && cardAttr.CardID == iCardID)
            {
               iCnt += cardAttr.CardCount;
            }
            i++;
         }
         return iCnt;
      }
      
      public function get propsCardData() : Array
      {
         return this._propsCardData;
      }
      
      public function get defCardData() : Array
      {
         return this._defCardData;
      }
      
      public function get equipmentCardData() : Array
      {
         return this._equipmentCardData;
      }
      
      public function get specialCardData() : Array
      {
         return this._specialCardData;
      }
      
      public function get dictPropsCardCount() : Dictionary
      {
         return this._dictPropsCardCount;
      }
      
      public function updateDataByBuyGoods(response:Object) : void
      {
         var obj:Object = null;
         var prevCardCount:int = 0;
         if(response.m_nResultID != 0)
         {
            return;
         }
         var arrAdd:Array = [];
         var i:int = 0;
         var n:int = int(response.m_aryCardData.length);
         while(i < n)
         {
            obj = response.m_aryCardData[i];
            prevCardCount = 0;
            if(this._dictPropsCardCount[obj.m_iCardID] != undefined)
            {
               prevCardCount = int(this._dictPropsCardCount[obj.m_iCardID]);
            }
            arrAdd.push({
               "m_iID":obj.m_iCardID,
               "m_iSequence":obj.m_nCardCount - prevCardCount
            });
            i++;
         }
         this.addPropsCardAttr(this._propsCardData,arrAdd);
      }
      
      public function updateDataByMakeCard(response:Object) : void
      {
         var newCardInfo:Object = {};
         newCardInfo.m_iCardID = response.m_stNewCardInfo.m_iCardID;
         newCardInfo.m_iCardSeq = response.m_stNewCardInfo.m_iCardSeq;
         newCardInfo.m_nCardCount = response.m_stNewCardInfo.m_nCardCount;
         newCardInfo.m_nCardUsedCount = response.m_stNewCardInfo.m_nCardUsedCount;
         newCardInfo.m_cTimeFlag = response.m_stNewCardInfo.m_cTimeFlag;
         newCardInfo.m_iExpiredTime = response.m_stNewCardInfo.m_iExpiredTime;
         newCardInfo.m_cIsBind = response.m_stNewCardInfo.m_cIsBind;
         newCardInfo.m_nUpdateMode = response.m_stNewCardInfo.m_nUpdateMode;
         newCardInfo.m_iUsedTime = response.m_stNewCardInfo.m_iUsedTime;
         newCardInfo.m_iDeltaTime = response.m_stNewCardInfo.m_iDeltaTime;
         newCardInfo.m_iTypeValue = response.m_cLevel;
         var b:Boolean = this.addDefCardAttr(this._defCardData,[newCardInfo]);
         if(b)
         {
            this._defCardData.sortOn(["DefCardType","CardID","TypeValue","IsExpiredTime"],[Array.NUMERIC,Array.NUMERIC,Array.DESCENDING,Array.NUMERIC]);
         }
         var arrTemp:Array = response.m_arrComposeMaterial.concat(response.m_arrAssMaterial);
         this.delPropsCardAttr(this._propsCardData,arrTemp);
      }
      
      public function updateDataByTransferCard(response:Object) : void
      {
         var newCardInfo:Object = null;
         var b:Boolean = false;
         var arrTemp:Array = null;
         if(response.m_nResultID == 0)
         {
            newCardInfo = {};
            newCardInfo.m_iCardID = response.m_stNewCardInfo.m_iCardID;
            newCardInfo.m_iCardSeq = response.m_stNewCardInfo.m_iCardSeq;
            newCardInfo.m_nCardCount = response.m_stNewCardInfo.m_nCardCount == 0 ? 1 : response.m_stNewCardInfo.m_nCardCount;
            newCardInfo.m_nCardUsedCount = response.m_stNewCardInfo.m_nCardUsedCount;
            newCardInfo.m_cTimeFlag = response.m_stNewCardInfo.m_cTimeFlag;
            newCardInfo.m_iExpiredTime = response.m_stNewCardInfo.m_iExpiredTime;
            newCardInfo.m_cIsBind = response.m_stNewCardInfo.m_cIsBind;
            newCardInfo.m_nUpdateMode = response.m_stNewCardInfo.m_nUpdateMode;
            newCardInfo.m_iUsedTime = response.m_stNewCardInfo.m_iUsedTime;
            newCardInfo.m_iDeltaTime = response.m_stNewCardInfo.m_iDeltaTime;
            newCardInfo.m_iTypeValue = response.m_iCardLevel;
            b = this.addDefCardAttr(this._defCardData,[newCardInfo]);
            if(b)
            {
               this._defCardData.sortOn(["DefCardType","CardID","TypeValue","IsExpiredTime"],[Array.NUMERIC,Array.NUMERIC,Array.DESCENDING,Array.NUMERIC]);
            }
            this.delDefCardAttr(this._defCardData,[{
               "m_iID":response.m_iCardID,
               "m_iSequence":response.m_iCardSeq
            }]);
         }
         if(response.m_nResultID == 0 || response.m_cBuyInsuranceFlag != 1)
         {
            arrTemp = response.m_arrMaterial;
            this.delSpecialCardAttr(this._specialCardData,arrTemp);
         }
      }
      
      public function updateDataByRemakeCard(response:Object) : void
      {
         var mainCardAttr:a_3228 = this.getCardAttr(this._defCardData,response.m_stNewCardInfo.m_iID,response.m_stNewCardInfo.m_iSequence);
         if(!mainCardAttr)
         {
            throw new Error("出错了，没有找到对应的主卡！");
         }
         if(response.m_iValidTime < 0)
         {
            mainCardAttr.ExpiredTime = response.m_iValidTime;
         }
         else
         {
            mainCardAttr.ExpiredTime = a_1767.getInstance().SystemTime + response.m_iValidTime;
         }
         var arrTemp:Array = response.m_arrSub.concat(response.m_arrAssMaterial);
         this.delPropsCardAttr(this._propsCardData,arrTemp);
      }
      
      public function updateDataByUpgradeCard(response:Object) : void
      {
         var mainCardAttr:a_3228 = this.getCardAttr(this._defCardData,response.m_stNewCardInfo.m_iID,response.m_stNewCardInfo.m_iSequence);
         if(!mainCardAttr)
         {
            throw new Error("出错了，没有找到对应的主卡！");
         }
         mainCardAttr.TypeValue = response.m_cLevel;
         if((response.m_iPosition & 0x0F00) == 256)
         {
            mainCardAttr.IsBind = 1;
         }
         if(response.m_nResult == 0 || response.m_nDisableConsortiaExtra != 1)
         {
            this.delDefCardAttr(this._defCardData,response.m_arrSub);
         }
         this.delPropsCardAttr(this._propsCardData,response.m_arrAssMaterial);
      }
      
      public function updateDataByUpgradeGem(response:Object) : void
      {
         var i:int = 0;
         var n:int = 0;
         var obj:Object = null;
         var mainCardAttr:a_3228 = this.getCardAttr(this._equipmentCardData,response.m_stNewCardInfo.m_iID,response.m_stNewCardInfo.m_iSequence);
         if(!mainCardAttr)
         {
            throw new Error("出错了，没有找到对应的主卡！");
         }
         if(!mainCardAttr.m_arrExtraAttr)
         {
            mainCardAttr.m_arrExtraAttr = [{
               "m_cItemType":10,
               "m_iItemAdd":response.m_cLevel,
               "m_iSkillID":mainCardAttr.CardID
            }];
         }
         else
         {
            i = 0;
            n = int(mainCardAttr.m_arrExtraAttr.length);
            while(i < n)
            {
               obj = mainCardAttr.m_arrExtraAttr[i];
               if(obj.m_cItemType == 10)
               {
                  obj.m_iItemAdd = response.m_cLevel;
                  break;
               }
               i++;
            }
         }
         var arrTemp:Array = response.m_arrSub.concat(response.m_arrAssMaterial);
         if((response.m_iPosition & 0x0F00) == 256)
         {
            mainCardAttr.IsBind = 1;
         }
         this.delPropsCardAttr(this._propsCardData,arrTemp);
      }
      
      public function updateDataByUpgradeWeapon(response:Object) : void
      {
         var mainCardAttr:a_3228 = this.getCardAttr(this._equipmentCardData,response.m_stNewCardInfo.m_iID,response.m_stNewCardInfo.m_iSequence);
         if(!mainCardAttr)
         {
            throw new Error("出错了，没有找到对应的主卡！");
         }
         this.updateCardAttrExtraAttr(mainCardAttr,response.m_iPosition,["m_iItemAdd"],[response.m_cLevel]);
         var arrTemp:Array = response.m_arrSub.concat(response.m_arrAssMaterial);
         this.delPropsCardAttr(this._propsCardData,arrTemp);
      }
      
      public function updateDataBySlotItem(response:Object) : void
      {
         var obj:Object = null;
         var mainCardAttr:a_3228 = this.getCardAttr(this._equipmentCardData,response.m_iItemID,response.m_iItemSeq);
         if(!mainCardAttr)
         {
            throw new Error("出错了，没有找到对应的主卡！");
         }
         mainCardAttr.m_nItemSlotNum = response.m_nSlotCount;
         mainCardAttr.IsBind = 1;
         var arrTemp:Array = [];
         var i:int = 0;
         var n:int = int(response.m_astDelInfo.length);
         while(i < n)
         {
            obj = response.m_astDelInfo[i];
            arrTemp.push({
               "m_iID":obj.m_iDelID,
               "m_iSequence":obj.m_nDelCount
            });
            i++;
         }
         this.delPropsCardAttr(this._propsCardData,arrTemp);
      }
      
      public function updateDataByGemInlay(response:Object) : void
      {
         var obj:Object = null;
         var mainCardAttr:a_3228 = this.getCardAttr(this._equipmentCardData,response.m_iItemID,response.m_iItemSeq);
         if(!mainCardAttr)
         {
            throw new Error("出错了，没有找到对应的主卡！");
         }
         this.addCardAttrExtraAttr(mainCardAttr,response.m_astGemInlay);
         var arrDel:Array = [];
         var i:int = 0;
         var n:int = int(response.m_astGemInlay.length);
         while(i < n)
         {
            obj = response.m_astGemInlay[i];
            arrDel.push({
               "m_iID":obj.m_iGemID,
               "m_iSequence":obj.m_iGemSeq
            });
            i++;
         }
         this.delDefCardAttr(this._equipmentCardData,arrDel);
      }
      
      public function updateDataByGemUnload(response:Object) : void
      {
         var i:int = 0;
         var n:int = 0;
         var obj:Object = null;
         var mainCardAttr:a_3228 = this.getCardAttr(this._equipmentCardData,response.m_iItemID,response.m_iItemSeq);
         if(!mainCardAttr)
         {
            throw new Error("出错了，没有找到对应的主卡！");
         }
         this.delCardAttrExtraAttr(mainCardAttr,response.m_iPosition);
         var arrDel:Array = [];
         i = 0;
         n = int(response.m_nDelCount);
         while(i < n)
         {
            obj = response.m_astDelInfo[i];
            arrDel.push({
               "m_iID":obj.m_iDelID,
               "m_iSequence":obj.m_nDelCount
            });
            i++;
         }
         this.delPropsCardAttr(this._propsCardData,arrDel);
         var arrAdd:Array = [];
         i = 0;
         n = int(response.m_nAddCount);
         while(i < n)
         {
            obj = response.m_astAddInfo[i];
            arrAdd.push({
               "m_iCardID":obj.m_iDelID,
               "m_iCardSeq":obj.m_iDelSeq,
               "m_iTypeValue":obj.m_nDelCount,
               "m_cIsBind":1
            });
            i++;
         }
         this.addDefCardAttr(this._equipmentCardData,arrAdd);
      }
      
      public function updateDataByGemDecompose(response:Object) : void
      {
         var obj:Object = null;
         this.delDefCardAttr(this._equipmentCardData,[{
            "m_iID":response.m_iItemID,
            "m_iSequence":response.m_iItemSeq
         }]);
         var arrTemp:Array = [];
         var i:int = 0;
         var n:int = int(response.m_astDecomposeInfo.length);
         while(i < n)
         {
            obj = response.m_astDecomposeInfo[i];
            arrTemp.push({
               "m_iID":obj.m_iCardID,
               "m_iSequence":obj.m_nCardCount,
               "m_cIsBind":obj.m_cIsBind
            });
            i++;
         }
         this.addPropsCardAttr(this._propsCardData,arrTemp);
      }
      
      public function DelItemByCrystal(stCardAtrr:a_3228) : void
      {
         this.delDefCardAttr(this._equipmentCardData,[{
            "m_iID":stCardAtrr.CardID,
            "m_iSequence":stCardAtrr.CardSeq
         }]);
      }
      
      public function UpdateDataByCrystal(arrAddItem:Array, arrDelProp:Array) : void
      {
         var obj:Object = null;
         var arrAdd:Array = [];
         var arrDel:Array = [];
         while(arrDelProp.length > 0)
         {
            obj = {};
            arrDel[arrDelProp.length - 1] = obj;
            obj.m_iID = arrDelProp.pop();
            obj.m_iSequence = 0;
         }
         while(arrAddItem.length > 0)
         {
            arrAdd.push({
               "m_iCardID":arrAddItem.pop(),
               "m_iCardSeq":int(4294967295 * Math.random()),
               "m_iTypeValue":10,
               "m_cIsBind":1
            });
         }
         this.addDefCardAttr(this._equipmentCardData,arrAdd);
         this.delPropsCardAttr(this._propsCardData,arrDel);
      }
      
      public function UpdateDataByCrystalUpgrade(stCardAttr:a_3228, iStoneID:int, iCont:int, iLevel:int) : void
      {
         var mainCardAttr:a_3228 = this.getCardAttr(this._equipmentCardData,stCardAttr.CardID,stCardAttr.CardSeq);
         stCardAttr.m_arrExtraAttr = [{
            "m_cItemType":10,
            "m_iItemAdd":iLevel
         }];
         stCardAttr.DictExtraAttr[10] = iLevel;
         mainCardAttr.m_arrExtraAttr = [{
            "m_cItemType":10,
            "m_iItemAdd":iLevel
         }];
         mainCardAttr.DictExtraAttr[10] = iLevel;
         this.updateCardAttrExtraAttr(mainCardAttr,mainCardAttr.CardPositionID,["m_iItemAdd"],[iLevel]);
         var obj:Object = {};
         obj.m_iID = iStoneID;
         obj.m_iSequence = iCont;
         this.delPropsCardAttr(this._propsCardData,[obj]);
      }
      
      public function getCardAttr(arrData:Array, CardID:int, CardSeq:int) : a_3228
      {
         var cardAttr:a_3228 = null;
         if(!arrData || arrData.length == 0)
         {
            return null;
         }
         var i:int = 0;
         var n:int = int(arrData.length);
         while(i < n)
         {
            cardAttr = arrData[i];
            if(cardAttr.CardID == CardID && cardAttr.CardSeq == CardSeq)
            {
               return cardAttr;
            }
            i++;
         }
         return null;
      }
      
      private function setPropsCardData(arrOrgData:Array) : void
      {
         this._propsCardData = this.cardAttrClone(arrOrgData);
         this._propsCardData.sortOn(["CardID","CardSeq"],[Array.NUMERIC | Array.DESCENDING,Array.NUMERIC]);
      }
      
      private function setDefCardData(arrOrgData:Array) : void
      {
         this._defCardData = this.cardAttrClone(arrOrgData);
         this._defCardData.sortOn(["DefCardType","CardID","TypeValue","IsExpiredTime"],[Array.NUMERIC,Array.NUMERIC,Array.DESCENDING,Array.NUMERIC]);
      }
      
      private function setEquipmentCardData(dictOrgData:Dictionary) : void
      {
         var bAbleSlot:Boolean = false;
         var iAbleIndex:int = 0;
         var iAbleItemId:int = 0;
         var heroItem:a_4461 = null;
         var CardID:int = 0;
         var tempID:int = 0;
         var cardAttr:a_3228 = null;
         this._equipmentCardData = [];
         var aryCanSlotItem:Array = ComposeConfig.getInstance().GetCanSlotItem();
         for each(heroItem in dictOrgData)
         {
            CardID = heroItem.m_iItemID;
            tempID = CardID & 0xFFF00000;
            bAbleSlot = false;
            for(iAbleIndex = 0; iAbleIndex < aryCanSlotItem.length; iAbleIndex++)
            {
               iAbleItemId = parseInt(aryCanSlotItem[iAbleIndex]);
               if(tempID == iAbleItemId || 343932928 == tempID || 344981504 == tempID)
               {
                  bAbleSlot = true;
                  break;
               }
            }
            if(bAbleSlot)
            {
               cardAttr = new a_3228();
               cardAttr.CardCount = heroItem.m_nItemCount;
               cardAttr.CardID = heroItem.m_iItemID;
               cardAttr.CardPositionID = heroItem.m_nItemPosition;
               cardAttr.CardSeq = heroItem.m_iItemSeq;
               cardAttr.IsBind = heroItem.m_cIsBind;
               cardAttr.ExpiredTime = heroItem.m_iUsedTime;
               cardAttr.Type = heroItem.m_iType;
               cardAttr.TypeValue = heroItem.m_iTypeValue;
               cardAttr.DeltaTime = heroItem.m_iDeltaTime;
               cardAttr.DictExtraAttr = Tool.a_4653(heroItem.m_dictExtraAttr) as Dictionary;
               cardAttr.m_arrExtraAttr = Tool.a_4653(heroItem.m_arrExtraAttr) as Array;
               cardAttr.m_nItemSlotNum = heroItem.m_nItemSlotNum;
               this._equipmentCardData.push(cardAttr);
            }
         }
         if(this._equipmentCardData.length > 0)
         {
            this._equipmentCardData.sortOn(["CardID","CardSeq"],[Array.NUMERIC | Array.DESCENDING,Array.NUMERIC]);
         }
      }
      
      private function setSpecialCardData(arrOrgData:Array) : void
      {
         this._specialCardData = this.cardAttrClone(arrOrgData);
         this._specialCardData.sortOn(["CardID","CardSeq"],[Array.NUMERIC | Array.DESCENDING,Array.NUMERIC]);
      }
      
      private function setDictPropsCardCount() : void
      {
         var cardAttr:a_3228 = null;
         if(!this._dictPropsCardCount)
         {
            this._dictPropsCardCount = new Dictionary();
         }
         var i:int = 0;
         var n:int = int(this._propsCardData.length);
         while(i < n)
         {
            cardAttr = this._propsCardData[i] as a_3228;
            if(cardAttr)
            {
               this._dictPropsCardCount[cardAttr.CardID] = cardAttr.CardCount;
            }
            i++;
         }
      }
      
      private function updateCardAttrExtraAttr(cardAttr:a_3228, position:int, props:Array, values:Array) : void
      {
         var extraAttr:Object = null;
         var i:int = 0;
         var n:int = 0;
         if(!cardAttr || !props || props.length == 0)
         {
            return;
         }
         var arrExtraAttr:Array = cardAttr.m_arrExtraAttr;
         if(!arrExtraAttr || arrExtraAttr.length == 0)
         {
            return;
         }
         i = 0;
         n = int(arrExtraAttr.length);
         while(i < n)
         {
            extraAttr = arrExtraAttr[i];
            if(11 == extraAttr.m_cItemType)
            {
               if(extraAttr.m_iPosition == position)
               {
                  break;
               }
            }
            else if(10 == extraAttr.m_cItemType)
            {
               if(extraAttr.m_iPosition == position)
               {
                  break;
               }
            }
            i++;
         }
         if(extraAttr)
         {
            i = 0;
            n = int(props.length);
            while(i < n)
            {
               extraAttr[props[i]] = values[i];
               i++;
            }
         }
      }
      
      private function delCardAttrExtraAttr(cardAttr:a_3228, position:int) : void
      {
         var extraAttr:Object = null;
         if(!cardAttr)
         {
            return;
         }
         var arrExtraAttr:Array = cardAttr.m_arrExtraAttr;
         if(!arrExtraAttr || arrExtraAttr.length == 0)
         {
            return;
         }
         var i:int = 0;
         var n:int = int(arrExtraAttr.length);
         while(i < n)
         {
            extraAttr = arrExtraAttr[i];
            if(11 == extraAttr.m_cItemType)
            {
               if(extraAttr.m_iPosition == position)
               {
                  arrExtraAttr.splice(i,1);
                  break;
               }
            }
            i++;
         }
      }
      
      private function addCardAttrExtraAttr(cardAttr:a_3228, arrExtraAttr:Array) : void
      {
         var obj:Object = null;
         var extraAttr:Object = null;
         if(!cardAttr || !arrExtraAttr || arrExtraAttr.length == 0)
         {
            return;
         }
         var arrExtraAttr2:Array = cardAttr.m_arrExtraAttr;
         if(!arrExtraAttr2)
         {
            arrExtraAttr2 = [];
            cardAttr.m_arrExtraAttr = arrExtraAttr2;
         }
         var i:int = 0;
         var n:int = int(arrExtraAttr.length);
         while(i < n)
         {
            obj = {};
            extraAttr = arrExtraAttr[i];
            obj.m_cItemType = extraAttr.m_cAttrType;
            obj.m_iItemAdd = extraAttr.m_iAttrLevel;
            obj.m_iSkillID = extraAttr.m_iGemID;
            obj.m_iPosition = extraAttr.m_iPosition;
            arrExtraAttr2.push(obj);
            i++;
         }
      }
      
      private function addDefCardAttr(arrTarget:Array, arrAdd:Array) : Boolean
      {
         var m_dictDesc:Dictionary = null;
         var i:int = 0;
         var n:int = 0;
         var obj:Object = null;
         var cardAttr:a_3228 = null;
         var b:Boolean = Boolean(arrAdd) && arrAdd.length > 0;
         if(b)
         {
            m_dictDesc = a_2027.getInstance().m_dictDesc;
            i = 0;
            n = int(arrAdd.length);
            while(i < n)
            {
               obj = arrAdd[i];
               cardAttr = new a_3228();
               cardAttr.CardID = obj.m_iCardID;
               cardAttr.CardSeq = obj.m_iCardSeq;
               if(obj.m_nCardCount != undefined)
               {
                  cardAttr.CardCount = obj.m_nCardCount;
               }
               if(obj.m_nCardUsedCount != undefined)
               {
                  cardAttr.UsedCount = obj.m_nCardUsedCount;
               }
               if(obj.m_iUsedTime != undefined)
               {
                  cardAttr.ExpiredTime = obj.m_iUsedTime;
               }
               if(obj.m_cIsBind != undefined)
               {
                  cardAttr.IsBind = obj.m_cIsBind;
               }
               if(obj.m_cIsBind != undefined)
               {
                  cardAttr.IsBind = obj.m_cIsBind;
               }
               if(obj.m_iDeltaTime != undefined)
               {
                  cardAttr.DeltaTime = obj.m_iDeltaTime;
               }
               if(obj.m_iType != undefined)
               {
                  cardAttr.Type = obj.m_iType;
               }
               if(obj.m_iTypeValue != undefined)
               {
                  cardAttr.TypeValue = obj.m_iTypeValue;
                  if(PackagesManager.getCardType(obj.m_iCardID) == ConstantCompose.CARD_TYPE_GEM)
                  {
                     cardAttr.m_arrExtraAttr = [{
                        "m_cItemType":10,
                        "m_iItemAdd":obj.m_iTypeValue
                     }];
                  }
               }
               if(m_dictDesc)
               {
                  obj = m_dictDesc[cardAttr.CardID];
                  if(obj)
                  {
                     cardAttr.UseNumber = obj.Use;
                     cardAttr.Name = obj.Name;
                  }
                  else
                  {
                     cardAttr.UseNumber = "0";
                  }
               }
               arrTarget.push(cardAttr);
               i++;
            }
            b = true;
         }
         return b;
      }
      
      private function delDefCardAttr(arrTarget:Array, arrDel:Array) : Boolean
      {
         var i:int = 0;
         var n:int = 0;
         var obj:Object = null;
         var j:int = 0;
         var l:int = 0;
         var cardAttr:a_3228 = null;
         var b:Boolean = Boolean(arrDel) && arrDel.length > 0;
         if(b)
         {
            i = 0;
            n = int(arrDel.length);
            while(i < n)
            {
               obj = arrDel[i];
               j = 0;
               l = int(arrTarget.length);
               while(j < l)
               {
                  cardAttr = arrTarget[j];
                  if(cardAttr.CardID == obj.m_iID && cardAttr.CardSeq == obj.m_iSequence)
                  {
                     arrTarget.splice(j,1);
                     break;
                  }
                  j++;
               }
               i++;
            }
            b = true;
         }
         return b;
      }
      
      private function addPropsCardAttr(arrTarget:Array, arrAdd:Array) : Boolean
      {
         var m_dictDesc:Dictionary = null;
         var i:int = 0;
         var n:int = 0;
         var cardAttr:a_3228 = null;
         var obj:Object = null;
         var b2:Boolean = false;
         var j:int = 0;
         var l:int = 0;
         var b:Boolean = false;
         if(Boolean(arrAdd) && arrAdd.length > 0)
         {
            m_dictDesc = a_2027.getInstance().m_dictDesc;
            i = 0;
            n = int(arrAdd.length);
            while(i < n)
            {
               obj = arrAdd[i];
               b2 = this._dictPropsCardCount[obj.m_iID] == null;
               if(obj.m_iSequence < 1)
               {
                  obj.m_iSequence = 1;
               }
               if(b2)
               {
                  b = true;
                  cardAttr = new a_3228();
                  cardAttr.CardID = obj.m_iID;
                  cardAttr.CardCount = obj.m_iSequence;
                  if(obj.m_cIsBind != undefined)
                  {
                     cardAttr.IsBind = obj.m_cIsBind;
                  }
                  this._dictPropsCardCount[obj.m_iID] = cardAttr.CardCount;
                  if(m_dictDesc)
                  {
                     obj = m_dictDesc[cardAttr.CardID];
                     if(obj)
                     {
                        cardAttr.UseNumber = obj.Use;
                        cardAttr.Name = obj.Name;
                     }
                     else
                     {
                        cardAttr.UseNumber = "0";
                     }
                  }
                  arrTarget.unshift(cardAttr);
               }
               else
               {
                  j = 0;
                  l = int(arrTarget.length);
                  while(j < l)
                  {
                     cardAttr = arrTarget[j];
                     if(cardAttr.CardID == obj.m_iID)
                     {
                        this._dictPropsCardCount[obj.m_iID] += obj.m_iSequence;
                        cardAttr.CardCount = this._dictPropsCardCount[obj.m_iID];
                        if(obj.m_cIsBind != undefined)
                        {
                           cardAttr.IsBind = obj.m_cIsBind;
                        }
                        break;
                     }
                     j++;
                  }
               }
               i++;
            }
         }
         return b;
      }
      
      private function delPropsCardAttr(arrTarget:Array, arrDel:Array) : Boolean
      {
         var i:int = 0;
         var n:int = 0;
         var obj:Object = null;
         var j:int = 0;
         var l:int = 0;
         var cardAttr:a_3228 = null;
         var b:Boolean = Boolean(arrDel) && arrDel.length > 0;
         if(b)
         {
            i = 0;
            n = int(arrDel.length);
            while(i < n)
            {
               obj = arrDel[i];
               j = 0;
               l = int(arrTarget.length);
               while(j < l)
               {
                  cardAttr = arrTarget[j];
                  if(cardAttr.CardID == obj.m_iID)
                  {
                     if(obj.m_iSequence < 1)
                     {
                        obj.m_iSequence = 1;
                     }
                     this._dictPropsCardCount[obj.m_iID] -= obj.m_iSequence;
                     cardAttr.CardCount = this._dictPropsCardCount[obj.m_iID];
                     if(this._dictPropsCardCount[obj.m_iID] <= 0)
                     {
                        delete this._dictPropsCardCount[obj.m_iID];
                        arrTarget.splice(j,1);
                     }
                     break;
                  }
                  j++;
               }
               i++;
            }
         }
         return b;
      }
      
      private function delSpecialCardAttr(arrTarget:Array, arrDel:Array) : Boolean
      {
         var i:int = 0;
         var n:int = 0;
         var obj:Object = null;
         var j:int = 0;
         var l:int = 0;
         var cardAttr:a_3228 = null;
         var b:Boolean = Boolean(arrDel) && arrDel.length > 0;
         if(b)
         {
            i = 0;
            n = int(arrDel.length);
            while(i < n)
            {
               obj = arrDel[i];
               j = 0;
               l = int(arrTarget.length);
               while(j < l)
               {
                  cardAttr = arrTarget[j];
                  if(cardAttr.CardID == obj.m_iID && cardAttr.CardSeq == obj.m_iSequence)
                  {
                     --cardAttr.CardCount;
                     if(cardAttr.CardCount <= 0)
                     {
                        arrTarget.splice(j,1);
                     }
                     break;
                  }
                  j++;
               }
               i++;
            }
         }
         return b;
      }
      
      private function getIsBind(arrCheckCard:Array) : Array
      {
         var obj:Object = null;
         var type:int = 0;
         var arrTarget:Array = null;
         var attr:a_3228 = null;
         if(!arrCheckCard || arrCheckCard.length == 0)
         {
            return [];
         }
         var a:Array = [];
         var i:int = 0;
         var n:int = int(arrCheckCard.length);
         while(i < n)
         {
            obj = arrCheckCard[i];
            type = PackagesManager.getCardType(obj.m_iID);
            if(type == ConstantCompose.CARD_TYPE_DEFENSE)
            {
               arrTarget = this._defCardData;
            }
            else
            {
               arrTarget = this._propsCardData;
            }
            attr = this.getCardAttr(arrTarget,obj.m_iID,obj.m_iSequence);
            if(attr)
            {
               if(attr.IsBind)
               {
                  a.push(obj);
               }
            }
            i++;
         }
         return a;
      }
      
      private function cardAttrClone(a:Array) : Array
      {
         var na:Array = a.concat();
         var i:int = 0;
         var len:int = int(na.length);
         while(i < len)
         {
            na[i] = na[i].clone();
            i++;
         }
         return na;
      }
   }
}

class PrivateClass
{
   
   public function PrivateClass()
   {
      super();
   }
}
