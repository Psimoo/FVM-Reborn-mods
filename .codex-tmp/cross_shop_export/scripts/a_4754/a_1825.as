package a_4754
{
   import a_4739.a_1828;
   import com.aurora.ui.maogoutd.component.a_3228;
   import com.aurora.ui.maogoutd.pet.PetAttr;
   import com.aurora.ui.maogoutd.role.a_4463;
   import flash.geom.Point;
   
   public class a_1825 extends a_1828
   {
      
      public static var e:a_1825 = new a_1825();
      
      public function a_1825()
      {
         super();
      }
      
      public function onApplicationHide() : void
      {
         notify("onApplicationHide");
      }
      
      public function onApplicationShow() : void
      {
         notify("onApplicationShow");
      }
      
      public function onNotifyCardsChange(arrCards:Array) : void
      {
         notify("onNotifyCardsChange",arrCards);
      }
      
      public function onNotifyDefCardsChange(arrDefCards:Array) : void
      {
         notify("onNotifyDefCardsChange",arrDefCards);
      }
      
      public function onNotifyPropsCardsChange(arrPropsCards:Array) : void
      {
         notify("onNotifyPropsCardsChange",arrPropsCards);
      }
      
      public function onNotifyCardsStore(size:int, type:int = 1) : void
      {
         notify("onNotifyCardsStore",size,type);
      }
      
      public function onNotifyRoleChange(role:a_4463) : void
      {
         notify("onNotifyRoleChange",role);
      }
      
      public function onNotifyRoleItemChange(role:a_4463) : void
      {
         notify("onNotifyRoleItemChange",role);
      }
      
      public function onNotifyEquipmentCardsChange(arrEquipmentCards:Array) : void
      {
         notify("onNotifyEquipmentCardsChange",arrEquipmentCards);
      }
      
      public function onNotifyPlayerCommonChange(common:Object) : void
      {
         notify("onNotifyPlayerCommonChange",common);
      }
      
      public function onGameAccountEnd() : void
      {
         notify("onGameAccountEnd");
      }
      
      public function onShowUserAvatarTip(role:Object) : void
      {
         notify("onShowUserAvatarTip",role);
      }
      
      public function onShowMouseTip(mouse:Object) : void
      {
         notify("onShowMouseTip",mouse);
      }
      
      public function onShowExploreTaskTip(task:Object) : void
      {
         notify("onShowExploreTaskTip",task);
      }
      
      public function onHideExploreTaskTip() : void
      {
         notify("onHideExploreTaskTip");
      }
      
      public function onShowCardTip(CardID:int, point:Point, w:int, h:int, cardAttr:a_3228 = null) : void
      {
         notify("onShowCardTip",CardID,point,w,h,cardAttr);
      }
      
      public function onHideUserAvatatTip() : void
      {
         notify("onHideUserAvatatTip");
      }
      
      public function onHideMouseTip() : void
      {
         notify("onHideMouseTip");
      }
      
      public function onHideCardTip(CardID:int) : void
      {
         notify("onHideCardTip",CardID);
      }
      
      public function onShowPetTip(petID:int, point:Point, w:int, h:int, petAttr:PetAttr) : void
      {
         notify("onShowPetTip",petID,point,w,h,petAttr);
      }
      
      public function onShowVsModeTip(id:int) : void
      {
         notify("onShowVsModeTip",id);
      }
      
      public function onShowVsLevelTip(id:int) : void
      {
         notify("onShowVsLevelTip",id);
      }
      
      public function onHideVsModeTip() : void
      {
         notify("onHideVsModeTip");
      }
      
      public function onRoleLevelChange(level:String) : void
      {
         notify("onRoleLevelChange",level);
      }
      
      public function RequestPayMoney() : void
      {
         notify("RequestPayMoney");
      }
      
      public function OnBuyGoodsResponse(buyGoods:Object) : void
      {
         notify("OnBuyGoodsResponse",buyGoods);
      }
      
      public function onShowRoleDetail(role:Object, isLocal:Boolean, isDetail:Boolean = true) : void
      {
         notify("onShowRoleDetail",role,isLocal,isDetail);
      }
      
      public function onShowSendMail(role:Object) : void
      {
         notify("onShowSendMail",role);
      }
      
      public function onRoomEventSeatStatus(iGameSeatID:int, status:int) : void
      {
         notify("onRoomEventSeatStatus",iGameSeatID,status);
      }
      
      public function onAuctionBuy() : void
      {
         notify("onAuctionBuy");
      }
      
      public function RequestTransferClientLog(iType:int, log:String) : void
      {
         notify("RequestTransferClientLog",iType,log);
      }
      
      public function onGameClose() : void
      {
         notify("onGameClose");
      }
      
      public function RequestInvite(iData:Object) : void
      {
         notify("RequestInvite",iData);
      }
      
      public function onNotifyUseService(arrUseService:Array) : void
      {
         notify("onNotifyUseService",arrUseService);
      }
      
      public function onNotifyUseSkillBook(data:Object) : void
      {
         notify("onNotifyUseSkillBook",data);
      }
      
      public function RequestSelectUserRoleEnter(role:Object) : void
      {
         notify("RequestSelectUserRoleEnter",role);
      }
      
      public function onShowActionUI(iType:int) : void
      {
         notify("onShowActionUI",iType);
      }
      
      public function RequestOpenPackage(leftTabIndex:int, rightTabIndex:int = 0) : void
      {
         notify("RequestOpenPackage",leftTabIndex,rightTabIndex);
      }
      
      public function RequestJoinConsortiaNotify(data:Object) : void
      {
         notify("RequestJoinConsortiaNotify",data);
      }
      
      public function onShowNotEnoughMoneyTip(msg:String) : void
      {
         notify("onShowNotEnoughMoneyTip",msg);
      }
      
      public function onNotifyPlayerHealthData(iCumulativeOnLine:int, iCumulativeOffLine:int, iTimestamp:int) : void
      {
         notify("onNotifyPlayerHealthData",iCumulativeOnLine,iCumulativeOffLine,iTimestamp);
      }
      
      public function GetTDLobbyLogic() : Object
      {
         return notifyData("GetTDLobbyLogic");
      }
      
      public function onSendMail(role:Object, isLocal:Boolean, isDetail:Boolean = true) : void
      {
         notify("onSendMail",role,isLocal,isDetail);
      }
      
      public function OnShowSendFlowerDialog(stDst:Object) : void
      {
         notify("OnShowSendFlowerDialog",stDst);
      }
   }
}

