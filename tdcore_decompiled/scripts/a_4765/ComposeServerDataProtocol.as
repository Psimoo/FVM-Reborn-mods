package a_4765
{
   import a_4716.b_154;
   import a_4728.a_1778;
   import a_4729.EventType;
   import a_4729.a_1789;
   import a_4754.a_1825;
   import a_4759.b_167;
   import a_4760.a_2251;
   import a_4763.a_2439;
   import a_4771.a_2650;
   import com.aurora.protocol.common.a_2670;
   import com.aurora.protocol.hallserver.a_2738;
   import com.aurora.protocol.hallserver.compose.CSRequestItemGemDecompose;
   import com.aurora.protocol.hallserver.compose.CSRequestItemGemInlay;
   import com.aurora.protocol.hallserver.compose.CSRequestItemGemUnload;
   import com.aurora.protocol.hallserver.compose.CSRequestSlottingItem;
   import com.aurora.protocol.hallserver.compose.CSRequestTransfer;
   import com.aurora.protocol.hallserver.compose.SCResponseCompose;
   import com.aurora.protocol.hallserver.compose.SCResponseItemGemDecompose;
   import com.aurora.protocol.hallserver.compose.SCResponseItemGemInlay;
   import com.aurora.protocol.hallserver.compose.SCResponseItemGemUnload;
   import com.aurora.protocol.hallserver.compose.SCResponseRecompose;
   import com.aurora.protocol.hallserver.compose.SCResponseSlottingItem;
   import com.aurora.protocol.hallserver.compose.SCResponseTransfer;
   import com.aurora.protocol.hallserver.compose.SCResponseUpgrade;
   import com.aurora.protocol.hallserver.compose.a_2858;
   import com.aurora.protocol.hallserver.compose.a_2862;
   import com.aurora.ui.maogoutd.component.a_3228;
   import com.aurora.ui.maogoutd.compose.ComposeConfig;
   import com.aurora.ui.maogoutd.role.a_4461;
   import com.aurora.ui.maogoutd.role.a_4463;
   import flash.events.IEventDispatcher;
   import flash.utils.ByteArray;
   
   public class ComposeServerDataProtocol extends b_167
   {
      
      private static var _instance:ComposeServerDataProtocol;
      
      public function ComposeServerDataProtocol(target:IEventDispatcher = null)
      {
         super(target);
         this.init();
      }
      
      public static function getInstance() : ComposeServerDataProtocol
      {
         if(null == _instance)
         {
            _instance = new ComposeServerDataProtocol();
         }
         return _instance;
      }
      
      public function a_2391(iSrcUin:int, iComposeID:int, arrComposeMaterial:Array, arrAssMaterial:Array, iDisableConsortiaExtra:int = 1) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2858 = new a_2858();
         var i:int = 0;
         request.m_iSrcUin = iSrcUin;
         request.m_iComposeID = iComposeID;
         request.m_nComposeMaterialCount = arrComposeMaterial.length;
         for(i = 0; i < request.m_nComposeMaterialCount; i++)
         {
            arrComposeMaterial[i] = this.a_2396(arrComposeMaterial[i]);
         }
         request.m_arrComposeMaterial = arrComposeMaterial;
         request.m_nAssMaterialCount = arrAssMaterial.length;
         for(i = 0; i < request.m_nAssMaterialCount; i++)
         {
            arrAssMaterial[i] = this.a_2396(arrAssMaterial[i]);
         }
         request.m_arrAssMaterial = arrAssMaterial;
         request.m_nDisableConsortiaExtra = iDisableConsortiaExtra;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_323,encodeBuffer);
      }
      
      public function a_2393(iSrcUin:int, stSrc:Object, arrSub:Array, arrAssMaterial:Array, iDisableConsortiaExtra:int = 1) : Boolean
      {
         var encodeLengh:int = 0;
         var msg_id:uint = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2862 = new a_2862();
         var i:int = 0;
         request.m_iSrcUin = iSrcUin;
         request.m_stSrc = this.a_2396(stSrc);
         request.m_iPosition = stSrc.m_iPosition;
         request.m_nSubCount = arrSub.length;
         for(i = 0; i < request.m_nSubCount; i++)
         {
            arrSub[i] = this.a_2396(arrSub[i]);
         }
         request.m_arrSub = arrSub;
         request.m_nAssMaterialCount = arrAssMaterial.length;
         request.m_arrAssMaterial = arrAssMaterial;
         for(i = 0; i < request.m_nAssMaterialCount; i++)
         {
            arrAssMaterial[i] = this.a_2396(arrAssMaterial[i]);
         }
         request.m_nDisableConsortiaExtra = iDisableConsortiaExtra;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         switch(stSrc.m_iAct)
         {
            case 1:
               msg_id = b_154.a_324;
               break;
            case 2:
               msg_id = b_154.a_326;
               break;
            case 4:
               msg_id = b_154.MSG_HALL_ITEM_GEM_UPGRADE;
               break;
            default:
               throw new Error("ComposeServerDataProtocol::RequestUpgradeItem>>m_iAct类型非法(m_iAct=" + stSrc.m_iAct + ")");
         }
         return pBaseProtocol.a_2201(hallConn,msg_id,encodeBuffer);
      }
      
      public function RequestTransferItem(iSrcUin:int, card:Object, arrMaterial:Array, m_cInsurance:int = 1) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:CSRequestTransfer = new CSRequestTransfer();
         var i:int = 0;
         request.m_iSrcUin = iSrcUin;
         request.m_iCardID = card.iCardID;
         request.m_iCardSeq = card.iCardSeq;
         request.m_nMaterialCount = arrMaterial.length;
         for(i = 0; i < request.m_nMaterialCount; i++)
         {
            arrMaterial[i] = this.a_2396(arrMaterial[i]);
         }
         request.m_arrMaterial = arrMaterial;
         request.m_cBuyInsuranceFlag = m_cInsurance;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_CARD_TRANSLATE,encodeBuffer);
      }
      
      public function RequestSlottingItem(iSrcUin:int, data:Object, iDisableConsortiaExtra:int = 1) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:CSRequestSlottingItem = new CSRequestSlottingItem();
         request.m_iSrcUin = iSrcUin;
         request.m_iItemID = data.m_iItemID;
         request.m_iItemSeq = data.m_iItemSeq;
         request.m_nDelCount = data.m_astDelInfo.length;
         request.m_astDelInfo = data.m_astDelInfo;
         request.m_nSlotCount = data.m_nSlotCount;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_SLOT_ITEM,encodeBuffer);
      }
      
      public function RequestItemGemUnload(iSrcUin:int, data:Object, iDisableConsortiaExtra:int = 1) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:CSRequestItemGemUnload = new CSRequestItemGemUnload();
         request.m_iSrcUin = iSrcUin;
         request.m_iItemID = data.m_iItemID;
         request.m_iItemSeq = data.m_iItemSeq;
         request.m_iPosition = data.m_iPosition;
         request.m_nDelCount = data.m_astDelInfo.length;
         request.m_astDelInfo = data.m_astDelInfo;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_ITEM_GEM_UNLOAD,encodeBuffer);
      }
      
      public function RequestItemGemInlay(iSrcUin:int, data:Object, iDisableConsortiaExtra:int = 1) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:CSRequestItemGemInlay = new CSRequestItemGemInlay();
         request.m_iSrcUin = iSrcUin;
         request.m_iItemID = data.m_iItemID;
         request.m_iItemSeq = data.m_iItemSeq;
         request.m_nGemCount = data.m_astGemInlay.length;
         request.m_astGemInlay = data.m_astGemInlay;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_ITEM_GEM_IN_LAY,encodeBuffer);
      }
      
      public function RequestGenDecompose(iSrcUin:int, data:Object, iDisableConsortiaExtra:int = 1) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:CSRequestItemGemDecompose = new CSRequestItemGemDecompose();
         request.m_iSrcUin = iSrcUin;
         request.m_iItemID = data.m_iItemID;
         request.m_iItemSeq = data.m_iItemSeq;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_ITEM_GEM_DECOMPOSE,encodeBuffer);
      }
      
      private function init() : void
      {
         a_2247(b_154.a_323,this.a_2392);
         a_2247(b_154.a_324,this.a_2394);
         a_2247(b_154.a_326,this.a_2395);
         a_2247(b_154.MSG_HALL_CARD_TRANSLATE,this.OnTransferItemResponse);
         a_2247(b_154.MSG_HALL_ITEM_GEM_UNLOAD,this.OnGenUnloadResponse);
         a_2247(b_154.MSG_HALL_SLOT_ITEM,this.OnSlotItemResponse);
         a_2247(b_154.MSG_HALL_ITEM_GEM_IN_LAY,this.OnGenInlayResponse);
         a_2247(b_154.MSG_HALL_ITEM_GEM_DECOMPOSE,this.OnGenDecomposeResponse);
         a_2247(b_154.MSG_HALL_ITEM_GEM_UPGRADE,this.OnGenUgradeResponse);
      }
      
      private function a_2396(obj:Object) : a_2738
      {
         var item:a_2738 = new a_2738();
         item.m_iID = obj.CardID;
         item.m_iSequence = obj.CardSeq;
         return item;
      }
      
      private function a_2392(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:SCResponseCompose = new SCResponseCompose();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CSResponseCompose failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_609);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function a_2394(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var cardAttr:a_3228 = null;
         var response:SCResponseUpgrade = new SCResponseUpgrade();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CSResponseUpgrade failed.");
            return;
         }
         response.m_iAct = 1;
         if(response.m_nResult == 0)
         {
            cardAttr = this.getDefCardAttr(response.m_stNewCardInfo.m_iID,response.m_stNewCardInfo.m_iSequence);
            if(cardAttr)
            {
               cardAttr.TypeValue = response.m_cLevel;
               if((response.m_iPosition & 0x0F00) == 256)
               {
                  cardAttr.IsBind = 1;
               }
               a_1825.e.onNotifyDefCardsChange(a_2439.getInstance().GetTDCardsInfo()[0]);
            }
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_610);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function OnGenUgradeResponse(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var tempID:int = 0;
         var objTemp:Object = null;
         var aryConfig:Array = null;
         var bSlot:Boolean = false;
         var iSlot:int = 0;
         var isBind:int = 0;
         var response:SCResponseUpgrade = new SCResponseUpgrade();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CSResponseUpgrade failed.");
            return;
         }
         response.m_iAct = 4;
         if(response.m_nResult == 0)
         {
            tempID = response.m_stNewCardInfo.m_iID & 0xFFF00000;
            aryConfig = ComposeConfig.getInstance().GetCanSlotItem();
            bSlot = false;
            for(iSlot = 0; iSlot < aryConfig.length; iSlot++)
            {
               if(tempID == parseInt(aryConfig[iSlot]))
               {
                  bSlot = true;
                  break;
               }
            }
            if(bSlot)
            {
               objTemp = this.getHeroItemFromHeroDetail(response.m_stNewCardInfo.m_iID,response.m_stNewCardInfo.m_iSequence);
               this.updateWeaponExtraAttr(objTemp,response.m_iPosition,["m_iItemAdd"],[response.m_cLevel]);
               objTemp = this.getHeroItemFromHeroItemID(response.m_stNewCardInfo.m_iID,response.m_stNewCardInfo.m_iSequence);
               this.updateWeaponExtraAttr(objTemp,response.m_iPosition,["m_iItemAdd"],[response.m_cLevel]);
               objTemp = this.getEquipmentCardAttr(response.m_stNewCardInfo.m_iID,response.m_stNewCardInfo.m_iSequence);
               this.updateWeaponExtraAttr(objTemp,response.m_iPosition,["m_iItemAdd"],[response.m_cLevel]);
            }
            else
            {
               isBind = -1;
               if((response.m_iPosition & 0x0F00) == 256)
               {
                  isBind = 1;
               }
               objTemp = this.getHeroItemFromHeroDetail(response.m_stNewCardInfo.m_iID,response.m_stNewCardInfo.m_iSequence);
               this.updateGemLevel(objTemp,response.m_cLevel,isBind);
               objTemp = this.getEquipmentCardAttr(response.m_stNewCardInfo.m_iID,response.m_stNewCardInfo.m_iSequence);
               this.updateGemLevel(objTemp,response.m_cLevel,isBind);
            }
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_610);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function a_2395(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var cardAttr:a_3228 = null;
         var response:SCResponseRecompose = new SCResponseRecompose();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CSResponseRecompose failed.");
            return;
         }
         response.m_iAct = 2;
         if(response.m_nResult == 0)
         {
            cardAttr = this.getDefCardAttr(response.m_stNewCardInfo.m_iID,response.m_stNewCardInfo.m_iSequence);
            if(cardAttr)
            {
               cardAttr.ExpiredTime = response.m_iValidTime;
               a_1825.e.onNotifyDefCardsChange(a_2439.getInstance().GetTDCardsInfo()[0]);
            }
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_610);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function OnTransferItemResponse(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:SCResponseTransfer = new SCResponseTransfer();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode SCResponseTransfer failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.CARD_TRANSLATE_RESPONSE);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function OnGenUnloadResponse(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var objTemp:Object = null;
         var response:SCResponseItemGemUnload = new SCResponseItemGemUnload();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode SCResponseItemGemUnload failed.");
            return;
         }
         if(response.m_nResult == 0)
         {
            objTemp = this.getHeroItemFromHeroDetail(response.m_iItemID,response.m_iItemSeq);
            this.delWeaponExtraAttr(objTemp,response.m_iPosition);
            objTemp = this.getHeroItemFromHeroItemID(response.m_iItemID,response.m_iItemSeq);
            this.delWeaponExtraAttr(objTemp,response.m_iPosition);
            objTemp = this.getEquipmentCardAttr(response.m_iItemID,response.m_iItemSeq);
            this.delWeaponExtraAttr(objTemp,response.m_iPosition);
         }
         var dataEvent:a_1778 = new a_1778(EventType.ITEM_GEM_UNLOAD);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function OnSlotItemResponse(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var objTemp:Object = null;
         var response:SCResponseSlottingItem = new SCResponseSlottingItem();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode SCResponseSlottingItem failed.");
            return;
         }
         if(response.m_nResult == 0)
         {
            objTemp = this.getHeroItemFromHeroDetail(response.m_iItemID,response.m_iItemSeq);
            this.addSlotItem(objTemp,response.m_nSlotCount);
            objTemp = this.getHeroItemFromHeroItemID(response.m_iItemID,response.m_iItemSeq);
            this.addSlotItem(objTemp,response.m_nSlotCount);
            objTemp = this.getEquipmentCardAttr(response.m_iItemID,response.m_iItemSeq);
            this.addSlotItem(objTemp,response.m_nSlotCount);
         }
         var dataEvent:a_1778 = new a_1778(EventType.SLOT_ITEM);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function OnGenInlayResponse(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var objTemp:Object = null;
         var response:SCResponseItemGemInlay = new SCResponseItemGemInlay();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode SCResponseItemGemInlay failed.");
            return;
         }
         if(response.m_nResult == 0)
         {
            objTemp = this.getHeroItemFromHeroDetail(response.m_iItemID,response.m_iItemSeq);
            this.addWeaponExtraAttr(objTemp,response.m_astGemInlay);
            objTemp = this.getHeroItemFromHeroItemID(response.m_iItemID,response.m_iItemSeq);
            this.addWeaponExtraAttr(objTemp,response.m_astGemInlay);
            objTemp = this.getEquipmentCardAttr(response.m_iItemID,response.m_iItemSeq);
            this.addWeaponExtraAttr(objTemp,response.m_astGemInlay);
         }
         var dataEvent:a_1778 = new a_1778(EventType.ITEM_GEM_IN_LAY);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function OnGenDecomposeResponse(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:SCResponseItemGemDecompose = new SCResponseItemGemDecompose();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode SCResponseItemGemDecompose failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.ITEM_GEM_DECOMPOSE);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function getHeroItemFromHeroDetail(searchID:int, searchSeq:int = 0) : a_4461
      {
         var role:a_4463 = a_2439.getInstance().GetCurrentRole() as a_4463;
         return this.getHeroItem(role.m_dictHeroDetail,searchID,searchSeq);
      }
      
      private function getHeroItemFromHeroItemID(searchID:int, searchSeq:int = 0) : a_4461
      {
         var role:a_4463 = a_2439.getInstance().GetCurrentRole() as a_4463;
         return this.getHeroItem(role.m_arrHeroItemID,searchID,searchSeq);
      }
      
      private function getDefCardAttr(searchID:int, searchSeq:int = 0) : a_3228
      {
         return this.getCardAttr(a_2439.getInstance().GetTDCardsInfo()[0],searchID,searchSeq);
      }
      
      private function getEquipmentCardAttr(searchID:int, searchSeq:int = 0) : a_3228
      {
         var role:a_4463 = a_2439.getInstance().GetCurrentRole() as a_4463;
         return this.getCardAttr(role.a_951,searchID,searchSeq);
      }
      
      private function getCardAttr(arrTarget:Array, searchID:int, searchSeq:int = 0) : a_3228
      {
         var attr:a_3228 = null;
         var i:int = 0;
         var n:int = int(arrTarget.length);
         while(i < n)
         {
            attr = arrTarget[i];
            if(attr.CardID == searchID && attr.CardSeq == searchSeq)
            {
               return attr;
            }
            i++;
         }
         return null;
      }
      
      public function getHeroItem(objTarget:*, searchID:int, searchSeq:int = 0) : a_4461
      {
         var heroItem:a_4461 = null;
         for each(heroItem in objTarget)
         {
            if(heroItem.m_iItemID == searchID && heroItem.m_iItemSeq == searchSeq)
            {
               return heroItem;
            }
         }
         return null;
      }
      
      private function updateWeaponExtraAttr(objTarget:Object, position:int, props:Array, values:Array) : void
      {
         var arrExtraAttr:Array = null;
         var extraAttr:Object = null;
         var i:int = 0;
         var n:int = 0;
         if(!objTarget)
         {
            return;
         }
         arrExtraAttr = objTarget.m_arrExtraAttr;
         if(Boolean(arrExtraAttr) && arrExtraAttr.length > 0)
         {
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
               i++;
            }
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
      
      private function delWeaponExtraAttr(objTarget:Object, position:int) : void
      {
         var arrExtraAttr:Array = null;
         var extraAttr:Object = null;
         var i:int = 0;
         var n:int = 0;
         if(!objTarget)
         {
            return;
         }
         arrExtraAttr = objTarget.m_arrExtraAttr;
         if(Boolean(arrExtraAttr) && arrExtraAttr.length > 0)
         {
            i = 0;
            n = int(arrExtraAttr.length);
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
      }
      
      private function addWeaponExtraAttr(objTarget:Object, arrExtraAttr:Array) : void
      {
         var arrExtraAttr2:Array = null;
         var extraAttr:Object = null;
         var i:int = 0;
         var n:int = 0;
         var obj:Object = null;
         var j:int = 0;
         var l:int = 0;
         var obj1:Object = null;
         if(!objTarget)
         {
            return;
         }
         var b:Boolean = false;
         arrExtraAttr2 = objTarget.m_arrExtraAttr;
         if(!arrExtraAttr2)
         {
            arrExtraAttr2 = [];
            objTarget.m_arrExtraAttr = arrExtraAttr2;
         }
         b = true;
         if(b)
         {
            i = 0;
            n = int(arrExtraAttr.length);
            while(i < n)
            {
               obj = {};
               b = true;
               extraAttr = arrExtraAttr[i];
               obj.m_cItemType = extraAttr.m_cAttrType;
               obj.m_iItemAdd = extraAttr.m_iAttrLevel;
               obj.m_iSkillID = extraAttr.m_iGemID;
               obj.m_iPosition = extraAttr.m_iPosition;
               j = 0;
               l = int(arrExtraAttr2.length);
               while(j < l)
               {
                  obj1 = arrExtraAttr2[j];
                  if(obj1.m_iPosition == extraAttr.m_iPosition)
                  {
                     b = false;
                     arrExtraAttr2[j] = obj;
                     break;
                  }
                  j++;
               }
               if(b)
               {
                  arrExtraAttr2.push(obj);
               }
               i++;
            }
         }
      }
      
      private function addSlotItem(objTarget:Object, slotCount:int) : void
      {
         if(!objTarget)
         {
            return;
         }
         objTarget.m_nItemSlotNum = slotCount;
         if(objTarget is a_4461)
         {
            objTarget.m_cIsBind = 1;
         }
         else
         {
            objTarget.IsBind = 1;
         }
      }
      
      private function updateGemLevel(objTarget:Object, level:int, isBind:int = -1) : void
      {
         var id:int = 0;
         var i:int = 0;
         var n:int = 0;
         var obj:Object = null;
         if(!objTarget)
         {
            return;
         }
         if(objTarget is a_4461)
         {
            id = int(objTarget.m_iItemID);
            if(isBind != -1)
            {
               objTarget.m_cIsBind = isBind;
            }
         }
         else
         {
            id = int(objTarget.CardID);
            if(isBind != -1)
            {
               objTarget.IsBind = isBind;
            }
         }
         if(!objTarget.m_arrExtraAttr)
         {
            objTarget.m_arrExtraAttr = [{
               "m_cItemType":10,
               "m_iItemAdd":level,
               "m_iSkillID":id
            }];
         }
         else
         {
            i = 0;
            n = int(objTarget.m_arrExtraAttr.length);
            while(i < n)
            {
               obj = objTarget.m_arrExtraAttr[i];
               if(obj.m_cItemType == 10)
               {
                  obj.m_iItemAdd = level;
                  break;
               }
               i++;
            }
         }
      }
   }
}

