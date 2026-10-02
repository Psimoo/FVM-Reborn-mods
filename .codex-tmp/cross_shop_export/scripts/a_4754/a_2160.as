package a_4754
{
   import a_4739.a_1828;
   import com.aurora.ui.maogoutd.component.a_3228;
   import flash.display.Bitmap;
   import flash.utils.Dictionary;
   
   public class a_2160 extends a_1828
   {
      
      public static var e:a_2160 = new a_2160();
      
      public function a_2160()
      {
         super();
      }
      
      public function onClosePackageUI(arrUpdateCardPositions:Array, arrUpdateHeroCardPositions:Array, dictUpdateHero:Dictionary) : void
      {
         notify("onClosePackageUI",arrUpdateCardPositions,arrUpdateHeroCardPositions,dictUpdateHero);
      }
      
      public function onNewGuideCardMove() : void
      {
         notify("onNewGuideCardMove");
      }
      
      public function RequestSaveUpdateTDCardFavorite(favouriteID:int, favouriteName:String, favitemsContent:String) : void
      {
         notify("RequestSaveUpdateTDCardFavorite",favouriteID,favouriteName,favitemsContent);
      }
      
      public function onUpdateCardData(arrUpdateTDCards:Array, iUpdateMode:int) : void
      {
         notify("onUpdateCardData",arrUpdateTDCards,iUpdateMode);
      }
      
      public function onUpdateHeroInfo(dict:Dictionary) : void
      {
         notify("onUpdateHeroInfo",dict);
      }
      
      public function onRennewCardPayTip(attr:a_3228, image:Bitmap) : void
      {
         notify("onRennewCardPayTip",attr,image);
      }
      
      public function onRenewPayCard(attr:a_3228, item:Object) : void
      {
         notify("onRenewPayCard",attr,item);
      }
      
      public function onBuyPayCard(goods:Array) : void
      {
         notify("onBuyPayCard",goods);
      }
      
      public function RequestUpdateDefGridSize(iCardID:int, iCardSeq:int) : void
      {
         notify("RequestUpdateDefGridSize",iCardID,iCardSeq);
      }
      
      public function RequestUpdateShowCardSetUp(iShowCard:int) : void
      {
         notify("RequestUpdateShowCardSetUp",iShowCard);
      }
      
      public function RequestUseService(iCardID:int, iCardSeq:int) : void
      {
         notify("RequestUseService",iCardID,iCardSeq);
      }
      
      public function RequestUseSkillBook(iCardID:int, iCardSeq:int) : void
      {
         notify("RequestUseSkillBook",iCardID,iCardSeq);
      }
      
      public function RequestUseExchangeItem(iCardID:int, iCardSeq:int) : void
      {
         notify("RequestUseExchangeItem",iCardID,iCardSeq);
      }
      
      public function RequestOpenPanel(iLeftMenuID:int, iRightMenuID:int) : void
      {
         notify("RequestOpenPanel",iLeftMenuID,iRightMenuID);
      }
      
      public function RequestUseCardSlotPackage(data:Object) : void
      {
         notify("RequestUseCardSlotPackage",data);
      }
      
      public function OnNotifyUseCardSlotPackage(data:Object) : void
      {
         notify("OnNotifyUseCardSlotPackage",data);
      }
      
      public function RequestOpenCardSlotPackage(data:Object) : void
      {
         notify("RequestOpenCardSlotPackage",data);
      }
      
      public function OnNotifyOpenCardSlotPackage(data:Object) : void
      {
         notify("OnNotifyOpenCardSlotPackage",data);
      }
   }
}

